`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/17/2024 08:27:53 PM
// Design Name: 
// Module Name: UpCounterLogic
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

module UpCounterLogic(
  input BrdClk, aReset, aIncrement,

  output reg bCounterOverflow,
  output reg [3:0] bCount
  );

  reg bDigit0, bDigit1, bDigit2, bDigit3;
  wire x1, x2, x3, x4;
  wire y1, y2, y3;
  
  assign x1 = (bDigit0 ^ aIncrement);
  assign x2 = (y1 ^ bDigit1);
  assign x3 = (y2 ^ bDigit2);
  assign x4 = (y3 ^ bDigit3);
  
  assign y1 = (aIncrement & bDigit0);
  assign y2 = (y1 & bDigit1);
  assign y3 = (y2 & bDigit2);
  assign bCounterOverflow = (y3 & bDigit3);
  
  assign bCount = {bDigit3, bDigit2, bDigit1, bDigit0};
  
  always @(posedge BrdClk) begin
    if(aReset) begin
      bDigit0 <= 0;
      bDigit1 <= 0;
      bDigit2 <= 0;
      bDigit3 <= 0;
    end 
    else begin 
      bDigit0 <= x1;
      bDigit1 <= x2;
      bDigit2 <= x3;
      bDigit3 <= x4;
      
    end
  
  end

endmodule
