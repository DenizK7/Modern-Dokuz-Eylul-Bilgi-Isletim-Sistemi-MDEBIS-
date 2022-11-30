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

	defer DB.Close()
	// if there is an error opening the connection, handle it
	if err != nil {
		panic(err.Error())
	}
	r := Router()
	fmt.Println("Starting server on the port 8080...")
	log.Fatal(http.ListenAndServe(":8080", r))
}

func enableCors(w *http.ResponseWriter) {
	(*w).Header().Set("Access-Control-Allow-Origin", "*")
	(*w).Header().Set("Access-Control-Allow-Headers", "Content-Type")

}
