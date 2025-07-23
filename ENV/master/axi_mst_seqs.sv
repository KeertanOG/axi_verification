`ifndef AXI_MST_SEQS_SV
`define AXI_MST_SEQS_SV

class axi_mst_seqs extends uvm_sequence #(axi_mst_seq_item);

  `uvm_object_utils(axi_mst_seqs)

  function new(string name = "axi_mst_seqs");
    super.new(name);
  endfunction

 // task body();
 // endtask

endclass

`endif
