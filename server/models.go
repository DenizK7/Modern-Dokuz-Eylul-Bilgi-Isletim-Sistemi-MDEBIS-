package main

type user struct {
	Student    student
	Lecturer   lecturer
	IsStudent  bool
	IsLecturer bool
}
type student struct {
	Username      string
	Id            string
	Password      string
	Name          string
	Surname       string
	Dep_name      string
	Grade         int
	Gpa           int
	E_mail        string
	Courses       []course
	Announcements []announcement
}

type lecturer struct {
	Username string
	Id       string
	Password string
	Name     string
	Surname  string
	Title    string
	Dep_name string
	E_mail   string
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
	LecturerId        int
	Resp_dept         string
	Day               string
	Hours             string
	Announcements     []announcement
	Lecturer_username string
}
