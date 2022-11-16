`timescale 1ns / 1ps

module BCDControl(
input [3:0] digit1, //más pequeño
input [3:0] digit2,
input [3:0] digit3,
input [3:0] digit4,
input [3:0] digit5, //más significativo
input [2:0] refresh_counter,
output reg[3:0] ONE_DIGIT =0
    );
always@(refresh_counter)
begin
    case (refresh_counter)
        3'd0:
            ONE_DIGIT = digit1;
        3'd1:
            ONE_DIGIT = digit2;
        3'd2:
            ONE_DIGIT = digit3;
        3'd3:
            ONE_DIGIT = digit4;
        3'd4:
            ONE_DIGIT = digit5;
     endcase
end    
    
endmodule
