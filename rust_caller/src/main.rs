#[link(name = "mysignal")]
extern "C" {
    fn register_callback(cb: extern "C" fn(i32)) -> i32;
}

extern "C" fn on_data_callback(a: i32) {
    println!("on_data from rust: {0}", a);
}

fn main() {
    println!("Hello, world!");
    unsafe {
        register_callback(on_data_callback);
    }
}
