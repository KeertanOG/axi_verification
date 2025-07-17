`ifndef AXI_BASE_TEST_SV
`define AXI_BASE_TEST_SV

class axi_base_test extends uvm_test;

  `uvm_component_utils(axi_base_test)
  axi_env env_h;
  axi_slv_seqs s_seqs_h;
  axi_mst_seqs m_seqs_h;

  function new(string name="axi_base_test",uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env_h = axi_env::type_id::create("env_h",this);
    s_seqs_h = axi_slv_seqs::type_id::create("s_seqs_h",this);
    m_seqs_h = axi_mst_seqs::type_id::create("m_seqs_h",this);

  endfunction

  function void end_of_elaboration_phase(uvm_phase phase);
    uvm_top.print_topology();
  endfunction

  function void report_phase(uvm_phase phase);
    uvm_report_server server_h;
    int err_count, fatal_count;

    server_h = uvm_report_server::get_server();

    err_count = server_h.get_severity_count(UVM_ERROR);
    fatal_count = server_h.get_severity_count(UVM_FATAL);

    $display("error count is: %0d",err_count);
    $display("fatal count is: %0d",fatal_count);
    if(err_count==0 && fatal_count==0) begin
      $display("========= ========= ========= =========");
      $display("=       = =       = =         =        ");
      $display("=       = =       = =         =        ");
      $display("=       = =       = =         =        ");
      $display("========= ========= ========= =========");
      $display("=         =       =         =         =");
      $display("=         =       =         =         =");
      $display("=         =       =         =         =");
      $display("=         =       =         =         =");
      $display("=         =       = ========= =========");
    end
    else begin
      $display("========= ========= ========= =      ");
      $display("=         =       =     =     =      ");
      $display("=         =       =     =     =      ");
      $display("=         =       =     =     =      ");
      $display("=         =       =     =     =      ");
      $display("========= =========     =     =      ");
      $display("=         =       =     =     =      ");
      $display("=         =       =     =     =      ");
      $display("=         =       =     =     =      ");
      $display("=         =       =     =     =      ");
      $display("=         =       = ========= =======");
    end
  endfunction
endclass

`endif
