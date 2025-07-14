module axi_top_module;
  
  import uvm_pkg :: *;
  `include "uvm_macros.svh"
 
  `include "axi_pkg.sv"
  import axi_pkg :: *;

  bit clk;                  //clock signal declaration

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    fork
      uvm_config_db #(virtual axi_slv_inf)::set(null,"*","s_vif",slv_inf);
      uvm_config_db #(virtual axi_mst_inf)::set(null, "*","m_vif",slv_inf);

      run_test();
    join
  end

endmodule
