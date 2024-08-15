const std = @import("std");

pub fn build(b: *std.Build) !void {
    const optimize = b.standardOptimizeOption(.{});

    const bla = try std.Target.Query.parse(.{
        .arch_os_abi = "x86_64-windows-msvc",
    });

    const odin_build = b.addSystemCommand(&.{
        "odin",
        "build",
        "from.odin",
        "-file",
        "-no-entry-point",
        "-build-mode:obj",
        "-out:from.obj",
        "-target:windows_amd64",
    });

    const exe = b.addExecutable(.{
        .name = "zig-odin-static-interop",
        .root_source_file = b.path("src/main.zig"),
        .target = b.resolveTargetQuery(bla),
        .optimize = optimize,
    });

    exe.step.dependOn(&odin_build.step);
    exe.addObjectFile(b.path("./from.obj"));
    b.installArtifact(exe);
}
