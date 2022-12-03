package main

import (
	"database/sql"
	"encoding/json"
	"fmt"
	"net/http"

	"github.com/gorilla/mux"
	"golang.org/x/crypto/bcrypt"
)

func getGeneralAnnouncements(w http.ResponseWriter, r *http.Request) {
	enableCors(&w)
	if GENERAL_ANNOUNCEMENTS != nil {
		json.NewEncoder(w).Encode(GENERAL_ANNOUNCEMENTS)
		return
	}
	rows, err := DB.Query("SELECT * FROM mdebis.general_announcement")
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
		announcements = append(announcements, announcement)
	}
	GENERAL_ANNOUNCEMENTS = &announcements
	json.NewEncoder(w).Encode(announcements)
}

func student_log_in(w http.ResponseWriter, r *http.Request) {
	enableCors(&w)
	params := mux.Vars(r)
	id := params["username"]
	typed_password := params["password"]
	var real_password string

	if err := DB.QueryRow("SELECT Password from mdebis.student where Student_Id=?", id).Scan(&real_password); err != nil {
		if err == sql.ErrNoRows {
			fmt.Println("error occured when finding the student")
			json.NewEncoder(w).Encode("ERROR: NO SUCH A STUDENT")
			return
		}
		fmt.Println("error occured when finding the student")
		json.NewEncoder(w).Encode("false")
		return
		//return false, nil, student
	}
	if bcrypt.CompareHashAndPassword([]byte(real_password), []byte(typed_password)) != nil {
		// If the two passwords don't match, return a 401 status
		fmt.Println("password error")
		json.NewEncoder(w).Encode("false")
		return
	}
	//create student struct and return its informations
	var student student
	if err := DB.QueryRow("SELECT Student_Id,Name,Surname,Year,Department_Id,Mail,GPA,Photo_Path from mdebis.student where Student_Id=?", id).Scan(&student.Id, &student.Name, &student.Surname, &student.Year, &student.Dep_Id, &student.E_mail, &student.GPA, &student.Photo_Path); err != nil {
		if err == sql.ErrNoRows {
			fmt.Println("error occured when finding the student")

			json.NewEncoder(w).Encode("ERROR: NO SUCH A STUDENT")
			return
		}
		fmt.Println("error occured when finding the student")
		json.NewEncoder(w).Encode("ERROR")
		fmt.Println(err.Error())
		return
		//return false, nil, student
	}

	json.NewEncoder(w).Encode(student)
}
func lecturer_log_in(w http.ResponseWriter, r *http.Request) {
	enableCors(&w)
	params := mux.Vars(r)
	id := params["username"]
	typed_password := params["password"]
	var real_password string

	if err := DB.QueryRow("SELECT Password from mdebis.lecturer where Lecturer_Id=?", id).Scan(&real_password); err != nil {
		if err == sql.ErrNoRows {
			fmt.Println("error occured when finding the student")
			json.NewEncoder(w).Encode("ERROR: NO SUCH A STUDENT")
			return
		}
		fmt.Println("error occured when finding the lecturer")
		json.NewEncoder(w).Encode("false")
		return
		//return false, nil, student
	}
	if bcrypt.CompareHashAndPassword([]byte(real_password), []byte(typed_password)) != nil {
		// If the two passwords don't match, return a 401 status
		fmt.Println("password error")
		json.NewEncoder(w).Encode("false")
		return
	}
	//create student struct and return its informations
	var lecturer lecturer
	if err := DB.QueryRow("SELECT Lecturer_Id,Name,Surname,Mail,Department_Id,Title,Photo_Path from mdebis.lecturer where Lecturer_Id=?", id).Scan(&lecturer.Id, &lecturer.Name, &lecturer.Surname, &lecturer.E_mail, &lecturer.Dep_id, &lecturer.Title, &lecturer.Photo_Path); err != nil {
		if err == sql.ErrNoRows {
			fmt.Println("error occured when finding the lecturer")

			json.NewEncoder(w).Encode("ERROR: NO SUCH A STUDENT")
			return
		}
		fmt.Println("error occured when finding the lecturer")
		json.NewEncoder(w).Encode("ERROR")
		fmt.Println(err.Error())
		return
	}

	json.NewEncoder(w).Encode(lecturer)

}
func manager_log_in(w http.ResponseWriter, r *http.Request) {
	enableCors(&w)
	params := mux.Vars(r)
	id := params["username"]
	typed_password := params["password"]
	var real_password string

	if err := DB.QueryRow("SELECT Password from mdebis.manager where Manager_Id=?", id).Scan(&real_password); err != nil {
		if err != nil {
			fmt.Println(err.Error())
			json.NewEncoder(w).Encode(err.Error())
			return
		}

		//return false, nil, student
	}
	if bcrypt.CompareHashAndPassword([]byte(real_password), []byte(typed_password)) != nil {
		// If the two passwords don't match, return a 401 status
		fmt.Println("password error")
		json.NewEncoder(w).Encode("WRONG PASSWORD!")
		return
	}
	//create student struct and return its informations
	var manager manager
	if err := DB.QueryRow("SELECT Manager_Id,Name,Surname,Photo_Path from mdebis.manager where Manager_Id=?", id).Scan(&manager.Id, &manager.Name, &manager.Surname, &manager.Photo_Path); err != nil {
		fmt.Println("error occured when finding the lecturer")
		json.NewEncoder(w).Encode("ERROR")
		fmt.Println(err.Error())
		return
		//return false, nil, student
	}

	json.NewEncoder(w).Encode(manager)

}
func hash_password(password string) []byte {
	hashedPassword, err := bcrypt.GenerateFromPassword([]byte(password), 8)
	if err != nil {
		fmt.Printf("error occured when hashing")
		return nil
	}
	return hashedPassword
}
