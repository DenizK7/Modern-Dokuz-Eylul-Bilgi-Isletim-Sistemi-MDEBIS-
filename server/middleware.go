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
	enableCors(&w)
	fmt.Println("asd")
	rows, err := db.Query("SELECT * FROM mdebis.generalannouncement")
	if err != nil {
		fmt.Println("error occured when getting general announcements")
	}
	defer rows.Close()

	var announcements []general_announcement

	// Loop through rows, using Scan to assign column data to struct fields.
	for rows.Next() {
		var announcement general_announcement
		if err := rows.Scan(&announcement.Announcement_id, &announcement.Title, &announcement.Content, &announcement.Link); err != nil {
			fmt.Println("error occured when getting general announcements")

		}
		fmt.Println(announcement.Title)
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

	if err := db.QueryRow("SELECT * from mdebis.student where username=?", username).Scan(&student.Id,
		&student.Password, &student.Name, &student.Surname, &student.Year, &student.Dep_Id,
		&student.E_mail, &student.Gpa); err != nil {
		if err == sql.ErrNoRows {
			fmt.Println("error occured when finding the student")

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
	USER.Student = student
	USER.IsLecturer = false
	USER.IsStudent = true
	get_courses(&student)
	get_course_announcements(&student)
}
func hash_password(password string) []byte {
	hashedPassword, err := bcrypt.GenerateFromPassword([]byte(password), 8)
	if err != nil {
		fmt.Printf("error occured when hashing")
		return nil
	}
	return hashedPassword
}

func create_course(w http.ResponseWriter, r *http.Request) {
	if USER.IsLecturer == true {
		var course course
		err := json.NewDecoder(r.Body).Decode(&course)
		if err != nil {
			json.NewEncoder(w).Encode(false)
			fmt.Println("error occured when parsing data to course struct")
			return
		}
		res, err := db.Exec("INSERT INTO mdebis.course VALUES (?,?,?,?,?,?,NULL)", course.Name, course.LecturerId, course.Resp_dept, course.Day, course.Hours, course, course.Lecturer_username)
		if err != nil {
			fmt.Println("error occured when inserting a course to DB")
			json.NewEncoder(w).Encode(false)
			return
		} else {
			fmt.Println(res)
			fmt.Println("course inserted!")
			json.NewEncoder(w).Encode(true)
		}
	}
}

func student_forgot(w http.ResponseWriter, r *http.Request) {
	enableCors(&w)
	var student student
	params := mux.Vars(r)
	username := params["username"]

	if err := db.QueryRow("SELECT * from mdebis.student where username=?",
		username).Scan(&student.Id, &student.Password, &student.Name,
		&student.Surname, &student.Year, &student.Dep_Id, &student.E_mail, &student.Gpa); err != nil {
		if err == sql.ErrNoRows {
			json.NewEncoder(w).Encode(false)
			fmt.Println("error occured when finding the student")
			return
		}
		fmt.Println("error occured when finding the student")
		return
	}
	fmt.Println("mail sent")
	json.NewEncoder(w).Encode(true)
}

func handler_get_courses(w http.ResponseWriter, r *http.Request) {
	if USER.IsStudent == true {
		if USER.Student.Courses == nil {
			get_courses(&USER.Student)
		}
		json.NewEncoder(w).Encode(USER.Student.Courses)
	}
}

func get_courses(student *student) {
	rows, err := db.Query("SELECT * from mdebis.course where idCourse=(SELECT idCourse FROM mdebis.course_has_student WHERE idStudent=?);", student.Id)
	if err != nil {
		fmt.Println("error occured when getting courses")
	}
	defer rows.Close()

	var courses []course

	for rows.Next() {
		var course course
		if err := rows.Scan(&course.Id, &course.Name, &course.LecturerId, &course.Resp_dept, &course.Day, &course.Hours, &course.Lecturer_username); err != nil {
			fmt.Println("error occured when getting courses")
		}
		courses = append(courses, course)
	}
	student.Courses = courses

}

func handler_get_course_announcements(w http.ResponseWriter, r *http.Request) {
	if USER.IsStudent == true {
		if USER.Student.Announcements == nil {
			get_course_announcements(&USER.Student)
		}
		json.NewEncoder(w).Encode(&USER.Student.Announcements)
	}
}
func get_course_announcements(student *student) {
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
		fmt.Println("error occured when getting announcements")
	}
	defer rows.Close()
	var announcements []announcement
	// Loop on rows, using Scan to assign column data to struct fields.
	for rows.Next() {
		var announcement announcement
		if err := rows.Scan(&announcement.Announcement_id, &announcement.Course_id, &announcement.Content, &announcement.Title); err != nil {
			fmt.Println("error occured when getting announcements")
		}
		announcements = append(announcements, announcement)
	}
	student.Announcements = announcements
}
