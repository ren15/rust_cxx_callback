#include "mysignal.h"


int main(){

    auto sig = SignalGenerator();
    sig.init();
    sig.start();

    return 0;
}