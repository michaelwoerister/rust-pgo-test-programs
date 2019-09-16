
#![crate_type="rlib"]

extern crate opaque;

pub fn do_the_loop(buffer: &[u8], len: usize) {
    // Iterate via indexing, so that we get bounds checks. We want to make
    // sure that bounds checks are assigned branch weights too.
    let mut i = 0;

    while i < len {
        // This is the less common case in the input
        let val = buffer[i];

        if val < 20 {
            opaque::opaque1(val);
        } else {
            opaque::opaque2(val);
        }

        i += 1;
    }
}
