`timescale 1ns/1ps
`include "cpu.sv"

module cpu_tb;

logic CLK, reset;
logic [7:0] ALUResult, cpu_out;

cpu dut(CLK, reset, ALUResult, cpu_out);

always #10 CLK <= !CLK;

initial #0 begin
  $dumpfile("cpu_tb.vcd");
  $dumpvars(0, cpu_tb);

  // Call reset
  CLK = 0;
  reset = 1;
  #15;
  reset = 0;
  
  #500; $finish;
end

initial begin // Response monitor
  $monitor("CLK=%d reset=%d ALUResult=%d cpu_out=%d", CLK, reset, ALUResult, cpu_out);
end

endmodule
