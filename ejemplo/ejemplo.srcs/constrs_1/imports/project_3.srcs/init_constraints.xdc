create_clock  -name clk -period 10.00 -waveform {0 4}[get_ports clk]
set_property -dict {PACKAGE_PIN E3 IOSTANDARD LVCMOS33} [get_ports {clk}];

## buttons
set_property -dict {PACKAGE_PIN N17 IOSTANDARD LVCMOS33} [get_ports {valid}]


##Switches

set_property -dict {PACKAGE_PIN J15 IOSTANDARD LVCMOS33} [get_ports {A[0]}]
set_property -dict {PACKAGE_PIN L16 IOSTANDARD LVCMOS33} [get_ports {A[1]}]
set_property -dict {PACKAGE_PIN M13 IOSTANDARD LVCMOS33} [get_ports {A[2]}]
set_property -dict {PACKAGE_PIN R15 IOSTANDARD LVCMOS33} [get_ports {A[3]}]
set_property -dict {PACKAGE_PIN R17 IOSTANDARD LVCMOS33} [get_ports {A[4]}]
set_property -dict {PACKAGE_PIN T18 IOSTANDARD LVCMOS33} [get_ports {A[5]}]
set_property -dict {PACKAGE_PIN U18 IOSTANDARD LVCMOS33} [get_ports {A[6]}]
set_property -dict {PACKAGE_PIN R13 IOSTANDARD LVCMOS33} [get_ports {A[7]}]
set_property -dict {PACKAGE_PIN T8 IOSTANDARD LVCMOS33} [get_ports {B[0]}]
set_property -dict {PACKAGE_PIN U8 IOSTANDARD LVCMOS33} [get_ports {B[1]}]
set_property -dict {PACKAGE_PIN R16 IOSTANDARD LVCMOS33} [get_ports {B[2]}]
set_property -dict {PACKAGE_PIN T13 IOSTANDARD LVCMOS33} [get_ports {B[3]}]
set_property -dict {PACKAGE_PIN H6 IOSTANDARD LVCMOS33} [get_ports {B[4]}]
set_property -dict {PACKAGE_PIN U12 IOSTANDARD LVCMOS33} [get_ports {B[5]}]
set_property -dict {PACKAGE_PIN v11 IOSTANDARD LVCMOS33} [get_ports {B[6]}]
set_property -dict {PACKAGE_PIN v10 IOSTANDARD LVCMOS33} [get_ports {B[7]}]


##7 segment display

set_property -dict {PACKAGE_PIN T10 IOSTANDARD LVCMOS33} [get_ports {cathode[0]}]
set_property -dict {PACKAGE_PIN R10 IOSTANDARD LVCMOS33} [get_ports {cathode[1]}]
set_property -dict {PACKAGE_PIN K16 IOSTANDARD LVCMOS33} [get_ports {cathode[2]}]
set_property -dict {PACKAGE_PIN K13 IOSTANDARD LVCMOS33} [get_ports {cathode[3]}]
set_property -dict {PACKAGE_PIN P15 IOSTANDARD LVCMOS33} [get_ports {cathode[4]}]
set_property -dict {PACKAGE_PIN T11 IOSTANDARD LVCMOS33} [get_ports {cathode[5]}]
set_property -dict {PACKAGE_PIN L18 IOSTANDARD LVCMOS33} [get_ports {cathode[6]}]

set_property -dict {PACKAGE_PIN H15 IOSTANDARD LVCMOS33} [get_ports {cathode[7]}]

set_property -dict {PACKAGE_PIN J17 IOSTANDARD LVCMOS33} [get_ports {anode[0]}]
set_property -dict {PACKAGE_PIN J18 IOSTANDARD LVCMOS33} [get_ports {anode[1]}]
set_property -dict {PACKAGE_PIN T9 IOSTANDARD LVCMOS33} [get_ports {anode[2]}]
set_property -dict {PACKAGE_PIN J14 IOSTANDARD LVCMOS33} [get_ports {anode[3]}]

#leds

#set_property -dict {PACKAGE_PIN H17 IOSTANDARD LVCMOS33} [get_ports {leds[0]}]
#set_property -dict {PACKAGE_PIN K15 IOSTANDARD LVCMOS33} [get_ports {leds[1]}]
#set_property -dict {PACKAGE_PIN J13 IOSTANDARD LVCMOS33} [get_ports {leds[2]}]
#set_property -dict {PACKAGE_PIN N14 IOSTANDARD LVCMOS33} [get_ports {leds[3]}]
#set_property -dict {PACKAGE_PIN R18 IOSTANDARD LVCMOS33} [get_ports {leds[4]}]
#set_property -dict {PACKAGE_PIN V17 IOSTANDARD LVCMOS33} [get_ports {leds[5]}]
#set_property -dict {PACKAGE_PIN U17 IOSTANDARD LVCMOS33} [get_ports {leds[6]}]
#set_property -dict {PACKAGE_PIN U16 IOSTANDARD LVCMOS33} [get_ports {leds[7]}]
#set_property -dict {PACKAGE_PIN V16 IOSTANDARD LVCMOS33} [get_ports {leds[8]}]
#set_property -dict {PACKAGE_PIN T15 IOSTANDARD LVCMOS33} [get_ports {leds[9]}]
#set_property -dict {PACKAGE_PIN U14 IOSTANDARD LVCMOS33} [get_ports {leds[10]}]
#set_property -dict {PACKAGE_PIN T16 IOSTANDARD LVCMOS33} [get_ports {leds[11]}]
#set_property -dict {PACKAGE_PIN V15 IOSTANDARD LVCMOS33} [get_ports {leds[12]}]
#set_property -dict {PACKAGE_PIN V14 IOSTANDARD LVCMOS33} [get_ports {leds[13]}]
#set_property -dict {PACKAGE_PIN V12 IOSTANDARD LVCMOS33} [get_ports {leds[14]}]
#set_property -dict {PACKAGE_PIN V11 IOSTANDARD LVCMOS33} [get_ports {leds[15]}]
