package templateProcesser

import (
	"bytes"
	"strconv"
	"strings"
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
				mapAllocationCompSec(value, &finalProcessData) //Asset Allocation (%)
			case "basic_information_section":
				mapBasicInfoSec(value, &finalProcessData)
			case "quarterly_allocation_section":
				mapQtrAllocSec(value, &finalProcessData) // Quarterly Asset Allocation Trends
			case "relative_performance_over_quarters":
				mapRelativePerOvrQtr(value, &finalProcessData) // Relative Performance
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
	var finalProcessData []BasicInfo
	var processData []BasicInfo
	MapToStruct(value, &processData)
	var temp BasicInfo
	for _, data := range processData {
		temp.Value = data.Value
		temp.Date = data.Date
		temp.Color = "#000"
		temp.Description = data.Description
		if data.Description == "MARKET_VALUE" {
			temp.Description = "CURRENT VALUE"
			temp.StrigValue = "₹ " + ConvertToFormattedNumberWithoutDecimalPointer(&data.Value)
			temp.Images = "/assets/images/three.png"
		}
		if data.Description == "ACQU_COST" {
			temp.Description = "HOLDING COST"
			temp.StrigValue = "₹ " + ConvertToFormattedNumberWithoutDecimalPointer(&data.Value)
			temp.Images = "./assets/images/two.png"
		}
		if data.Description == "NetContribution" {
			temp.Description = "INFLOW MINUS OUTFLOW"
			temp.StrigValue = "₹ " + ConvertToFormattedNumberWithoutDecimalPointer(&data.Value)
			temp.Images = "./assets/images/one.png"
		}
		if data.Description == "XIRR" {
			temp.Description = "PORTFOLIO RETURN(IRR)"
			temp.StrigValue = strconv.FormatFloat(data.Value, 'f', 2, 64) + "%"
			temp.Images = "./assets/images/four.png"
			if data.Value < 0 {
				temp.Color = "#ff0000de"
			} else {
				temp.Color = "#15ff00de"
			}
		}

		if data.Description == "BMXIRR" {
			temp.Description = "BENCHMARK RETURN(IRR)"
			temp.StrigValue = strconv.FormatFloat(data.Value, 'f', 2, 64) + "%"
			temp.Images = "./assets/images/six.png"
			if data.Value < 0 {
				temp.Color = "#ff0000de"
			} else {
				temp.Color = "#15ff00de"
			}
		}
		if strings.Contains(data.Description, "BenchmarkInfo_") {
			temp.StrigValue = strconv.FormatFloat(data.Value, 'f', 2, 64) + "%"
			if data.Description == "BenchmarkInfo_NIFTY500" {
				temp.Description = "BenchmarkInfo_NIFTY 500"
			}
			if data.Description == "BenchmarkInfo_CRISILCBI" {
				temp.Description = "BenchmarkInfo_CRISIL Comp IDX"
			}
			if data.Value < 0 {
				temp.Color = "#ff0000de"
			} else {
				temp.Color = "#15ff00de"
			}
		}

		finalProcessData = append(finalProcessData, temp)
	}
	parsingData.BasicInformationSection = finalProcessData
}

func mapQtrAllocSec(value interface{}, parsingData *ExecutiveSummary) {
	var processData []FinalQuarterlyAllocation
	MapToStruct(value, &processData)
	parsingData.QuarterlyAllocationSection = processData
}
func mapRelativePerOvrQtr(value interface{}, parsingData *ExecutiveSummary) {
	var processData []RelativePerformance
	MapToStruct(value, &processData)
	parsingData.RelativePerformanceOverQuarters = processData
}
