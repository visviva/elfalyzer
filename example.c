#include <stdio.h>

// Define some data in specific sections
int normal_data = 42;

__attribute__((section(".custom_data1")))
int custom_data1_array[2] = {123, 456};  // This is 8 bytes, exceeding the limit of 4 bytes set in the linker script

__attribute__((section(".custom_data2")))
int custom_data2 = 789;

void normal_function() {
    printf("This is a normal function.\n");
}

__attribute__((section(".custom_text1")))
void custom_function1() {
    printf("This is custom_function1.\n");
}

__attribute__((section(".custom_text2")))
void custom_function2() {
    printf("This is custom_function2.\n");
}

int main() {
    normal_function();
    custom_function1();
    custom_function2();
    printf("Normal data: %d\n", normal_data);
    printf("Custom data1: %d\n", custom_data1_array[0]);
    printf("Custom data2: %d\n", custom_data2);
    return 0;
}
