
#include <stdint.h>


void opaque1(uint8_t x);
int16_t opaque2(uint8_t x);

uint8_t __attribute__((noinline)) function_with_unused_branch(int i) {
    if (i > 1000) {
        if (i < 10000) {
            return i * i;
        } else {
            return 3 * (i + 4);
        }
    } else {
        return (uint8_t)i;
    }
}

void do_the_loop(uint8_t * buffer, unsigned long len) {
    int i = 0;

    while (i < len) {
        // This is the less common case in the input
        uint8_t val = function_with_unused_branch((int)(buffer[i]));

        if (val < 20) {
            opaque1(val);
        } else {
            opaque2(val);
        }

        i += 1;
    }
}

int unused_function(int i) {
    if (i < 0) {
        return -i;
    }

    return i;
}

