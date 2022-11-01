package main

import "github.com/gorilla/mux"

func Router() *mux.Router {

	router := mux.NewRouter()
	router.HandleFunc("/log_student/{username}/{password}", student_log_in)
	router.HandleFunc("/log_lecturer/{username}/{password}", lecturer_log_in)
	router.HandleFunc("/student_forgot/{username}", student_forgot)

	return router
}
