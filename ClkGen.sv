`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2024 07:55:26 PM
// Design Name: 
// Module Name: ClkGen
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


module ClkGen(
  input BrdClk, aReset_n, // 100 MHz
  
  output reg SlowClk
    );
    
    // Generate 5Hz Clock for Counter
    reg [31:0] bMaxValue, bClkCounter;
    
    assign bMaxValue = 20000000;
    
    always @(posedge BrdClk or posedge aReset_n) begin 
      if (aReset_n) begin 
        SlowClk <= 0;
        bClkCounter <= 0;
      end 
      else begin 
        bClkCounter <= bClkCounter + 1;
        if (bClkCounter == bMaxValue) begin
          bClkCounter <= 0;
          SlowClk <= ~SlowClk;
        end
      end
    end
    
endmodule
