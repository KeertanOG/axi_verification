`ifndef AXI_SLV_DRV_SV
`define AXI_SLV_DRV_SV

class axi_slv_drv extends uvm_driver #(axi_slv_trans);

  `uvm_component_utils(axi_slv_drv)

  virtual axi_slv_inf vif;

  function new(string name = "axi_slv_drv", uvm_component parent);
    super.new(name, parent);
  endfunction

endclass

`endif
