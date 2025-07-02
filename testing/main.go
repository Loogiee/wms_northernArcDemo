package main

import (
	"encoding/json"
	"fmt"
	"time"
)

type QuarterlyAllocationData struct {
	QuarterlyAllocationSection []QuarterlyAllocation `json:"quarterly_allocation_section"`
}

type QuarterlyAllocation struct {
	Date        string       `json:"Date"` // You can use time.Time if you want to parse the date
	Allocations []Allocation `json:"allocations"`
}

type Allocation struct {
	AssetGroupName string  `json:"asset_group_name"`
	Value          float64 `json:"value"`
}

func main() {
	// struct mapping and data manuplate testing
	var FinalData []QuarterlyAllocation
	var parsedData []map[string]interface{}
	jsonData := `[{"quarterly_allocation_section":[{"Date":"March 2024","allocations":[{"asset_group_name":"Commodities","value":1.92},{"asset_group_name":"Equities","value":98.08},{"asset_group_name":"Fixed Income","value":0},{"asset_group_name":"Liquid","value":0}]},{"Date":"June 2024","allocations":[{"asset_group_name":"Commodities","value":1.76},{"asset_group_name":"Equities","value":98.24},{"asset_group_name":"Fixed Income","value":0},{"asset_group_name":"Liquid","value":0}]},{"Date":"September 2024","allocations":[{"asset_group_name":"Commodities","value":1.15},{"asset_group_name":"Equities","value":98.84},{"asset_group_name":"Fixed Income","value":0},{"asset_group_name":"Liquid","value":0.01}]},{"Date":"December 2024","allocations":[{"asset_group_name":"Commodities","value":0.62},{"asset_group_name":"Equities","value":98.26},{"asset_group_name":"Fixed Income","value":1.11},{"asset_group_name":"Liquid","value":0.01}]}]}]`

	if err := json.Unmarshal([]byte(jsonData), &parsedData); err != nil {
		fmt.Println("failed to unmarshal JSON_DATA:", err)
	}
	for _, mainGroup := range parsedData {
		fmt.Println("mainGroup: ", mainGroup)
		for group, data := range mainGroup {
			fmt.Println("Group:", group, "Data:", data)
			MapToStruct(data, &FinalData)
		}
	}
	fmt.Println("FinalData:", FinalData)
	fmt.Println()

	/* // date formatting testing
	parsedDate, err := DateFormatter("2022-10-04", "02 Jan 2006")
	fmt.Println(parsedDate, err)
	*/
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
