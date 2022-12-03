package main

import (
	json "encoding/json"
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
		if err := rows.Scan(&announcement.AnnouncementId, &announcement.Title, &announcement.Content, &announcement.Link); err != nil {
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
	encoder := json.NewEncoder(w)
	err, realPassword := getRealPasswordStudent(id)
	if err == true {
		encoder.Encode(false)
		return
	}
	if bcrypt.CompareHashAndPassword([]byte(realPassword), []byte(typedPassword)) != nil {
		// If the two passwords don't match, return a 401 status
		fmt.Println("password error")
		err := json.NewEncoder(w).Encode("false")
		if err != nil {
			encoder.Encode(false)
			return
		}
		encoder.Encode(false)
		return
	}
	//create student struct and return its information
	isAchieved, sessionHash, student := getStudent(id)
	if isAchieved == false {
		fmt.Println("error occured when logging")
		encoder.Encode(false)
		return
	}
	encoder.Encode(student)
	encoder.Encode(sessionHash)

}

/*
this functin responses the request by encoding the time table in json format
!ATTENTION! - STUDENT MUST ALREADY LOGGED IN - !ATTENTION!
*/

func getTimeTable(w http.ResponseWriter, r *http.Request) {
	enableCors(&w)
	params := mux.Vars(r)
	sessionHash := params["sessionHash"]
	user := getUser(sessionHash)
	if user == nil {
		fmt.Println("! ! !first you MUST log in! ! !")
	}
	getCoursesTimeTable(user.Student)
	json.NewEncoder(w).Encode(user.Student.TimeTable)
}

/*
This function returns randomly created hash
to hold the logged user's records
to be able to serve them later faster without a need to log in everytime
*/
func generateRandomSession() string {
	s1 := rand.NewSource(time.Now().UnixNano())
	r1 := rand.New(s1)
	return string(hashPassword(string(r1.Intn(100000))))

}
func lecturerLogIn(w http.ResponseWriter, r *http.Request) {
	enableCors(&w)
	encoder := json.NewEncoder(w)
	params := mux.Vars(r)
	id := params["username"]
	typedPassword := params["password"]
	isFound, realPassword := getRealPasswordLecturer(id)
	if isFound == false {
		encoder.Encode(false)
		return
	}
	if bcrypt.CompareHashAndPassword([]byte(realPassword), []byte(typedPassword)) != nil {
		// If the two passwords don't match, return a 401 status
		fmt.Println("password error")
		err := json.NewEncoder(w).Encode("false")
		if err != nil {
			encoder.Encode(false)
			return
		}
		encoder.Encode(false)
		return
	}
	//create student struct and return its information
	isFoundLecturer, sessionKey, lecturer := getLecturer(id)
	if isFoundLecturer == false {
		encoder.Encode(false)
		return
	}
	encoder.Encode(lecturer)
	encoder.Encode(sessionKey)

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
