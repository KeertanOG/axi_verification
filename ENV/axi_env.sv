`ifndef AXI_ENV_SV
`define AXI_ENV_SV

class axi_env extends uvm_env;
  `uvm_component_utils(axi_env)

  //env config class
  axi_env_config env_cfg;

  //agents and scoreboard
  axi_mst_agent mst_agt_h;        //master agent
  axi_slv_agent slv_agt_h;        //slave agent
  axi_scb scb_h;                  //scoreboard 

  function new(string name="axi_env",uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env_cfg = axi_env_config::type_id::create("env_cfg",this);
    //get handle of env config 
    if(!uvm_config_db #(axi_env_config)::get(this,"","env_cfg",env_cfg))
      `uvm_fatal("ENV_NOT_FOUND",$sformatf("cannot get environment config",get_full_name()))

    //set master agent config handle
    if(env_cfg.has_mst_agt)begin
      uvm_config_db #(axi_mst_agt_config)::set(this,"mst_agt_h*","mst_cfg",env_cfg.mst_agt_cfg);
      mst_agt_h = axi_mst_agent::type_id::create("mst_agt_h",this);
    end

    //set slave agent config handle
    if(env_cfg.has_slv_agt)begin
      uvm_config_db #(axi_slv_agt_config)::set(this,"slv_agt_h*","slv_cfg",env_cfg.slv_agt_cfg);
      slv_agt_h = axi_slv_agent::type_id::create("slv_agt_h",this);
    end
    
    //create scoreboard
    if(env_cfg.has_scb)begin
      scb_h = axi_scb::type_id::create("scb_h",this);
    end

  endfunction

  function void connect_phase(uvm_phase phase);
    mst_agt_h.mst_agent_analysis_export.connect(scb_h.m_scb_analysis_import);
    slv_agt_h.slv_agent_analysis_export.connect(scb_h.s_scb_analysis_import);
  endfunction

endclass

`endif
