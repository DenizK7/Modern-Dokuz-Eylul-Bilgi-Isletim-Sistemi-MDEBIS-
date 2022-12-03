package main

import "github.com/gorilla/mux"

func Router() *mux.Router {

	router := mux.NewRouter()
	router.HandleFunc("/log_student/{username}/{password}", studentLogIn)
	router.HandleFunc("/get_gen_announcements", getGeneralAnnouncements)
	router.HandleFunc("/log_lecturer/{username}/{password}", lecturerLogIn)
	router.HandleFunc("/time_table/{sessionHash}", getTimeTable)

	return router
}
