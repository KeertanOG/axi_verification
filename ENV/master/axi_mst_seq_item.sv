`ifndef AXI_MST_SEQ_ITEM_SV
`define AXI_MST_SEQ_ITEM_SV

class axi_mst_seq_item #(int MST_ADDR_WIDTH=32, MST_DATA_WIDTH=32) extends uvm_sequence_item;

  //write address channel signals
  rand bit [3:0]awid;
  rand bit [MST_ADDR_WIDTH-1:0]awaddr;
  rand bit [7:0]awlen;
  rand bit [2:0]awsize;
  rand bit [1:0]awburst;
//  bit awvalid;
//  bit awready;

  //write data channel signals
  rand bit [3:0]wid;
  rand bit [MST_DATA_WIDTH-1:0]wdata[$];
  rand bit [MST_DATA_WIDTH/8:0]wstrb[$];
//  bit wlast;
//  bit wvalid;
//  bit wready;

  //write response channel signals
  bit [3:0]bid;
  bit [1:0]bresp;
//  bit bvalid;
//  bit bready;

  //read address channel signals
  rand bit [3:0]arid;
  rand bit [MST_ADDR_WIDTH-1:0]araddr;
  rand bit [7:0]arlen;
  rand bit [2:0]arsize;
  rand bit [1:0]arburst;
//  bit arvalid;
//  bit arready;
  
  //read data channel signals
  bit [3:0]rid;
  bit [MST_DATA_WIDTH-1:0]rdata[$];
  bit [1:0]rresp[$];
//  bit rlast;
//  bit rvalid;
//  bit rready;

  `uvm_object_utils_begin(axi_mst_seq_item)
    `uvm_field_int(awid, UVM_ALL_ON | UVM_DEC)
    `uvm_field_int(awaddr, UVM_ALL_ON | UVM_HEX)
    `uvm_field_int(awlen, UVM_ALL_ON | UVM_DEC)
    `uvm_field_int(awsize, UVM_ALL_ON | UVM_DEC)
    `uvm_field_int(awburst, UVM_ALL_ON | UVM_DEC)
//    `uvm_field_int(awvalid, UVM_ALL_ON | UVM_DEC)
//    `uvm_field_int(awready, UVM_ALL_ON | UVM_DEC)
    `uvm_field_int(wid, UVM_ALL_ON | UVM_DEC)
    `uvm_field_queue_int(wdata, UVM_ALL_ON | UVM_HEX)
    `uvm_field_queue_int(wstrb, UVM_ALL_ON | UVM_HEX)
//    `uvm_field_int(wlast, UVM_ALL_ON | UVM_DEC)
//    `uvm_field_int(wvalid, UVM_ALL_ON | UVM_DEC)
//    `uvm_field_int(wready, UVM_ALL_ON | UVM_DEC)
    `uvm_field_int(bid, UVM_ALL_ON | UVM_DEC)
    `uvm_field_int(bresp, UVM_ALL_ON | UVM_DEC)
//    `uvm_field_int(bvalid, UVM_ALL_ON | UVM_DEC)
//    `uvm_field_int(bready, UVM_ALL_ON | UVM_DEC)
    `uvm_field_int(arid, UVM_ALL_ON | UVM_DEC)
    `uvm_field_int(araddr, UVM_ALL_ON | UVM_HEX)
    `uvm_field_int(arlen, UVM_ALL_ON | UVM_DEC)
    `uvm_field_int(arsize, UVM_ALL_ON | UVM_DEC)
    `uvm_field_int(arburst, UVM_ALL_ON | UVM_DEC)
//    `uvm_field_int(arvalid, UVM_ALL_ON | UVM_DEC)
//    `uvm_field_int(arready, UVM_ALL_ON | UVM_DEC)
    `uvm_field_int(rid, UVM_ALL_ON | UVM_DEC)
    `uvm_field_queue_int(rdata, UVM_ALL_ON | UVM_HEX)
    `uvm_field_queue_int(rresp, UVM_ALL_ON | UVM_DEC)
//    `uvm_field_int(rlast, UVM_ALL_ON | UVM_DEC)
//    `uvm_field_int(rvalid, UVM_ALL_ON | UVM_DEC)
//    `uvm_field_int(rready, UVM_ALL_ON | UVM_DEC)
  `uvm_object_utils_end

  function new(string name = "axi_mst_seq_item");
    super.new(name);
  endfunction

endclass

`endif
