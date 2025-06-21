package main

import (
	"fmt"
	"log"
	"log/slog"
	"os"
	"strconv"
	. "wms_report/db"

	. "wms_report/models"
	. "wms_report/templateProcesser"
	. "wms_report/utils"
	. "wms_report/validate"

	"github.com/gin-gonic/gin"
	"github.com/google/uuid"
)

func init() {
	// loads all the env variables at the start of the program
	LoadEnv()
	// setting fonts as global env for typst
	fontSetEnvErr := os.Setenv("TYPST_FONT_PATHS", "./assets/fonts")
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
	defer db.Close()
	if err != nil {
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

	// strict validation for the incoming request body
	if obj := ValidateAdHocRequest(requestBody); len(obj) != 0 {
		c.JSON(406, gin.H{"error": obj})
		return
	}
	pdfByte := CreatePDFByte(requestedReports, customer, portfolio, reportDate, db, traceId)

	pdfData, _ := ConvertToPdfLocal(pdfByte, "./GeneratedOutput/", "output.pdf")

	c.Header("Content-Type", "application/pdf")
	c.Header("Content-Disposition", "attachment; filename=report.pdf")
	c.Data(200, "application/pdf", pdfData)
}
