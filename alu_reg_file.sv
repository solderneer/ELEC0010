`include "reg_file.sv"
`include "alu.sv"

module alu_reg_file(
  input logic CLK, write_enable, ALUSrc,
  input logic [1:0] ALUControl,
  input logic [3:0] RA1, RA2, WA,
  input logic [7:0] immediate,
  output logic [7:0] ALUResult, cpu_out,
  output logic zero
);

logic [7:0] w1, w2, w3;

reg_file registers(CLK, write_enable, RA1, RA2, WA, ALUResult, w1, w2, cpu_out);

// mux
assign w3 = ALUSrc ? immediate : w2;

alu internalalu(w1, w3, ALUControl, ALUResult, zero); 

endmodule



