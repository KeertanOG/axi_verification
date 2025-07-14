`ifndef AXI_ENV_CONFIG_SV
`define AXI_ENV_CONFIG_SV

class axi_env_config extends uvm_object;

  `uvm_object_utils(axi_env_config)

  function new(string name = "axi_env_config");
    super.new(name);
  endfunction

endclass
`endif
