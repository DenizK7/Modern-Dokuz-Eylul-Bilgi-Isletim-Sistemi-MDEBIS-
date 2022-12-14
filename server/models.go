package main

import "database/sql"

type user struct {
	Student  *student
	Lecturer *lecturer
	Manager  *manager
}
type student struct {
	Id               int
	Name             string
	Surname          string
	Year             int
	DepId            int
	GPA              float32
	EMail            string
	PhotoPath        sql.NullString
	Courses          []course
	CreatedTimeTable bool
	TimeTable        [40]time_table_entry
}

type lecturer struct {
	Id        string
	Name      string
	Surname   string
	EMail     string
	DepId     int
	Courses   []course
	Title     string
	PhotoPath sql.NullString
}
type general_announcement struct {
	AnnouncementId int
	Title          string
	Content        string
	Link           string
}
type announcement struct {
	AnnouncementId int
	CourseId       int
	Title          string
	Content        string
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
