module axi_top_module;
  
  import uvm_pkg :: *;
  `include "uvm_macros.svh"
 
  import axi_pkg :: *;

  bit clk;                  //clock signal declaration

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  axi_mst_inf mst_inf(clk);
  axi_slv_inf slv_inf(clk);
  initial begin
    fork
      uvm_config_db #(virtual axi_slv_inf)::set(null,"*","s_vif",slv_inf);
      uvm_config_db #(virtual axi_mst_inf)::set(null, "*","m_vif",mst_inf);

      run_test();
    join
  end

endmodule
