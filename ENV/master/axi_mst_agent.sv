`ifndef AXI_MST_AGENT_SV
`define AXI_MST_AGENT_SV

class axi_mst_agent extends uvm_agent;

  `uvm_component_utils(axi_mst_agent)
  
  uvm_analysis_export #(axi_mst_trans) mst_agent_analysis_export;

  axi_mst_seqr m_seqr_h;
  axi_mst_drv m_drv_h;
  axi_mst_mon m_mon_h;

  virtual axi_mst_inf vif; 

  function new(string name = "axi_mst_agent", uvm_component parent);
    super.new(name, parent);
    mst_agent_analysis_export = new("mst_agent_analysis_export", this);
  endfunction

  function void build_phase(uvm_phase phase);
    if(!uvm_config_db #(virtual axi_mst_inf)::get(this,"","m_vif",vif))
      `uvm_fatal("axi_mst_agent","interface config_db error")
    m_drv_h = axi_mst_drv::type_id::create("m_drv_h",this);
    m_mon_h = axi_mst_mon::type_id::create("m_mon_h",this);
    m_seqr_h = axi_mst_seqr::type_id::create("m_seqr_h",this);
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    m_drv_h.seq_item_port.connect(m_seqr_h.seq_item_export);
    m_mon_h.mst_mon_analysis_port.connect(mst_agent_analysis_export);
    m_drv_h.vif = vif;
    m_mon_h.vif = vif;
  endfunction

endclass

`endif
