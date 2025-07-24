`ifndef AXI_TEST_SANITY_SV
`define AXI_TEST_SANITY_SV

class axi_test_sanity extends axi_base_test;

  `uvm_component_utils(axi_test_sanity)

  axi_mst_sanity_seqs mst_seqs;
  axi_slv_sanity_seqs slv_seqs;

  function new(string name = "axi_test_sanity", uvm_component parent);
    super.new(name,parent);
  endfunction

  task run_phase(uvm_phase phase);
    phase.raise_objection(this,"sanity_test_started");
    fork
      begin
        mst_seqs = axi_mst_sanity_seqs::type_id::create("mst_seqs",this);
        void'(mst_seqs.randomize() with {no_of_itr == 10;});
        mst_seqs.start(env_h.mst_agt_h.mst_seqr_h);
      end
      begin
        slv_seqs = axi_slv_sanity_seqs::type_id::create("slv_seqs",this);
        void'(slv_seqs.randomize() with {no_of_itr == 10;});
        slv_seqs.start(env_h.slv_agt_h.slv_seqr_h);
      end
    join
    phase.drop_objection(this," sanity_test_started");
  endtask

endclass

`endif
