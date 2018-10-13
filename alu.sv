module alu(
  input   logic [31:0]  srca,srcb,
  input   logic [2:0]   alucontrol,
  output  logic [31:0]  aluout,
  output  logic         zero
);
  logic [31:0] notsrcb;
  logic [31:0] srcbb;
  logic [31:0] s;
  assign notsrcb = ~srcb;
  assign s = srca + srcbb + alucontrol[2];

  assign zero = (aluout === 0);
  always @(*)
    case(alucontrol[1:0])
      2'b00: aluout <= srca & srcbb;
      2'b01: aluout <= srca | srcbb;
      2'b10: aluout <= s;
      2'b11: aluout <= {31'b0,s[31]};
      default: aluout <= 32'hxxxxxxxx;
    endcase

  mux2 #(32) bmux(srcb,notsrcb,alucontrol[2],srcbb);

endmodule
