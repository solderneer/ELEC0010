module alu(
  input logic [7:0] SrcA, SrcB,
  input logic [1:0] ALUControl,
  output logic [7:0] ALUResult,
  output logic zero
  );

  always_comb begin
    case (ALUControl)
      2'd0 : ALUResult = SrcA & SrcB;
      2'd1 : ALUResult = SrcA | SrcB;
      2'd2 : ALUResult = SrcA + SrcB;
      2'd3 : ALUResult = SrcA - SrcB;
      default: ALUResult = 8'bx;
    endcase

    zero = (ALUResult == 0);
  end
endmodule
