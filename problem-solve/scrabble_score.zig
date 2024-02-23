pub fn score(s: []const u8) u32 {
    var sum: u32 = 0;

    for (s) |v| {
        var i = @as(u8, v);
        if (i > 90) {
            i -= 32;
        }
        if (i == 'K') {
            sum += 5;
        } else if (i == 'J' or i == 'X') {
            sum += 8;
        } else if (i == 'Q' or i == 'Z') {
            sum += 10;
        } else if (i == 'D' or i == 'G') {
            sum += 2;
        } else if (i == 'B' or i == 'C' or i == 'M' or i == 'P') {
            sum += 3;
        } else if (i == 'F' or i == 'H' or i == 'V' or i == 'W' or i == 'Y') {
            sum += 4;
        } else {
            sum += 1;
        }
    }

    return sum;
}
