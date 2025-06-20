package utils

import (
	"log"
	"os"
	"strconv"

	"github.com/joho/godotenv"
)

var ENVIRONMENT string
var HOST string
var DBPORT string
var SERVICENAME string
var USERNAME string
var PASSWORD string
var GOPORT string
var SMTP_HOST string
var SMTP_PORT int
var SMTP_MAXCONNS int
var SMTP_USER string
var SMTP_PASS string
var SHOW_LOGS string

func LoadEnv() {
	err := godotenv.Load()
	if err != nil {
		log.Fatal("Error loading .env file")
	}
	ENVIRONMENT = os.Getenv("ENVIRONMENT")
	HOST = os.Getenv("DB_HOST")
	DBPORT = os.Getenv("DB_PORT")
	SERVICENAME = os.Getenv("DB_SERVICE_NAME")
	USERNAME = os.Getenv("DB_USERNAME")
	PASSWORD = os.Getenv("DB_PASSWORD")
	GOPORT = os.Getenv("PORT")
	SMTP_HOST = os.Getenv("SMTP_HOST")
	SMTP_PORT, _ = strconv.Atoi(os.Getenv("SMTP_PORT"))
	SMTP_MAXCONNS, _ = strconv.Atoi(os.Getenv("SMTP_MAXCONNS"))
	SMTP_USER = os.Getenv("SMTP_USER")
	SMTP_PASS = os.Getenv("SMTP_PASS")
	SHOW_LOGS = os.Getenv("SHOW_LOGS")
}
