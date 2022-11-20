package main

type user struct {
	Student    student
	Lecturer   lecturer
	IsStudent  bool
	IsLecturer bool
}
type student struct {
	Id            string
	Password      string
	Name          string
	Surname       string
	Year          int
	Grade         int
	Gpa           float32
	E_mail        string
	Dep_Id        int
	Courses       []course
	Announcements []announcement
}

type lecturer struct {
	Id       string
	Password string
	Name     string
	Surname  string
	Title    string
	Dep_id   int
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
