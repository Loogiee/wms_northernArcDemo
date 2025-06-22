package db

import (
	"database/sql"
	"fmt"
	"log"
	"time"
	"wms_report/utils"

	"github.com/pkg/errors"
	_ "github.com/sijms/go-ora/v2"
)

func ConnectToDB() (*sql.DB, error) {
	// Establish the DB connection
	host := utils.HOST
	port := utils.DBPORT
	serviceName := utils.SERVICENAME
	username := utils.USERNAME
	password := utils.PASSWORD

	dsn := fmt.Sprintf("oracle://%s:%s@%s:%s/%s", username, password, host, port, serviceName)
	db, err := sql.Open("oracle", dsn)
	if err != nil {
		log.Printf("Failed to connect to Oracle database: %v", err)
		return nil, errors.Wrap(err, "Failed to open database connection")
	}
	db.SetMaxOpenConns(200)                // Maximum number of open connections to the database
	db.SetMaxIdleConns(50)                 // Maximum number of idle connections
	db.SetConnMaxLifetime(5 * time.Minute) // Maximum amount of time a connection can be reused
	// Ping the DB to verify connection
	fmt.Println("Connected, initiating db ping")
	err = db.Ping()
	if err != nil {
		return nil, errors.Wrap(err, "Failed to ping database")
	}
	fmt.Println("Db ping successful")
	// Return the successful DB connection
	return db, nil
}

func FetchDataForReport(customer string, portfolio string, reportDate string, db *sql.DB, reportName string) (string, error) {
	query := `
		SELECT JSON_ARRAYAGG(REPORT_DATA RETURNING CLOB) AS JSON_DATA
		FROM RPT_PMS.REPORT_PACKAGE_DATA
		WHERE CUSTOMER = :1 AND PORTFOLIO = :2 AND REPORT_DATE = TO_DATE( :3 , 'YYYY-MM-DD')
		AND REPORT_NAME = :4
		ORDER BY SUB_REPORT_SRL_NO
	`
	// Execute the query with the correct parameters
	rows, err := db.Query(query, customer, portfolio, reportDate, reportName)
	if err != nil {
		return "", errors.Wrap(err, "failed to execute query:")
	}
	defer rows.Close()

	var reportData string

	for rows.Next() {
		// Scan the JSON_DATA column into the variable
		if err := rows.Scan(&reportData); err != nil {
			// FIXME: incase if the data is empty send out a custom http response saying no data found
			return "", errors.Wrapf(err, "failed to scan row for report %v. No Data Available:", reportName)
		}
	}

	// Check for errors during iteration
	if err := rows.Err(); err != nil {
		return "", errors.Wrap(err, "error during row iteration:")
		// fmt.Errorf("error during row iteration: %v", err)
	}
	return reportData, nil
}
