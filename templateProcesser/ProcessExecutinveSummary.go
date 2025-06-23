package templateProcesser

import (
	"bytes"
	"text/template"
	. "wms_report/models"
	. "wms_report/utils"

	"github.com/pkg/errors"
)

func ProcessExecutinveSummary(sqlData *[]map[string]interface{}) (string, error) {
	// define executiveStruct
	var finalProcessData ExecutiveSummary

	for _, obj := range *sqlData {
		for key, value := range obj {
			switch key {
			case "allocation_comparison_section":
				mapAllocationCompSec(value, &finalProcessData)
			case "basic_information_section":
				mapBasicInfoSec(value, &finalProcessData)
			case "quarterly_allocation_section":
				mapQtrAllocSec(value, &finalProcessData)
			case "relative_performance_over_quarters":
				mapRelativePerOvrQtr(value, &finalProcessData)
			}
		}

	}
	var tmpl, terr = template.New("ExecutiveSummary.typ").Funcs(FuncMap).ParseFiles("./assets/templateSource/ExecutiveSummary.typ")
	if terr != nil {
		return "", errors.Wrap(terr, "failed to parse title template:")
	}

	var buf bytes.Buffer
	if err := tmpl.Execute(&buf, finalProcessData); err != nil {
		return "", errors.Wrapf(err, "failed to execute parsed title template err: %v", err)
	}
	return buf.String(), nil

}

func mapAllocationCompSec(value interface{}, parsingData *ExecutiveSummary) {
	var processData []Allocation
	MapToStruct(value, &processData)
	parsingData.AllocationComparisonSection = processData
}

func mapBasicInfoSec(value interface{}, parsingData *ExecutiveSummary) {
	var processData []BasicInfo
	MapToStruct(value, &processData)
	parsingData.BasicInformationSection = processData
}
func mapQtrAllocSec(value interface{}, parsingData *ExecutiveSummary) {
	var processData []QuarterlyAlloc
	MapToStruct(value, &processData)
	parsingData.QuarterlyAllocationSection = processData
}
func mapRelativePerOvrQtr(value interface{}, parsingData *ExecutiveSummary) {
	var processData []RelativePerformance
	MapToStruct(value, &processData)
	parsingData.RelativePerformanceOverQuarters = processData
}
