package main

import (
	"fmt"
	"time"
)

type RequestBody struct {
	RequestedReports []int  `json:"requested_reports" validate:"required,positivearr"`
	CustomerName     string `json:"customer_name" validate:"required"`
	Portfolio        string `json:"portfolio" validate:"required"`
	ReportDate       string `json:"report_date" validate:"required,date"`
	Logs             string `json:"logs"`
}
type RequestApiError struct {
	Field string
	Msg   string
}
type ExecutiveSummary struct {
	BasicInformationSection         []BasicInfo           `json:"basic_information_section"`
	AllocationComparisonSection     []Allocation          `json:"allocation_comparison_section"`
	QuarterlyAllocationSection      []QuarterlyAlloc      `json:"quarterly_allocation_section"`
	RelativePerformanceOverQuarters []RelativePerformance `json:"relative_performance_over_quarters"`
}

type BasicInfo struct {
	Description string  `json:"Description"`
	Value       float64 `json:"Value"`
	Date        *string `json:"Date"` // Use pointer to handle null
}

type Allocation struct {
	AssetGroupName          string  `json:"ASSET_GROUP_NAME"`
	TotalExposurePercentage float64 `json:"Total_Exposure_Percentage"`
	StrategicPercentage     float64 `json:"Strategic_Percentage"`
}

type QuarterlyAlloc struct {
	AssetGroupName string  `json:"ASSET_GROUP_NAME"`
	March2024      float64 `json:"March 2024"`
	June2024       float64 `json:"June 2024"`
	September2024  float64 `json:"September 2024"`
	December2024   float64 `json:"December 2024"`
}

type RelativePerformance struct {
	Metric  string  `json:"Metric"`
	Mar2024 float64 `json:"Mar 2024"`
	Jun2024 float64 `json:"Jun 2024"`
	Sep2024 float64 `json:"Sep 2024"`
	Dec2024 float64 `json:"Dec 2024"`
}

type Overview struct {
	ReportDate     string `json:"Report Date"`
	ReportFrom     string `json:"Report From"`
	ReportTo       string `json:"Report To"`
	PrintDate      string `json:"Print Date"`
	RM             string `json:"RM"`
	RMMobile       string `json:"RMMobile"`
	RMEmail        string `json:"RMEmail"`
	SM             string `json:"SM"`
	SMMobile       string `json:"SMMobile"`
	SMEmail        string `json:"SMEmail"`
	ClientName     string `json:"Client_Name"`
	FamilyName     string `json:"Family_Name"`
	CustomerMobile string `json:"Customer_Mobile"`
	CustomerType   string `json:"Customer_Type"`
}

type ReportOverview struct {
	OverviewSection []Overview `json:"overview_section"`
}

func main() {
	// var finalProcessData Overview
	// var tempData []map[string]interface{}
	// sqlData := `[{"overview_section": [{"Report Date": "2025-06-20", "Report From": "2024-09-25", "Report To": "2025-09-25", "Print Date": "2025-06-20", "RM": "Abhishek Puri", "RMMobile": "8851555342", "RMEmail": "abhishek.puri@nexedge.capital", "SM": "", "SMMobile": "", "SMEmail": "", "Client_Name": "GAUTAM GAMBHIR", "Family_Name": "GAUTAM GAMBHIR", "Customer_Mobile": "", "Customer_Type": ""}]}]`

	// json.Unmarshal([]byte(sqlData), &tempData)
	// for _, item := range tempData {
	// 	var tempData []Overview
	// 	for _, value := range item {
	// 		jsonBytes, _ := json.Marshal(value)
	// 		json.Unmarshal(jsonBytes, &tempData)
	// 	}
	// 	finalProcessData = tempData[0]
	// }
	// fmt.Println(finalProcessData.PrintDate)
	parsedDate, err := DateFormatter("2022-10-04", "02 Jan 2006")
	fmt.Println(parsedDate, err)

}

func DateFormatter(dateStr string, format string) (string, error) {
	layout := "2006-01-02"
	parsedDate, err := time.Parse(layout, dateStr)
	if err != nil {
		return "", fmt.Errorf("failed to parse date: %w", err)
	}
	return parsedDate.Format(format), nil
}
