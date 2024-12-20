set_property PACKAGE_PIN J15 [get_ports {bNumber[0]}]
set_property PACKAGE_PIN L16 [get_ports {bNumber[1]}]
set_property PACKAGE_PIN M13 [get_ports {bNumber[2]}]
set_property PACKAGE_PIN R15 [get_ports {bNumber[3]}]
set_property PACKAGE_PIN T10 [get_ports {bSegmentOutput[7]}]
set_property PACKAGE_PIN R10 [get_ports {bSegmentOutput[6]}]
set_property PACKAGE_PIN K16 [get_ports {bSegmentOutput[5]}]
set_property PACKAGE_PIN K13 [get_ports {bSegmentOutput[4]}]
set_property PACKAGE_PIN P15 [get_ports {bSegmentOutput[3]}]
set_property PACKAGE_PIN T11 [get_ports {bSegmentOutput[2]}]
set_property PACKAGE_PIN L18 [get_ports {bSegmentOutput[1]}]
set_property PACKAGE_PIN H15 [get_ports {bSegmentOutput[0]}]
set_property PACKAGE_PIN J17 [get_ports {bDigitSel[7]}]
set_property PACKAGE_PIN J18 [get_ports {bDigitSel[6]}]
set_property PACKAGE_PIN T9 [get_ports {bDigitSel[5]}]
set_property PACKAGE_PIN J14 [get_ports {bDigitSel[4]}]
set_property PACKAGE_PIN P14 [get_ports {bDigitSel[3]}]
set_property PACKAGE_PIN T14 [get_ports {bDigitSel[2]}]
set_property PACKAGE_PIN K2 [get_ports {bDigitSel[1]}]
set_property PACKAGE_PIN U13 [get_ports {bDigitSel[0]}]
set_property PACKAGE_PIN N17 [get_ports aReset_n]

## Clock Signal
set_property PACKAGE_PIN E3 [get_ports BrdClk]
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports BrdClk]

set_property CFGBVS VCCO [current_design]
#where value1 is either VCCO or GND

set_property CONFIG_VOLTAGE 3.3 [current_design]
#where value2 is the voltage provided to configuration bank 0

set_property IOSTANDARD LVCMOS33 [get_ports {bDigitSel[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {bDigitSel[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {bDigitSel[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {bDigitSel[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {bDigitSel[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {bDigitSel[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {bDigitSel[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {bDigitSel[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {bNumber[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {bNumber[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {bNumber[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {bNumber[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {bSegmentOutput[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {bSegmentOutput[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {bSegmentOutput[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {bSegmentOutput[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {bSegmentOutput[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {bSegmentOutput[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {bSegmentOutput[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {bSegmentOutput[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports aReset_n]
set_property IOSTANDARD LVCMOS33 [get_ports BrdClk]

set_property IOSTANDARD LVCMOS33 [get_ports aIncrement]
set_property IOSTANDARD LVCMOS33 [get_ports aScanEn]
set_property IOSTANDARD LVCMOS33 [get_ports bScanIn]
set_property IOSTANDARD LVCMOS33 [get_ports bScanOut]
set_property PACKAGE_PIN R17 [get_ports aIncrement]
set_property PACKAGE_PIN V10 [get_ports aScanEn]
set_property PACKAGE_PIN U11 [get_ports bScanIn]
set_property PACKAGE_PIN V11 [get_ports bScanOut]

set_property IOSTANDARD LVCMOS33 [get_ports {bCount[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {bCount[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {bCount[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {bCount[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports aReset]
set_property IOSTANDARD LVCMOS33 [get_ports bCounterOverflow]
set_property PACKAGE_PIN H17 [get_ports {bCount[0]}]
set_property PACKAGE_PIN N14 [get_ports {bCount[3]}]
set_property PACKAGE_PIN J13 [get_ports {bCount[2]}]
set_property PACKAGE_PIN K15 [get_ports {bCount[1]}]
set_property PACKAGE_PIN N17 [get_ports aReset]
set_property PACKAGE_PIN V11 [get_ports bCounterOverflow]

set_property IOSTANDARD LVCMOS33 [get_ports aScanIn]
set_property PACKAGE_PIN M17 [get_ports aScanIn]
set_property PACKAGE_PIN T15 [get_ports bCounterOverflow]
