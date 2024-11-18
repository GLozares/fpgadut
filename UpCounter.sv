`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2024 02:49:00 PM
// Design Name: 
// Module Name: UpCounter
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


module UpCounter(
  input BrdClk, aReset_n, aScanEn,            //Control Bits 
  input bScanIn, aIncrement,                  //Mux Input
  
  output reg bScanOut,                        //4 Clock Cycle Delay between bScanIn and bScanOut
  output reg [3:0] bCount                     //4-bit output for normal operation
    );
    
    //  Every digit output will be muxed via aScanEn 
    //  Under normal operation (aScanEn = 0) output FFs will return combinatorial logic results.
    //  When (aScanEn = 1) output FFs will return bScanIn delayed by how far down the FF chain they are.
    //  This will result in a 4 clock cycle delay between in and out. 
    //  Additionally, it will take 4 clock cycles after aScanEn is asserted to flush adder data at bScanOut.
    
    //  This kind of design will enable output FF testing when in debug mode.
    
    
    //  First create 4 connections to hold intermediate scan values
    reg bScan0, bScan1, bScan2, bScan3;
    reg [3:0] bCountInt; 
    
    //  Manual assignment of digits due to scan pattern 
    assign bCountInt = {bScan3, bScan2, bScan1, bScan0};
    
    //  bScan3 will match bScanOut 
    assign bScanOut = bCount[3];

    //  mux output 
    always @(aScanEn or aIncrement) begin 
      if(aScanEn) begin 
        bCount <= bCountInt;
      end
      else begin 
        bCount <= {bScan3, bScan2, bScan1, bScan0};
      end
    end
    
    always @(posedge BrdClk) begin 
      if (!aReset_n) begin                    // Reset
        bScan3 <= 0;
        bScan2 <= 0;
        bScan1 <= 0;
        bScan0 <= 0;
      end 
      else begin 
        if (aScanEn) begin                    // Scan Enabled (Burst Pattern Reader)
          bScan0 <= bScanIn;                   
          bScan1 <= bScan0;
          bScan2 <= bScan1;
          bScan3 <= bScan2;
        end
        else                                  // Normal Operation (Counter)
          if (aIncrement) begin                                  
            bCountInt <= bCountInt + 1; 
          end 
          else begin                          //Else do not change output
            bCountInt <= bCountInt;
          end
        end
      end
      
endmodule
