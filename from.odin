package main

import "core:runtime"
import "core:fmt"

SomeStruct :: struct {
	string: cstring,
	some_int: uintptr,
}

Arithmetic :: struct {
	first: uintptr,
	second: uintptr,
}

@export
print_some_info :: proc "c" (something: SomeStruct) {
	context = runtime.default_context()

	fmt.println("%s: %#X", something.string, something.some_int)
}

@export
add_stuff :: proc "c" (lhs: uintptr, rhs: uintptr) -> uintptr {
	return lhs + rhs
}

@export
do_arithmetic :: proc "c" (a: Arithmetic) -> uintptr {
	return a.first * a.second
}
