/********************************************
* VerifWorks Go2UVM App: VW_DVC_Go2UVM
* Automatically generated by VerifWorks's DVC_Go2UVM Riviera Apps 
* Thanks for using VerifWorks products
* Visit http://www.verifworks.com for more 
* Generated on   : 2016-05-27 14:01:08
********************************************/ 



// Generating SystemVerilog interface for module: cover_va
// ---------------------------------------------------------
interface cover_va_if ();
  logic  [0:0] a;
  logic  [0:0] b;
  logic  [0:0] c;
  logic  [0:0] clk;
  // End of interface signals 


  // Start of clocking block definition 
  clocking cb @(posedge clk);
    output a;
    output b;
    output c;
    output clk;
  endclocking : cb
  // End of clocking block definition 

endinterface : cover_va_if
// Automatically generated from VerifWorks's DVCreate-Go2UVM product
// Thanks for using VerifWorks products, see http://www.verifworks.com for more

import uvm_pkg::*;
`include uvm_macros.svh
// Import Go2UVM Package
import vw_go2uvm_pkg::*;
// Use the base class provided by the vw_go2uvm_pkg
class cover_va_test extends go2uvm_base_test;
  // Create a handle to the actual interface
  virtual cover_va_if vif;
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
endclass : cover_va_test

module cover_va_go2uvm;
  timeunit 1ns;
  timeprecision 1ns;
  parameter VW_CLK_PERIOD = 10;

  // Simple clock generator
  bit `VW_CLK ;
  always # (VW_CLK_PERIOD/2) `VW_CLK <= ~`VW_CLK;

  // Interface instance
  cover_va_if cover_va_if_0 (.*);

  // Connect TB clk to Interface instance clk

  // DUT instance
  cover_va cover_va_0 ();


  // Using VW_Go2UVM
  cover_va_test cover_va_test_0;
  initial begin : go2uvm_test
    cover_va_test_0 = new ();
    // Connect virtual interface to physical interface
    cover_va_test_0.vif = cover_va_if_0;
    // Kick start standard UVM phasing
    run_test ();
  end : go2uvm_test
endmodule : cover_va_go2uvm

