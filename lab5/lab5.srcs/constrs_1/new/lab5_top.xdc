# contraints file (.xdc file) for lab 5

# Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

# UNCOMMENT the below lines to generate a virtual clock required for timing analysis
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]
set_input_delay -clock [get_clocks sys_clk_pin] -add_delay 0.000 [get_ports -filter { NAME =~"*" && DIRECTION == "IN" } ]
set_output_delay -clock [get_clocks sys_clk_pin] -add_delay 0.000 [get_ports -filter { NAME =~ "*" && DIRECTION == "OUT" } ]

# switches
set_property PACKAGE_PIN V17 [get_ports {seed1[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seed1[0]}]
set_property PACKAGE_PIN V16 [get_ports {seed1[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seed1[1]}]
set_property PACKAGE_PIN W16 [get_ports {seed1[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seed1[2]}]
set_property PACKAGE_PIN W17 [get_ports {seed1[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seed1[3]}]

set_property PACKAGE_PIN W15 [get_ports {seed2[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seed2[0]}]
set_property PACKAGE_PIN V15 [get_ports {seed2[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seed2[1]}]
set_property PACKAGE_PIN W14 [get_ports {seed2[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seed2[2]}]
set_property PACKAGE_PIN W13 [get_ports {seed2[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seed2[3]}]

#Buttons
set_property PACKAGE_PIN U18 [get_ports rst]
set_property IOSTANDARD LVCMOS33 [get_ports rst]
set_property PACKAGE_PIN T17 [get_ports Roll]
set_property IOSTANDARD LVCMOS33 [get_ports Roll]

#7-segments
set_property PACKAGE_PIN U2 [get_ports {Anode[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Anode[0]}]
set_property PACKAGE_PIN U4 [get_ports {Anode[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Anode[1]}]
set_property PACKAGE_PIN V4 [get_ports {Anode[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Anode[2]}]
set_property PACKAGE_PIN W4 [get_ports {Anode[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Anode[3]}]

set_property PACKAGE_PIN W7 [get_ports {LED_out[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED_out[6]}]
set_property PACKAGE_PIN W6 [get_ports {LED_out[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED_out[5]}]
set_property PACKAGE_PIN U8 [get_ports {LED_out[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED_out[4]}]
set_property PACKAGE_PIN V8 [get_ports {LED_out[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED_out[3]}]
set_property PACKAGE_PIN U5 [get_ports {LED_out[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED_out[2]}]
set_property PACKAGE_PIN V5 [get_ports {LED_out[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED_out[1]}]
set_property PACKAGE_PIN U7 [get_ports {LED_out[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED_out[0]}]

# LEDs
set_property PACKAGE_PIN U16 [get_ports {sum[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sum[0]}]
set_property PACKAGE_PIN E19 [get_ports {sum[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sum[1]}]
set_property PACKAGE_PIN U19 [get_ports {sum[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sum[2]}]
set_property PACKAGE_PIN V19 [get_ports {sum[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sum[3]}]
set_property PACKAGE_PIN W18 [get_ports {sum[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sum[4]}]

set_property PACKAGE_PIN V13 [get_ports {second[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {second[0]}]
set_property PACKAGE_PIN V3 [get_ports {second[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {second[1]}]
set_property PACKAGE_PIN W3 [get_ports {second[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {second[2]}]
set_property PACKAGE_PIN U3 [get_ports {second[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {second[3]}]
set_property PACKAGE_PIN P3 [get_ports {second[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {second[4]}]