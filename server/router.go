package main

import "github.com/gorilla/mux"

func Router() *mux.Router {

	router := mux.NewRouter()
	router.HandleFunc("/log_student/{username}/{password}", responseStudentLogIn)
	router.HandleFunc("/get_gen_announcements", responseGetGeneralAnnouncements)
	router.HandleFunc("/log_lecturer/{username}/{password}", responseLecturerLogIn)
	router.HandleFunc("/time_table/{sessionHash}", responseGetTimeTable)
	router.HandleFunc("/get_courses/{sessionHash}", responseGetCourses)
	router.HandleFunc("/log_manager/{id}/{password}", responseManagerLogIn)
	return router
}
