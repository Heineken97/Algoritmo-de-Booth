module refresh_counter(
input refresh_clock,
output reg [1:0] refresh_counter =0);

always@(posedge refresh_clock) refresh_counter <= refresh_counter +1;

endmodule