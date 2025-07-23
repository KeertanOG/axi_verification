`ifndef AXI_MST_AGENT_SV
`define AXI_MST_AGENT_SV

class axi_mst_agent extends uvm_agent;

  `uvm_component_utils(axi_mst_agent)
  
  uvm_analysis_export #(axi_mst_seq_item) mst_agent_analysis_export;

  //handles 
  axi_mst_seqr m_seqr_h;        //master sequencer
  axi_mst_drv m_drv_h;          //master driver
  axi_mst_mon m_mon_h;          //master monitor

  //virtual interface
  virtual axi_mst_inf vif; 

  //master config handle
  axi_mst_agt_config  mst_agt_cfg;

  function new(string name = "axi_mst_agent", uvm_component parent);
    super.new(name, parent);
    mst_agent_analysis_export = new("mst_agent_analysis_export", this);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    if(!uvm_config_db #(axi_mst_agt_config)::get(this,"","mst_cfg",mst_agt_cfg))
      `uvm_fatal(get_name(),"cannot get master config in master agent")

    //create components if agent is active
    if(mst_agt_cfg.is_active  == UVM_ACTIVE) begin
      m_drv_h = axi_mst_drv::type_id::create("m_drv_h",this);
      m_seqr_h = axi_mst_seqr::type_id::create("m_seqr_h",this);
    end
    
    //required in both active and passive
    m_mon_h = axi_mst_mon::type_id::create("m_mon_h",this);

  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    //if active
    if(mst_agt_cfg.is_active == UVM_ACTIVE) begin
      m_drv_h.seq_item_port.connect(m_seqr_h.seq_item_export);
      m_drv_h.vif = vif;
    end

    //always required
    m_mon_h.vif = vif;
    m_mon_h.mst_mon_analysis_port.connect(mst_agent_analysis_export);

  endfunction

endclass

`endif
