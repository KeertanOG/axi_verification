`ifndef AXI_BASE_TEST_SV
`define AXI_BASE_TEST_SV

class axi_base_test extends uvm_test;

  `uvm_component_utils(axi_base_test)

  //handles for config classes
  axi_mst_agt_config mst_agt_cfg;     //master agent config
  axi_slv_agt_config slv_agt_cfg;     //slave agent config
  axi_env_config env_cfg;             //env config

  //env class handle
  axi_env env_h;

  function new(string name="axi_base_test",uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    mst_agt_cfg = axi_mst_agt_config::type_id::create("mst_agt_cfg");
    slv_agt_cfg = axi_slv_agt_config::type_id::create("slv_agt_cfg");
    env_cfg = axi_env_config::type_id::create("env_cfg",this);

    //getting virtual master interface
    if(!uvm_config_db #(virtual axi_mst_inf)::get(this,"","m_vif",mst_agt_cfg.vif))
      `uvm_fatal("axi_mst_agent","interface config_db error")

    //getting virtual slave interface
    if(!uvm_config_db #(virtual axi_slv_inf)::get(this,"","s_vif",slv_agt_cfg.vif))
      `uvm_fatal("axi_slv_agent","interface config_db error")

    env_cfg.mst_agt_cfg = mst_agt_cfg;
    env_cfg.slv_agt_cfg = slv_agt_cfg;

    //set of env config handle
    uvm_config_db #(axi_env_config)::set(this,"env_h*","env_cfg",env_cfg);
    env_h = axi_env::type_id::create("env_h",this);

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
