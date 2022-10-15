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


class MySignal : public SignalGenerator {

public:
  virtual int init() override {
    std::cout << "MySignal Init Called" << std::endl;
    return 0;
  }
  virtual int on_data(int data) override {
    std::cout << "on_data called with data: " << data << std::endl;
    return 0;
  }
};

extern "C" int create_signal_generator();
extern "C" int create_ondata();