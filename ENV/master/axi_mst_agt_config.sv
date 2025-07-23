`ifndef AXI_MST_AGT_CONFIG_SV
`define AXI_MST_AGT_CONFIG_SV

class axi_mst_agt_config extends uvm_object;

  `uvm_object_utils(axi_mst_agt_config)

  //uvm in-built enum
  uvm_active_passive_enum is_active = UVM_ACTIVE;

  //virtual interface
  virtual axi_mst_inf vif;

  function new(string name = "axi_mst_agt_config");
    super.new(name);
  endfunction

endclass

`endif
