#[link(name = "mysignal")]
extern "C" {
    fn create_ondata() -> i32;
}

fn main() {
    println!("Hello, world!");
    unsafe {
        create_ondata();
    }
}
