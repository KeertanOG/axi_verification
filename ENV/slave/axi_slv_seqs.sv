`ifndef AXI_SLV_SEQS_SV
`define AXI_SLV_SEQS_SV

class axi_slv_seqs extends uvm_sequence #(axi_slv_seq_item);

  //variable for no of iteration
  rand int no_of_itr = 1;

  `uvm_object_utils_begin(axi_slv_seqs)
    `uvm_field_int(no_of_itr, UVM_ALL_ON | UVM_UNSIGNED)
  `uvm_object_utils_end

  function new(string name = "axi_slv_seqs");
    super.new(name);
  endfunction

 // task body();
 // endtask

endclass

`endif
