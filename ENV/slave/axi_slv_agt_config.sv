`ifndef AXI_SLV_AGT_CONFIG_SV
`define AXI_SLV_AGT_CONFIG_SV

class axi_slv_agt_config extends uvm_object;

  `uvm_object_utils(axi_slv_agt_config)

  function new(string name = "axi_slv_agt_config");
    super.new(name);
  endfunction

endclass

`endif
