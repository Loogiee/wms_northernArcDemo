package templateProcesser

import (
	"bytes"
	// "encoding/json"
	"text/template"
	. "wms_report/models"
	. "wms_report/utils"

	"github.com/pkg/errors"
)

func ProcessHolding(sqlData *[]map[string]interface{}) (string, error) {
	var finalProcessData HoldingSection

	for _, obj := range *sqlData {
		for key, value := range obj {
			switch key {
			case "mutuals_funds_holding_section": // Mutual Funds - Investment Summary
				mapMutualFund(value, &finalProcessData)
			case "pms_holding_section#IGNORED": //PMS - Investment Summary
				mapPMSHolding(value, &finalProcessData)
			case "direct_equities_holding_section#IGNORED": //Direct Equity Holding - Advisor Wise
				mapDirectEquHolding(value, &finalProcessData)
			}
		}
	}

	var tmpl, terr = template.New("HoldingReport.typ").Funcs(FuncMap).ParseFiles("./assets/templateSource/HoldingReport.typ")
	if terr != nil {
		return "", errors.Wrap(terr, "failed to parse title template:")
	}

	var buf bytes.Buffer
	if err := tmpl.Execute(&buf, finalProcessData); err != nil {
		return "", errors.Wrapf(err, "failed to execute parsed Holding Report template err: %v", err)
	}
	return buf.String(), nil
}

func mapMutualFund(value interface{}, parsingData *HoldingSection) {
	var processData []MututalFundHoldingSection
	MapToStruct(value, &processData)
	parsingData.MututalFundHoldingSection = processData
}

func mapPMSHolding(value interface{}, parsingData *HoldingSection) {
	var processData []PmsHoldingSection
	MapToStruct(value, &processData)
	parsingData.PmsHoldingSection = processData
}
func mapDirectEquHolding(value interface{}, parsingData *HoldingSection) {
	var processData []DirectEquHoldingSection
	MapToStruct(value, &processData)
	parsingData.DirectEquHoldingSection = processData
}
