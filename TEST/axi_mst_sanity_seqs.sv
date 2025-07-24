`ifndef AXI_MST_SANITY_SEQS_SV 
`define AXI_MST_SANITY_SEQS_SV

class axi_mst_sanity_seqs extends axi_mst_seqs;

  `uvm_object_utils(axi_mst_sanity_seqs)

  function new(string name = "axi_mst_sanity_seqs");
    super.new(name);
  endfunction

  //generating stimulus
  task body();
    repeat(no_of_itr) begin
      req = axi_mst_seq_item #(32,32)::type_id::create("req");
      start_item(req);
      if(!req.randomize() with {opr == MRD_WR;})
        `uvm_error("mst_seq","FAILED")
      finish_item(req);
    end
  endtask
endclass

`endif
