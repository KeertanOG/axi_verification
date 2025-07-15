`ifndef AXI_ENV_SV
`define AXI_ENV_SV

class axi_env extends uvm_env;
  `uvm_component_utils(axi_env)

  axi_mst_agent m_agt_h;
  axi_slv_agent s_agt_h;
  axi_scb scb_h;

  function new(string name="axi_env",uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    m_agt_h = axi_mst_agent::type_id::create("m_agt_h",this);
    s_agt_h = axi_slv_agent::type_id::create("s_agt_h",this);
    scb_h = axi_scb::type_id::create("scb_h",this);
  endfunction

endclass

`endif
