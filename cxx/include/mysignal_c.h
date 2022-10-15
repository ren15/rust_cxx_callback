// this file is only for c caller code
typedef void (*rust_callback)(int32_t);

int create_signal_generator();
int create_ondata();
int register_callback(rust_callback callback);
