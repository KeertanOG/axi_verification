`ifndef AXI_MST_INF_SV
`define AXI_MST_INF_SV

interface axi_mst_inf(input aclk);
  
  logic aresetn;

  //write address channel signals
  logic [3:0]awid;                  //write address id
  logic [`MST_ADDR_WIDTH-1:0]awaddr;               //write address
  logic [7:0]awlen;                 //write burst length
  logic [2:0]awsize;                //write burst size
  logic [1:0]awburst;               //write burst type
  logic awvalid;                    //write address valid
  logic awready;                    //write address ready

  //write data channel signals
  logic [3:0]wid;                   //write data id
  logic [`MST_DATA_WIDTH-1:0]wdata;                //write data
  logic [`MST_DATA_WIDTH/8:0]wstrb;                 //write strobes
  logic wlast;                      //write last 
  logic wvalid;                     //write data valid
  logic wready;                     //write data ready

  //write response channel signals
  logic [3:0]bid;                   //write response id
  logic [1:0]bresp;                 //write response
  logic bvalid;                     //write response valid
  logic bready;                     //write response ready

  //read address channel signals
  logic [3:0]arid;                  //read address id
  logic [`MST_ADDR_WIDTH-1:0]araddr;               //read address
  logic [7:0]arlen;                 //read burst length
  logic [2:0]arsize;                //read burst size
  logic [1:0]arburst;               //read burst type
  logic arvalid;                    //read address valid
  logic arready;                    //read address ready
  
  //read data channel signals
  logic [3:0]rid;                   //read data id
  logic [`MST_DATA_WIDTH-1:0]rdata;                //read data
  logic [1:0]rresp;                 //read response
  logic rlast;                      //read last
  logic rvalid;                     //read valid
  logic rready;                     //read ready

  //clocking block for slave driver
  clocking mst_drv_cb @(posedge aclk);
    default input #1 output #1;

    input aresetn, awid, awaddr, awlen, awsize, awburst, awvalid, wid, wdata, wstrb, wlast, wvalid,bready, arid, araddr, arlen, arsize, arburst, arvalid, rready;

    output awready, wready, bid, bresp, bvalid, arready, rid, rdata, rresp, rlast, rvalid;

  endclocking

  //clocking block for slave monitor
  clocking mst_mon_cb @(posedge aclk);
    default input #1 output #1;

    input aresetn, awid, awaddr, awlen, awsize, awburst, awvalid, wid, wdata, wstrb, wlast, wvalid,bready, arid, araddr, arlen, arsize, arburst, arvalid, rready;
    input awready, wready, bid, bresp, bvalid, arready, rid, rdata, rresp, rlast, rvalid;

  endclocking

  modport MST_DRV_MP (clocking mst_drv_cb, input aclk);
  modport MST_MON_MP (clocking mst_mon_cb, input aclk);

endinterface

`endif
