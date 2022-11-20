package main

import (
	"database/sql"
	"fmt"
	"net/http"

	_ "github.com/go-sql-driver/mysql"
	"golang.org/x/crypto/bcrypt"
)

/*CONSTANTS CAME HERE
 */
var db *sql.DB
var USER *user
var LAST_COURSE_ID *int
var LAST_ANNOUNCEMENT_ID *int

func main() {
	fmt.Println(string(hash_password("354152")))

	db_loc, err := sql.Open("mysql", "root:354152@tcp(127.0.0.1:3306)/mdebis")

	db = db_loc
	defer db.Close()
	// if there is an error opening the connection, handle it
	if err != nil {
		panic(err.Error())
	}

	rows, err := db.Query("SELECT * from MDEBIS.lecturer")
	for rows.Next() {
		var lecturer lecturer
		if err := rows.Scan(&lecturer.Id, &lecturer.Password, &lecturer.Name, &lecturer.Surname, &lecturer.E_mail, &lecturer.Dep_id, &lecturer.E_mail); err != nil {
			fmt.Println("error occured when getting courses")
		}
		lecturer.Password = string(hash_password_(lecturer.Password))
		res, err := db.Exec("UPDATE MDEBIS.lecturer SET Password=? where Lecturer_Id=?;", lecturer.Password, lecturer.Id)
		if err != nil {

		}
		if res != nil {

		}

	}

}
func hash_password_(password string) []byte {
	hashedPassword, err := bcrypt.GenerateFromPassword([]byte(password), 8)
	if err != nil {
		fmt.Printf("error occured when hashing")
		return nil
	}
	return hashedPassword
}
func enableCors(w *http.ResponseWriter) {
	(*w).Header().Set("Access-Control-Allow-Origin", "*")
	(*w).Header().Set("Access-Control-Allow-Headers", "Content-Type")

}
