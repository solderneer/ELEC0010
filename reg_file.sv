module reg_file(
  input logic CLK, write_enable,
  input logic [3:0] RA1, RA2, WA,
  input logic [7:0] ALUResult,
  output logic [7:0] RD1, RD2, cpu_out
);

logic [7:0] store [0:15];

assign RD1 = store[RA1];
assign RD2 = store[RA2];
assign cpu_out = store[4'd15];

initial begin
  store[0] <= 1'b0;
end

always_ff @(posedge CLK && write_enable && WA > 0) begin
  store[WA] <= ALUResult;
end

endmodule


