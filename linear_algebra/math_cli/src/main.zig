const std = @import("std");

pub fn main() !void {
    // Prints to stderr (it's a shortcut based on `std.io.getStdErr()`)
    std.debug.print("All your {s} are belong to us.\n", .{"codebase"});

    // stdout is for the actual output of your application, for example if you
    // are implementing gzip, then only the compressed bytes should be sent to
    // stdout, not any debugging messages.
    const stdout_file = std.io.getStdOut().writer();
    var bw = std.io.bufferedWriter(stdout_file);
    const stdout = bw.writer();

    try stdout.print("Run `zig build test` to run the tests.\n", .{});

    // name
    const name = "Nanashi";
    const age = "24";

    try stdout.print("The name of owner of this codabase is {s}.\n", .{name});

    try stdout.print("Age is {s}\n", .{age});

    // array
    // const a = [5]u8{ 'h', 'e', 'l', 'l', 'o' };
    // for (a) |c| {
    //     try stdout.print("{s}", .{c});
    // }

    try bw.flush(); // don't forget to flush!
}

test "simple test" {
    var list = std.ArrayList(i32).init(std.testing.allocator);
    defer list.deinit(); // try commenting this out and see if zig detects the memory leak!
    try list.append(42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
    try std.testing.expect(true);
}

test "out of bounds" {
    @setRuntimeSafety(false);
    const a = [3]u8{ 'y', '6', '8' };
    const index: u8 = 2;
    const b = a[index];
    _ = b;
}

// unreachable
test "unreachable" {
    const x: i32 = 1;
    // const y: u32 = if (x == 2) 5 else unreachable;
    const y: u32 = if (x == 2) 5 else 1;
    _ = y;
}

fn assciiToUpper(x: u8) u8 {
    return switch (x) {
        'a'...'z' => x + 'A' - 'a',
        'A'...'Z' => x,
        else => unreachable,
    };
}

test "unreachable switch" {
    try std.testing.expect(assciiToUpper('a') == 'A');
    try std.testing.expect(assciiToUpper('A') == 'A');
}

// pointers
fn increment(num: *u8) void {
    num.* += 1;
}

test "pointers" {
    var x: u8 = 1;
    increment(&x);
    try std.testing.expect(x == 2);
}

// naughty pointers
test "naugthy pointers" {
    const x: u16 = 1;
    const y: *u8 = @ptrFromInt(x);

    _ = y;
}

// slices
fn total(values: []const u8) usize {
    var sum: usize = 0;
    for (values) |v| sum += v;
    return sum;
}

test "slices" {
    const array = [_]u8{ 1, 2, 3, 4, 5 };
    const slice = array[0..4];
    try std.testing.expect(total(slice) == 10);
}

test "slice 2" {
    const array = [_]u8{ 1, 2, 3, 4, 6 };
    const slices = array[0..];
    _ = slices;
}

test "slice pointer" {
    const ar = [_]u8{ 1, 2, 3, 4, 5 };
    const slice = ar[0..3];

    try std.testing.expect(@TypeOf(slice) == *const [3]u8);
}

// enums
test "enums" {
    const Value = enum(u2) { zero, one, two };

    try std.testing.expect(@intFromEnum(Value.zero) == 0);
    try std.testing.expect(@intFromEnum(Value.one) == 1);
    try std.testing.expect(@intFromEnum(Value.two) == 2);
}

test "enums 2" {
    const Value = enum(u32) {
        hundred = 100,
        thousand = 1000,
        million = 1000000,
        next,
    };
    try std.testing.expect(@intFromEnum(Value.hundred) == 100);
    try std.testing.expect(@intFromEnum(Value.thousand) == 1000);
    try std.testing.expect(@intFromEnum(Value.million) == 1000000);
    try std.testing.expect(@intFromEnum(Value.next) == 1000001);
}

const Suit = enum {
    clubs,
    spades,
    diamonds,
    hearts,
    pub fn isClubs(self: Suit) bool {
        return self == Suit.clubs;
    }
};

test "enum method" {
    try std.testing.expect(Suit.spades.isClubs() == Suit.isClubs(.spades));
}

const Vec3 = struct { x: f32, y: f32, z: f32 };

test "struct usage" {
    const loc = Vec3{
        .x = 30,
        .y = 20,
        .z = 100,
    };
    _ = loc;
}

// swap
const Stuff = struct {
    x: i32,
    y: i32,
    fn swap(self: *Stuff) void {
        const tmp = self.x;
        self.x = self.y;
        self.y = tmp;
    }
};

test "automatic dereference" {
    var new_stuff = Stuff{ .x = 10, .y = 20 };
    new_stuff.swap();
    try std.testing.expect(new_stuff.x == 20);
    try std.testing.expect(new_stuff.y == 10);
}

// union
const Tag = enum { a, b, c };
const Tagged = union(Tag) { a: u8, b: f32, c: bool };

test "switch on tagged union" {
    var value = Tagged{ .b = 1.5 };

    switch (value) {
        .a => |*byte| byte.* += 1,
        .b => |*float| float.* *= 3,
        .c => |*b| b.* = !b.*,
    }
    try std.testing.expect(value.b == 1.5 * 3);
}

// optional
test "optional" {
    var found_index: ?usize = null;
    const data = [_]i32{ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12 };
    for (data, 0..) |v, i| {
        if (v == 100) found_index = i;
    }
    try std.testing.expect(found_index == null);
}

// comptime
fn Matrix(
    comptime T: type,
    comptime width: comptime_int,
    comptime height: comptime_int,
) type {
    return [height][width]T;
}

test "returning a type" {
    try std.testing.expect(Matrix(f32, 4, 4) == [4][4]f32);
}

test "string" {}
