questa: clean
	qverilog -f flist
clean:
	\rm -fr work* qver* *.wlf

rvra1: clean
	vlib work
	vlog -f flist -dbg
	vsim recursive

rvra: clean
	vsim -c -do rvra_run.do
