module control_unit(
  input logic [3:0] opcode,
  output logic Branch, ALUSrc, RegWrite,
  output logic [1:0] ALUControl
);

logic [5:0] state;
  
assign RegWrite = state[4];
assign ALUSrc = state[3];
assign ALUControl = state[2:1];
assign Branch = state[0];

always_comb begin
  case (opcode)
    4'b0000: state = 5'b10000;
    4'b0001: state = 5'b10010;
    4'b0010: state = 5'b10100;
    4'b0011: state = 5'b10110;
    4'b0100: state = 5'b11000;
    4'b0101: state = 5'b11010;
    4'b0110: state = 5'b11100;
    4'b0111: state = 5'b00111;
    default: state = 5'bx;
  endcase
end

endmodule
