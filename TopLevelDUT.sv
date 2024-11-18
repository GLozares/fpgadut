`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2024 08:12:39 PM
// Design Name: 
// Module Name: TopLevelDUT
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


module TopLevelDUT(
  input BrdClk, aReset_n, aScanEn, bScanIn, aIncrement,
  input [3:0] bNumber,
  
  
  output reg bScanOut,
  output reg [7:0] bDigitSel,
  output reg [7:0] bSegmentOutput // Array of 8 numbers corresponding to LED Cathodes (Common Anode Board)
);

  wire [3:0] bCounterOutput;
  // Instantiate 7Segment Module 
  SevSegDisplay SevSeg(
    .BrdClk (BrdClk),
    .aReset_n (aReset_n),
    .bNumber (bCounterOutput),
    .bDigitSel (bDigitSel), 
    .bSegmentOutput (bSegmentOutput)
  );
  
  // Instantiate UpCounter 
  UpCounter DFT_Counter(
    .BrdClk (BrdClk),
    .aReset_n (aReset_n),
    .aScanEn (aScanEn),
    .bScanIn (bScanIn),
    .aIncrement (aIncrement),
    .bScanOut (bScanOut),
    .bCount (bCounterOutput)
  );
  
  
endmodule
