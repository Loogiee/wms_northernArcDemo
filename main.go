package main

import (
	"fmt"
	"log"
	"log/slog"
	"os"
	"strconv"
	"strings"
	. "wms_report/db"

	. "wms_report/models"
	. "wms_report/templateProcesser"
	. "wms_report/utils"
	. "wms_report/validate"

	"github.com/gin-gonic/gin"
	"github.com/google/uuid"
	"github.com/pkg/errors"
)

func init() {
	// loads all the env variables at the start of the program
	LoadEnv()
	// setting fonts as global env for typst
	fontSetEnvErr := os.Setenv("TYPST_FONT_PATHS", "/assets/fonts")
	if fontSetEnvErr != nil {
		fmt.Println("Error setting environment variable:", fontSetEnvErr)
	}
	// ping db at the start. terminate on ping failure
	db, err := ConnectToDB()
	if err != nil {
		log.Fatalf("Failed! connect to db, error: %v", err)
	}
	db.Close()

}

var logger *slog.Logger
var FinalTemp []byte

func main() {
	if ENVIRONMENT == "" {
		log.Fatalf("ENVIRONMENT variable not found in env")
	}
	// Initialize Gin router
	r := gin.Default()
	r.POST("/generate_reports", reportHandler)

	// Start the Gin HTTP server
	port, err := strconv.Atoi(GOPORT)
	if err != nil {
		log.Fatal("Error setting environment Missing Port:", err)

	}
	fmt.Printf("Starting server on port %d...\n", port)
	if err := r.Run(fmt.Sprintf(":%d", port)); err != nil {
		log.Fatalf("Error starting server: %v", err)
	}

}

func reportHandler(c *gin.Context) {
	var requestBody RequestBody
	// Generate a new UUID
	uuid := uuid.New()
	traceId := uuid.String()

	if err := c.ShouldBindJSON(&requestBody); err != nil {
		fmt.Print("Error binding RequstBody JSON:", err, "Origin", GetErrorOrigin(err))
		c.JSON(400, gin.H{"error": err.Error()})
		return
	}

	fmt.Println("Trace ID:", traceId, "Request received to generate report", requestBody.Portfolio)
	db, err := ConnectToDB()
	if err != nil {
		// stackTrace := fmt.Sprintf("%+v", err)
		fmt.Println("DB connection or ping fails", "Category", "DB", "error", err, "Origin", GetErrorOrigin(err))
		c.JSON(500, gin.H{"error": "Failed to connect to db"})
		log.Fatalf("Failed to connect to Oracle database: %v", err)
		return
	}
	requestedReports := requestBody.RequestedReports
	customer := requestBody.CustomerName
	portfolio := requestBody.Portfolio
	reportDate := requestBody.ReportDate
	fmt.Printf("Generating report for customer: %s, portfolio: %s, report date: %s, report srlno: %v\n", customer, portfolio, reportDate, requestedReports)
	defer db.Close()

	// strict validation for the incoming request body
	if obj := ValidateAdHocRequest(requestBody); len(obj) != 0 {
		c.JSON(406, gin.H{"error": obj})
		return
	}
	pdfData, _ := ConvertToPdfLocal(FinalTemp, "./GeneratedOutput/", "output.pdf")

	c.Header("Content-Type", "application/pdf")
	c.Header("Content-Disposition", "attachment; filename=report.pdf")
	c.Data(200, "application/pdf", pdfData)

}

func reportHandler2(c *gin.Context) {
	// title template
	TitleTemp, TitleErr := os.ReadFile("./assets/templateSource/Title.typ")
	if TitleErr != nil {
		log.Fatalf("Failed to read title template, error: %v", TitleErr)
	}
	FinalTemp = append(FinalTemp, TitleTemp...)

	// executive summary template
	ExeSumTemp := ExecuteSummaryTemp()
	FinalTemp = append(FinalTemp, ExeSumTemp...)

	// Convert the final template to PDF
	ConvertToPdfLocal(FinalTemp, "./GeneratedOutput/", "output.pdf")
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
