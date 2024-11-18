`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2024 07:27:49 PM
// Design Name: 
// Module Name: tb_Segment
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


module tb_Segment;
  reg BrdClk, aReset_n;
  reg [3:0] bNumber;
  
  wire [7:0] bDigitSel, bSegmentOutput;
  
  SevSegDisplay DisplayUUT(
    .BrdClk (BrdClk),
    .aReset_n (aReset_n),
    .bNumber (bNumber),
    .bDigitSel (bDigitSel),
    .bSegmentOutput (bSegmentOutput)
  );
  
  initial begin 
    BrdClk <= 0;
    forever #5 BrdClk <= ~BrdClk;
  end
  
  initial begin 
    
  end
endmodule
