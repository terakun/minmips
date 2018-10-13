SRC = adder.sv datapath.sv maindec.sv alu.sv dmem.sv regfile.sv aludec.sv flopr.sv mips.sv signext.sv top.sv controller.sv imem.sv mux2.sv sl2.sv
TESTBENCH = testbench.sv
OUT = testbench
COMPILER = iverilog
COFLAGS = -g2012 -o 

$(OUT) : $(TESTBENCH) $(SRC)
	$(COMPILER) $(COFLAGS) $(OUT) $(TESTBENCH) $(SRC)
