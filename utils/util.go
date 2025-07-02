package utils

import (
	"encoding/json"
	"fmt"
	"html/template"
	"strings"
	"time"
)

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

func DateFormatter(dateStr string, format string) (string, error) {
	layout := "2006-01-02"
	parsedDate, err := time.Parse(layout, dateStr)
	if err != nil {
		return "", fmt.Errorf("failed to parse date: %w", err)
	}
	return parsedDate.Format(format), nil
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

func ConvertToDecimalValuePointer(amount *float64) string {
	if amount == nil {
		return "--"
	}
	if *amount == 0.0 {
		return "0"
	}
	return fmt.Sprintf("%.2f", *amount)
}
func ConvertToFormattedNumberPointer(amount *float64) string {
	if amount == nil {
		return "--"
	}
	if *amount == 0.0 {
		return "0"
	}

	stringVal := fmt.Sprintf("%.2f", *amount)
	parts := strings.Split(stringVal, ".")
	intPart := parts[0]
	decimalPart := parts[1]

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

	return result + "." + decimalPart
}
func ConvertToFormattedPercentagePointer(amount *float64) string {
	if amount == nil {
		return "--"
	}
	if *amount == 0.0 {
		return "0"
	}
	stringVal := fmt.Sprintf("%.2f", *amount)
	if *amount >= 100.0 {
		stringVal = fmt.Sprintf("%.0f", *amount)
		fmt.Println("amount >=100")
	}

	return stringVal
}
func Contains(input string, contain string) bool {
	return strings.Contains(strings.ToUpper(input), contain)
}

var FuncMap = template.FuncMap{
	"sub": func(a, b int) int { return a - b },
	"ConvertToFormattedNumberWithoutDecimalPointer": ConvertToFormattedNumberWithoutDecimalPointer,
	"ConvertToFormattedNumberPointer":               ConvertToFormattedNumberPointer,
	"ConvertToFormattedPercentagePointer":           ConvertToFormattedPercentagePointer,
	"DateFormatter":                                 DateFormatter,
	"Contains":                                      Contains,
}
