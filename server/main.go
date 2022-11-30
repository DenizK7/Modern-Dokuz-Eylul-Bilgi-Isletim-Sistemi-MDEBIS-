package main

import (
	"database/sql"
	"fmt"
	"log"
	"net/http"

	_ "github.com/go-sql-driver/mysql"
)

/*CONSTANTS CAME HERE
 */
var DB *sql.DB
var ACTIVE_USERS *user
var GENERAL_ANNOUNCEMENTS *[]general_announcement

func main() {
	fmt.Println(string(hash_password("deniz2000")))
	var err error
	DB, err := sql.Open("mysql", "root:354152@tcp(127.0.0.1:3306)/mdebis")

	if err != nil {
		panic(err.Error())
	}
	defer DB.Close()
	r := Router()
	fmt.Println("Starting server on the port 8080...")
	log.Fatal(http.ListenAndServe(":8080", r))
}

func enableCors(w *http.ResponseWriter) {
	(*w).Header().Set("Access-Control-Allow-Origin", "*")
	(*w).Header().Set("Access-Control-Allow-Headers", "Content-Type")

}
