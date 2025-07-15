`ifndef AXI_MST_PKG_SV
`define AXI_MST_PKG_SV

//`include "axi_mst_defines.sv"
//`include "axi_mst_inf.sv"

package axi_mst_pkg;
  import uvm_pkg :: *;
  
  `include "uvm_macros.svh"
  
  import axi_mst_agt_pkg :: *;
  `include "axi_mst_agent.sv"

endpackage

`endif
