`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2022 08:19:04 PM
// Design Name: 
// Module Name: RefreshCounter
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


module RefreshCounter(
    input refresh_clock,
    output logic [1:0] refresh_counter =0);
    
    always@(posedge refresh_clock) refresh_counter <= refresh_counter +1;

endmodule
