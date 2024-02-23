const std = @import("std");
const expect = std.testing.expect;

test "always succeeds" {
    try expect(true);
}

test "always faild" {
    const a = true;
    var x: u16 = 0;
    if (a) {
        x += 1;
    } else {
        x += 2;
    }
    x = if (x == 1) 2 else 1;
    try expect(x == 2);
}

test "while" {
    var i: u8 = 2;
    while (i < 100) {
        if (i == 32) break;
        i *= 2;
    }
    try expect(i == 32);
}

test "for" {
    const string = [_]u8{ 'h', 'e', 'l', 'l', 'o' };

    for (string, 0..) |character, index| {
        _ = character;
        _ = index;
    }

    for (string) |character| {
        _ = character;
    }

    for (string, 0..) |_, index| {
        _ = index;
    }

    for (string) |_| {}
}

fn add(x: u32) u32 {
    return x + 5;
}

test "function" {
    const y = add(0);
    try std.testing.expect(@TypeOf(y) == u32);
    try std.testing.expect(y == 5);
}

// fibonnaci
fn fibonnaci(n: u16) u16 {
    if (n == 0 or n == 1) return n;
    return fibonnaci(n - 1) + fibonnaci(n - 2);
}

test "fib" {
    const x = fibonnaci(10);
    try expect(@TypeOf(x) == u16);
    try expect(x == 55);
}

// defer
test "def" {
    var x: i16 = 5;
    {
        defer x += 2;
        try expect(x == 5);
    }
    try expect(x == 7);
}

// defer execute in reverse order
test "mul def" {
    var x: f32 = 5;
    {
        defer x += 2;
        defer x /= 2;
    }

    try expect(x == 4.5);
}

// errors
const FileOpenError = error{ AccessDenied, OutOfMemory, FileNotFound };

const AllocationError = error{OutOfMemory};

test "coerce error from a subset to a superset" {
    const err: FileOpenError = AllocationError.OutOfMemory;
    try expect(err == FileOpenError.OutOfMemory);
}

fn failingFunction() error{Oops}!void {
    return error.Oops;
}

test "returning an error" {
    failingFunction() catch |err| {
        try expect(err == error.Oops);
        return;
    };
}

// switch
test "swtich" {
    var x: i8 = 10;
    switch (x) {
        -1...1 => {
            x = -x;
        },
        10, 100 => {
            x = @divExact(x, -1);
        },
        else => {},
    }
    try expect(x == -10);
}
