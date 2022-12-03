package main

import (
	"database/sql"
	"encoding/json"
	"fmt"
	"github.com/gorilla/mux"
	"golang.org/x/crypto/bcrypt"
	"math/rand"
	"net/http"
	"time"
)

func getGeneralAnnouncements(w http.ResponseWriter, r *http.Request) {
	enableCors(&w)
	rows, err := DB.Query("SELECT * FROM mdebis.general_announcement")
	if err != nil {
		fmt.Println("error occurred when getting general announcements")
	}

	var announcements []general_announcement

	// Loop through rows, using Scan to assign column data to struct fields.
	for rows.Next() {
		var announcement general_announcement
		if err := rows.Scan(&announcement.Announcement_id, &announcement.Title, &announcement.Content, &announcement.Link); err != nil {
			fmt.Println("error occurred when getting general announcements")
		}
		announcements = append(announcements, announcement)
	}
	err = json.NewEncoder(w).Encode(announcements)
	if err != nil {
		return
	}
}

func studentLogIn(w http.ResponseWriter, r *http.Request) {
	enableCors(&w)
	params := mux.Vars(r)
	id := params["username"]
	typedPassword := params["password"]
	var realPassword string

	if err := DB.QueryRow("SELECT Password from mdebis.student where Student_Id=?", id).Scan(&realPassword); err != nil {
		if err == sql.ErrNoRows {
			fmt.Println("error occurred when finding the student")
			err := json.NewEncoder(w).Encode("ERROR: NO SUCH A STUDENT")
			if err != nil {
				return
			}
			return
		}
		fmt.Println("error occurred when finding the student")
		err := json.NewEncoder(w).Encode("false")
		if err != nil {
			return
		}
		return
		//return false, nil, student
	}
	if bcrypt.CompareHashAndPassword([]byte(realPassword), []byte(typedPassword)) != nil {
		// If the two passwords don't match, return a 401 status
		fmt.Println("password error")
		err := json.NewEncoder(w).Encode("false")
		if err != nil {
			return
		}
		return
	}
	//create student struct and return its information
	var student student
	if err := DB.QueryRow("SELECT Student_Id,Name,Surname,Year,Department_Id,Mail,GPA,Photo_Path from mdebis.student where Student_Id=?", id).Scan(&student.Id, &student.Name, &student.Surname, &student.Year, &student.Dep_Id, &student.E_mail, &student.GPA, &student.Photo_Path); err != nil {
		if err == sql.ErrNoRows {
			fmt.Println("error occurred when finding the student")

			err := json.NewEncoder(w).Encode("ERROR: NO SUCH A STUDENT")
			if err != nil {
				return
			}
			return
		}
		fmt.Println("error occurred when finding the student")
		err := json.NewEncoder(w).Encode("ERROR")
		if err != nil {
			return
		}
		fmt.Println(err.Error())
		return
		//return false, nil, student
	}
	student.SessionKey = generateRandomSession()
	//create new user record
	var newUser = new(user)
	newUser.Student = &student
	ACTIVE_USERS[student.SessionKey] = *newUser
	err := json.NewEncoder(w).Encode(student)
	if err != nil {
		return
	}
}
func getTimeTable(w http.ResponseWriter, r *http.Request) {
	enableCors(&w)
	params := mux.Vars(r)
	id := params["id"]

	//checking that this student

}

func generateRandomSession() string {
	s1 := rand.NewSource(time.Now().UnixNano())
	r1 := rand.New(s1)
	return string(hashPassword(string(r1.Intn(100000))))

}
func lecturerLogIn(w http.ResponseWriter, r *http.Request) {
	enableCors(&w)
	params := mux.Vars(r)
	id := params["username"]
	typedPassword := params["password"]
	var realPassword string

	if err := DB.QueryRow("SELECT Password from mdebis.lecturer where Lecturer_Id=?", id).Scan(&realPassword); err != nil {
		if err == sql.ErrNoRows {
			fmt.Println("error occurred when finding the student")
			err := json.NewEncoder(w).Encode("ERROR: NO SUCH A STUDENT")
			if err != nil {
				return
			}
			return
		}
		fmt.Println("error occurred when finding the lecturer")
		err := json.NewEncoder(w).Encode("false")
		if err != nil {
			return
		}
		return
		//return false, nil, student
	}
	if bcrypt.CompareHashAndPassword([]byte(realPassword), []byte(typedPassword)) != nil {
		// If the two passwords don't match, return a 401 status
		fmt.Println("password error")
		err := json.NewEncoder(w).Encode("false")
		if err != nil {
			return
		}
		return
	}
	//create student struct and return its information
	var lecturer lecturer
	if err := DB.QueryRow("SELECT Lecturer_Id,Name,Surname,Mail,Department_Id,Title,Photo_Path from mdebis.lecturer where Lecturer_Id=?", id).Scan(&lecturer.Id, &lecturer.Name, &lecturer.Surname, &lecturer.E_mail, &lecturer.Dep_id, &lecturer.Title, &lecturer.Photo_Path); err != nil {
		if err == sql.ErrNoRows {
			fmt.Println("error occurred when finding the lecturer")

			err := json.NewEncoder(w).Encode("ERROR: NO SUCH A STUDENT")
			if err != nil {
				return
			}
			return
		}
		fmt.Println("error occurred when finding the lecturer")
		err := json.NewEncoder(w).Encode("ERROR")
		if err != nil {
			return
		}
		fmt.Println(err.Error())
		return
	}

	lecturer.SessionKey = generateRandomSession()
	//create new user record
	var newUser = new(user)
	newUser.Lecturer = &lecturer
	ACTIVE_USERS[lecturer.SessionKey] = *newUser
	err := json.NewEncoder(w).Encode(lecturer)
	if err != nil {
		return
	}

}
func managerLogIn(w http.ResponseWriter, r *http.Request) {
	enableCors(&w)
	params := mux.Vars(r)
	id := params["username"]
	typedPassword := params["password"]
	var realPassword string

	if err := DB.QueryRow("SELECT Password from mdebis.manager where Manager_Id=?", id).Scan(&realPassword); err != nil {
		if err != nil {
			fmt.Println(err.Error())
			err := json.NewEncoder(w).Encode(err.Error())
			if err != nil {
				return
			}
			return
		}

		//return false, nil, student
	}
	if bcrypt.CompareHashAndPassword([]byte(realPassword), []byte(typedPassword)) != nil {
		// If the two passwords don't match, return a 401 status
		fmt.Println("password error")
		err := json.NewEncoder(w).Encode("WRONG PASSWORD!")
		if err != nil {
			return
		}
		return
	}
	//create student struct and return its information
	var manager manager
	if err := DB.QueryRow("SELECT Manager_Id,Name,Surname,Photo_Path from mdebis.manager where Manager_Id=?", id).Scan(&manager.Id, &manager.Name, &manager.Surname, &manager.Photo_Path); err != nil {
		fmt.Println("error occurred when finding the lecturer")
		err := json.NewEncoder(w).Encode("ERROR")
		if err != nil {
			return
		}
		fmt.Println(err.Error())
		return
		//return false, nil, student
	}

	err := json.NewEncoder(w).Encode(manager)
	if err != nil {
		return
	}

}
func hashPassword(password string) []byte {
	hashedPassword, err := bcrypt.GenerateFromPassword([]byte(password), 8)
	if err != nil {
		fmt.Printf("error occurred when hashing")
		return nil
	}
	return hashedPassword
}
