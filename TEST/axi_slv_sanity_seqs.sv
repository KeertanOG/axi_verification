`ifndef AXI_SLV_SANITY_SEQS_SV 
`define AXI_MST_SANITY_SEQS_SV

class axi_slv_sanity_seqs extends axi_slv_seqs;

  `uvm_object_utils(axi_slv_sanity_seqs)

  function new(string name = "axi_slv_sanity_seqs");
    super.new(name);
  endfunction

  //generating stimulus
  task body();
    repeat(no_of_itr) begin
      req = axi_slv_seq_item #(32,32)::type_id::create("req");
      start_item(req);
      if(!req.randomize() with {})
        `uvm_error("slv_seq","FAILED")
      finish_item(req);
    end
  endtask
endclass

`endif
