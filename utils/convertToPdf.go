package utils

import (
	"bytes"
	// "errors"
	"fmt"
	"os"
	"os/exec"
	"strings"

	"github.com/pkg/errors"
)

func ConvertToPdfBuffer(finalString string, customerName string, filePath string) ([]byte, error) {
	// finalString := ""
	// // fmt.Println("length", len(htmlStrings))
	// for i := 0; i < len(htmlStrings); i++ {
	// 	finalString += htmlStrings[i]
	// }

	// export TYPST_FONT_PATHS=fonts/
	cmd := exec.Command("typst", "compile", "-", "-")

	// Provide the Typst content via stdin
	cmd.Stdin = bytes.NewReader([]byte(finalString))

	// Capture the PDF output in memory
	var pdfBuffer bytes.Buffer
	cmd.Stdout = &pdfBuffer
	var stderr bytes.Buffer
	cmd.Stderr = &stderr

	// Run the command

	err := cmd.Run()
	// os.WriteFile("failed_typst_files/1.typ", []byte(finalString), 0644)
	if err != nil {
		fmt.Println("Error generating PDF :", stderr.String())
		err := os.WriteFile("failed_typst_files/1.typ", []byte(finalString), 0644)
		if err != nil {
			fmt.Println("Error writing Typst file:", err)
			// return nil, err
		}
		return nil, errors.New(stderr.String()) // typst compiler sends error to stderr
	}

	fileName := filePath + customerName + ".pdf"
	// // err = uploadToS3(client, fileName, &pdfBuffer)

	if "ENVIRONMENT" == "LOCAL" {
		err = os.WriteFile(fileName, pdfBuffer.Bytes(), 0644)
		if err != nil {
			fmt.Println("Error writing Typst file:", err)
		}
	}

	return pdfBuffer.Bytes(), nil

}

func ConvertToPdfLocal(finalString []byte, portfolio string) ([]byte, error) {
	processedPath := "./GeneratedOutput/"
	processedFileName := processedPath + portfolio + ".pdf"
	failedPath := "./FaildOutput/"
	faildFileName := failedPath + portfolio + ".typ"
	// export TYPST_FONT_PATHS=fonts/
	cmd := exec.Command("typst", "compile", "-", "-")

	// Provide the Typst content via stdin
	cmd.Stdin = bytes.NewReader(finalString)

	// Capture the PDF output in memory
	var pdfBuffer bytes.Buffer
	cmd.Stdout = &pdfBuffer
	var stderr bytes.Buffer
	cmd.Stderr = &stderr

	// Run the command
	if err := cmd.Run(); err != nil {
		if err := os.MkdirAll(failedPath, os.ModePerm); err != nil {
			fmt.Println("Error creating faild directory ", portfolio, ":", err)
		}
		fmt.Println("Error generating PDF :", stderr.String(), err)
		os.WriteFile(faildFileName, finalString, 0777)
		return nil, err
	}
	// creating dir if not exit to store output file
	if err := os.MkdirAll(processedPath, os.ModePerm); err != nil {
		fmt.Println("Error creating directory ", portfolio, ":", err)
	}
	// creating output pdf
	errr := os.WriteFile(processedFileName, pdfBuffer.Bytes(), 0777)
	if errr != nil {
		fmt.Println("Error writing Typst file:", errr)
	}

	return pdfBuffer.Bytes(), nil

}

// Example function to transform the response
func GetErrorOrigin(err error) string {
	type stackTracer interface {
		StackTrace() errors.StackTrace
	}
	if stackErr, ok := err.(stackTracer); ok {
		stackTrace := stackErr.StackTrace()
		// fmt.Println("error stack", stackTrace)
		if len(stackTrace) > 1 {
			var stackTraceLogs []string
			for index, val := range stackTrace {
				if index != len(stackTrace)-1 {
					stackTraceLogs = append(stackTraceLogs, fmt.Sprintf("%v", val))
				}
			}
			finalLog := strings.Join(stackTraceLogs, " <-- ")
			return finalLog
		}
	}
	// Fallback if no stack trace
	return err.Error()
}
