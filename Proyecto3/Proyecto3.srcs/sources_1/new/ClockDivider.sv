`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2022 08:35:59 PM
// Design Name: 
// Module Name: ClockDivider
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


module ClockDivider(input logic clk,
    output logic divided_clk  
        );
        
    localparam div_value = 4999; // 10KHz
        
    integer counter_value =0;
    
    always@ (posedge clk)
    begin
        if (counter_value == div_value)
            counter_value <=0;
        else
            counter_value <= counter_value+1;  
    end
    // divide clock
    always@ (posedge clk)
    begin
        if (counter_value == div_value)
            divided_clk <= ~divided_clk;
        else
            divided_clk <= divided_clk;
    end

endmodule
