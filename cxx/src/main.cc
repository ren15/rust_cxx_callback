#include "mysignal.hpp"



int main() {

  auto sig = MySignal();
  sig.init();
  sig.start(10);

  return 0;
}