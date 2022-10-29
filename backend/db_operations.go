package main

import (
	"fmt"
)

func student_log_in(username string, password string) {
	res, err := db.Query("SELECT * from mdebis.student where username=? and password=?", username, password)
	if err != nil {
		panic(err.Error())
	}
	var student student

	for res.Next() {
		err := res.Scan(&student.username, &student.id, &student.password, &student.surname, &student.dep_code, &student.grade, &student.name, &student.gpa)
		if err != nil {

		}

		fmt.Printf("%v\n", student)

	}
}

func lecturer_log_in(username string, password string) {

}
