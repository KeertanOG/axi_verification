`ifndef AXI_ENV_PKG_SV
`define AXI_ENV_PKG_SV

package axi_env_pkg;
  import uvm_pkg :: *;
  
  `include "uvm_macros.svh"
  
  import axi_mst_pkg :: *;
  import axi_slv_pkg :: *;
  `include "axi_env_config.sv"
  `include "axi_env.sv"

endpackage

`endif
