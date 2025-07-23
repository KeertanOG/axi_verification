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

    //initiating all the channels
    forever begin
      fork
        wr_addr_chnl();
        wr_data_chnl();
        wr_resp_chnl();
        rd_addr_chnl();
        rd_data_chnl();
      join_none

      seq_item_port.get(req);

      //for read and simultaneous read write operation
      if(opr_en == READ || opr_en == RD_WR) begin
        rd_addr_que.push_back(req);
        rd_data_que.push_back(req);
      end

      //for write and simulataneous read write operation
      if(opr_en == WRITE || opr_en == RD_WR) begin
        wr_addr_que.push_back(req);
        wr_data_que.push_back(req);
      end

      $cast(rsp,req.clone());
      rsp.set_id_info(req);
    end
  endtask
  
  //task for write address phase
  task wr_addr_chnl();
//    @(vif.mst_drv_cb);
//    vif.awid <= req.awid;
//    vif.awlen <= req.awlen;
//    vif.awsize <= req.awsize;
//    vif.awburst <= req.awburst;
  endtask

  //task for write data phase
  task wr_data_chnl();
    //@(vif.)
  endtask

  //task for write response phase
  task wr_resp_chnl();
  endtask

  //task for read address phase
  task rd_addr_chnl();
  endtask

  //task for read data phase
  task rd_data_chnl();
  endtask

endclass

`endif
