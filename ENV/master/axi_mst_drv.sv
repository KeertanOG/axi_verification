`ifndef AXI_MST_DRV_SV
`define AXI_MST_DRV_SV

class axi_mst_drv extends uvm_driver #(axi_mst_seq_item);

  `uvm_component_utils(axi_mst_drv)

  //virtual interface
  virtual axi_mst_inf vif;

  //differen phases for different channels
  axi_mst_seq_item wr_addr_que[$];        //write address phase
  axi_mst_seq_item wr_data_que[$];        //write data phase
  axi_mst_seq_item wr_resp_que[$];        //write response phase
  axi_mst_seq_item rd_addr_que[$];        //read address phase
  axi_mst_seq_item rd_data_que[$];        //read data phase

  function new(string name = "axi_mst_drv", uvm_component parent);
    super.new(name, parent);
  endfunction

  task run_phase(uvm_phase phase);
    //waiting for initial reset
    vif.wait_reset_assert();                //waiting for initial reset assertion
    vif.wait_reset_release();               //waiting for initial reset release

    //initiating all the channels
    fork
      wr_addr_chnl();
      wr_data_chnl();
//      wr_resp_chnl();
      rd_addr_chnl();
      rd_data_chnl();
    join_none

    forever begin
      seq_item_port.get(req);

      //for read and simultaneous read write operation
      if(req.opr == MREAD || req.opr == MRD_WR) begin
        rd_addr_que.push_back(req);
        rd_data_que.push_back(req);
      end

      //for write and simulataneous read write operation
      if(req.opr == MWRITE || req.opr == MRD_WR) begin
        wr_addr_que.push_back(req);
        wr_data_que.push_back(req);
        wr_resp_que.push_back(req);
      end

      $cast(rsp,req.clone());
//      rsp.set_id_info(req);
    end
  endtask
  
  //task for write address channel
  task wr_addr_chnl();
    axi_mst_seq_item item;
    forever begin
      wait(wr_addr_que.size != 0);
      item = wr_addr_que.pop_front();
      @(vif.mst_drv_cb);
      vif.awvalid <= 1'b1;
      vif.awid <= item.awid;
      vif.awaddr <= item.awaddr;
      vif.awlen <= item.awlen;
      vif.awsize <= item.awsize;
      vif.awburst <= item.awburst;
      while(vif.awready == 1'b0) @(vif.mst_drv_cb);
      if(wr_addr_que.size() == 0) vif.awvalid <= 1'b0;     //if transaction completes
    end
  endtask

  //task for write data phase
  task wr_data_chnl();
    axi_mst_seq_item item;
    forever begin
      wait(wr_data_que.size != 0);
      item = wr_data_que.pop_front();
      for(int i=0; i<=item.awlen; i++) begin
        @(vif.mst_drv_cb);
        vif.wvalid <= 1'b1;
        vif.wid <= item.wid;
        vif.wdata <= item.wdata[i];
        vif.wstrb <= item.wstrb[i];
        $display("i",i);
        $display("awlen",item.awlen);
        if(i==item.awlen)
          vif.wlast <= 1'b1;
        else vif.wlast <= 1'b0;
        while(vif.wready == 1'b0) @(vif.mst_drv_cb);
      end
      if(wr_data_que.size() == 0) vif.wvalid <= 1'b0;
    end
  endtask

  //task for write response phase
//  task wr_resp_chnl();
//  endtask

  //task for read address phase
  task rd_addr_chnl();
    axi_mst_seq_item item;
    forever begin
      wait(rd_addr_que.size != 0);
      item = rd_addr_que.pop_front();
      @(vif.mst_drv_cb);
      vif.arvalid <= 1'b1;
      vif.arid <= item.arid;
      vif.araddr <= item.araddr;
      vif.arlen <= item.arlen;
      vif.arsize <= item.arsize;
      vif.arburst <= item.arburst;
      while(vif.arready == 1'b0) @(vif.mst_drv_cb);
      if (rd_addr_que.size() == 0) vif.arvalid <= 1'b0;
    end
  endtask

  //task for read data phase
  task rd_data_chnl();
  endtask

endclass

`endif
