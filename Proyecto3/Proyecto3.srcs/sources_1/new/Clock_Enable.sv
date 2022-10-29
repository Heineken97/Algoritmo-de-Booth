`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TEC
// Engineer: Joseph David Jimenez Zu�iga
// 
// Create Date: 10/28/2022 06:45:21 PM
// Design Name: Clock
// Module Name: Clock_Enable
// Project Name: Proyecto3
// Target Devices: NEXYS A7 - 110T
// Tool Versions: 
// Description: 
// Habilita el slow clock para el antirebote
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Clock_Enable(input clkIN_500Hz, output clkOUT_1Hz);
    reg [26:0] counter = 0;
    always@( posedge clkIN_500Hz )
    begin
    counter <= (counter>= 249999)?0:counter + 1;
    end
    assign clkOUT_1Hz = (counter== 249999 )?1'b1:1'b0;
endmodule
