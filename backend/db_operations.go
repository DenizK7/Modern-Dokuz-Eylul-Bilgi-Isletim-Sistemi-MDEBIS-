package main

import (
	"database/sql"
	"encoding/json"
)

func get_general_announcements() (bool, []byte) {
	rows, err := db.Query("SELECT * FROM mdebis.generalannouncement")
	if err != nil {
		return false, nil
	}
	defer rows.Close()

	var announcements []general_announcement

	// Loop through rows, using Scan to assign column data to struct fields.
	for rows.Next() {
		var announcement general_announcement
		if err := rows.Scan(&announcement.Announcement_id, &announcement.Title, &announcement.Content, &announcement.Link); err != nil {
			return false, nil
		}
		announcements = append(announcements, announcement)
	}
	json_announcements, err := json.MarshalIndent(announcements, "", "")

	return true, json_announcements
}

func student_log_in(username string, password string) (bool, []byte, student) {
	var student student
	if err := db.QueryRow("SELECT * from mdebis.student where username=? and password=?",
		username, password).Scan(&student.Username, &student.Id, &student.Password,
		&student.Surname, &student.Dep_name, &student.Grade, &student.Name, &student.Gpa, &student.E_mail); err != nil {
		if err == sql.ErrNoRows {
			return false, nil, student
		}
		return false, nil, student
	}
	json_student, err := json.Marshal(student)
	if err != nil {
		return false, nil, student
	}
	return true, json_student, student
}

func lecturer_log_in(username string, password string) (bool, []byte) {
	var lecturer lecturer
	if err := db.QueryRow("SELECT * from mdebis.lecturer where username=? and password=?",
		username, password).Scan(&lecturer.Username, &lecturer.Id, &lecturer.Password, &lecturer.Name,
		&lecturer.Surname, &lecturer.Title, &lecturer.Dep_name, &lecturer.E_mail); err != nil {
		if err == sql.ErrNoRows {
			return false, nil
		}
		return false, nil
	}
	json_lecturer, err := json.Marshal(lecturer)
	if err != nil {
		return false, nil
	}
	return true, json_lecturer
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

func get_courses(student *student) []byte {
	rows, err := db.Query("SELECT * from mdebis.course where idCourse=(SELECT idCourse FROM mdebis.course_has_student WHERE idStudent=?);", student.Id)
	if err != nil {
		return nil
	}
	defer rows.Close()

	var courses []course

	// Loop through rows, using Scan to assign column data to struct fields.
	for rows.Next() {
		var course course
		if err := rows.Scan(&course.Id, &course.Name, &course.LecturerId, &course.Resp_dept, &course.Day, &course.Hours, &course.Lecturer_username); err != nil {
			return nil
		}
		courses = append(courses, course)
	}
	student.Courses = courses
	json_courses, err := json.MarshalIndent(courses, "", "")
	return json_courses

}
func get_course_announcements(student_id int) []byte {

	return nil
}
