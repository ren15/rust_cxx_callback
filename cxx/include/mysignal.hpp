#include <iostream>

class SignalGenerator {
public:
  SignalGenerator(){};
  ~SignalGenerator(){};

  virtual int init() {
    std::cout << "SignalGenerator Init Called" << std::endl;
    return 0;
  }

  int start(int total) {
    std::cout << "Start Called" << std::endl;
    for (auto i = 0; i < total; i++) {
      on_data(i);
    }
    return 0;
  }

  virtual int on_data(int data) { return 0; };
};

typedef void (*rust_callback)(int32_t);

class MySignal : public SignalGenerator {
  rust_callback cb;

public:
  virtual int init() override {
    std::cout << "MySignal Init Called" << std::endl;
    return 0;
  }
  int set_callback(rust_callback callback) {
    this->cb = callback;
    return 0;
  }
  virtual int on_data(int data) override {
    if (cb != nullptr) {
      cb(data);
    } else {
      std::cout << "on_data from Cpp: " << data << std::endl;
    }
    return 0;
  }
};

extern "C" int create_signal_generator();
extern "C" int create_ondata();
extern "C" int register_callback(rust_callback callback);