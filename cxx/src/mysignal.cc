#include <mysignal.hpp>

int create_signal_generator() {
  auto sig = SignalGenerator();
  sig.init();
  sig.start(10);
  return 0;
}

int create_ondata() {
  auto sig = MySignal();
  sig.init();
  sig.start(10);
  return 0;
}

int register_callback(rust_callback callback) {
  auto sig = MySignal();
  sig.init();
  sig.set_callback(callback);
  sig.start(10);
  return 0;
}