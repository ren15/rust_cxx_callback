#include <iostream>

class SignalGenerator {
public:
  SignalGenerator(){};
  ~SignalGenerator(){};

  int init() {
    std::cout << "Init Called" << std::endl;
    return 0;
  }

  int start() {
    std::cout << "Start Called" << std::endl;
    for (auto i = 0; i < 10; i++) {
      std::cout << "i: " << i << std::endl;
    }

    return 0;
  }
};
