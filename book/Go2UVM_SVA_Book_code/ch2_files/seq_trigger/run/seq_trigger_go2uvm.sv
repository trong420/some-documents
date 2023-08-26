/********************************************
* VerifWorks Go2UVM App: VW_DVC_Go2UVM
* Automatically generated by VerifWorks's DVC_Go2UVM Riviera Apps 
* Thanks for using VerifWorks products
* Visit http://www.verifworks.com for more 
* Generated on   : 2016-06-04 15:07:58
********************************************/ 



// Generating SystemVerilog interface for module: seq_trigger
// ---------------------------------------------------------
interface seq_trigger_if ();
  logic  [0:0] clk;
  logic  [0:0] done;
  logic  [0:0] load_mem;
  logic  [0:0] ready;
  // End of interface signals 


  // Start of clocking block definition 
  clocking cb @(posedge clk);
    output clk;
    output done;
    output load_mem;
    input ready;
  endclocking : cb
  // End of clocking block definition 

endinterface : seq_trigger_if
// Automatically generated from VerifWorks's DVCreate-Go2UVM product
// Thanks for using VerifWorks products, see http://www.verifworks.com for more

import uvm_pkg::*;
`include uvm_macros.svh
// Import Go2UVM Package
import vw_go2uvm_pkg::*;
// Use the base class provided by the vw_go2uvm_pkg
class seq_trigger_test extends go2uvm_base_test;
  // Create a handle to the actual interface
  virtual seq_trigger_if vif;
  task reset;
    `uvm_info (log_id, "Start of reset", UVM_MEDIUM)
    `uvm_info (log_id, "Fill in your reset logic here ", UVM_MEDIUM)
    // this.vif.cb.rst_n <= 1'b0;
    // repeat (5) @ (this.vif.cb);
    // this.vif.cb.rst_n <= 1'b1;
    // repeat (1) @ (this.vif.cb);
    `uvm_info (log_id, "End of reset", UVM_MEDIUM)
  endtask : reset
  task main ();
    `uvm_info (log_id, "Start of main", UVM_MEDIUM)
    `uvm_info (log_id, "Fill in your main logic here ", UVM_MEDIUM)
    // this.vif.cb.inp_1 <= 1'b0;
    // this.vif.cb.inp_2 <= 22;
    // repeat (5) @ (this.vif.cb);
    `uvm_info (log_id, "End of main", UVM_MEDIUM)
  endtask : main
endclass : seq_trigger_test

module seq_trigger_go2uvm;
  timeunit 1ns;
  timeprecision 1ns;
  parameter VW_CLK_PERIOD = 10;

  // Simple clock generator
  bit `VW_CLK ;
  always # (VW_CLK_PERIOD/2) `VW_CLK <= ~`VW_CLK;

  // Interface instance
  seq_trigger_if seq_trigger_if_0 (.*);

  // Connect TB clk to Interface instance clk

  // DUT instance
  seq_trigger seq_trigger_0 ();


  // Using VW_Go2UVM
  seq_trigger_test seq_trigger_test_0;
  initial begin : go2uvm_test
    seq_trigger_test_0 = new ();
    // Connect virtual interface to physical interface
    seq_trigger_test_0.vif = seq_trigger_if_0;
    // Kick start standard UVM phasing
    run_test ();
  end : go2uvm_test
endmodule : seq_trigger_go2uvm

