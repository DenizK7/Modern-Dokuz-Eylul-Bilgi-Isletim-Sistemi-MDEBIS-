package main

import "github.com/gorilla/mux"

func Router() *mux.Router {

	router := mux.NewRouter()
	router.HandleFunc("/log_student/{username}/{password}", student_log_in)
	router.HandleFunc("/log_lecturer/{username}/{password}", lecturer_log_in)
	router.HandleFunc("/student_forgot/{username}", student_forgot)
	router.HandleFunc("/get_gen_announcements", get_general_announcements)
	router.HandleFunc("/get_course_announcements", handler_get_course_announcements)
	router.HandleFunc("/get_courses", handler_get_courses)
	return router
}
