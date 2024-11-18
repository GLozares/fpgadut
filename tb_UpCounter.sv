`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2024 03:10:35 PM
// Design Name: 
// Module Name: tb_UpCounter
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


module tb_UpCounter;
  
  reg BrdClk, aReset_n, aScanEn, bScanIn, aIncrement;
  wire [3:0] bCount;
  wire bScanOut;

  // Instantiate four bit adder module 
  UpCounter DFT_UpCounter(
    .BrdClk (BrdClk),
    .aReset_n (aReset_n),
    .aScanEn (aScanEn),
    .bScanIn (bScanIn),
    .aIncrement (aIncrement),
    .bCount (bCount),
    .bScanOut (bScanOut)
  );
  
  //  Clock signal generation 
  initial begin
    BrdClk <= 0;
    forever #5 BrdClk = ~BrdClk;
  end
  
  //  Test Stimulus
  initial begin 
    aReset_n <= 0;
    #20 
    aReset_n <= 1;
    
    //  First test normal operation
    aScanEn <= 0;
    aIncrement <= 1;
    #100
    //  10 Cycles = 10 
    assert (bCount == 10) else $error("Failed normal operation, step 1");
    
    //  Then assert aScanEn and Burst 0110 
    aScanEn <= 1; 
    bScanIn <= 0;
    #10 
    bScanIn <= 1;
    #10 
    bScanIn <= 1;
    #10 
    bScanIn <= 0;
    #10 
    //  Check for 0110 on count now that 4 clock cycles have passed 
    assert (bCount == 4'b0110) else $error("Failed scan operation");
    
    aScanEn <= 0; // Deasserting aScanEN here will resume increment operation on next clock cycle
    #10 
    //  Check for 0111 on count to check for resume operation
    assert (bCount == 4'b0111) else $error("Failed to resume count operation");
    #100
    $finish;
  end
  
  
endmodule
