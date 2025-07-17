`ifndef AXI_MST_DRV_SV
`define AXI_MST_DRV_SV

class axi_mst_drv extends uvm_driver #(axi_mst_trans);

  `uvm_component_utils(axi_mst_drv)

  virtual axi_mst_inf vif;

  function new(string name = "axi_mst_drv", uvm_component parent);
    super.new(name, parent);
  endfunction

endclass

`endif
