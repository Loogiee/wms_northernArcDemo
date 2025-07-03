package templateProcesser

import (
	"database/sql"
	"log"
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
	errCh := make(chan error, len(requestedReports))
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
	var wg = &sync.WaitGroup{}
	for _, reportId := range requestedReports {
		wg.Add(1)
		go func(reportId int) {
			defer wg.Done()
			switch reportId {
			case 2: // Executive Summary
				exeData, err := FetchDataForReport(customer, portfolio, reportDate, db, "executive_summary")
				if err != nil {
					logger.Error("Failed to fetch Executive Summary report data", "Category", "DB", "Error", err.Error(), "Origin", GetErrorOrigin(err))
					errCh <- err
					return
				}
				exeResult, err := ProcessExecutinveSummary(&exeData)
				if err != nil {
					logger.Error("Failed to process Executive Summary report data", "Category", "PROCESS", "Error", err.Error(), "Origin", GetErrorOrigin(err))
					errCh <- err
					return
				}
				allReportsData.Store(reportId, exeResult)
			case 3: //Portfolio Allocation
				portAllocDisData, err := FetchDataForReport(customer, portfolio, reportDate, db, "portfolio_allocation_summary")
				if err != nil {
					logger.Error("Failed to fetch Portfolio Allocation report data", "Category", "DB", "Error", err.Error(), "Origin", GetErrorOrigin(err))
					errCh <- err
					return
				}
				portAllocResult, err := ProcessPortfolioAllocation(&portAllocDisData)
				if err != nil {
					logger.Error("Failed to process Portfolio Allocation report data", "Category", "PROCESS", "Error", err.Error(), "Origin", GetErrorOrigin(err))
					errCh <- err
					return
				}
				allReportsData.Store(reportId, portAllocResult)
			case 4: //Asset Class Summary
				portSumDisData, err := FetchDataForReport(customer, portfolio, reportDate, db, "Asset Class Summary")
				if err != nil {
					logger.Error("Failed to fetch Portfolio Summary report data", "Category", "DB", "Error", err.Error(), "Origin", GetErrorOrigin(err))
					errCh <- err
					return
				}
				portSumResult, err := ProcessPortfolioSummary(&portSumDisData)
				if err != nil {
					logger.Error("Failed to process Portfolio Summary report data", "Category", "PROCESS", "Error", err.Error(), "Origin", GetErrorOrigin(err))
					errCh <- err
					return
				}
				allReportsData.Store(reportId, portSumResult)
			case 6: // Mutual Fund Analysis
				mutualFundData, err := FetchDataForReport(customer, portfolio, reportDate, db, "Mutual Fund Analysis")
				if err != nil {
					logger.Error("Failed to fetch mututal fund report data", "Category", "DB", "Error", err.Error(), "Origin", GetErrorOrigin(err))
					errCh <- err
					return
				}
				mutualFundResult, err := ProcessMutualFund(&mutualFundData)
				if err != nil {
					logger.Error("Failed to mututal fund report data", "Category", "PROCESS", "Error", err.Error(), "Origin", GetErrorOrigin(err))
					errCh <- err
					return
				}
				allReportsData.Store(6, mutualFundResult)
			}

		}(reportId)
	}
	wg.Wait()

	// capGainLossData, capGainLossFundErr := FetchDataForReport(customer, portfolio, reportDate, db, "capGainLoss_fund_report")
	// if capGainLossFundErr != nil {
	// 	logger.Error("Failed to fetch capital gain loss report data", "Category", "DB", "Error", capGainLossFundErr.Error(), "Origin", GetErrorOrigin(capGainLossFundErr))
	// 	return nil, capGainLossFundErr
	// }
	// capGainLossFundResult, capGainLossFundErr := ProcessCapGainLoss(&capGainLossData)
	// if capGainLossFundErr != nil {
	// 	logger.Error("Failed to capital gain loss report data", "Category", "PROCESS", "Error", capGainLossFundErr.Error(), "Origin", GetErrorOrigin(capGainLossFundErr))
	// 	return nil, capGainLossFundErr
	// }
	// allReportsData.Store(7, capGainLossFundResult)

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
	select {
	case err := <-errCh:
		// if err != nil {
		log.Printf("An error occurred: %v", err)
		return []byte(strings.Join(FinalTemp, "")), err
		// }
	default:
		log.Printf("All reports generated successfully!")
	}
	FinalTemp = append(FinalTemp,DisclaimerText)
	return []byte(strings.Join(FinalTemp, "")), nil

}
