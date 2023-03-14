`timescale 1ns/1ps
`include "alu.sv"

module alu_tb;

logic [7:0] SrcA, SrcB, ALUResult;
logic [1:0] ALUControl;
logic zero;

alu dut(SrcA, SrcB, ALUControl, ALUResult, zero);

initial begin
  $dumpfile("alu_tb.vcd");
  $dumpvars(0, alu_tb);

  // Testing AND
  $display("Operation AND, 5 AND 4:");
  ALUControl = 2'd0;
  SrcA = 8'd5;
  SrcB = 8'd4;
  #10;
  if (ALUResult !== (SrcA & SrcB)) $display("AND operation failed.");
  
  // Testing OR
  $display("Operation OR, 5 OR 3:");
  ALUControl = 2'd1;
  SrcA = 8'd5;
  SrcB = 8'd3;
  #10;
  if (ALUResult !== (SrcA | SrcB)) $display("OR operation failed.");
  
  // Testing Addition
  $display("Operation ADD, 5 PLUS 3:");
  ALUControl = 2'd2;
  SrcA = 8'd5;
  SrcB = 8'd3;
  #10;
  if (ALUResult !== (SrcA + SrcB)) $display("Add operation failed.");
  
  // Testing Subtraction
  $display("Operation SUBTRACT, 5 MINUS 3:");
  ALUControl = 2'd3;
  SrcA = 8'd5;
  SrcB = 8'd3;
  #10;
  if (ALUResult !== (SrcA - SrcB)) $display("Subtrack operation failed.");
  
  // Testing negative Subtraction
  $display("Operation NEGATIVE SUBTRACT, 5 MINUS 7:");
  ALUControl = 2'd3;
  SrcA = 8'd5;
  SrcB = 8'd7;
  #10;
  if (ALUResult !== (SrcA - SrcB)) $display("Subtrack operation failed.");

end

initial begin // Response monitor
$monitor("SrcA=%d SrcB=%d ALUControl=%d ALUResult=%d zero=%d", SrcA[7:0], SrcB[7:0], ALUControl[1:0], ALUResult[7:0], zero);
end

endmodule
