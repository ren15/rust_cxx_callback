#include "mysignal.hpp"



int main() {

  auto sig = MySignal();
  sig.init();

  sig.start(10);

  auto sig1 = SignalGenerator();
  sig1.init();

  sig1.start(10);

  return 0;
}