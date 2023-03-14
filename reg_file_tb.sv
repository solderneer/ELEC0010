`timescale 1ns/1ps
`include "reg_file.sv"

module reg_file_tb;

logic CLK, write_enable = 0;
logic [3:0] RA1, RA2, WA = 0;
logic [7:0] ALUResult = 0;
logic [7:0] RD1, RD2, cpu_out;

reg_file dut(CLK, write_enable, RA1, RA2, WA, ALUResult, RD1, RD2, cpu_out);

initial begin
  $dumpfile("reg_file_tb.vcd");
  $dumpvars(0, reg_file_tb); 

  CLK = 0;

  // Check initial values
  RA1 = 4'd0;
  RA2 = 4'd0;

  CLK = ~CLK;
  #10;
  CLK = ~CLK;
  #10;

  if (RD1 !== 0) $display("Initialization failed.");
  if (RD2 !== 0) $display("Initialization failed.");

  // Store to register 1
  RA1 = 4'd1;
  RA2 = 4'd1;
  WA = 4'd1;
  ALUResult = 8'd15;

  write_enable = 1;
  CLK = ~CLK;
  #10;
  CLK = ~CLK;
  #10;
  write_enable = 0;

  if (RD1 !== 15) $display("Store to register 1 failed");
  if (RD2 !== 15) $display("View to output 2 failed");
  
  // Store to register 2
  RA2 = 4'd2;
  WA = 4'd2;
  ALUResult = 8'd15;

  write_enable = 1;
  CLK = ~CLK;
  #10;
  CLK = ~CLK;
  #10;
  write_enable = 0;

  if (RD2 !== 15) $display("Store to register 2 failed");
  
  // Store to register 1 without write enable (SHOULD FAIL)
  WA = 4'd1;
  ALUResult = 8'd20;

  CLK = ~CLK;
  #10;
  CLK = ~CLK;
  #10;

  if (RD1 === 20) $display("Shouldn't be able to write to register 2 without write enable");
 
  // Store to register 2 without write enable (SHOULD FAIL)
  WA = 4'd2;
  ALUResult = 8'd20;

  CLK = ~CLK;
  #10;
  CLK = ~CLK;
  #10;

  if (RD2 === 20) $display("Shouldn't be able to write to register 2 without write enable");

  // Store to register 0 (SHOULD FAIL)
  WA = 4'd0;
  ALUResult = 8'd20;
  RA1 = 4'd0;

  write_enable = 1;
  CLK = ~CLK;
  #10;
  CLK = ~CLK;
  #10;
  write_enable = 0;

  if (RD1 !== 0) $display("Shouldn't be able to write to register 0");

  // Store 20 to cpu_out
  WA = 4'd15;
  ALUResult = 8'd20;
  RA1 = 4'd15;
  RA2 = 4'd15;

  write_enable = 1;
  CLK = ~CLK;
  #10;
  CLK = ~CLK;
  #10;
  write_enable = 0;

  if (cpu_out !== 20) $display("Write to cpu_out failed");
  if (RD1 !== 20) $display("Write to RD1 failed");
  if (RD2 !== 20) $display("Write to RD2 failed");
  
  // Store 15 to cpu_out
  ALUResult = 8'd15;

  write_enable = 1;
  CLK = ~CLK;
  #10;
  CLK = ~CLK;
  #10;
  write_enable = 0;

  if (cpu_out !== 15) $display("Write to cpu_out failed");
  if (RD1 !== 15) $display("Write to RD1 failed");
  if (RD2 !== 15) $display("Write to RD2 failed");
end

initial begin // Response monitor
$monitor("clk=%d write_enable=%d RA1=%d RA2=%d WA=%d ALUResult=%d RD1=%d RD2=%d cpu_out=%d ", CLK, write_enable, RA1, RA2, WA, ALUResult, RD1, RD2, cpu_out);
end

endmodule
