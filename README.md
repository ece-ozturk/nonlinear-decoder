## Nonlinear Decoder in VHDL

This is a decoder written in VHDL, for Bogazici University EE244 Digital Systems Design class.

This decoder uses an 8-bit floating number, consisting 1 sign bit, a 3-bit exponent and a 4-bit mantissa  **S M3 M2 M1 M0 E2 E1 E0**, and converts to its binary value according to the function **(1-2S)×M× 2<sup>E</sup>**.

**The project consists of**
- *a 7-bit up counter* (generates all possible positive inputs)
- *a decoder* (converts 8-bit floating number to a binary number using the function mentioned above)
- *a binary to BCD converter* (using double dabble algorithm)
- *a 7-segment display driver*
- *a frequency divider* (generates 2Hz clock signal to visualize the output on 7-seg easily)

