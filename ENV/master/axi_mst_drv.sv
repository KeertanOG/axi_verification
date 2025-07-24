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
      vif.mst_drv_cb.awvalid <= 1'b1;
      vif.mst_drv_cb.awid <= item.awid;
      vif.mst_drv_cb.awaddr <= item.awaddr;
      vif.mst_drv_cb.awlen <= item.awlen;
      vif.mst_drv_cb.awsize <= item.awsize;
      vif.mst_drv_cb.awburst <= item.awburst;
      while(vif.mst_drv_cb.awready == 1'b0) @(vif.mst_drv_cb);
      if(wr_addr_que.size() == 0) vif.mst_drv_cb.awvalid <= 1'b0;     //if transaction completes
    end
  endtask

  //task for write data phase
  task wr_data_chnl();
    axi_mst_seq_item item;
    forever begin
      wait(wr_data_que.size != 0);
      item = wr_data_que.pop_front();
      for(int i=0; i<item.awlen+1; i++) begin
        @(vif.mst_drv_cb);
        vif.mst_drv_cb.wvalid <= 1'b1;
        vif.mst_drv_cb.wid <= item.wid;
        vif.mst_drv_cb.wdata <= item.wdata[i];
        vif.mst_drv_cb.wstrb <= item.wstrb[i];
        if(i==item.awlen)
          vif.mst_drv_cb.wlast <= 1'b1;
        while(vif.mst_drv_cb.wready == 1'b0) @(vif.mst_drv_cb);
      end
      if(wr_data_que.size() == 0) vif.mst_drv_cb.wvalid <= 1'b0;
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
      vif.mst_drv_cb.arvalid <= 1'b1;
      vif.mst_drv_cb.arid <= item.arid;
      vif.mst_drv_cb.araddr <= item.araddr;
      vif.mst_drv_cb.arlen <= item.arlen;
      vif.mst_drv_cb.arsize <= item.arsize;
      vif.mst_drv_cb.arburst <= item.arburst;
      while(vif.mst_drv_cb.arready == 1'b0) @(vif.mas_drv_cb);
      if (rd_addr_que.size() == 0) vif.mst_drv_cb.arvalid <= 1'b0;
    end
  endtask

  //task for read data phase
  task rd_data_chnl();
  endtask

endclass

`endif
