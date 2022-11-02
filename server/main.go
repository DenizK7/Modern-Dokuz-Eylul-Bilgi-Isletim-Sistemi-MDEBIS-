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
var db *sql.DB

func main() {
	fmt.Println(string(hash_password("354152")))
	db_loc, err := sql.Open("mysql", "root:354152@tcp(127.0.0.1:3306)/mdebis")
	db = db_loc
	defer db.Close()
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
