`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2024 05:59:18 PM
// Design Name: 
// Module Name: SevSegDisplay
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


module SevSegDisplay(
  input BrdClk, aReset_n,
  input [3:0] bNumber,
  
  output reg [7:0] bDigitSel,
  output reg [7:0] bSegmentOutput // Array of 8 numbers corresponding to LED Cathodes (Common Anode Board)
    );
    
    // 4-bit Input means we only require 2 Digits. 
    // Potentially use rightmost for binary representation
    // Note active low on segment output 
    
    reg aReset;
    assign aReset = ~aReset_n;
    
    // AN = bDigitalSel, in this case just do rightmost for now
    assign bDigitSel = 8'b11111110;
    
    // Encoder (bNumber to bSegmentOutput) function 
    always @(posedge BrdClk) begin
      if(aReset_n) begin
        bSegmentOutput <= 0;
      end
      else begin
        case(bNumber)
          4'b0000: bSegmentOutput <= 8'b00000011;
          4'b0001: bSegmentOutput <= 8'b10011111;
          4'b0010: bSegmentOutput <= 8'b00100101;
          4'b0011: bSegmentOutput <= 8'b00001101;
          4'b0100: bSegmentOutput <= 8'b10011001;
          4'b0101: bSegmentOutput <= 8'b01001001;
          4'b0110: bSegmentOutput <= 8'b01000001;
          4'b0111: bSegmentOutput <= 8'b00011111;
          4'b1000: bSegmentOutput <= 8'b00000001;
          4'b1001: bSegmentOutput <= 8'b00001001;
          4'b1010: bSegmentOutput <= 8'b00010001;
          4'b1011: bSegmentOutput <= 8'b11000001;
          4'b1100: bSegmentOutput <= 8'b01100011;
          4'b1101: bSegmentOutput <= 8'b10000101;
          4'b1110: bSegmentOutput <= 8'b01100001;
          4'b1111: bSegmentOutput <= 8'b01110001;
          default: bSegmentOutput <= 8'b00000011;
        endcase
      end
    end
endmodule
