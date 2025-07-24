`ifndef AXI_SLV_AGENT_SV
`define AXI_SLV_AGENT_SV

class axi_slv_agent extends uvm_agent;

  `uvm_component_utils(axi_slv_agent)
  
  uvm_analysis_export #(axi_slv_seq_item) slv_agent_analysis_export;

  //handles
  axi_slv_seqr slv_seqr_h;          //master sequencer
  axi_slv_drv slv_drv_h;            //master driver
  axi_slv_mon slv_mon_h;            //master monitor

  //virtual interface
  virtual axi_slv_inf vif;

  //slave config handle
  axi_slv_agt_config slv_agt_cfg;

  function new(string name = "axi_slv_agent", uvm_component parent);
    super.new(name, parent);
    slv_agent_analysis_export = new("slv_agent_analysis_export", this);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    if(!uvm_config_db #(axi_slv_agt_config)::get(this,"","slv_cfg",slv_agt_cfg))
      `uvm_fatal(get_name(),"cannot get master config in master agent")

    //create components if agent is active
    if(slv_agt_cfg.is_active == UVM_ACTIVE) begin
      slv_drv_h = axi_slv_drv::type_id::create("slv_drv_h",this);
      slv_seqr_h = axi_slv_seqr::type_id::create("slv_seqr_h",this);
    end

    //required in both active and passive
    slv_mon_h = axi_slv_mon::type_id::create("slv_mon_h",this);

  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    //if active
    if(slv_agt_cfg.is_active == UVM_ACTIVE) begin
      slv_drv_h.seq_item_port.connect(slv_seqr_h.seq_item_export);
      slv_drv_h.vif = slv_agt_cfg.vif;
    end

    //always required
    slv_mon_h.vif = slv_agt_cfg.vif;
    slv_mon_h.slv_mon_analysis_port.connect(slv_agent_analysis_export);

  endfunction

endclass

`endif
