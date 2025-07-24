module axi_top_module;
  
  import uvm_pkg :: *;
  `include "uvm_macros.svh"
 
  import axi_pkg :: *;

  bit clk;                  //clock signal declaration
  bit aresetn;              //active low reset signal

  //clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  //interface instantiation
  axi_mst_inf mst_inf(clk, aresetn);      //master
  axi_slv_inf slv_inf(clk, aresetn);      //slave

  assign mst_inf.wready = 0;
  assign mst_inf.awready = 0;

  initial begin
    fork
      //get virtual interface
      uvm_config_db #(virtual axi_slv_inf)::set(null,"*","s_vif",slv_inf);
      uvm_config_db #(virtual axi_mst_inf)::set(null, "*","m_vif",mst_inf);

      run_test();
    join
  end

  //initial reset
  initial begin
    aresetn = 0;
    repeat(2) @(posedge clk);
    aresetn = 1;
  end

endmodule
