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

typedef struct{
    logic load_A;
    logic load_B;
    logic load_add;
    logic shift_HQ_LQ_Q_1;
    logic add_sub;
} mult_control_t;

module top(
input logic clk,
    input logic rst,
    input logic valid,
    input logic Q_0,
    input logic Q_1,
    output logic state
    );
  mult_control_t mult_control;
  next_state_file FMS(.clk(clk), .rst(rst), .valid(valid), .Q_0(Q_0), .Q_1(Q_1),.mult_control(mult_control), .state(state));
endmodule
