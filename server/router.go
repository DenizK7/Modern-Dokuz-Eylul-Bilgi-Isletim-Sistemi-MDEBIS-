package main

import "github.com/gorilla/mux"

func Router() *mux.Router {

	router := mux.NewRouter()
	router.HandleFunc("/log_student/{username}/{password}", student_log_in).Methods("GET", "OPTIONS")

	return router
}
