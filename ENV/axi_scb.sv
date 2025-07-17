`ifndef AXI_SCB_SV
`define AXI_SCB_SV

class axi_scb extends uvm_component;

  `uvm_component_utils(axi_scb);

  axi_mst_agent m_agt_h;
  axi_slv_agent s_agt_h;

  //uvm_analysis_export #(axi_slv_trans) s_scb_analysis_import;
  //uvm_analysis_export #(axi_mst_trans) m_scb_analysis_import;

  function new(string name = "axi_scb",uvm_component parent);
    super.new(name,parent);
  //  s_scb_analysis_import = new("s_scb_analysis_import",this);
  //  m_scb_analysis_import = new("m_scb_analsysi_import",this);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction

  function void connect_phase(uvm_phase phase);
  //  m_agt_h.mst_agent_analysis_export.connect(m_scb_analysis_import);
  //  s_agt_h.slv_agent_analysis_export.connect(s_scb_analysis_import);
  endfunction
    
  task run_phase(uvm_phase phase);
  endtask

endclass

`endif
