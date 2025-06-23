package templateProcesser

import (
	"bytes"
	"encoding/json"
	"text/template"
	. "wms_report/models"
	. "wms_report/utils"

	"github.com/pkg/errors"
)

func ProcessTitle(sqlData *[]map[string]interface{}) (string, error) {
	var finalProcessData Overview

	for _, item := range *sqlData {
		var tempData []Overview
		for _, value := range item {
			jsonBytes, _ := json.Marshal(value)
			json.Unmarshal(jsonBytes, &tempData)
		}
		finalProcessData = tempData[0]
	}

	var tmpl, terr = template.New("Title.typ").Funcs(FuncMap).ParseFiles("./assets/templateSource/Title.typ")
	if terr != nil {
		return "", errors.Wrap(terr, "failed to parse title template:")
	}

	var buf bytes.Buffer
	if err := tmpl.Execute(&buf, finalProcessData); err != nil {
		return "", errors.Wrapf(err, "failed to execute parsed title template err: %v", err)
	}
	return buf.String(), nil
}
