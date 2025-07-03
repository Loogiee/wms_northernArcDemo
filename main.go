package main

import (
	"fmt"
	"io"
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
	// initial log dir and file
	os.MkdirAll("./logs", os.ModeAppend)
	logFile, err := os.OpenFile("./logs/app_log.json", os.O_CREATE|os.O_WRONLY|os.O_APPEND, 0666)
	if err != nil {
		panic(err)
	}
	defer logFile.Close()
	// MultiWriter to log to both console and file
	writer := io.MultiWriter(os.Stdout, logFile)
	handler := slog.NewJSONHandler(writer, &slog.HandlerOptions{
		Level: slog.LevelDebug,
	})
	logger = slog.New(handler)
	logger.Debug("Application Started")

	if ENVIRONMENT == "" {
		logger.Error("ENVIRONMENT variable not found in env")
		os.Exit(0)
	}
	// Initialize Gin router
	r := gin.Default()
	r.POST("/generate_reports", reportHandler)

	// Start the Gin HTTP server
	port, err := strconv.Atoi(GOPORT)
	if err != nil {
		logger.Error("Error setting environment Missing Port", "Err:", err)
		os.Exit(1)
	}
	logger.Info("Starting server on port", "Port :", GOPORT)
	if err := r.Run(fmt.Sprintf(":%d", port)); err != nil {
		logger.Error("Error starting server", "Err:", err)
		os.Exit(1)
	}

}

func reportHandler(c *gin.Context) {
	var requestBody RequestBody
	// Generate a new UUID
	uuid := uuid.New()
	traceId := uuid.String()
	if err := c.ShouldBindJSON(&requestBody); err != nil {
		logger.Error("Error binding RequstBody JSON:", "Err:", err, "Origin", GetErrorOrigin(err))
		c.JSON(400, gin.H{"error": err.Error()})
		return
	}
	fmt.Println("Trace ID:", traceId, "Request received to generate report", requestBody.Portfolio)
	db, err := ConnectToDB()
	if err != nil {
		logger.Error("DB connection or ping fails", "Category", "DB", "Err:", err, "Origin", GetErrorOrigin(err))
		c.JSON(500, gin.H{"error": "Failed to connect to db"})
		log.Fatalf("Failed to connect to Oracle database: %v", err)
		return
	}
	defer db.Close()
	requestedReports := requestBody.RequestedReports
	customer := requestBody.CustomerName
	portfolio := requestBody.Portfolio
	reportDate := requestBody.ReportDate
	logger.Info("Generating report", "ReportID:", requestedReports, "Customer:", customer, "Portfolio:", portfolio, "ReportDate:", reportDate)

	// strict validation for the incoming request body
	if obj := ValidateAdHocRequest(requestBody); len(obj) != 0 {
		c.JSON(406, gin.H{"error": obj})
		return
	}
	if len(requestedReports) == 0 {
		requestedReports = []int{1, 2, 3, 4, 5, 6}
	}
	pdfByte, err := CreatePDFByte(requestedReports, customer, portfolio, reportDate, db, traceId, logger)
	if err != nil {
		logger.Error("Error wile populating data in template", "Err:", err)
		c.JSON(500, gin.H{"message": "Error while populating data in template", "error": err.Error(), "traceId": traceId})
		return
	}
	pdfData, err := ConvertToPdfLocal(pdfByte, portfolio)
	if err != nil {
		c.JSON(500, gin.H{"message": "Error while genrating PDF file", "Error": err.Error(), "traceId": traceId})
		return
	}
	c.Header("Content-Type", "application/pdf")
	c.Header("Content-Disposition", "attachment; filename=report.pdf")
	c.Data(200, "application/pdf", pdfData)
}

// func reportConfig() {
// 	var SlideMap map[int]string = map[int]string{
// 		2: "executive_summary",
// 		3: "portfolio_allocation_summary",
// 		4: "Asset Class Summary",
// 		5: "Mutual Fund Analysis",
// 		6: "Capital Gain/Loss",
// 	}
// }
