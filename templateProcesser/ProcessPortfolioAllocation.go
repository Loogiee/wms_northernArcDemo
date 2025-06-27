package templateProcesser

import (
	"bytes"
	"text/template"
	. "wms_report/models"
	. "wms_report/utils"

	"github.com/pkg/errors"
)

func ProcessPortfolioAllocation(sqlData *[]map[string]interface{}) (string, error) {
	// define executiveStruct
	var finalProcessData PortfolioAllocation

	for _, obj := range *sqlData {
		for key, value := range obj {
			switch key {
			case "assetwise_allocation_section":
				mapAssetWiseAlloSec(value, &finalProcessData)
			case "security_category_allocation_section":
				mapSecurityCatAlloSec(value, &finalProcessData)
			}
		}

	}
	var tmpl, terr = template.New("PortfolioAllocation.typ").Funcs(FuncMap).ParseFiles("./assets/templateSource/PortfolioAllocation.typ")
	if terr != nil {
		return "", errors.Wrap(terr, "failed to parse title template:")
	}

	var buf bytes.Buffer
	if err := tmpl.Execute(&buf, finalProcessData); err != nil {
		return "", errors.Wrapf(err, "failed to execute parsed title template err: %v", err)
	}
	return buf.String(), nil

}

func mapAssetWiseAlloSec(value interface{}, parsingData *PortfolioAllocation) {
	var processData []AssetwiseAllocation
	MapToStruct(value, &processData)
	parsingData.AssetwiseAllocation = processData
}

func mapSecurityCatAlloSec(value interface{}, parsingData *PortfolioAllocation) {
	var processData []SecurityCategoryAllocation
	MapToStruct(value, &processData)
	parsingData.SecurityCategoryAllocation = processData
}
