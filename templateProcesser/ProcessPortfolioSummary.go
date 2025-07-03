package templateProcesser

import (
	"bytes"
	"text/template"

	. "wms_report/models"
	. "wms_report/utils"

	"github.com/pkg/errors"
)

func ProcessPortfolioSummary(sqlData *[]map[string]interface{}) (string, error) {
	var finalProcessData FinalPortfolioSummary
	// var group []string

	for _, obj := range *sqlData {
		for key, value := range obj {
			switch key {
			case "asset_subasset_section":
				MapAssetSubassetSection(value, &finalProcessData) // Asset Class Wise Summary
			case "subasset_asset_section#IGNORE":
				MapSubAssetSection(value, &finalProcessData) // Product Wise Exposure - Advisors / Distributors
			case "subasset_asset_marketcaptype_section":
				MapSubassetMarketCapTypeSection(value, &finalProcessData) // Sub Asset Class Wise Exposure - Advisors / Distributors
			case "mutuals_funds_holding_section":
				mapMutualFund(value, &finalProcessData) // Mutual Funds - Investment Summary
			case "pms_holding_section#IGNORED":
				mapPMSHolding(value, &finalProcessData) //PMS - Investment Summary
			case "direct_equities_holding_section#IGNORED":
				mapDirectEquHolding(value, &finalProcessData) //Direct Equity Holding - Advisor Wise
			}
		}
	}

	var tmpl, terr = template.New("PortfolioSummary.typ").Funcs(FuncMap).ParseFiles("./assets/templateSource/PortfolioSummary.typ")
	if terr != nil {
		return "", errors.Wrap(terr, "failed to parse portfolio summary template:")
	}

	var buf bytes.Buffer
	if err := tmpl.Execute(&buf, finalProcessData); err != nil {
		return "", errors.Wrapf(err, "failed to execute parsed portfolio summary template err: %v", err)
	}

	return buf.String(), nil
}

func MapAssetSubassetSection(value interface{}, parsingData *FinalPortfolioSummary) {
	var processData []AssetSubassetSection
	MapToStruct(value, &processData)
	parsingData.AssetSubassetSection = processData
}
func MapSubAssetSection(value interface{}, parsingData *FinalPortfolioSummary) {
	var processData []SubAssetSection
	MapToStruct(value, &processData)
	parsingData.SubAssetSection = processData
}
func MapSubassetMarketCapTypeSection(value interface{}, parsingData *FinalPortfolioSummary) {
	var processData []SubassetMarketCapTypeSection
	MapToStruct(value, &processData)
	parsingData.SubassetMarketCapTypeSection = processData
}

func mapMutualFund(value interface{}, parsingData *FinalPortfolioSummary) {
	var processData []MututalFundHoldingSection
	MapToStruct(value, &processData)
	parsingData.MututalFundHoldingSection = processData
}

func mapPMSHolding(value interface{}, parsingData *FinalPortfolioSummary) {
	var processData []PmsHoldingSection
	MapToStruct(value, &processData)
	parsingData.PmsHoldingSection = processData
}
func mapDirectEquHolding(value interface{}, parsingData *FinalPortfolioSummary) {
	var processData []DirectEquHoldingSection
	MapToStruct(value, &processData)
	parsingData.DirectEquHoldingSection = processData
}
