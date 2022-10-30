package main

type student struct {
	Username string
	Id       string
	Password string
	Name     string
	Surname  string
	Dep_name string
	Grade    int
	Gpa      int
	E_mail   string
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
	Course_id int
	Content   string
}

type course struct {
	Id            int
	Name          string
	LecturerId    int
	Resp_dept     string
	Day           [5]int
	Hours         [8]int
	Announcements []announcement
}
