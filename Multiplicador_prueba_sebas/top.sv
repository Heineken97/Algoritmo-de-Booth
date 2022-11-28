
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/23/2022 01:25:09 AM
// Code your design here
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/23/2022 01:25:09 AM
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module top(
    input logic clk,
    input logic rst,
    input logic valid,
    input logic [7:0]A,
    input logic [7:0]B,
    output logic [1:0]Q_LSB,
    output logic [15:0] Y
  	//output logic [3:0]anode, 
  	//output logic [7:0]cathode
    );
  	logic load_A;
    logic load_B;
    logic load_add;
    logic shift_HQ_LQ_Q_1;
    logic add_sub;
    logic [7:0]state;
    //logic [1:0]Q_LSB;
    //logic [15:0] Y;
    //logic [15:0] bcd_;
    
 //ClockDivider Refreshclock_generator (.clk(clk),.divided_clk(refreshclock));
    
 //RefreshCounter Refreshcounter_wrapper(.refresh_clock(refreshclock),.refresh_counter(refresh_counter));
    
 //Bin2Bcd BCD_wrapper(.bin(Y[15:3]),.bcd(bcd_));
    
 //AnodoControl Anode_control_wrapper(.refresh_counter(refresh_counter),.anode(anode));
    
 //BCDControl BCD_control_wrapper(.digit1(bcd_[3:0]),.digit2(bcd_[7:4]),.digit3(bcd_[11:8]),.digit4(bcd_[15:12]),.refresh_counter(refresh_counter),.ONE_DIGIT(ONE_DIGIT));
    
 //BCDCathode BCD_to_Cathodes_Wrapper(.digit(ONE_DIGIT),.cathode(cathode));
  
 next_state_file FMS(.clk(clk), .rst(rst), .valid(valid), .Q_0(Q_LSB[1]), .Q_1(Q_LSB[0]), .state(state), .load_A(load_A),.load_B(load_B), .load_add(load_add),.shift_HQ_LQ_Q_1(shift_HQ_LQ_Q_1),.add_sub(add_sub));
 mult mult(.clk(clk), .rst(rst),.A(A),.B(B), .load_A(load_A),.load_B(load_B), .load_add(load_add),.shift_HQ_LQ_Q_1(shift_HQ_LQ_Q_1),.add_sub(add_sub), .Q_LSB(Q_LSB),.Y(Y));
  
endmodule