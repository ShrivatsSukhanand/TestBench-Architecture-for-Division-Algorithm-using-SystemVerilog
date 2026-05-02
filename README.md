Enhanced the testbench architecture I used for the 8-bit comparator to verify the 17-bit signed non-restoring division algorithm design I implemented. Introduced clocking blocks for synchronised signal sampling, and integrated a monitor and scoreboard for self-checking. 

The scoreboard computes the expected quotient and remainder internally using SystemVerilog's / and % operators, packs them into a 34-bit result, and compares against the DUT output — reporting PASS or FAIL for each transaction.

The testbench handles variable-latency FSM-based designs by synchronising on a valid signal asserted when the FSM reaches its terminal state, ensuring the monitor captures only settled, valid results. Debugged with assistance from Google AI and Claude
It can be tested on EDA Playground using Aldec Riviera-PRO 2025.04 — (EDA Plaground)[https://www.edaplayground.com/x/fiAu]

Output screenshot is attached below for 20 Transactions among which all have passed:

<img width="406" height="738" alt="image" src="https://github.com/user-attachments/assets/8d74340b-a4dc-454b-a741-4dd8b48555fd" />
<img width="407" height="752" alt="image" src="https://github.com/user-attachments/assets/72e19f9e-9bda-4cf7-aaa0-7cac9e3767d0" />
<img width="634" height="736" alt="image" src="https://github.com/user-attachments/assets/00b40f3c-5d7a-40da-898d-81459dedc49a" />
