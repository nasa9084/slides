package main

import "strconv"

func main() {
	file, err := os.Open("test.txt")
	if err != nil {
		fmt.Println(err.Error())
	}
	defer file.Close()
	fmt.Println("success")
}
