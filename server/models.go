package main

import "database/sql"

type user struct {
	Student  *student
	Lecturer *lecturer
	Manager  *manager
}
type student struct {
	Id                 int
	Name               string
	Surname            string
	Year               int
	Dep_Id             int
	GPA                float32
	E_mail             string
	Photo_Path         string
	Courses            []course
	Created_Time_Table bool
	Time_table         [40]time_table_entry
	SessionKey         string
}

type lecturer struct {
	Id         string
	Name       string
	Surname    string
	E_mail     string
	Dep_id     int
	Courses    []course
	Title      string
	Photo_Path string
	SessionKey string
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
	Id               string
	Name             string
	Dep_Id           int
	Attandence_Limit int
	Time_Inf         []course_time
	Credit           int
	Announcements    []announcement
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
	SessionKey string
}
type time_table_entry struct {
	Department       string
	Course_name      string
	Lecturer_name    string
	Attandence_Limit int
}
type course_time struct {
	Day  int
	Hour int
}
