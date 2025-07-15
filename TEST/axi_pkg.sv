`ifndef AXI_PKG_SV
`define AXI_PKG_SV

  `include "axi_mst_defines.sv" 
  `include "axi_slv_defines.sv"
  `include "axi_mst_inf.sv"
  `include "axi_slv_inf.sv"
  
package axi_pkg;
  import uvm_pkg :: *;
  
  `include "uvm_macros.svh"
  import axi_mst_agt_pkg :: *;
  import axi_slv_agt_pkg :: *;
  import axi_mst_pkg :: *;
  import axi_slv_pkg :: *;
  import axi_env_pkg::*;
  `include "axi_base_test.sv"

endpackage

`endif
