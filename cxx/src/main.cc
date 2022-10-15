#include "mysignal.h"

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

int main() {

  auto sig = MySignal();
  sig.init();

  sig.start(10);

  auto sig1 = SignalGenerator();
  sig1.init();

  sig1.start(10);

  return 0;
}