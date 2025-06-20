package models

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

type Report struct {
	ExecutiveSummary ExecutiveSummary `json:"executive_summary"`
}
