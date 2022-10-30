package main

import (
	"database/sql"
	"encoding/json"
)

func student_log_in(username string, password string) (bool, []byte) {
	var student student
	if err := db.QueryRow("SELECT * from mdebis.student where username=? and password=?",
		username, password).Scan(&student.Username, &student.Id, &student.Password,
		&student.Surname, &student.Dep_code, &student.Grade, &student.Name, &student.Gpa); err != nil {
		if err == sql.ErrNoRows {
			return false, nil
		}
		return false, nil
	}
	json_student, err := json.Marshal(student)
	if err != nil {
		return false, nil
	}
	return true, json_student
}

func lecturer_log_in(username string, password string) (bool, []byte) {
	var lecturer lecturer
	if err := db.QueryRow("SELECT * from mdebis.lecturer where username=? and password=?",
		username, password).Scan(&lecturer.Username, &lecturer.Id, &lecturer.Password,
		&lecturer.Surname, &lecturer.Title, &lecturer.Dep_name); err != nil {
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
