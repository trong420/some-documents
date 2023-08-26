/********************************************
* VerifWorks Go2UVM App: VW_DVC_Go2UVM
* Automatically generated by VerifWorks's DVC_Go2UVM Riviera Apps 
* Thanks for using VerifWorks products
* Visit http://www.verifworks.com for more 
* Generated on   : 2016-06-04 15:02:31
********************************************/ 



// Generating SystemVerilog interface for module: seq_or
// ---------------------------------------------------------
interface seq_or_if (input logic clk);
  logic  [0:0] a;
 // logic : Signed Bit [31:0] b;
  logic  [0:0] c;
  logic  [0:0] reset_n;
//  logic : Signed Bit [31:0] d;
//  logic : Signed Bit [31:0] e;
  // End of interface signals 


  // Start of clocking block definition 
  clocking cb @(posedge clk);
    output a;
  //  output b;
    output c;
    output reset_n;
  //  output d;
  //  output e;
  endclocking : cb
  // End of clocking block definition 

endinterface : seq_or_if
// Automatically generated from VerifWorks's DVCreate-Go2UVM product
// Thanks for using VerifWorks products, see http://www.verifworks.com for more

import uvm_pkg::*;
`include "uvm_macros.svh"
// Import Go2UVM Package
import vw_go2uvm_pkg::*;
// Use the base class provided by the vw_go2uvm_pkg
class seq_or_test extends go2uvm_base_test;
  // Create a handle to the actual interface
  virtual seq_or_if vif;
  task reset;
    `uvm_info (log_id, "Start of reset", UVM_MEDIUM)
   // `uvm_info (log_id, "Fill in your reset logic here ", UVM_MEDIUM)
     this.vif.cb.reset_n <= 1'b0;
     repeat (5) @ (this.vif.cb);
     this.vif.cb.reset_n <= 1'b1;
     repeat (1) @ (this.vif.cb);
    `uvm_info (log_id, "End of reset", UVM_MEDIUM)
  endtask : reset
  task main ();
    `uvm_info (log_id, "Start of main", UVM_MEDIUM)
   // `uvm_info (log_id, "Fill in your main logic here ", UVM_MEDIUM)

	@(vif.cb);
	  begin
	    @(vif.cb);
		vif.cb.a <= 1'b1;
		vif.cb.c <= 1'b1;
	    @(vif.cb);
	    @(vif.cb);
	    @(vif.cb);
	    @(vif.cb);
	    @(vif.cb);
	    @(vif.cb);

		vif.cb.a <= 1'b0;
		vif.cb.c <= 1'b0;
	 end
#250 $finish;


    `uvm_info (log_id, "End of main", UVM_MEDIUM)
  endtask : main
endclass : seq_or_test

module seq_or_go2uvm;
  timeunit 1ns;
  timeprecision 1ns;
  parameter VW_CLK_PERIOD = 10;

  // Simplclock generator
  bit clk ;
  always # (VW_CLK_PERIOD/2) clk <= ~clk;

  // Interface instance
  seq_or_if seq_or_if_0 (.*);

  // Connect TB clk to Interface instance clk

  // DUT instance
  seq_or seq_or_0 (.clk(clk),
                    .a(seq_or_if_0.a),
                    .c(seq_or_if_0.c),
                    .reset_n(seq_or_if_0.reset_n)                    
           );


  // Using VW_Go2UVM
  seq_or_test seq_or_test_0;
  initial begin : go2uvm_test
    seq_or_test_0 = new ();
    // Connect virtual interface to physical interface
    seq_or_test_0.vif = seq_or_if_0;
    // Kick start standard UVM phasing
    run_test ();
  end : go2uvm_test
endmodule : seq_or_go2uvm
