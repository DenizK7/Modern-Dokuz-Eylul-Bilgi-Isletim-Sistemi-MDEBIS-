package main

import (
	"database/sql"
	"fmt"

	_ "github.com/go-sql-driver/mysql"
)

/*CONSTANTS CAME HERE
 */
var db *sql.DB

func main() {
	db_loc, err := sql.Open("mysql", "root:354152@tcp(127.0.0.1:3306)/mdebis")
	db = db_loc
	defer db.Close()
	// if there is an error opening the connection, handle it
	if err != nil {
		panic(err.Error())
	}

	succes, res := lecturer_forgot("birant.derya")
	if succes == false {
		fmt.Println("no lecturer")
	} else {
		fmt.Printf("mail" + string(res))
	}
}
