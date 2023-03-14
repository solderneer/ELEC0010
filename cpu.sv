`include "control_unit.sv"
`include "alu_reg_file.sv"
`include "instruction_memory_pc.sv"

module cpu(
  input logic CLK, reset,
  output logic [7:0] ALUResult, cpu_out
);

logic PCSrc, Branch, ALUSrc, RegWrite, zero;
logic [1:0] ALUControl;
logic [23:0] Instr;
logic [7:0] immediate;
logic [3:0] opcode, RA1, RA2, WA;

control_unit cu(opcode, Branch, ALUSrc, RegWrite, ALUControl);
instruction_memory_pc impc(CLK, PCSrc, reset, immediate, Instr);    
alu_reg_file arf(~CLK, RegWrite, ALUSrc, ALUControl, RA1, RA2, WA, immediate, ALUResult, cpu_out, zero); 

assign opcode = Instr[23:20];
assign WA = Instr[19:16];
assign RA1 = Instr[15:12];
assign RA2 = Instr[11:8];
assign immediate = Instr[7:0];

// Create AND gate
assign PCSrc = Branch & zero;

endmodule
