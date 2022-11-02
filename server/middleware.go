package main

import (
	"database/sql"
	"encoding/json"
	"fmt"
	"net/http"
	"strings"

	"github.com/gorilla/mux"
	"golang.org/x/crypto/bcrypt"
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
	enableCors(&w)
	params := mux.Vars(r)
	username := params["username"]
	password := params["password"]

	var student student

	if err := db.QueryRow("SELECT * from mdebis.student where username=?", username).Scan(&student.Username,
		&student.Id, &student.Password, &student.Surname, &student.Dep_name, &student.Grade,
		&student.Name, &student.Gpa, &student.E_mail); err != nil {
		if err == sql.ErrNoRows {
			fmt.Println("no student")
			json.NewEncoder(w).Encode("false")
			return
			//return false, nil, student
		}
		json.NewEncoder(w).Encode("false")
		return
		//return false, nil, student
	}
	if bcrypt.CompareHashAndPassword([]byte(student.Password), []byte(password)) != nil {
		// If the two passwords don't match, return a 401 status
		fmt.Println("password error")
		json.NewEncoder(w).Encode("false")
		return
	}

	//return true, json_student, student
	fmt.Println("found the student :)")

	json.NewEncoder(w).Encode(student)
}
func hash_password(password string) []byte {
	hashedPassword, err := bcrypt.GenerateFromPassword([]byte(password), 8)
	if err != nil {
		fmt.Printf("error occured when hashing")
		return nil
	}
	return hashedPassword
}
func lecturer_log_in(w http.ResponseWriter, r *http.Request) {
	enableCors(&w)
	params := mux.Vars(r)
	username := params["username"]
	password := params["password"]
	var lecturer lecturer
	if err := db.QueryRow("SELECT * from mdebis.lecturer where username=? and password=?", username).Scan(&lecturer.Username, &lecturer.Id, &lecturer.Password, &lecturer.Name,
		&lecturer.Surname, &lecturer.Title, &lecturer.Dep_name, &lecturer.E_mail); err != nil {
		if err == sql.ErrNoRows {
			return
		}
		return
	}
	if bcrypt.CompareHashAndPassword([]byte(lecturer.Password), []byte(password)) != nil {
		// If the two passwords don't match, return a 401 status
		fmt.Println("password error")
		json.NewEncoder(w).Encode("false")
		return
	}
	json.NewEncoder(w).Encode(lecturer)
}

func student_forgot(w http.ResponseWriter, r *http.Request) {
	enableCors(&w)
	w.Header().Set("Access-Control-Allow-Origin", "*")

	var student student
	params := mux.Vars(r)
	username := params["username"]

	if err := db.QueryRow("SELECT * from mdebis.student where username=?",
		username).Scan(&student.Username, &student.Id, &student.Password,
		&student.Surname, &student.Dep_name, &student.Grade, &student.Name, &student.Gpa, &student.E_mail); err != nil {
		if err == sql.ErrNoRows {
			json.NewEncoder(w).Encode(false)
			fmt.Println("NO STUDENT")
			return
			//return false, nil
		}
		fmt.Println("NO STUDENT")
		return
		//return false, nil
	}
	fmt.Println("mail sent")
	//return true, json_mail
	json.NewEncoder(w).Encode(true)
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

func get_courses(student *student) {
	rows, err := db.Query("SELECT * from mdebis.course where idCourse=(SELECT idCourse FROM mdebis.course_has_student WHERE idStudent=?);", student.Id)
	if err != nil {
		//return nil
	}
	defer rows.Close()

	var courses []course

	// Loop through rows, using Scan to assign column data to struct fields.
	for rows.Next() {
		var course course
		if err := rows.Scan(&course.Id, &course.Name, &course.LecturerId, &course.Resp_dept, &course.Day, &course.Hours, &course.Lecturer_username); err != nil {
			//	return nil
		}
		courses = append(courses, course)
	}
	student.Courses = courses
	//json_courses, err := json.MarshalIndent(courses, "", "")
	//return json_courses

}
func get_course_announcements(student *student) []byte {
	if student.Courses == nil {
		get_courses(student)
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
