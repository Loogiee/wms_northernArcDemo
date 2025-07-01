package main

import (
	"encoding/json"
	"fmt"
	"strconv"
	"strings"
	"time"
)

type BasicInfo struct {
	Description string  `json:"Description"`
	Value       float64 `json:"Value"`
	Date        string  `json:"Date"`
	StrigValue  string
	Images      string
	Color       string
}
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
	OrderNumber      int
}

func main() {
	var FinalData []BasicInfo
	var parsedData []map[string]interface{}
	jsonData := `[{"basic_information_section":[{"Description":"ACQU_COST","Value":293976076.83,"Date":"As on 19 Mar 2025"},{"Description":"MARKET_VALUE","Value":300751912.95,"Date":"As on 19 Mar 2025"},{"Description":"NetContribution","Value":290254594.11,"Date":"Since Inception"},{"Description":"XIRR","Value":-14.36,"Date":"Since Inception"},{"Description":"BMXIRR","Value":-3.15,"Date":"Since Inception"},{"Description":"BenchmarkInfo_CRISILCBI","Value":2.75,"Date":""},{"Description":"BenchmarkInfo_NIFTY500","Value":-17.21,"Date":""}]}]`

	if err := json.Unmarshal([]byte(jsonData), &parsedData); err != nil {
		fmt.Println("failed to unmarshal JSON_DATA:", err)
	}
	for _, group := range parsedData {
		for _, data := range group {
			MapToStruct(data, &FinalData)
		}
	}
	ProcessExecutinveSummary(&FinalData)
	// sortingRecords(&FinalData)
	// parsedDate, err := DateFormatter("2022-10-04", "02 Jan 2006")
	// fmt.Println(parsedDate, err)

}

func DateFormatter(dateStr string, format string) (string, error) {
	layout := "2006-01-02"
	parsedDate, err := time.Parse(layout, dateStr)
	if err != nil {
		return "", fmt.Errorf("failed to parse date: %w", err)
	}
	return parsedDate.Format(format), nil
}

func MapToStruct(data interface{}, result interface{}) error {
	// Convert the input data to JSON
	dataBytes, err := json.Marshal(data)
	if err != nil {
		return fmt.Errorf("failed to marshal data to JSON: %w", err)
	}
	// Unmarshal the JSON into the struct
	if err := json.Unmarshal(dataBytes, result); err != nil {
		return fmt.Errorf("failed to unmarshal into struct: %w", err)
	}
	return nil
}

func ProcessExecutinveSummary(data *[]BasicInfo) {
	var temp BasicInfo
	var finalProcessData []BasicInfo

	for _, data := range *data {
		temp.Value = data.Value
		temp.Date = data.Date
		temp.Color = "black"
		temp.Description = data.Description
		if data.Description == "MARKET_VALUE" {
			temp.Description = "CURRENT VALUE"
			temp.StrigValue = ConvertToFormattedNumberWithoutDecimalPointer(&data.Value)
			temp.Images = "/assets/images/three.png"
		}
		if data.Description == "ACQU_COST" {
			temp.Description = "HOLDING COST"
			temp.StrigValue = ConvertToFormattedNumberWithoutDecimalPointer(&data.Value)
			temp.Images = "./assets/images/two.png"
		}
		if data.Description == "NetContribution" {
			temp.Description = "INFLOW MINUS OUTFLOW"
			temp.StrigValue = ConvertToFormattedNumberWithoutDecimalPointer(&data.Value)
			temp.Images = "./assets/images/one.png"
		}
		if data.Description == "XIRR" {
			temp.Description = "PORTFOLIO RETURN(IRR)"
			temp.StrigValue = strconv.FormatFloat(data.Value, 'f', 2, 64) + "%"
			temp.Images = "./assets/images/one.png"
			if data.Value < 0 {
				temp.Color = "red"
			} else {
				temp.Color = "green"
			}
		}

		if data.Description == "BMXIRR" {
			temp.Description = "BENCHMARK RETURN(IRR)"
			temp.StrigValue = strconv.FormatFloat(data.Value, 'f', 2, 64) + "%"
			temp.Images = "./assets/images/one.png"
			if data.Value < 0 {
				temp.Color = "red"
			} else {
				temp.Color = "green"
			}
		}
		if strings.Contains(data.Description, "BenchmarkInfo_") {
			temp.StrigValue = strconv.FormatFloat(data.Value, 'f', 2, 64) + "%"
			if data.Value < 0 {
				temp.Color = "red"
			} else {
				temp.Color = "green"
			}
		}

		finalProcessData = append(finalProcessData, temp)
	}
	for _, data := range finalProcessData {
		fmt.Println(data.Description)

	}

}

func ConvertToFormattedNumberWithoutDecimalPointer(amount *float64) string {
	if amount == nil {
		return "--"
	}
	if *amount == 0.0 {
		return "0"
	}

	intPart := fmt.Sprintf("%.0f", *amount)
	n := len(intPart)

	if n <= 3 {
		return intPart
	}

	result := intPart[n-3:]
	for i := n - 3; i > 0; i -= 2 {
		start := i - 2
		if start < 0 {
			start = 0
		}
		separator := ","
		if intPart[start] == '-' && i-start <= 1 {
			separator = ""
		}
		result = intPart[start:i] + separator + result
	}

	return result
}
