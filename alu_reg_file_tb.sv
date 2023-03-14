`timescale 1ns/1ps
`include "alu_reg_file.sv"

module alu_reg_file_tb;

logic CLK, write_enable, ALUSrc;
logic [1:0] ALUControl;
logic [3:0] RA1, RA2, WA;
logic [7:0] immediate;
logic [7:0] ALUResult, cpu_out;
logic zero;

alu_reg_file dut(CLK, write_enable, ALUSrc, ALUControl, RA1, RA2, WA, immediate, ALUResult, cpu_out, zero);

initial begin
  $dumpfile("alu_reg_file_tb.vcd");
  $dumpvars(0, alu_reg_file_tb); 

  CLK = 0;

  // Load 5 into register 1
  
  // Setup
  RA1 = 4'd0;
  WA = 4'd1;
  immediate = 8'd5;
  ALUSrc = 1'b1;
  ALUControl = 2'd2;
  write_enable = 1'b1;
  
  // Move clock
  #10;
  CLK=~CLK;
  #10;
  CLK=~CLK;

  // Load 5 into register 2

  // Setup
  WA = 4'd2;
  immediate = 8'd5;
  
  // Move clock
  #10;
  CLK=~CLK;
  #10;
  CLK=~CLK;

  // Add and store into register 3
  RA1 = 4'd1;
  RA2 = 4'd2;
  WA = 4'd3;
  ALUSrc = 1'b0;

  // Move clock
  #10;
  CLK=~CLK;
  #10;
  CLK=~CLK;

  // Subtract and store to register 4
  WA = 4'd4;
  ALUControl = 2'd3;
  
  // Move clock
  #10;
  CLK=~CLK;
  #10;
  CLK=~CLK;

  // Bitwise OR and store to 5
  WA = 4'd5;
  ALUControl = 2'd1;
  
  // Move clock
  #10;
  CLK=~CLK;
  #10;
  CLK=~CLK;

  // Bitwise AND and store to 6
  WA = 4'd6;
  ALUControl = 2'd0;
  
  // Move clock
  #10;
  CLK=~CLK;
  #10;
  CLK=~CLK;
  
  // Multiply register 3 by 2
  WA = 4'd3;
  RA1 = 4'd3;
  RA2 = 4'd3;
  ALUControl = 2'd2;
  
  // Move clock
  #10;
  CLK=~CLK;
  #10;
  CLK=~CLK;

  // Copy register 3 to 15
  RA1 = 4'd3;
  RA2 = 4'd0;
  ALUControl = 2'd2;
  WA = 4'd15;

  // Move clock
  #10;
  CLK=~CLK;
  #10;
  CLK=~CLK;
  
  // Copy register 3 to 15
  RA1 = 4'd4;
  RA2 = 4'd0;
  ALUControl = 2'd2;
  WA = 4'd15;

  // Move clock
  #10;
  CLK=~CLK;
  #10;
  CLK=~CLK;
end

initial begin // Response monitor
$monitor("clk=%d write_enable=%d RA1=%d RA2=%d WA=%d ALUControl=%d ALUSrc=%d immediate=%d ALUResult=%d cpu_out=%d zero=%d", CLK, write_enable, RA1, RA2, WA, ALUControl, ALUSrc, immediate, ALUResult, cpu_out, zero);
end

endmodule
