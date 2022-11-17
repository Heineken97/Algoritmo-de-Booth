module anod_Control(
input [1:0] refresh_counter,
output reg [3:0] anode =0
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
     endcase
end
endmodule