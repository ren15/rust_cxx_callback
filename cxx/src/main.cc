#include "mysignal.h"

class MySignal : public SignalGenerator {

    public:
    virtual int on_data(int data) override
    {
        std::cout << "on_data called with data: " << data << std::endl;
        return 0;
    }
};


int main(){

    auto sig = MySignal();
    sig.init();

    sig.start(10);

    return 0;
}