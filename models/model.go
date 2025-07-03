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
	ReportDate        string `json:"Report Date"`
	ReportFrom        string `json:"Report From"`
	ReportTo          string `json:"Report To"`
	PrintDate         string `json:"Print Date"`
	Portfolio         string `json:"portfolio"`
	ConsolidatedLevel string `json:"consolidated_level"`
	RM                string `json:"RM"`
	RMMobile          string `json:"RMMobile"`
	RMEmail           string `json:"RMEmail"`
	SM                string `json:"SM"`
	SMMobile          string `json:"SMMobile"`
	SMEmail           string `json:"SMEmail"`
	ClientName        string `json:"Client_Name"`
	FamilyName        string `json:"Family_Name"`
	CustomerMobile    string `json:"Customer_Mobile"`
	CustomerType      string `json:"Customer_Type"`
}

//  Executive Summary page Start
type ExecutiveSummary struct {
	BasicInformationSection         []BasicInfo                `json:"basic_information_section"`
	AllocationComparisonSection     []AllocationComparison     `json:"allocation_comparison_section"`
	QuarterlyAllocationSection      []FinalQuarterlyAllocation `json:"quarterly_allocation_section"`
	RelativePerformanceOverQuarters []RelativePerformance      `json:"relative_performance_over_quarters"`
}

type BasicInfo struct {
	Description string  `json:"Description"`
	Value       float64 `json:"Value"`
	Date        string  `json:"Date"`
	StrigValue  string
	Images      string
	Color       string
}

type AllocationComparison struct {
	Description string            `json:"Description"`
	Value       []AssetAllocation `json:"Value"`
}

type AssetAllocation struct {
	AssetGroupName string  `json:"ASSET_GROUP_NAME"`
	Value          float64 `json:"Value"`
}

// Quarterly Asset Allocation Trends
type FinalQuarterlyAllocation struct {
	Date                string                `json:"Date"` // You can use time.Time if you want to parse the date
	QuarterlyAllocation []QuarterlyAllocation `json:"allocations"`
}

