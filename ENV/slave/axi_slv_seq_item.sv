`ifndef AXI_SLV_SLV_SEQ_ITEM_SV
`define AXI_SLV_SLV_SEQ_ITEM_SV

class axi_slv_seq_item #(int SLV_ADDR_WIDTH = 32, SLV_DATA_WIDTH = 32) extends uvm_sequence_item;

  //write address channel signals
  bit [3:0]awid;
  bit [SLV_ADDR_WIDTH-1:0]awaddr;
  bit [7:0]awlen;
  bit [2:0]awsize;
  bit [1:0]awburst;
  bit awvalid;
  bit awready = 1;

  //write data channel signals
  bit [2:0]wid;
  bit [SLV_DATA_WIDTH-1:0]wdata[$];
  bit [SLV_DATA_WIDTH/8:0]wstrb[$];
  rand bit wlast;
  bit wvalid;
  bit wready = 1;

  //write response channel signals
  bit [3:0]bid;
  bit [1:0]bresp;
  bit bvalid;
  bit bready;

  //read address channel signals
  bit [3:0]arid;
  bit [SLV_ADDR_WIDTH-1:0]araddr;
  bit [7:0]arlen;
  bit [2:0]arsize;
  bit [1:0]arburst;
  bit arvalid;
  bit arready;
  
  //read data channel signals
  rand bit [3:0]rid;
  rand bit [SLV_DATA_WIDTH-1:0]rdata[$];
  bit [1:0]rresp[$];
  bit rlast;
  bit rvalid;
  bit rready;

  //instantiation of enum for type of operation
  rand sopr_en opr;

  `uvm_object_utils_begin(axi_slv_seq_item)
    `uvm_field_int(awid, UVM_ALL_ON | UVM_DEC)
    `uvm_field_int(awaddr, UVM_ALL_ON | UVM_HEX)
    `uvm_field_int(awlen, UVM_ALL_ON | UVM_DEC)
    `uvm_field_int(awsize, UVM_ALL_ON | UVM_DEC)
    `uvm_field_int(awburst, UVM_ALL_ON | UVM_DEC)
    `uvm_field_int(awvalid, UVM_ALL_ON | UVM_DEC)
    `uvm_field_int(awready, UVM_ALL_ON | UVM_DEC)
    `uvm_field_int(wid, UVM_ALL_ON | UVM_DEC)
    `uvm_field_queue_int(wdata, UVM_ALL_ON | UVM_HEX)
    `uvm_field_queue_int(wstrb, UVM_ALL_ON | UVM_HEX)
    `uvm_field_int(wlast, UVM_ALL_ON | UVM_DEC)
    `uvm_field_int(wvalid, UVM_ALL_ON | UVM_DEC)
    `uvm_field_int(wready, UVM_ALL_ON | UVM_DEC)
    `uvm_field_int(bid, UVM_ALL_ON | UVM_DEC)
    `uvm_field_int(bresp, UVM_ALL_ON | UVM_DEC)
    `uvm_field_int(bvalid, UVM_ALL_ON | UVM_DEC)
    `uvm_field_int(bready, UVM_ALL_ON | UVM_DEC)
    `uvm_field_int(arid, UVM_ALL_ON | UVM_DEC)
    `uvm_field_int(araddr, UVM_ALL_ON | UVM_HEX)
    `uvm_field_int(arlen, UVM_ALL_ON | UVM_DEC)
    `uvm_field_int(arsize, UVM_ALL_ON | UVM_DEC)
    `uvm_field_int(arburst, UVM_ALL_ON | UVM_DEC)
    `uvm_field_int(arvalid, UVM_ALL_ON | UVM_DEC)
    `uvm_field_int(arready, UVM_ALL_ON | UVM_DEC)
    `uvm_field_int(rid, UVM_ALL_ON | UVM_DEC)
    `uvm_field_queue_int(rdata, UVM_ALL_ON | UVM_HEX)
    `uvm_field_queue_int(rresp, UVM_ALL_ON | UVM_DEC)
    `uvm_field_int(rlast, UVM_ALL_ON | UVM_DEC)
    `uvm_field_int(rvalid, UVM_ALL_ON | UVM_DEC)
    `uvm_field_int(rready, UVM_ALL_ON | UVM_DEC)
  `uvm_object_utils_end

  function new(string name = "axi_slv_seq_item");
    super.new(name);
  endfunction

endclass

`endif
