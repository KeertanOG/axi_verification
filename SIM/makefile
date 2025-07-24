TEST = axi_test_sanity

compile:
	vlog -coveropt 3 +cover +acc +incdir+../ENV +incdir+../TEST +incdir+../ENV/master +incdir+../ENV/slave ../ENV/master/axi_mst_agt_pkg.sv ../ENV/slave/axi_slv_agt_pkg.sv ../ENV/axi_env_pkg.sv ../TEST/axi_pkg.sv ../TOP/axi_top_module.sv 
 
sim:
	@echo ""
	vsim -voptargs=+acc axi_top_module +UVM_TESTNAME=$(TEST)
 
sim_cmd:
	@echo ""
	vsim -voptargs=+acc -coverage axi_top_module -c -do "run -all; exit;" +UVM_TESTNAME=$(TEST)

run_regression:
	for t in $(TEST); do \
		vsim -voptargs=+acc -coverage axi_top_module -c -do "coverage save -onexit -directive -cvg -codeall $${t}.ucdb;run -all; exit;" +UVM_TESTNAME=$$t; \
	done

merge_cover:
	vcover merge final_cover.ucdb write_cover.ucdb read_cover.ucdb simultaneous_cover.ucdb

vcover:
	vcover report -details -html -htmldir coverage final_cover.ucdb
