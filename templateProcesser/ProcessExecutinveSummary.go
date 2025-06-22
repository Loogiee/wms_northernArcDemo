package templateProcesser

import (
	"fmt"
	. "wms_report/models"
	. "wms_report/utils"

	"github.com/pkg/errors"
)

func ProcessExecutinveSummary(sqlData *string) (string, error) {
	// define executiveStruct
	var parsingData []ExecutiveSummary

	if err := MapToStruct(*sqlData, &parsingData); err != nil {
		return "", errors.Wrap(err, "Error converting title map to struct: ")
	}
	fmt.Println(parsingData[0].AllocationComparisonSection[1].StrategicPercentage)
	return "buf.String()", nil
}
