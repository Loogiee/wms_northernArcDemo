package validate

import (
	"reflect"
	"regexp"
	. "wms_report/models"

	"github.com/go-playground/validator/v10"
)

func ValidateAdHocRequest(requestBody RequestBody) []RequestApiError {
	validate := validator.New()
	validate.RegisterValidation("date", validateDate)
	validate.RegisterValidation("positivearr", validateIntegerArray)

	err := validate.Struct(requestBody)
	result := make([]RequestApiError, 0)
	if err != nil {
		validatorErrors := err.(validator.ValidationErrors)
		for _, errorField := range validatorErrors {
			// fmt.Println("tag", errorField.Tag())
			// fmt.Println("actual tag", errorField.ActualTag())
			jsonField, _ := reflect.TypeOf(requestBody).FieldByName(errorField.Field())
			result = append(result, RequestApiError{
				Field: jsonField.Tag.Get("json"),
				Msg:   msgForTag(errorField.Tag(), errorField.Type().String()),
			})
		}
	}
	return result
}

func validateDate(fl validator.FieldLevel) bool {
	re := regexp.MustCompile(`^\d{4}-\d{2}-\d{2}$`)
	return re.MatchString(fl.Field().String())
}

func validateIntegerArray(fl validator.FieldLevel) bool {
	numbers := fl.Field().Interface().([]int)

	// Loop through the array and check if each number is positive
	for _, num := range numbers {
		if num <= 0 || num > 29 {
			return false // If any number is not positive, return false
		}
	}

	return true // All numbers are positive
}

func msgForTag(tag string, datatype string) string {
	switch tag {
	case "required":
		return "This field is required with type " + datatype
	case "email":
		return "This field is required with non-empty valid email"
	case "date":
		return "Invalid date format. Accepted format is YYYY-MM-DD"
	case "positivearr":
		return "Invalid request reports, should be a non-empty array of positive integers with values between 1 and 29"
	}
	return ""
}
