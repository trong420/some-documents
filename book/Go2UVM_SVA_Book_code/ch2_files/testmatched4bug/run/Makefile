questa: clean
	qverilog -f flist
clean:
	\rm -fr work* qver* *.wlf

rvra: clean
	vsim -c -do rvra_run.do

rvra1: clean
	vlib work
	vlog -f flist -dbg
	vsim testmatched

rvra_gui: clean
	vsim -do rvra_run.do

