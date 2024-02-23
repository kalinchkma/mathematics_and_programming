const std = @import("std");

pub fn isPangram(str: []const u8) bool {
    var aph: isize = 2015;

    // var alphabet = [_]u8{ 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'X' };
    const alphabet = std.ArrayHasMap(u8, bool);
    _ = alphabet;

    for (str) |v| {
        var i = v;
        if (i >= 65 and i <= 90) {
            aph -= i;
        } else if (i >= 97 and i <= 122) {
            i -= 32;
            aph -= i;
        }
    }
    if (aph <= 0) return true;
    return false;
}
