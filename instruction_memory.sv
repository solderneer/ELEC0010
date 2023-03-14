module instruction_memory(
  input logic [7:0] PC,
  output logic [23:0] Instr
);

logic [23:0] store [0:256];

assign Instr = store[PC];

initial begin
  $readmemh("program.txt", store);
end

endmodule
