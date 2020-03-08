package main

import (
    "fmt"
    "net/http"
    "time"
)

func greeting(w http.ResponseWriter, r *http.Request) {
    dt := time.Now()
    fmt.Fprintf(w, "Hello! Welcome to my containerized web server in Golang!\nToday's date and time is: %s", dt.Format("02-01-2006 15:04:05 Monday"))
}

func main() {
    fmt.Println("Server started")
    http.HandleFunc("/", greeting)

    http.ListenAndServe(":8080", nil)
}
