BUILD_DIR = ./build

PRJ = demo

test:
	mill -i $(PRJ).test

verilog:
	$(call git_commit, "generate verilog")
	mkdir -p $(BUILD_DIR)
	mill -i $(PRJ).runMain Elaborate --target-dir $(BUILD_DIR)

help:
	mill -i $(PRJ).runMain Elaborate --help

fmt:
	mill -i __.reformat

fmtcheck:
	mill -i __.checkFormat

bsp:
	mill -i mill.bsp.BSP/install

clean:
	-rm -rf $(BUILD_DIR)

.PHONY: test verilog help fmt fmtcheck clean

sim:
	$(call git_commit, "sim RTL") # DO NOT REMOVE THIS LINE!!!
	mill demo.test

-include ../Makefile
