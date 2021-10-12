package main

import (
	"fmt"

	"github.com/spf13/viper"
)

const UserKey = "User"

func main() {
	viper.Set(UserKey, "Alice")
	fmt.Println("Hello " + viper.GetString(UserKey))
}
