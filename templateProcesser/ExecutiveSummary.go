package templateProcesser

import (
	"bytes"
	"fmt"
	"os"
	"text/template"
	. "wms_report/models"
	. "wms_report/utils"
)

func ExecuteSummaryTemp() []byte {
	// define executiveStruct
	var basicInforStructData Report
	//reterive executiveSummary data from json
	data, _ := os.ReadFile("../../wms/NorthernArc/JsonKeys/executive_summary.json")
	// mapping data to struct
	MapToStruct(data, &basicInforStructData)

	// creating template
	var tmpl, _ = template.New("ExecutiveSummary.typ").Funcs(FuncMap).ParseFiles("./assets/templateSource/ExecutiveSummary.typ")

	var buf bytes.Buffer
	// execute template with data
	err := tmpl.Execute(&buf, basicInforStructData)
	if err != nil {
		fmt.Println("failed to execute Transaction Report parsing template err: ", err)
	}
	return buf.Bytes()
}
