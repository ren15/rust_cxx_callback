#include <iostream>

class SignalGenerator {
public:
  SignalGenerator(){};
  ~SignalGenerator(){};

  int init() {
    std::cout << "Init Called" << std::endl;
    return 0;
  }

  int start(int total) {
    std::cout << "Start Called" << std::endl;
    for (auto i = 0; i < total; i++) {
      on_data(i);
    }
    return 0;
  }

  virtual int on_data(int data) = 0;
};
