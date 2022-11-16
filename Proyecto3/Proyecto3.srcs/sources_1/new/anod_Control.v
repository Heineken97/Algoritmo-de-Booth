module anod_Control(
input [2:0] refresh_counter,
output reg [7:0] anode =0
);
always@(refresh_counter)
begin
    case (refresh_counter)
        3'b000:
            anode = 4'b11111110;
        3'b001:
            anode = 4'b11111101;
        3'b010:
            anode = 4'b11111011;
        3'b011:
            anode = 4'b11110111;
        3'b100:
            anode = 4'b11101111;
        3'b101:
            anode = 4'b11011111;
        3'b110:
            anode = 4'b10111111;
        3'b111:
            anode = 4'b01111111;
     endcase
end
endmodule