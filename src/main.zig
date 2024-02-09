const std = @import("std");

const SomeInfo = extern struct {
    string: [*:0]const u8,
    some_int: usize,
};

const Arithmetic = extern struct {
    f: usize,
    s: usize,
};

extern fn print_some_info(something: SomeInfo) void;
extern fn add_stuff(lhs: usize, rhs: usize) usize;
extern fn do_arithmetic(a: Arithmetic) usize;

pub fn main() !void {
    const something = SomeInfo{
        .string = "Hello from odin!",
        .some_int = 0x1337,
    };

    const writer = std.io.getStdOut().writer();

    try writer.print("--------- ODIN STARTS HERE ---------\n", .{});
    print_some_info(something);
    try writer.print("Odin adds: {d} + {d} to {d}\n", .{ 1337, 666, add_stuff(1337, 666) });
    try writer.print("Odin arithmetic: {d} * {d} to {d}\n", .{ 10, 10, do_arithmetic(Arithmetic{ .f = 10, .s = 10 }) });
    try writer.print("---------- ODIN ENDS HERE ----------\n", .{});
}
