const std = @import("std");
var stdout_buffer: [1024]u8 = undefined;
var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
const stdout = &stdout_writer.interface;


pub fn main () !void {
    try if_else_statemnet();
    try switch_statement();
    try panic_and_range();
    try stdout.flush();
}

// If else statemnet
fn if_else_statemnet () !void {
    const x = 5;
    if(x > 10) {
        try stdout.print("The x is greator\n", .{});
    } else {
       try stdout.print("The x is lesser\n", .{});
    }
}


// Swich statement in zig
const Role = enum {
  SE, DPE, DE, DA, PM, PO, KS
};

fn switch_statement() !void {
    var area : []const u8 = undefined;
    const role = Role.SE;
    switch (role) {
        .PM , .SE , .DPE => {
            area = "Platform";
        },
        .KS , .PO => {
            area = "Data";
        },
        .DA , .DE => {
            area = "I dont know";
        }
    }
    try stdout.print("{s}\n", .{area});
   // try stdout.flush();
}

// Panic and range
fn panic_and_range () !void {
    const level : u8 = 4;
    const category = switch (level) {
        0...25 => "beginner",
        26...75 => "intermediary",
        76...100 => "professional",
        else => {
            @panic("Unsupported argument");
        }
    };
   try stdout.print("{s}\n", .{category});
}
