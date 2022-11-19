`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2022 08:38:52 PM
// Design Name: 
// Module Name: AnodoControl
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


module AnodoControl(
input [1:0] refresh_counter,
output logic [3:0] anode
);
always@(refresh_counter)
    begin
        case (refresh_counter)
            2'b00:
                anode = 4'b1110;
            2'b01:
                anode = 4'b1101;
            2'b10:
                anode = 4'b1011;
            2'b11:
                anode = 4'b0111;
           //default: anode = 3'b0;
         endcase
    end
endmodule

