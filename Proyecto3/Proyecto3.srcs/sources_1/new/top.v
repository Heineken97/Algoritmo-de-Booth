`timescale 1ns / 1ps

module top(
input wire clk, //100MHz
input wire [7:0] switch,
input wire [3:0] button,
output wire [3:0] anode,
output wire [7:0] cathode
    );
    
wire refreshclock;
wire [1:0] refresh_counter;
wire [3:0] ONE_DIGIT;

clock_divider refreshclock_generator (
.clk(clk),
.divided_clk(refreshclock)
);

refresh_counter Refreshcounter_wrapper(
.refresh_clock(refreshclock),
.refresh_counter(refresh_counter)
);

anod_Control anode_control_wrapper(
.refresh_counter(refresh_counter),
.anode(anode)
);
BCDControl BCD_control_wrapper(
.digit1(switch[3:0]),
.digit2(switch[7:4]),
.digit3(button[3:0]),
.digit4(button[3:0]),
.refresh_counter(refresh_counter),
.ONE_DIGIT(ONE_DIGIT)
);

BCD_Cathode BCD_to_Cathodes_Wrapper(
.digit(ONE_DIGIT),
.cathode(cathode));

endmodule
