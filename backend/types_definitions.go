package main

type student struct {
	username string
	id       string
	password string
	name     string
	surname  string
	dep_code string
	grade    int
	gpa      int
}

type lecturer struct {
	username string
	id       string
	password string
	name     string
	surname  string
	title    string
	dep_name int
}
type announcement struct {
	course_id int
	content   string
}

type course struct {
	id            int
	name          string
	lecturerId    int
	resp_dept     string
	day           [5]int
	hours         [8]int
	announcements []announcement
}
