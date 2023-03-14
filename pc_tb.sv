`timescale 1ns/1ps
`include "pc.sv"

module pc_tb;

logic CLK, PCSrc, reset;
logic [7:0] PC, immediate;

pc dut(CLK, PCSrc, reset, immediate, PC);

initial begin
  $dumpfile("pc_tb.vcd");
  $dumpvars(0, pc_tb);

  CLK = 0;
  PCSrc = 0;
  reset = 0;
  immediate = 0;

  // Assert reset
  reset = 1'b1;

  // Clock
  #10;
  CLK = ~CLK;
  #10;
  CLK = ~CLK;

  if (PC !== 0) $display("Initialization failed.");

  // Increment
  reset = 1'b0;
  
  // Clock
  #10;
  CLK = ~CLK;
  #10;
  CLK = ~CLK;

  if (PC !== 8'd1) $display("Increment failed.");

  // Increment again

  // Clock
  #10;
  CLK = ~CLK;
  #10;
  CLK = ~CLK;

  if (PC !== 8'd2) $display("Increment failed.");
  
  // Increment again

  // Clock
  #10;
  CLK = ~CLK;
  #10;
  CLK = ~CLK;

  if (PC !== 8'd3) $display("Increment failed.");

  // Jump to 5
  PCSrc = 1'b1;
  immediate = 8'd5;

  // Clock
  #10;
  CLK = ~CLK;
  #10;
  CLK = ~CLK;

  if (PC !== 8'd5) $display("Jump failed.");
  
  // Assert reset
  reset = 1'b1;
  PCSrc = 1'b0;

  // Clock
  #10;
  CLK = ~CLK;
  #10;
  CLK = ~CLK;

  if (PC !== 0) $display("Reset failed.");
  
  // Increment again
  reset = 1'b0;

  // Clock
  #10;
  CLK = ~CLK;
  #10;
  CLK = ~CLK;

  if (PC !== 8'd1) $display("Increment failed.");
  
  // Clock
  #10;
  CLK = ~CLK;
  #10;
  CLK = ~CLK;

  if (PC !== 8'd2) $display("Increment failed.");
end

initial begin // Response monitor
$monitor("CLK=%d PCSrc=%d reset=%d PC=%d immediate=%h", CLK, PCSrc, reset, PC, immediate);
end

endmodule
