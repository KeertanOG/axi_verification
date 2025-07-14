`ifndef AXI_SLV_AGT_PKG_SV
`define AXI_SLV_AGT_PKG_SV

package axi_slv_agt_pkg;
  import uvm_pkg :: *;
  
  `include "uvm_macros.svh"
  
`include "axi_slv_defines.sv"
  `include "axi_slv_trans.sv"
  `include "axi_slv_seqs.sv"  
  `include "axi_slv_seqr.sv"
  `include "axi_slv_mon.sv"
  `include "axi_slv_drv.sv"
  `include "axi_slv_agent.sv"

endpackage

`endif
