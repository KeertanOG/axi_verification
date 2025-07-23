`ifndef AXI_SLV_SEQR_SV
`define AXI_SLV_SEQR_SV

class axi_slv_seqr extends uvm_sequencer #(axi_slv_seq_item);

  `uvm_component_utils(axi_slv_seqr)

  function new(string name="axi_slv_seqr", uvm_component parent = null);
    super.new(name,parent);
  endfunction

endclass

`endif
