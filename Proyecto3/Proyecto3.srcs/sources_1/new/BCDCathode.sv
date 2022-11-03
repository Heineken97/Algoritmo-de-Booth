`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2022 08:40:25 PM
// Design Name: 
// Module Name: BCDCathode
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


module BCDCathode(
input [3:0] digit,
output logic [7:0] cathode
);

always@(digit)
begin
    case(digit)
    4'd0:
        cathode = 8'b11000000;
    4'd1:
        cathode = 8'b11111001;
    4'd2:
        cathode = 8'b10100100;
    4'd3:
        cathode = 8'b10110000;
    4'd4:
        cathode = 8'b10011001;    
    4'd5:
        cathode = 8'b10010010;   
    4'd6:
        cathode = 8'b10000010;    
    4'd7:
        cathode = 8'b11111000;   
    4'd8:
        cathode = 8'b10000000;
    4'd9:
        cathode = 8'b10010000;
    default:
        cathode = 8'b11000000;
    endcase    
end

endmodule