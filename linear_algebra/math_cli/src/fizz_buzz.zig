const std = @import("std");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    var count: u8 = 1;
    // with while loop
    while (count <= 100) : (count += 1) {

        // with if else
        // if (count % 3 == 0 and count % 5 == 0) {
        //     try stdout.writeAll("Fizz Buzz\n");
        // } else if (count % 3 == 0) {
        //     try stdout.writeAll("Fizz\n");
        // } else if (count % 5 == 0) {
        //     try stdout.writeAll("Buzz\n");
        // } else {
        //     try stdout.print("{}\n", .{count});
        // }

        // with switch
        const div_3: u2 = @intFromBool(count % 3 == 0);
        const div_5 = @intFromBool(count % 5 == 0);

        const div_ans = div_3 * 2 + div_5;
        switch (div_ans) {
            0b10 => try stdout.writeAll("Fizz\n"),
            0b01 => try stdout.writeAll("Buzz\n"),
            0b11 => try stdout.writeAll("Fizz Buzz\n"),
            0b00 => try stdout.print("{}\n", .{count}),
        }
    }
}
