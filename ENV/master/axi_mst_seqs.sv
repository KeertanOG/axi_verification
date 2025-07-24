`ifndef AXI_MST_SEQS_SV
`define AXI_MST_SEQS_SV

class axi_mst_seqs extends uvm_sequence #(axi_mst_seq_item);

  //variable for no of iteration
  rand int no_of_itr = 1;

  `uvm_object_utils_begin(axi_mst_seqs)
    `uvm_field_int(no_of_itr, UVM_ALL_ON | UVM_UNSIGNED)
  `uvm_object_utils_end

  function new(string name = "axi_mst_seqs");
    super.new(name);
  endfunction

 // task body();
 // endtask

endclass

`endif
