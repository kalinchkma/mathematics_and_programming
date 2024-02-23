const std = @import("std");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    // get rendom number
    var seed: u64 = undefined;
    try std.os.getrandom(std.mem.asBytes(&seed));

    var prng = std.rand.DefaultPrng.init(seed);
    const rand = &prng.random();

    const target_number = rand.intRangeAtMost(u8, 1, 100);

    // number guess user can
    var number_of_guess: u8 = 10;

    while (number_of_guess > 0) {
        const stdin = std.io.getStdIn().reader();

        // prinf message
        try stdout.print("Guess the number. move left {} :> ", .{number_of_guess});
        const bare_line = try stdin.readUntilDelimiterAlloc(std.heap.page_allocator, '\n', 8192);
        // free memory end of the function
        defer std.heap.page_allocator.free(bare_line);

        // reduce number of guress
        number_of_guess -= 1;

        const line = std.mem.trim(u8, bare_line, "\r");

        // parse guess
        const guess = std.fmt.parseInt(u8, line, 10) catch |err| switch (err) {
            error.Overflow => {
                try stdout.writeAll("Please enter a small positive number\n");
                continue;
            },
            error.InvalidCharacter => {
                try stdout.writeAll("Please enter a valid number\n");
                continue;
            },
        };
        // check guess
        if (guess < target_number) try stdout.writeAll("Too Small!\n");
        if (guess > target_number) try stdout.writeAll("Too Big!\n");
        if (guess == target_number) {
            try stdout.writeAll("Congrates! you have guessed corrent number!\n");
            break;
        }
        if (number_of_guess <= 0) {
            try stdout.print("Looser. right number is {}\n", .{target_number});
        }
    }
}
