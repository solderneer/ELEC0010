`timescale 1ns/1ps
`include "control_unit.sv"

module control_unit_tb;

logic [3:0] opcode;
logic Branch, ALUSrc, RegWrite;
logic [1:0] ALUControl;

control_unit dut(opcode, Branch, ALUSrc, RegWrite, ALUControl);

initial begin
  $dumpfile("control_unit_tb.vcd");
  $dumpvars(0, control_unit_tb);

  opcode = 4'b0000;
  #2;
  if(!((RegWrite == 1) && (ALUSrc == 0) && (ALUControl == 2'b00) && (Branch == 0)))
    $display("Incorrect output for 0000");
  
  opcode = 4'b0001;
  #2;
  if(!((RegWrite == 1) && (ALUSrc == 0) && (ALUControl == 2'b01) && (Branch == 0)))
    $display("Incorrect output for 0001");
  
  opcode = 4'b0010;
  #2;
  if(!((RegWrite == 1) && (ALUSrc == 0) && (ALUControl == 2'b10) && (Branch == 0)))
    $display("Incorrect output for 0010");
  
  opcode = 4'b0011;
  #2;
  if(!((RegWrite == 1) && (ALUSrc == 0) && (ALUControl == 2'b11) && (Branch == 0)))
    $display("Incorrect output for 0011");
  
  opcode = 4'b0100;
  #2;
  if(!((RegWrite == 1) && (ALUSrc == 1) && (ALUControl == 2'b00) && (Branch == 0)))
    $display("Incorrect output for 0100");
  
  opcode = 4'b0101;
  #2;
  if(!((RegWrite == 1) && (ALUSrc == 1) && (ALUControl == 2'b01) && (Branch == 0)))
    $display("Incorrect output for 0101");
  
  opcode = 4'b0110;
  #2;
  if(!((RegWrite == 1) && (ALUSrc == 1) && (ALUControl == 2'b10) && (Branch == 0)))
    $display("Incorrect output for 0110");
  
  opcode = 4'b0111;
  #2;
  if(!((RegWrite == 0) && (ALUSrc == 0) && (ALUControl == 2'b11) && (Branch == 1)))
    $display("Incorrect output for 0110");
end

initial begin // Response monitor
$monitor("opcode=%b Branch=%b ALUSrc=%b RegWrite=%b ALUControl=%b", opcode, Branch, ALUSrc, RegWrite, ALUControl);
end

endmodule
