
#![crate_type="bin"]

extern crate opt_lib;

fn main() -> std::io::Result<()> {

    let len = 100;

    let mut buffer = Vec::with_capacity(len);

    for x in 0 .. len {
        if x % 10 == 0 {
            buffer.push(1);
        } else {
            buffer.push(0);
        }
    }

    let len = buffer.len();
    opt_lib::do_the_loop(&buffer, len);

    Ok(())
}
