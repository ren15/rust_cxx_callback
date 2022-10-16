fn main() {
    println!("cargo:rustc-link-search=native=../cmake-build");
    println!("cargo:rustc-link-lib=dylib=mysignal");
}
