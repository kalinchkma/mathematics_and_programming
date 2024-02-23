pub const ComputationError = error{IllegalArgument};

pub fn steps(number: usize) anyerror!usize {
    if (number == 0) return error.IllegalArgument;
    var n: u64 = @as(u64, number);
    var step: u64 = 0;
    while (true) {
        if (n == 1) break;
        if (n % 2 == 0) {
            n /= 2;
        } else n = n * 3 + 1;
        step += 1;
    }
    return step;
}
