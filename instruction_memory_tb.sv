`timescale 1ns/1ps
`include "instruction_memory.sv"

module instruction_memory_tb;

logic [7:0] PC;
logic [23:0] Instr;

instruction_memory dut(PC, Instr);

initial begin
  $dumpfile("instruction_memory_tb.vcd");
  $dumpvars(0, instruction_memory_tb); 

  PC = 8'd0;
  #2;
  if(Instr !== 24'h610001) $display("Incorrect value in position 0");

  PC = 8'd1;
  #2;
  if(Instr !== 24'h620020) $display("Incorrect value in position 1");

  PC = 8'd2;
  #2;
  if(Instr !== 24'h6F0000) $display("Incorrect value in position 2");

  PC = 8'd3;
  #2;
  if(Instr !== 24'h701207) $display("Incorrect value in position 3");

  PC = 8'd4;
  #2;
  if(Instr !== 24'h211100) $display("Incorrect value in position 4");

  PC = 8'd5;
  #2;
  if(Instr !== 24'h6FF001) $display("Incorrect value in position 5");

  PC = 8'd6;
  #2;
  if(Instr !== 24'h700003) $display("Incorrect value in position 6");

  PC = 8'd7;
  #2;
  if(Instr !== 24'h700007) $display("Incorrect value in position 7");
end

initial begin // Response monitor
$monitor("PC=%d Instr=%h", PC, Instr);
end
endmodule
