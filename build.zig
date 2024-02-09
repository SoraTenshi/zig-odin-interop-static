const std = @import("std");

pub fn build(b: *std.Build) !void {
    const optimize = b.standardOptimizeOption(.{});

    const bla = try std.zig.CrossTarget.parse(.{
        .arch_os_abi = "x86_64-windows-msvc",
    });

    const exe = b.addExecutable(.{
        .name = "zig-odin-static-interop",
        .root_source_file = .{ .path = "src/main.zig" },
        .target = b.resolveTargetQuery(bla),
        .optimize = optimize,
    });

    exe.addObjectFile(.{ .path = "./from.obj" });
    b.installArtifact(exe);
}
