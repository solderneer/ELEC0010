`timescale 1ns/1ps
`include "instruction_memory_pc.sv"

module instruction_memory_pc_tb;

logic CLK, PCSrc, reset;
logic [7:0] immediate;
logic [23:0] Instr;

instruction_memory_pc dut(CLK, PCSrc, reset, immediate, Instr);

initial begin
  $dumpfile("instruction_memory_pc_tb.vcd");
  $dumpvars(0, instruction_memory_pc_tb);

  CLK = 0;

  // Assert the reset
  reset = 1'b1;
  PCSrc = 1'b0;

  // Clock
  #10;
  CLK = ~CLK;
  #10;
  CLK = ~CLK;
  
  if(Instr !== 24'h610001) $display("Incorrect value in position 0");

  // Let it Increment
  reset = 1'b0;
  
  // Clock
  #10;
  CLK = ~CLK;
  #10;
  CLK = ~CLK;

  if(Instr !== 24'h620020) $display("Incorrect value in position 1");

  // Clock
  #10;
  CLK = ~CLK;
  #10;
  CLK = ~CLK;

  if(Instr !== 24'h6F0000) $display("Incorrect value in position 2");
  
  // Clock
  #10;
  CLK = ~CLK;
  #10;
  CLK = ~CLK;
  
  if(Instr !== 24'h701207) $display("Incorrect value in position 3");
  
  // Clock
  #10;
  CLK = ~CLK;
  #10;
  CLK = ~CLK;
  
  if(Instr !== 24'h211100) $display("Incorrect value in position 4");
  
  // Clock
  #10;
  CLK = ~CLK;
  #10;
  CLK = ~CLK;
  
  if(Instr !== 24'h6FF001) $display("Incorrect value in position 5");
  
  // Clock
  #10;
  CLK = ~CLK;
  #10;
  CLK = ~CLK;

  if(Instr !== 24'h700003) $display("Incorrect value in position 6");

  // Clock
  #10;
  CLK = ~CLK;
  #10;
  CLK = ~CLK;

  if(Instr !== 24'h700007) $display("Incorrect value in position 7");
  
  // Jump back to 2
  PCSrc = 1'b1;
  immediate = 8'd2;
  
  // Clock
  #10;
  CLK = ~CLK;
  #10;
  CLK = ~CLK;
  
  if(Instr !== 24'h6F0000) $display("JUMP FAILED: Incorrect value in position 2");
end

initial begin // Response monitor
$monitor("CLK=%d Instr=%h", CLK, Instr);
end
endmodule
