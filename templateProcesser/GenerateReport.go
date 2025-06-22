package templateProcesser

import (
	"database/sql"
	"log/slog"
	"sort"
	"strings"
	"sync"
	. "wms_report/db"
	. "wms_report/utils"
)

func CreatePDFByte(requestedReports []int, customer string, portfolio string, reportDate string, db *sql.DB, trackId string, logger *slog.Logger) ([]byte, error) {
	var FinalTemp []string
	var allReportsData sync.Map

	// Title template process
	titleData, titleErr := FetchDataForReport(customer, portfolio, reportDate, db, "Overview")
	if titleErr != nil {
		logger.Error("Failed to fetch Title report data", "Category", "DB", "Error", titleErr.Error(), "Origin", GetErrorOrigin(titleErr))
		return nil, titleErr
	}
	titleResult, titleErr := ProcessTitle(&titleData)
	if titleErr != nil {
		logger.Error("Failed to process Title report data", "Category", "PROCESS", "Error", titleErr.Error(), "Origin", GetErrorOrigin(titleErr))
		return nil, titleErr
	}
	allReportsData.Store(1, titleResult)

	// Executive Summary
	exeData, exeErr := FetchDataForReport(customer, portfolio, reportDate, db, "executive_summary")
	if exeErr != nil {
		logger.Error("Failed to fetch Executive Summary report data", "Category", "DB", "Error", exeErr.Error(), "Origin", GetErrorOrigin(exeErr))
		return nil, exeErr
	}
	exeResult, exeErr := ProcessExecutinveSummary(&exeData)
	if exeErr != nil {
		logger.Error("Failed to process Executive Summary report data", "Category", "PROCESS", "Error", exeErr.Error(), "Origin", GetErrorOrigin(exeErr))
		return nil, exeErr
	}
	allReportsData.Store(2, exeResult)

	// collecting and ordering Data from sync mapper
	var keys []int
	allReportsData.Range(func(key, value interface{}) bool {
		// Collect keys
		if k, ok := key.(int); ok {
			keys = append(keys, k)
		}
		return true
	})

	// Sort keys
	sort.Ints(keys)

	// Append sorted data to FinalTemp
	for _, k := range keys {
		if v, ok := allReportsData.Load(k); ok {
			// Type assertion to string
			if str, ok := v.(string); ok {
				FinalTemp = append(FinalTemp, str)
			} else {
				// Handle the case where the value is not a string
				logger.Error("Error: expected a string value, got", v)
			}
		}
	}
	return []byte(strings.Join(FinalTemp, "")), nil

}
