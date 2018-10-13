module testbench();
  logic clk;
  logic reset;

  logic [31:0]  writedata,dataadr;
  logic         memwrite;

  top dut(clk,reset,writedata,dataadr,memwrite);

  initial
    begin
      reset <= 1; #22 ; reset <= 0;
    end

  always
  begin
    clk <= 1; #5; clk <= 0; #5;
  end

  always @(negedge clk)
    begin
      if(memwrite) begin
        if(dataadr === 84) begin // 0 1 1 2 3 5 8 13 21 34
          if(writedata == 34) begin
            $display("Simulation succeeded");
            $stop;
          end else
            $display("dataadr = %d , writedata = %d",dataadr,writedata);
            $stop;
        end
        if(dataadr == 80)
          $display("writedata = %d",writedata);
      end
    end
endmodule
