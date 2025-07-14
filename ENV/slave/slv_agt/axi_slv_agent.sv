`ifndef AXI_SLV_AGENT_SV
`define AXI_SLV_AGENT_SV

class axi_slv_agent extends uvm_agent;

  `uvm_component_utils(axi_slv_agent)
  
  uvm_analysis_export #(axi_slv_trans) slv_agent_analysis_export;

  axi_slv_seqr s_seqr_h;
  axi_slv_drv s_drv_h;
  axi_slv_mon s_mon_h;

  virtual axi_slv_inf vif;

  function new(string name = "axi_slv_agent", uvm_component parent);
    super.new(name, parent);
    slv_agent_analysis_export = new("slv_agent_analysis_export", this);
  endfunction

  function void build_phase(uvm_phase phase);
    if(!uvm_config_db #(virtual axi_slv_inf)::get(this,"","s_vif",vif))
      `uvm_fatal("axi_slv_agent","interface config_db error")
    s_drv_h = axi_slv_drv::type_id::create("s_drv_h",this);
    s_mon_h = axi_slv_mon::type_id::create("s_mon_h",this);
    s_seqr_h = axi_slv_seqr::type_id::create("s_seqr_h",this);
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    s_drv_h.seq_item_port.connect(s_seqr_h.seq_item_export);
    s_mon_h.slv_mon_analysis_port.connect(slv_agent_analysis_export);
    s_drv_h.vif = vif;
    s_mon_h.vif = vif;
  endfunction

endclass

`endif
