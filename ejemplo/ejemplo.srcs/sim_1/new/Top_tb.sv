`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2022 05:52:59 PM
// Design Name: 
// Module Name: Top_tb
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


module Top_tb;

logic clk =0;
  logic rst;
  logic valid;
  logic [7:0]state;
  logic [1:0] Q_LSB;
  logic [15:0] Y = 15'd0;
  logic [7:0] A;
  logic [7:0] B;
  
  
  top top(.clk(clk),.rst(rst), .valid(valid),.A(A),.B(B),.Q_LSB(Q_LSB),.Y(Y), .state(state));
  
  always #10 clk = ~clk;
  
  initial begin
    rst=1;
    #50
    rst=0;
    #20
    
    A = 8'd3;
    B= 8'd2;
    valid =1;
    #40
    valid =0;
    
    #1500
    valid =0;
    
    
  end
endmodule
