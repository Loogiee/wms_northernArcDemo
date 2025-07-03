package templateProcesser

import (
	"bytes"
	"text/template"
	. "wms_report/models"
	. "wms_report/utils"

	"github.com/pkg/errors"
)

func ProcessCapGainLoss(sqlData *[]map[string]interface{}) (string, error) {

	var finalProcessData ExecutiveSummary

	for _, obj := range *sqlData {
		for key, value := range obj {
			switch key {
			case "-":
				mapCapGainLoss(value, &finalProcessData)
			}
		}

	}
	var tmpl, terr = template.New("CapitalGainLoss.typ").Funcs(FuncMap).ParseFiles("./assets/templateSource/CapitalGainLoss.typ")
	if terr != nil {
		return "", errors.Wrap(terr, "failed to parse capital gain loss template:")
	}

	var buf bytes.Buffer
	if err := tmpl.Execute(&buf, finalProcessData); err != nil {
		return "", errors.Wrapf(err, "failed to execute parsed capital gain loss template err: %v", err)
	}
	return buf.String(), nil

}

func mapCapGainLoss(value interface{}, parsingData *ExecutiveSummary) {
	var processData []AllocationComparison
	MapToStruct(value, &processData)
	parsingData.AllocationComparisonSection = processData
}
