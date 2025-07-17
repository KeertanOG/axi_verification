`ifndef AXI_MST_MON_SV
`define AXI_MST_MON_SV

class axi_mst_mon extends uvm_monitor;

  `uvm_component_utils(axi_mst_mon)

  uvm_analysis_port #(axi_mst_trans) mst_mon_analysis_port;

  axi_mst_trans mst_trans_h;

  virtual axi_mst_inf vif;

  function new(string name = "axi_mst_mon", uvm_component parent);
    super.new(name, parent);
    mst_mon_analysis_port = new("mst_agent_analysis_port",this);
  endfunction

endclass

`endif
