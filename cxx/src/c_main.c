#include <stdio.h>

#include <mysignal_c.h>

int on_data_in_c(int data){
    printf("ondata from c: %d\n",data);
    return 0;
}

int main(){
    register_callback((rust_callback)on_data_in_c);
}