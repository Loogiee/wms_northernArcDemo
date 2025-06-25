package models

// Request body struct
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

// Report Overview page
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

//  Executive Summary page Start
type ExecutiveSummary struct {
	BasicInformationSection         []BasicInfo           `json:"basic_information_section"`
	AllocationComparisonSection     []Allocation          `json:"allocation_comparison_section"`
	QuarterlyAllocationSection      []QuarterlyAlloc      `json:"quarterly_allocation_section"`
	RelativePerformanceOverQuarters []RelativePerformance `json:"relative_performance_over_quarters"`
}

type BasicInfo struct {
	Description string  `json:"Description"`
	Value       float64 `json:"Value"`
	Date        string  `json:"Date"`
}

type Allocation struct {
	AssetGroupName          string  `json:"ASSET_GROUP_NAME"`
	TotalExposurePercentage float64 `json:"Total_Exposure_Percentage"`
	StrategicPercentage     float64 `json:"Strategic_Percentage"`
}

type QuarterlyAlloc struct {
	Commodities float64 `json:"Commodities"`
	Equities    float64 `json:"Equities"`
	FixedIncome float64 `json:"Fixed Income"`
	Liquid      float64 `json:"Liquid"`
	Date        string  `json:"Date"`
}

type RelativePerformance struct {
	Date          string  `json:"Date"`
	BMXIRR        float64 `json:"BMXIRR"`
	ExcessReturns float64 `json:"ExcessReturns"`
	XIRR          float64 `json:"XIRR"`
}

//Portfolio Allocation page
type AssetwiseAllocation struct {
	AssetGroupName   string  `json:"ASSET_GROUP_NAME"`
	StartMarketValue float64 `json:"START_MARKET_VALUE"`
	EndMarketValue   float64 `json:"END_MARKET_VALUE"`
	StartExposure    float64 `json:"START_Exposure%"`
	EndExposure      float64 `json:"END_Exposure%"`
}

type SecurityCategoryAllocation struct {
	SecurityCategory string  `json:"SECURITY_CATEGORY"`
	StartMarketValue float64 `json:"START_MARKET_VALUE"`
	EndMarketValue   float64 `json:"END_MARKET_VALUE"`
	StartExposure    float64 `json:"START_Exposure%"`
	EndExposure      float64 `json:"END_Exposure%"`
}

// Portfolio Analysis Report
// --> Asset Class Wise Summary
type AssetSubassetSection struct {
	AssetGroupName   string  `json:"ASSET_GROUP_NAME"`
	SecurityCategory string  `json:"SECURITY_CATEGORY"`
	MarketValue      float64 `json:"MARKET_VALUE"`
	AcquisitionCost  float64 `json:"ACQU_COST"`
	RealGainLoss     float64 `json:"REAL_GAIN_LOSS"`
	Appreciation     float64 `json:"APPRE_DEPRE"`
	Dividend         float64 `json:"DIVIDEND"`
	XIRR             float64 `json:"XIRR"`
	AssetExposure    float64 `json:"ASSET_EXPOSURE%"`
	BenchmarkName    string  `json:"BENCHMARK_NAME"`
	GroupLabel       string  `json:"GROUP_LABEL"`
}

// --> Product Wise Exposure - Advisors / Distributors
type SubassetMarketCapTypeSection struct {
	SecurityCategory  string  `json:"SECURITY_CATEGORY"`
	AssetGroupName    string  `json:"ASSET_GROUP_NAME"`
	MarketCapType     string  `json:"MARKET_CAP_TYPE"`
	MarketValue       float64 `json:"MARKET_VALUE"`
	AcquisitionCost   float64 `json:"ACQU_COST"`
	RealGainLoss      float64 `json:"REAL_GAIN_LOSS"`
	Appreciation      float64 `json:"APPRE_DEPRE"`
	XIRR              float64 `json:"XIRR"`
	AssetExposure     float64 `json:"ASSET_EXPOSURE%"`
	DistributedIncome float64 `json:"DISTRIBUTED_INCOME"`
	GroupLabel        string  `json:"GROUP_LABEL"`
}

// --> Sub Asset Class Wise Exposure - Advisors / Distributors
type SubAssetSection struct {
	AssetGroupName   string  `json:"ASSET_GROUP_NAME"`
	SecurityCategory string  `json:"SECURITY_CATEGORY"`
	MarketValue      float64 `json:"MARKET_VALUE"`
	AcquisitionCost  float64 `json:"ACQU_COST"`
	RealGainLoss     float64 `json:"REAL_GAIN_LOSS"`
	Appreciation     float64 `json:"APPRE_DEPRE"`
	XIRR             float64 `json:"XIRR"`
	AssetExposure    float64 `json:"ASSET_EXPOSURE%"`
	GroupLabel       string  `json:"GROUP_LABEL"`
}

// AMC Wise Exposure - All Advisors
type AmcWiseSection struct {
	AssetGroupName  string  `json:"ASSET_GROUP_NAME"`
	IssuerName      string  `json:"ISSUER_NAME"`
	MarketValue     float64 `json:"MARKET_VALUE"`
	AcquisitionCost float64 `json:"ACQU_COST"`
	Appreciation    float64 `json:"APPRE_DEPRE"`
	XIRR            float64 `json:"XIRR"`
	AssetExposure   float64 `json:"ASSET_EXPOSURE%"`
}
