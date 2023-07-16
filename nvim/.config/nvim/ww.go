package main

import (
	"fmt"
	"sync"
	"sync/atomic"
)

type st struct {
	a int
}

func main() {
	pool := sync.Pool{
		New: func() interface{} {
			return &st{}
		},
	}
	var g sync.Map

	var i atomic.Int32
	i.Add(1)
	i.Store(5)
	fmt.Println(i.Load())
}
