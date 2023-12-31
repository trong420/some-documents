/*
    Code for use with the book
    "SystemVerilog Assertions Handbook, 2nd edition"ISBN  878-0-9705394-8-7

    Code is copyright of VhdlCohen Publishing & CVC Pvt Ltd., copyright 2009 

    www.systemverilog.us  ben@systemverilog.us
    www.cvcblr.com, info@cvcblr.com

    All code provided in this book and in the accompanied website is distributed
    with *ABSOLUTELY NO SUPPORT* and *NO WARRANTY* from the authors.  Neither
    the authors nor any supporting vendors shall be liable for damage in connection
    with, or arising out of, the furnishing, performance or use of the models
    provided in the book and website.
*/


interface sva_if (input clk);
   logic snoop, hit_modified, writeback, reset_n, go;
logic reset_cmd, trans_start;
logic enable,xfr,pending,req4,ack,acquire,id,hit,busy,req,sel5,packet,lastbit,first,cmd,size,gx_start;
logic dgrant,dbusy_n,dbus_enb,data_last,frame,grant,time_out,addr,aquired,write_en,write;
  clocking cb @(posedge clk);
 input snoop, hit_modified, writeback, reset_n, go;
input reset_cmd, trans_start;
input enable,xfr,pending,req4,ack,acquire,id,hit,busy,req,sel5,packet,lastbit,first,cmd,size,gx_start;
input dgrant,dbusy_n,dbus_enb,data_last,frame,grant,time_out,addr,aquired,write_en,write;
  endclocking : cb

endinterface : sva_if
import uvm_pkg::*;
  `include "uvm_macros.svh"

import vw_go2uvm_pkg::*;

class uvm_sva_test extends go2uvm_base_test;
  virtual sva_if vif;

  task reset ();
    `uvm_info(log_id, "Start of reset", UVM_MEDIUM)
    repeat(10) @ (vif.cb);
    `uvm_info(log_id, "End of reset", UVM_MEDIUM)
  endtask : reset

  task main();
        `uvm_info(log_id, "Start of Test", UVM_MEDIUM)
             @ (vif.cb);
      
    `uvm_info(log_id, "End of Test", UVM_MEDIUM)
    endtask : main

endclass : uvm_sva_test


module top;
    timeunit 1ns;   timeprecision 100ps;
    logic clk=0;
    initial forever #10 clk=!clk; 

    // Instantiate the Interface
   sva_if if_0 (.*);

    // Instantiate the DUT       
               dict dut (.clk(clk),
                    .snoop(if_0.snoop),
                    .reset_n(if_0.reset_n),
                    .hit_modified(if_0.hit_modified),
                    .writeback(if_0.writeback),
                    .go(if_0.go),
                    .reset_cmd(if_0.reset_cmd),
                    .trans_start(if_0.trans_start),
                    .enable(if_0.enable),
                    .xfr(if_0.xfr),
                    .ack(if_0.ack),

                    .acquire(if_0.acquire),
                    .id(if_0.id),
                    .hit(if_0.hit),
                    .busy(if_0.busy),
                    .req4(if_0.req4),
                    .req(if_0.req),
                    .sel5(if_0.sel5),

                    .packet(if_0.packet),
                    .lastbit(if_0.lastbit),
                    .size(if_0.size),
                    .gx_start(if_0.gx_start),
                    .first(if_0.first),
                    .cmd(if_0.cmd),
                    .dbusy_n(if_0.dbusy_n),
                    .dgrant(if_0.dgrant),

                     .dbus_enb(if_0.dbus_enb),
                    .data_last(if_0.data_last),
                    .frame(if_0.frame),
                    .grant(if_0.grant),
                    .time_out(if_0.time_out),
                    .addr(if_0.addr),
                    .write(if_0.write),
                    .write_en(if_0.write_en),
                     .aquired(if_0.aquired)






                                       );

   uvm_sva_test test_0;


    initial begin
      test_0 = new();
      test_0.vif = if_0;
      run_test();
    end
endmodule : top


