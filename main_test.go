package main

import (
    "net/http"
    "net/http/httptest"
    "testing"
    "time"
    "fmt"
)

// Test function for "go test" to check server output is correct
// Test with "go test" from project root.
func TestHealthCheck(t *testing.T) {
    req, err := http.NewRequest("GET", "/", nil)

    if err != nil {
        t.Errorf("An error occurred. %v", err)
    }

    rr := httptest.NewRecorder()
    handler := http.HandlerFunc(greeting)

    handler.ServeHTTP(rr, req)

    if status := rr.Code; status != http.StatusOK {
        t.Errorf("Handler returned wrong status code. Got %v, want %v", status, http.StatusOK)
    }


    dt := time.Now()
    expected := fmt.Sprintf("Hello! Welcome to my containerized web server in Golang!\nToday's date and time is: %s", dt.Format("02-01-2006 15:04:05 Monday"))
    if rr.Body.String() != expected {
        t.Errorf("Handler returned incorrect body: Got %v, want %v", rr.Body.String(), expected)
    }
}