type QuarterlyAllocation struct {
	AssetGroupName string  `json:"asset_group_name"`
	Value          float64 `json:"value"`
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

type PortfolioAllocation struct {
	AssetwiseAllocation        []AssetwiseAllocation
	SecurityCategoryAllocation []SecurityCategoryAllocation
}
type FinalPortfolioSummary struct {
	AssetSubassetSection         []AssetSubassetSection
	SubassetMarketCapTypeSection []SubassetMarketCapTypeSection
	SubAssetSection              []SubAssetSection
	MututalFundHoldingSection    []MututalFundHoldingSection
	PmsHoldingSection            []PmsHoldingSection
	DirectEquHoldingSection      []DirectEquHoldingSection
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

// --> Sub Asset Class Wise Exposure - Advisors / Distributors
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

// --> Product Wise Exposure - Advisors / Distributors
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

// --> Mutual Funds - Investment Summary
type MututalFundHoldingSection struct {
	AssetGroupName  string  `json:"ASSET_GROUP_NAME"`
	MarketCapType   string  `json:"MARKET_CAP_TYPE"`
	SecurityName    string  `json:"SECURITY_NAME"`
	FolioNo         string  `json:"FOLIO_NO"`
	AcquisitionCost float64 `json:"ACQU_COST"`
	MarketValue     float64 `json:"MARKET_VALUE"`
	Appreciation    float64 `json:"APPRE_DEPRE"`
	RealGainLoss    float64 `json:"REAL_GAIN_LOSS"`
	Quantity        float64 `json:"QUANTITY"`
	PurchaseDate    string  `json:"PUR_DATE"`
	HoldingDays     float64 `json:"HOLD_DAYS"`
	XIRR            float64 `json:"XIRR"`
	AbsoluteReturn  float64 `json:"ABSOLUTE_RETURN"`
	GroupLabel      string  `json:"GROUP_LABEL"`
}

// --> PMS - Investment Summary
type PmsHoldingSection struct {
	AssetGroupName string  `json:"ASSET_GROUP_NAME"`
	MarketCapType  string  `json:"MARKET_CAP_TYPE"`
	SecurityName   string  `json:"SECURITY_NAME"`
	MarketValue    float64 `json:"MARKET_VALUE"`
	FolioNo        string  `json:"FOLIO_NO"`
	Inflow         float64 `json:"INFLOW"`
	Outflow        float64 `json:"OUTFLOW"`
	XIRR           float64 `json:"XIRR"`
	AssetExposure  float64 `json:"ASSET_EXPOSURE%"`
	// market value data is missing need to add that
}

// --> Direct Equity Holding - Advisor Wise
type DirectEquHoldingSection struct {
	AssetGroupName   string  `json:"ASSET_GROUP_NAME"`
	MarketCapType    string  `json:"MARKET_CAP_TYPE"`
	SecurityName     string  `json:"SECURITY_NAME"`
	ISIN             string  `json:"ISIN"`
	Quantity         float64 `json:"QUANTITY"`
	AveragePrice     float64 `json:"AVERAGE_PRICE"`
	AcquCost         float64 `json:"ACQU_COST"`
	Dividend         float64 `json:"DIVIDEND"`
	MarketPrice      float64 `json:"MARKET_PRICE"`
	MarketValue      float64 `json:"MARKET_VALUE"`
	AppreDepre       float64 `json:"APPRE_DEPRE"`
	AbsoluteReturn   float64 `json:"ABSOLUTE_RETURN"`
	AssetExposurePct float64 `json:"ASSET_EXPOSURE%"`
}

type MutualFundSection struct {
	AmcWiseSection               []AmcWiseSection
	FundManagerSection           []FundManagerSection
	SectorWiseSection            []SectorWiseSection
	MututalFundTransSection      []MututalFundTransSection
	EquityMfAmcAllocation        []EquityMfAmcAllocation
	EquityMfIndustryAllocation   []EquityMfIndustryAllocation
	EquityMfMarketCapitalization []EquityMfMarketCapitalization
	EquityQuants                 []EquityQuants
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

// Fund Manager Wise Exposure - All Advisors
type FundManagerSection struct {
	FundManagerName  string  `json:"FUND_MANAGER_NAME"`
	IssuerName       string  `json:"ISSUER_NAME"`
	MarketValue      float64 `json:"MARKET_VALUE"`
	TotAssetExposure float64 `json:"TOTAL_ASSET_EXPOSURE%"`
}

// Mutual Fund - Sector Wise Exposure
type SectorWiseSection struct {
	SectorName       string  `json:"SECTOR_NAME"`
	MarketValue      float64 `json:"MARKET_VALUE"`
	TotAssetExposure float64 `json:"TOTAL_ASSET_EXPOSURE%"`
}

//Transaction History - Mutual Funds
type MututalFundTransSection struct {
	AssetGroupName   string  `json:"ASSET_GROUP_NAME"`
	SecurityCategory string  `json:"SECURITY_CATEGORY"`
	SecurityName     string  `json:"SECURITY_NAME"`
	FolioNo          string  `json:"FOLIO_NO"`
	TransDate        string  `json:"CASHFLOW_DATE"`
	TransCode        string  `json:"TRANS_CODE"`
	Quantity         float64 `json:"QUANTITY"`
	Price            float64 `json:"PRICE"`
	AcquCost         float64 `json:"ACQU_COST"`
}

type EquityMfIndustryAllocation struct {
	IndustryName string  `json:"INDUSTRY_NAME"`
	Percentage   float64 `json:"Percentage"`
}

type EquityMfAmcAllocation struct {
	IssuerName string  `json:"ISSUER_NAME"`
	Percentage float64 `json:"Percentage"`
}
type EquityMfMarketCapitalization struct {
	MarketCapType string  `json:"MARKET_CAP_TYPE"`
	Percentage    float64 `json:"Percentage"`
}

type EquityQuants struct {
	Metric    string  `json:"Metric"`
	ValueYear float64 `json:"Value(yr)"`
}
