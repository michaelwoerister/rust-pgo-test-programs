
#include <stdint.h>


void opaque1(uint8_t x);
int16_t opaque2(uint8_t x);

void do_the_loop(uint8_t * buffer, unsigned long len) {
    int i = 0;

    while (i < len) {
        // This is the less common case in the input
        uint8_t val = buffer[i];

        if (val < 20) {
            opaque1(val);
        } else {
            opaque2(val);
        }

        i += 1;
    }
}
