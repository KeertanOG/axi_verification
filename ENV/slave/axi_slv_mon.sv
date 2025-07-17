`ifndef AXI_SLV_MON_SV
`define AXI_SLV_MON_SV

class axi_slv_mon extends uvm_monitor;

  `uvm_component_utils(axi_slv_mon)

  uvm_analysis_port #(axi_slv_trans) slv_mon_analysis_port;

  axi_slv_trans slv_trans_h;

  virtual axi_slv_inf vif;

  function new(string name = "axi_slv_mon", uvm_component parent);
    super.new(name, parent);
    slv_mon_analysis_port = new("slv_mon_analysis_port",this);
  endfunction

endclass

`endif
