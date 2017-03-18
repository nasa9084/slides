package main

import "fmt"

func main() {
	// いわゆるfor
	for i := 0; i < 10; i++ {
		fmt.Println(i)
	}

	// whileに近いfor
	i := 0
	for i < 10 {
		fmt.Println(i)
		i++
	}

	// 拡張for
	array := []int{0, 1, 2, 3, 4, 5, 6, 7, 8, 9}
	for i := range array {
		fmt.Println(i)
	}
}
