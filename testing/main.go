package main

import (
	"encoding/json"
	"fmt"
	"sort"
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
type FinalEquityMfIndustryAllocation struct {
	EquityMfIndustryAllocation []EquityMfIndustryAllocation
}
type EquityMfIndustryAllocation struct {
	IndustryName string  `json:"INDUSTRY_NAME"`
	Percentage   float64 `json:"Percentage"`
}

func main() {
	var finalProcessData FinalEquityMfIndustryAllocation
	var tempData []map[string]interface{}
	sqlData := `[{"equity_mf_industry_allocation%": [{"INDUSTRY_NAME": "Banking", "Percentage": 16.5200495723}, {"INDUSTRY_NAME": "Software", "Percentage": 7.9025017895}, {"INDUSTRY_NAME": "Drugs & Pharma", "Percentage": 7.4460083269}, {"INDUSTRY_NAME": "Cement", "Percentage": 4.3877079956}, {"INDUSTRY_NAME": "Cars & Multi Utility Vehicles", "Percentage": 2.7510672857}, {"INDUSTRY_NAME": "Telecom Services", "Percentage": 2.463508379}, {"INDUSTRY_NAME": "Life Insurance", "Percentage": 2.4406426937}, {"INDUSTRY_NAME": "E-Commerce", "Percentage": 2.2222556683}, {"INDUSTRY_NAME": "Auto Ancillaries", "Percentage": 2.0726549388}, {"INDUSTRY_NAME": "Other Financial Instututions", "Percentage": 1.977855761}, {"INDUSTRY_NAME": "Others", "Percentage": 49.8157475891}]}]`

	json.Unmarshal([]byte(sqlData), &tempData)
	// fmt.Println(err,tempData)
	for _, item := range tempData {
		fmt.Println(item)
		var tempData []EquityMfIndustryAllocation
		for _, value := range item {
			jsonBytes, _ := json.Marshal(value)
			json.Unmarshal(jsonBytes, &tempData)
		}
		finalProcessData.EquityMfIndustryAllocation = tempData
		// 	finalProcessData = tempData[0]
	}

	fmt.Println(finalProcessData.EquityMfIndustryAllocation)

	// Sort the slice by Percentage in ascending order
	sort.Slice(finalProcessData.EquityMfIndustryAllocation, func(i, j int) bool {
		return finalProcessData.EquityMfIndustryAllocation[i].Percentage > finalProcessData.EquityMfIndustryAllocation[j].Percentage
	})

	for group, data := range finalProcessData.EquityMfIndustryAllocation {
		fmt.Println(group, data)
	}
	// parsedDate, err := DateFormatter("2022-10-04", "02 Jan 2006")
	// fmt.Println(parsedDate, err)

}

func DateFormatter(dateStr string, format string) (string, error) {
	layout := "2006-01-02"
	parsedDate, err := time.Parse(layout, dateStr)
	if err != nil {
		return "", fmt.Errorf("failed to parse date: %w", err)
	}
	return parsedDate.Format(format), nil
}

func MapToStruct(data interface{}, result interface{}) error {
	// Convert the input data to JSON
	dataBytes, err := json.Marshal(data)
	if err != nil {
		return fmt.Errorf("failed to marshal data to JSON: %w", err)
	}
	// Unmarshal the JSON into the struct
	if err := json.Unmarshal(dataBytes, result); err != nil {
		return fmt.Errorf("failed to unmarshal into struct: %w", err)
	}
	return nil
}
