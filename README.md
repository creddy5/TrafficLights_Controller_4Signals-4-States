# TrafficLights_Controller_4Signals-4-States
Verilog Code for Traffic Light Controller (using 4 states)

This project simulates a 4-way traffic light controller using a Finite State Machine (FSM) in Verilog HDL.
Each direction (North–South, South–North, East–West, and West–East) gets a traffic signal that cycles through Green → Yellow → Red, following a realistic traffic sequence.

The FSM ensures:

Only one direction (and its opposite) is Green or Yellow at a time.

Others remain Red, ensuring safe and proper traffic flow.

==================================================================================================================================

File Structure:

traffic_light_4/

├── traffic_light_4.v        # Main Verilog module (FSM-based controller)

├── traffic_light_4_tb.v     # Testbench file for simulation

└── README.md                # Project documentation


==================================================================================================================================


Module Description:

| Signal                 | Direction | Width | Description                               |
| ---------------------- | --------- | ----- | ----------------------------------------- |
| `CLK`                  | Input     | 1     | System clock signal                       |
| `CLEAR`                | Input     | 1     | Asynchronous reset (active high)          |
| `NS`, `SN`, `EW`, `WE` | Output    | 2     | Light state (00=RED, 01=YELLOW, 10=GREEN) |


State Machine Operation:

| Phase            | Description                       | Duration                    |
| ---------------- | --------------------------------- | --------------------------- |
| **Green Phase**  | Selected direction shows GREEN    | `GREEN_DELAY` clock cycles  |
| **Yellow Phase** | Same direction switches to YELLOW | `YELLOW_DELAY` clock cycles |
| **Next State**   | FSM moves to next direction       | After YELLOW phase          |


Sequence:

| Cycle | Active Direction          | Light Color    |
| ----- | ------------------------- | -------------- |
| 1     | North–South               | Green → Yellow |
| 2     | South–North               | Green → Yellow |
| 3     | East–West                 | Green → Yellow |
| 4     | West–East                 | Green → Yellow |
| →     | Loops back to North–South | ...            |


