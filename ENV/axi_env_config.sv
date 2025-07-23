`ifndef AXI_ENV_CONFIG_SV
`define AXI_ENV_CONFIG_SV

class axi_env_config extends uvm_object;

  `uvm_object_utils(axi_env_config)

  //config class handles
  axi_mst_agt_config mst_agt_cfg;       //master config class
  axi_slv_agt_config slv_agt_cfg;       //master config class

  //switches
  int has_mst_agt = 1;        //switch for master agent
  int has_slv_agt = 1;        //switch for master agent
  int has_scb = 1;            //switch for scoreboard

  function new(string name = "axi_env_config");
    super.new(name);
  endfunction

endclass
`endif
