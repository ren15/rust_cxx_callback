fn main() {
    println!("cargo:rustc-link-search=native=./src");
    println!("cargo:rustc-link-lib=dylib=mysignal");
}
