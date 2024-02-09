const std = @import("std");

const SomeInfo = extern struct {
    string: [*:0]const u8,
    some_int: usize,
};

extern fn print_some_info(something: SomeInfo) callconv(.C) void;

pub fn main() !void {
    const something = SomeInfo{
        .string = "Hello from odin!",
        .some_int = 0x1337,
    };

    try std.io.getStdOut().writer().print("--------- ODIN STARTS HERE ---------\n", .{});
    print_some_info(something);
    try std.io.getStdOut().writer().print("---------- ODIN ENDS HERE ----------\n", .{});
}
