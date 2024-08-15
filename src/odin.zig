
// Context :: struct {
// 	allocator:              Allocator,
// 	temp_allocator:         Allocator,
// 	assertion_failure_proc: Assertion_Failure_Proc,
// 	logger:                 Logger,
// 	random_generator:       Random_Generator,

// 	user_ptr:   rawptr,
// 	user_index: int,

// 	// Internal use only
// 	_internal: rawptr,
// }

// Allocator_Proc :: #type proc(allocator_data: rawptr, mode: Allocator_Mode,
//                              size, alignment: int,
//                              old_memory: rawptr, old_size: int,
//                              location: Source_Code_Location = #caller_location) -> ([]byte, Allocator_Error)
// Allocator :: struct {
// 	procedure: Allocator_Proc,
// 	data:      rawptr,
// }

// Assertion_Failure_Proc :: #type proc(prefix, message: string, loc: Source_Code_Location) -> !


// Logger :: struct {
// 	procedure:    Logger_Proc,
// 	data:         rawptr,
// 	lowest_level: Logger_Level,
// 	options:      Logger_Options,
// }

// Logger_Level :: enum uint {
// 	Debug   = 0,
// 	Info    = 10,
// 	Warning = 20,
// 	Error   = 30,
// 	Fatal   = 40,
// }

// Logger_Option :: enum {
// 	Level,
// 	Date,
// 	Time,
// 	Short_File_Path,
// 	Long_File_Path,
// 	Line,
// 	Procedure,
// 	Terminal_Color,
// 	Thread_Id,
// }

// Logger_Options :: bit_set[Logger_Option]
// Logger_Proc :: #type proc(data: rawptr, level: Logger_Level, text: string, options: Logger_Options, location := #caller_location)

// Random_Generator_Mode :: enum {
// 	Read,
// 	Reset,
// 	Query_Info,
// }

// Random_Generator_Query_Info_Flag :: enum u32 {
// 	Cryptographic,
// 	Uniform,
// 	External_Entropy,
// 	Resettable,
// }
// Random_Generator_Query_Info :: distinct bit_set[Random_Generator_Query_Info_Flag; u32]

// Random_Generator_Proc :: #type proc(data: rawptr, mode: Random_Generator_Mode, p: []byte)

// Random_Generator :: struct {
// 	procedure: Random_Generator_Proc,
// 	data:      rawptr,
// }

