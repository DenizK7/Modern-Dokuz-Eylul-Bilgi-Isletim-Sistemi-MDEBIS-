package main

import (
	"database/sql"
	"encoding/json"
	"fmt"
	"net/http"
	"strings"

	"github.com/gorilla/mux"
)

func get_general_announcements(w http.ResponseWriter, r *http.Request) {
	rows, err := db.Query("SELECT * FROM mdebis.generalannouncement")
	if err != nil {
		//return false, nil
	}
	defer rows.Close()

	var announcements []general_announcement

	// Loop through rows, using Scan to assign column data to struct fields.
	for rows.Next() {
		var announcement general_announcement
		if err := rows.Scan(&announcement.Announcement_id, &announcement.Title, &announcement.Content, &announcement.Link); err != nil {
			//return false, nil
		}
		announcements = append(announcements, announcement)
	}
	json.NewEncoder(w).Encode(announcements)
	//return true, json_announcements
}

func student_log_in(w http.ResponseWriter, r *http.Request) {
	params := mux.Vars(r)
	username := params["username"]
	password := params["password"]

	var student student
	if err := db.QueryRow("SELECT * from mdebis.student where username=? and password=?",
		username, password).Scan(&student.Username, &student.Id, &student.Password,
		&student.Surname, &student.Dep_name, &student.Grade, &student.Name, &student.Gpa, &student.E_mail); err != nil {
		if err == sql.ErrNoRows {
			fmt.Println("no student")
			return
			//return false, nil, student
		}
		return
		//return false, nil, student
	}

	//return true, json_student, student
	fmt.Println("found the student :)")
	//For concurency concerns,
	pointer_glb_lecturer = nil
	pointer_glb_student = &student
	json.NewEncoder(w).Encode(student)
}

func lecturer_log_in(w http.ResponseWriter, r *http.Request) {
	params := mux.Vars(r)
	username := params["username"]
	password := params["password"]
	var lecturer lecturer
	if err := db.QueryRow("SELECT * from mdebis.lecturer where username=? and password=?",
		username, password).Scan(&lecturer.Username, &lecturer.Id, &lecturer.Password, &lecturer.Name,
		&lecturer.Surname, &lecturer.Title, &lecturer.Dep_name, &lecturer.E_mail); err != nil {
		if err == sql.ErrNoRows {
			//return false, nil
		}
		//return false, nil
	}
	pointer_glb_student = nil
	pointer_glb_lecturer = &lecturer
	json.NewEncoder(w).Encode(lecturer)
}

func student_forgot(username string) (bool, []byte) {
	var student student
	if err := db.QueryRow("SELECT * from mdebis.student where username=?",
		username).Scan(&student.Username, &student.Id, &student.Password,
		&student.Surname, &student.Dep_name, &student.Grade, &student.Name, &student.Gpa, &student.E_mail); err != nil {
		if err == sql.ErrNoRows {
			return false, nil
		}
		return false, nil
	}
	json_mail, err := json.Marshal(student.E_mail)
	if err != nil {
		return false, nil
	}
	return true, json_mail
}
func lecturer_forgot(username string) (bool, []byte) {
	var lecturer lecturer
	if err := db.QueryRow("SELECT * from mdebis.lecturer where username=?",
		username).Scan(&lecturer.Username, &lecturer.Id, &lecturer.Password, &lecturer.Name,
		&lecturer.Surname, &lecturer.Title, &lecturer.Dep_name, &lecturer.E_mail); err != nil {
		if err == sql.ErrNoRows {
			return false, nil
		}
		return false, nil
	}
	json_mail, err := json.Marshal(lecturer.E_mail)
	if err != nil {
		return false, nil
	}
	return true, json_mail
}

func get_courses(w http.ResponseWriter, r *http.Request) {
	rows, err := db.Query("SELECT * from mdebis.course where idCourse=(SELECT idCourse FROM mdebis.course_has_student WHERE idStudent=?);", pointer_glb_student.Id)
	if err != nil {
		//return nil
	}
	defer rows.Close()

	var courses []course

	// Loop through rows, using Scan to assign column data to struct fields.
	for rows.Next() {
		var course course
		if err := rows.Scan(&course.Id, &course.Name, &course.LecturerId, &course.Resp_dept, &course.Day, &course.Hours, &course.Lecturer_username); err != nil {
			//return nil
		}
		courses = append(courses, course)
	}
	pointer_glb_student.Courses = courses
	json.NewEncoder(w).Encode(courses)
}
func get_course_announcements(student *student) []byte {
	if pointer_glb_student.Courses == nil {
		//get_courses(student)
	}
	//collect course ids
	var course_ids []string
	var courses = student.Courses
	for i := 0; i < len(courses); i++ {
		course_ids = append(course_ids, courses[i].Id)
	}
	rows, err := db.Query("SELECT * from mdebis.announcement where Course_idCourse IN (?)", strings.Join(course_ids, ","))
	if err != nil {
		return nil
	}
	defer rows.Close()
	var announcements []announcement
	// Loop on rows, using Scan to assign column data to struct fields.
	for rows.Next() {
		var announcement announcement
		if err := rows.Scan(&announcement.Announcement_id, &announcement.Course_id, &announcement.Content); err != nil {
			return nil
		}
		announcements = append(announcements, announcement)
	}
	json_announcements, err := json.MarshalIndent(announcements, " ", " ")
	if err != nil {
		fmt.Println("error when converting to json")
	}
	return json_announcements
}
