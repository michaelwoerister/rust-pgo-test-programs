
extern crate opaque;

use std::io::{self, Read};
use std::fs::File;

fn main() -> io::Result<()> {

    // Read our input from a file so that we compiler can't make assumptions
    // about it.
    let mut f = File::open("input.txt")?;
    let mut buffer = Vec::new();
    f.read_to_end(&mut buffer)?;

    // Iterate via indexing, so that we get bounds checks. We want to make
    // sure that bounds checks are assigned branch weights too.
    let len = buffer.len();
    do_the_loop(&buffer, len);

    Ok(())
}

#[inline(never)]
fn do_the_loop(buffer: &[u8], len: usize) {
    for i in 0 .. len {
        // This is the less common case in the input
        let val = buffer[i];

        if val == b'1' {
            opaque::opaque1(val);
        } else {
            opaque::opaque2(val);
        }
    }
}
