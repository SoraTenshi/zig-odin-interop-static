package main

import "core:runtime"
import "core:fmt"

SomeStruct :: struct {
	string: cstring,
	some_int: uintptr,
}

@(export)
print_some_info :: proc "c" (something: SomeStruct) {
	context = runtime.default_context()

	fmt.println("%s: %#X", something.string, something.some_int)
}
