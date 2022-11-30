package main

import "database/sql"

type user struct {
	Students  []student
	Lecturers []lecturer
	Managers  []manager
}
type student struct {
	Id         int
	Name       string
	Surname    string
	Year       int
	Dep_Id     int
	GPA        float32
	E_mail     string
	Photo_Path string
}

type lecturer struct {
	Id         string
	Name       string
	Surname    string
	E_mail     string
	Dep_id     int
	Title      string
	Photo_Path string
}
type general_announcement struct {
	Announcement_id int
	Title           string
	Content         string
	Link            string
}
type announcement struct {
	Announcement_id int
	Course_id       int
	Title           string
	Content         string
}

type course struct {
	Id                string
	Name              string
	Dep_Id            int
	Attandence_Limit  int
	Time_Inf          []time_for_table
	Credit            int
	Announcements     []announcement
	Lecturer_username string
}

type department struct {
	Id           int
	Head_Lect_Id int
	Name         string
}

type manager struct {
	Id         int
	Name       string
	Surname    string
	Photo_Path sql.NullString
}

type time_for_table struct {
	Day  int
	Hour int
}
