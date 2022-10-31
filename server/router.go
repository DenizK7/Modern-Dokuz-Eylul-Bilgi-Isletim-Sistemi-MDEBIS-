package main

import "github.com/gorilla/mux"

func Router() *mux.Router {

	router := mux.NewRouter()
	router.HandleFunc("/log_student", student_log_in).Methods("GET", "OPTIONS")

	return router
}
