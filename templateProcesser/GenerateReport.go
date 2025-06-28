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

	portSumDisData, portSumErr := FetchDataForReport(customer, portfolio, reportDate, db, "portfolio_summary")
	if portSumErr != nil {
		logger.Error("Failed to fetch Portfolio Summary report data", "Category", "DB", "Error", portSumErr.Error(), "Origin", GetErrorOrigin(portSumErr))
		return nil, portSumErr
	}
	portSumResult, portSumErr := ProcessPortfolioSummary(&portSumDisData)
	if portSumErr != nil {
		logger.Error("Failed to process Portfolio Summary report data", "Category", "PROCESS", "Error", portSumErr.Error(), "Origin", GetErrorOrigin(portSumErr))
		return nil, portSumErr
	}
	allReportsData.Store(4, portSumResult)

	portAllocDisData, portAllocErr := FetchDataForReport(customer, portfolio, reportDate, db, "portfolio_allocation_summary")
	if portSumErr != nil {
		logger.Error("Failed to fetch Portfolio Allocation report data", "Category", "DB", "Error", portAllocErr.Error(), "Origin", GetErrorOrigin(portAllocErr))
		return nil, portAllocErr
	}
	portAllocResult, portAllocErr := ProcessPortfolioAllocation(&portAllocDisData)
	if portAllocErr != nil {
		logger.Error("Failed to process Portfolio Allocation report data", "Category", "PROCESS", "Error", portAllocErr.Error(), "Origin", GetErrorOrigin(portAllocErr))
		return nil, portAllocErr
	}
	allReportsData.Store(3, portAllocResult)

	holdData, holdErr := FetchDataForReport(customer, portfolio, reportDate, db, "holding_report")
	if holdErr != nil {
		logger.Error("Failed to fetch Asset Class Wise Summary report data", "Category", "DB", "Error", holdErr.Error(), "Origin", GetErrorOrigin(holdErr))
		return nil, holdErr
	}
	holdResult, holdErr := ProcessHolding(&holdData)
	if holdErr != nil {
		logger.Error("Failed to Holding report data", "Category", "PROCESS", "Error", holdErr.Error(), "Origin", GetErrorOrigin(holdErr))
		return nil, holdErr
	}
	allReportsData.Store(5, holdResult)

	mutualFundData, mutualFundErr := FetchDataForReport(customer, portfolio, reportDate, db, "mutual_fund_report")
	if mutualFundErr != nil {
		logger.Error("Failed to fetch mututal fund report data", "Category", "DB", "Error", mutualFundErr.Error(), "Origin", GetErrorOrigin(mutualFundErr))
		return nil, mutualFundErr
	}
	mutualFundResult, mutualFundErr := ProcessMutualFund(&mutualFundData)
	if mutualFundErr != nil {
		logger.Error("Failed to mututal fund report data", "Category", "PROCESS", "Error", mutualFundErr.Error(), "Origin", GetErrorOrigin(mutualFundErr))
		return nil, mutualFundErr
	}
	allReportsData.Store(6, mutualFundResult)

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
