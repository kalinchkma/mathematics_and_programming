const std = @import("std");

const Thread = std.Thread;
const Semaphore = std.Thread.Semaphore;

const WorkEntry = struct {
    msg: []const u8,
};

const ThreadInfo = struct {
    thread_index: usize,
    semaphore_ptr: *Semaphore,
};

const n_threads_to_spawn = 10;

var completion_count: usize = 0;
var next_entry_to_do: usize = 0;
var entry_count: usize = 0;
var entry_buffer: [10]WorkEntry = undefined;

fn addWork(semaphore_ptr: *Semaphore, msg: []const u8) void {
    const entry_index = @atomicLoad(usize, &entry_count, .SeqCst);
    entry_buffer[entry_index].msg = msg;

    // SeqCst guarantees that the msg write above is visible before the entry_count write below can be seen.
    @atomicStore(usize, &entry_count, entry_index + 1, .SeqCst);

    semaphore_ptr.post(); // Wake up all threads
}

fn doWork(info: *ThreadInfo) void {
    while (true) {
        if (next_entry_to_do < entry_count) {
            const entry_index = @atomicRmw(usize, &next_entry_to_do, .Add, 1, .SeqCst);
            const msg = entry_buffer[entry_index].msg;
            std.debug.print("Thread {d}: {s}\n", .{ info.thread_index, msg });
            _ = @atomicRmw(usize, &completion_count, .Add, 1, .SeqCst);
        } else {
            info.semaphore_ptr.wait(); // Put all threads to sleep
        }
    }
}

pub fn main() !void {
    var semaphore = Semaphore{};
    var infos: [n_threads_to_spawn]ThreadInfo = undefined;
    for (&infos, 0..) |*info, thread_index| {
        info.thread_index = thread_index;
        info.semaphore_ptr = &semaphore;
        const handle = try Thread.spawn(.{}, doWork, .{info});
        handle.detach();
    }

    addWork(&semaphore, "job 1");
    addWork(&semaphore, "job 2");
    addWork(&semaphore, "job 3");
    addWork(&semaphore, "job 4");
    addWork(&semaphore, "job 5");
    addWork(&semaphore, "job 6");
    addWork(&semaphore, "job 7");
    addWork(&semaphore, "job 8");
    addWork(&semaphore, "job 9");
    addWork(&semaphore, "job 10");

    while (entry_count != completion_count) {} // Don't continue until all work has been done.

    std.debug.print("DONE\n", .{});
}
