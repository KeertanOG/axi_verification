`ifndef AXI_MST_SEQR_SV
`define AXI_MST_SEQR_SV

class axi_mst_seqr extends uvm_sequencer #(axi_mst_seq_item);

  `uvm_component_utils(axi_mst_seqr)

  function new(string name="axi_mst_seqr", uvm_component parent = null);
    super.new(name,parent);
  endfunction

endclass

`endif
