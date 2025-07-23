`ifndef AXI_SCB_SV
`define AXI_SCB_SV
`uvm_analysis_imp_decl(_mst_mon)
`uvm_analysis_imp_decl(_slv_mon)

class axi_scb extends uvm_component;

  `uvm_component_utils(axi_scb);

  axi_mst_agent m_agt_h;
  axi_slv_agent s_agt_h;

  uvm_analysis_imp_slv_mon #(axi_slv_seq_item, axi_scb) s_scb_analysis_import;
  uvm_analysis_imp_mst_mon #(axi_mst_seq_item, axi_scb) m_scb_analysis_import;

  function new(string name = "axi_scb",uvm_component parent);
    super.new(name,parent);
    s_scb_analysis_import = new("s_scb_analysis_import",this);
    m_scb_analysis_import = new("m_scb_analsysi_import",this);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction

  function void write_mst_mon(axi_mst_seq_item req);
  endfunction

  function void write_slv_mon(axi_slv_seq_item req);
  endfunction

  task run_phase(uvm_phase phase);
  endtask

endclass

`endif
