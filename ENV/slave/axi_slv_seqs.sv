`ifndef AXI_SLV_SEQS_SV
`define AXI_SLV_SEQS_SV

class axi_slv_seqs extends uvm_sequence #(axi_slv_trans);

  `uvm_object_utils(axi_slv_seqs)

  function new(string name = "axi_slv_seqs");
    super.new(name);
  endfunction

 // task body();
 // endtask

endclass

`endif
