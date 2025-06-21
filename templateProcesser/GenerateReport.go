package templateProcesser

import (
	"database/sql"
	"fmt"
	"sync"
	. "wms_report/db"
	. "wms_report/utils"
)

func CreatePDFByte(requestedReports []int, customer string, portfolio string, reportDate string, db *sql.DB, trackId string) []byte {
	// var FinalTemp []byte
	var allReportsData sync.Map

	// Title template process
	titleData, titleErr := FetchDataForReport(customer, portfolio, reportDate, db, trackId, "Overview")
	if titleErr != nil {
		fmt.Println("Failed to fetch Title report data", "Category", "DB", "Error", titleErr.Error(), "Origin", GetErrorOrigin(titleErr))
		return nil
	}
	titleResult, titleErr := ProcessTitle(&titleData, requestedReports)
	if titleErr != nil {
		fmt.Println("Failed to process Title report data", "Category", "PROCESS", "Error", titleErr.Error(), "Origin", GetErrorOrigin(titleErr))
		return nil
	}

	allReportsData.Store(1, titleResult)
	return []byte(titleResult)

}
