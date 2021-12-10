# FPGA-Projects-Fall-2021

All of my FPGA Projects from ECE3300 and ECE3300L.

Digital Circuit Design Using Verilog. Goal of this course was to create digital designs using Verilog, while emphasizing low resources and low power.

LAB1: Two 4-bit inputs, with two control switches. One of the control switches decides which input to display on the LEDs, while the other control switch displays the location on the board. Utilizes parameterization. 

LAB2: 16-bit ALU that includes addition and subtraction. Utilizes a load, reset, add, and subtract buttons. First uses the switches to decide the first input. Once the load button is pressed, the first input is stored and the next use of the switches will be for the second input. 

LAB3: 4x16 Decoder with control system. Controls the speed of the LEDs with a clock divider. 5 switches control the 32 different speeds of the board.

LAB4: BCD counter that displays on the seven segment display. Includes a controlled clock divider, reset button, and up and down capabilities. 

LAB5: Similar to LAB4, but includes all 6 digits on the seven segment display. Includes the clock divider, reset button, and up and down functions.

LAB6: Similar to LAB5, but includes 7 switches. Three switches determine the input value for the digit you want to change, and the remaining three decide which specific seven segment display digit do you want to switch for the input value. Still uses the up and down, reset, and clock divider. 

LAB7: Created a sequence detecotr with no overlapping using FSMs, memory, the BCD Up/Down counter, and seven segment display to display when we read a sequence. 5 switches control the clock divider and 4 switches are to load values into the memory for the sequence detector to read while running. Uses a read, write, and reset button. 

LAB8(Partially Completed): Designed a 4-bit barrel shifter using BCD counters, FIFOs, seven segment displays, and memory. Two switches are assigned to one digit on the seven segment display. Once we push the enable button, the counter will start either incrementing or decrementing. If we push it again, the counter will stop. We can use the switches to barrel shift the digits right. 

LAB9(Partially Completed): Utilized the barrel shifter, but instead of using the BCD counter, we used a UART and FIFOS to input data onto the seven segment display and use the same switches to change the input. 
