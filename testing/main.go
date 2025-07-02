package main

import (
	"encoding/json"
	"fmt"
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
	/* // struct mapping and data manuplate testing
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
	*/

	/* // date formatting testing
	parsedDate, err := DateFormatter("2022-10-04", "02 Jan 2006")
	fmt.Println(parsedDate, err)
	*/
	number := -27993443313.33
	formattedNumber := ConvertToFormattedNumberPointer(&number)
	fmt.Println(formattedNumber)
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

func ConvertToFormattedNumberPointer(amount *float64) string {
	if amount == nil {
		return "--"
	}

	// Ensure amount is a float64
	value := *amount

	if value == 0.0 {
		return "0"
	}

	strVal := fmt.Sprintf("%.2f", value)
	isNegtiveNo := strings.Contains(strVal, "-")
	parts := strings.Split(strVal, ".")
	intPart := parts[0]
	decimalPart := parts[1]
	intSeparatedPart := ""

	for i, digit := range intPart {
		revIndex := len(intPart) - 1 - i

		if revIndex > 0 && ((revIndex == 3 && revIndex%3 == 0) || (revIndex > 3 && revIndex%2 != 0)) {
			intSeparatedPart += string(digit) + ","
		} else {
			intSeparatedPart += string(digit)
		}
	}

	return intSeparatedPart + "." + decimalPart
}
