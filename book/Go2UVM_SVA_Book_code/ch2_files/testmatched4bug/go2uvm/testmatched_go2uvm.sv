/********************************************
* VerifWorks Go2UVM App: VW_DVC_Go2UVM
* Automatically generated by VerifWorks's DVC_Go2UVM Riviera Apps 
* Thanks for using VerifWorks products
* Visit http://www.verifworks.com for more 
* Generated on   : 2016-06-04 15:21:16
********************************************/ 



// Generating SystemVerilog interface for module: testmatched
// ---------------------------------------------------------
interface testmatched_if (input logic clk,a_clk,a_sysclk,b_sysclk,d_clk,sysclk);
  logic  [0:0] c;
  logic  [0:0] rst_n;
  // End of interface signals 


  // Start of clocking block definition 
  clocking cb @(posedge clk or posedge a_clk or posedge a_sysclk or posedge b_sysclk or posedge d_clk or posedge sysclk);
    output a_clk;
    output a_sysclk;
    output b_sysclk;
    output c;
    output d_clk;
    output sysclk;
		output rst_n;
  endclocking : cb
  // End of clocking block definition 

endinterface : testmatched_if
// Automatically generated from VerifWorks's DVCreate-Go2UVM product
// Thanks for using VerifWorks products, see http://www.verifworks.com for more

import uvm_pkg::*;
`include "uvm_macros.svh"
// Import Go2UVM Package
import vw_go2uvm_pkg::*;
// Use the base class provided by the vw_go2uvm_pkg
class testmatched_test extends go2uvm_base_test;
  // Create a handle to the actual interface
  virtual testmatched_if vif;
  task reset();
    `uvm_info (log_id, "Start of reset", UVM_MEDIUM)
    `uvm_info (log_id, "Fill in your reset logic here ", UVM_MEDIUM)
    this.vif.cb.rst_n <= 1'b0;
    repeat (5) @ (this.vif.cb);
    this.vif.cb.rst_n <= 1'b1;
    repeat (1) @ (this.vif.cb);
    `uvm_info (log_id, "End of reset", UVM_MEDIUM)
  endtask : reset
  task main ();
    `uvm_info (log_id, "Start of main", UVM_MEDIUM)
    `uvm_info (log_id, "Fill in your main logic here ", UVM_MEDIUM)
   
		
		
		`uvm_info (log_id, "End of main", UVM_MEDIUM)
  endtask : main
endclass : testmatched_test

module testmatched_go2uvm;
  timeunit 1ns;
  timeprecision 1ns;
  parameter VW_CLK_PERIOD = 10;

  // Simple clock generator
  bit clk,a_clk,a_sysclk,b_sysclk,d_clk,sysclk ;
  always # (VW_CLK_PERIOD/2) clk <= ~clk;
  always # (VW_CLK_PERIOD/2) a_clk <= ~a_clk;
  always # (VW_CLK_PERIOD/2) a_sysclk <= ~a_sysclk;
  always # (VW_CLK_PERIOD/2) b_sysclk <= ~b_sysclk;
  always # (VW_CLK_PERIOD/2) d_clk <= ~d_clk;
	always # (VW_CLK_PERIOD/2) sysclk <= ~sysclk;


  // Interface instance
  testmatched_if testmatched_if_0 (.*);

  // Connect TB clk to Interface instance clk

  // DUT instance
  testmatched testmatched_0 (.clk(clk),
														.a_clk(a_clk),
														.a_sysclk(a_sysclk),
														.b_sysclk(b_sysclk),
														.c(testmatched_if_0.c),
														.d_clk(d_clk),
														.sysclk(sysclk),
														.rst_n(testmatched_if_0.rst_n));


  // Using VW_Go2UVM
  testmatched_test testmatched_test_0;
  initial begin : go2uvm_test
    testmatched_test_0 = new ();
    // Connect virtual interface to physical interface
    testmatched_test_0.vif = testmatched_if_0;
    // Kick start standard UVM phasing
    run_test ();
  end : go2uvm_test
endmodule : testmatched_go2uvm
