package main

import (
	"database/sql"
	"fmt"

	_ "github.com/go-sql-driver/mysql"
)

func main() {
	db, err := sql.Open("mysql", "root:354152@tcp(127.0.0.1:3306)/mdebis")

	// if there is an error opening the connection, handle it
	if err != nil {
		panic(err.Error())
	}
	insert, err := db.Query("INSERT INTO manager VALUES ( 2,1, 'TEST','eren' )")

	// if there is an error inserting, handle it
	if err != nil {
		panic(err.Error())
	}
	// be careful deferring Queries if you are using transactions
	defer insert.Close()

	fmt.Println("CONNECTION AND INSERTION OPERATIN ESTABLISHED SUCCESFULLY!")
}
