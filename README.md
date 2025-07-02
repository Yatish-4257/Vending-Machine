
# Vending Machine FSM (Finite State Machine) Module  

## Description  
This project is a Verilog-based implementation of a finite state machine (FSM) for simulating the functionality of a simple vending machine. The module has three states (`s0`, `s1`, `s2`) representing different levels of credit based on the user's coin inputs (`00`, `01`, `10`). It determines the appropriate state transition, dispenses an item (`out`), and calculates any change (`change`) when the required credit is met or exceeded. The design operates synchronously with a clock signal (`clk`) and includes a reset input (`rst`) for reinitialization.  

## Key Features  
- **State-Based Operation:** Efficiently handles three states to process transactions and manage credit.  
- **Dynamic Inputs:** Supports multiple coin inputs and adapts state transitions accordingly.  
- **Output Management:** Dispenses items and returns the correct amount of change when applicable.  
- **Synchronous Reset:** Ensures the module initializes to the base state when reset is triggered.  
- **Compact Design:** Easy to integrate with larger systems for hardware simulation or FPGA deployment.  

## Usage  
The module is designed for use in digital design and FPGA applications. To test the functionality:  
1. Integrate the Verilog module into your simulation environment.  
2. Provide a clock (`clk`) and reset (`rst`) signal.  
3. Use the `in` input to simulate coin insertion (`00` for no coin, `01` for a smaller coin, and `10` for a larger coin).  
4. Observe the `out` output for item dispensing and `change` for remaining balance.  
