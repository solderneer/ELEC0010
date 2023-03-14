module pc(
  input logic CLK, PCSrc, reset,
  input logic [7:0] immediate,
  output logic [7:0] PC
);

always_ff @(posedge CLK) begin
  if(reset) PC <= 0;
  else PC <= (PCSrc) ? immediate : (PC + 8'd1);
end

endmodule
