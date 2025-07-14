`ifndef AXI_ENV_SV
`define AXI_ENV_SV

class axi_env extends uvm_env;
  `uvm_component_utils(axi_env)

  axi_mst_agent m_agt_h;
  axi_slv_agent s_agt_h;
  axi_scb scb_h;

  uvm_analysis_export #(axi_slv_trans) s_env_analysis_export;
  uvm_analysis_export #(axi_mst_trans) m_env_analysis_export;

  function new(string name="axi_env",uvm_component parent);
    super.new(name, parent);
    s_env_analysis_export = new("s_env_analysis_export",this);
    m_env_analysis_export = new("m_env_analsysi_export",this);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    m_agt_h = axi_mst_agent::type_id::create("m_agt_h",this);
    s_agt_h = axi_slv_agent::type_id::create("s_agt_h",this);
    scb_h = axi_scb::type_id::create("scb_h",this);
  endfunction

  function void connect_phase(uvm_phase phase);
    m_agt_h.mst_agent_analysis_export.connect(scb_h.mst_scb_analysis_imp);
    s_agt_h.slv_agent_analysis_export.connect(scb_h.slv_scb_analysis_imp);
  endfunction
 
endclass

`endif
