`include "pc.sv"
`include "instruction_memory.sv"

module instruction_memory_pc(
  input logic CLK, PCSrc, reset,
  input logic [7:0] immediate,
  output logic [23:0] Instr
);

wire [7:0] PCInternal;

pc counter(CLK, PCSrc, reset, immediate, PCInternal);
instruction_memory store(PCInternal, Instr);

endmodule
