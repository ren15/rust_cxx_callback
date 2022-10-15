#include <mysignal.hpp>


int create_signal_generator() {
  auto sig = SignalGenerator();
  sig.init();
  sig.start(10);
  return 0;
}

int create_ondata(){
  auto sig = MySignal();
  sig.init();
  sig.start(10);
  return 0;
}