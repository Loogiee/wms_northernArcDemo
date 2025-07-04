package templateProcesser

import (

	// "encoding/json"
	"bytes"
	"sort"
	"text/template"
	. "wms_report/models"
	. "wms_report/utils"

	"github.com/pkg/errors"
)

func ProcessMutualFund(sqlData *[]map[string]interface{}) (string, error) {
	var FinalProcessData MutualFundSection
	for _, obj := range *sqlData {
		for key, value := range obj {
			switch key {
			case "amc_wise_section": //AMC Wise Exposure - All Advisors
				mapAmcWiseSection(value, &FinalProcessData)
			case "fund_manager_wise_section": //Fund Manager Wise Exposure - All Advisor
				mapFundManagerWiseSection(value, &FinalProcessData)
			case "mf_sector_wise_section":
				mapSectorWiseSection(value, &FinalProcessData) //Fund Manager Wise Exposure - All Advisor
			case "mutual_fund_transaction_section":
				mapMututalFundTransSection(value, &FinalProcessData) //Transaction History - Mutual Funds
			case "equity_mf_market_capitalization_allocation%":
				mapEqMktCapSection(value, &FinalProcessData) //Market Capitalization Allocation(%)
			case "equity_mf_amc_allocation%":
				mapEqAmcAllocSection(value, &FinalProcessData) //AMC Allocation(%)
			case "equity_quants":
				mapEqQuantsSection(value, &FinalProcessData) //Equity Quants
			case "equity_mf_industry_allocation%":
				mapEqIndAllocSection(value, &FinalProcessData) //Industry Allocation(%)
			}
		}
	}
	var tmpl, terr = template.New("MututalFundReport.typ").Funcs(FuncMap).ParseFiles("./assets/templateSource/MututalFundReport.typ")
	if terr != nil {
		return "", errors.Wrap(terr, "failed to parse title template:")
	}

	var buf bytes.Buffer
	if err := tmpl.Execute(&buf, FinalProcessData); err != nil {
		return "", errors.Wrapf(err, "failed to execute parsed Holding Report template err: %v", err)
	}
	return buf.String(), nil
}

func mapAmcWiseSection(value interface{}, parsingData *MutualFundSection) {
	var processData []AmcWiseSection
	MapToStruct(value, &processData)
	parsingData.AmcWiseSection = processData
}
func mapFundManagerWiseSection(value interface{}, parsingData *MutualFundSection) {
	var processData []FundManagerSection
	MapToStruct(value, &processData)
	sort.Slice(processData, func(i, j int) bool {
		return processData[i].TotAssetExposure > processData[j].TotAssetExposure
	})
	parsingData.FundManagerSection = processData
}
func mapSectorWiseSection(value interface{}, parsingData *MutualFundSection) {
	var processData []SectorWiseSection
	MapToStruct(value, &processData)
	sort.Slice(processData, func(i, j int) bool {
		return processData[i].TotAssetExposure > processData[j].TotAssetExposure
	})
	parsingData.SectorWiseSection = processData
}

func mapMututalFundTransSection(value interface{}, parsingData *MutualFundSection) {
	var processData []MututalFundTransSection
	MapToStruct(value, &processData)
	parsingData.MututalFundTransSection = processData
}

func mapEqMktCapSection(value interface{}, parsingData *MutualFundSection) {
	var processData []EquityMfMarketCapitalization
	MapToStruct(value, &processData)
	sort.Slice(processData, func(i, j int) bool {
		return processData[i].Percentage > processData[j].Percentage
	})
	parsingData.EquityMfMarketCapitalization = processData
}

func mapEqAmcAllocSection(value interface{}, parsingData *MutualFundSection) {
	var processData []EquityMfAmcAllocation
	MapToStruct(value, &processData)
	sort.Slice(processData, func(i, j int) bool {
		return processData[i].Percentage > processData[j].Percentage
	})
	parsingData.EquityMfAmcAllocation = processData
}
func mapEqQuantsSection(value interface{}, parsingData *MutualFundSection) {
	var processData []EquityQuants
	MapToStruct(value, &processData)
	for index, item := range processData {
		switch item.Metric {
		case "PE_RATIO":
			processData[index].Metric = "P/E"
		case "PB_RATIO":
			processData[index].Metric = "P/B"
		case "MARKET_CAP":
			processData[index].Metric = "Weighted Avg. Market Cap(Cr) "
		case "SHARPE_RATIO":
			processData[index].Metric = "Sharpe Ratio"
		case "BETA":
			processData[index].Metric = "Portfolio Beta"
		case "STANDARD_DEVIATION":
			processData[index].Metric = "Standard Deviation"
		}
	}
	parsingData.EquityQuants = processData
}

func mapEqIndAllocSection(value interface{}, parsingData *MutualFundSection) {
	var processData []EquityMfIndustryAllocation
	MapToStruct(value, &processData)
	sort.Slice(processData, func(i, j int) bool {
		return processData[i].Percentage > processData[j].Percentage
	})
	parsingData.EquityMfIndustryAllocation = processData
}
