package templateProcesser

import (
	"bytes"
	"text/template"
	. "wms_report/models"
	. "wms_report/utils"

	"github.com/pkg/errors"
)

func ProcessTitle(wmsData *string, requestedReports []int) (string, error) {
	var parsingData []ReportOverview

	if err := MapToStruct(*wmsData, &parsingData); err != nil {
		return "", errors.Wrap(err, "Error converting title map to struct: ")
	}
	var tmpl, terr = template.New("Title.typ").Funcs(FuncMap).ParseFiles("./assets/templateSource/Title.typ")
	if terr != nil {
		return "", errors.Wrap(terr, "failed to parse title template:")
	}
	var buf bytes.Buffer
	err := tmpl.Execute(&buf, parsingData[0].OverviewSection[0])
	if err != nil {
		return "", errors.Wrapf(err, "failed to execute parsed title template err: %v", err)
	}
	return buf.String(), nil
}
