`timescale 1ns / 1ps

module BCDControl(
input [3:0] digit1, //más pequeño
input [3:0] digit2,
input [3:0] digit3,
input [3:0] digit4, //más significativo
input [1:0] refresh_counter,
output reg[3:0] ONE_DIGIT =0
    );
always@(refresh_counter)
begin
    case (refresh_counter)
        2'd0:
            ONE_DIGIT = digit1;
        2'd1:
            ONE_DIGIT = digit2;
        2'd2:
            ONE_DIGIT = digit3;
        2'd3:
            ONE_DIGIT = digit4;
     endcase
end    
    
endmodule
