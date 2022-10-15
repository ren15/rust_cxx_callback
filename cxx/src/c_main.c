#include <stdio.h>

#include <mysignal_c.h>

int on_data_in_c(int data){
    printf("ondata from c: %d\n",data);
}

int main(){
    //create_signal_generator();
    //create_ondata();
    register_callback(on_data_in_c);
}