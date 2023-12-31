/********************************************
* VerifWorks Go2UVM App: VW_DVC_Go2UVM
* Automatically generated by VerifWorks's DVC_Go2UVM Riviera Apps 
* Thanks for using VerifWorks products
* Visit http://www.verifworks.com for more 
* Generated on   : 2016-06-04 15:13:26
********************************************/ 



// Generating SystemVerilog interface for module: seq_untyped
// ---------------------------------------------------------
interface seq_untyped_if (input logic clk);
  logic  [0:0] a;
  logic  [7:0] a8;
  logic  [0:0] b;
  logic  [0:0] c;
  logic  [0:0] reset_n;
  logic  [0:0] d;
  logic  [7:0] d8;
  logic  [0:0] e;
  logic  [0:0] f;
 // logic : Signed Bit [31:0] i;
 // logic : Signed Bit [31:0] j;
  // End of interface signals 


  // Start of clocking block definition 
  clocking cb @(posedge clk);
    output a;
    output a8;
    output b;
    output c;
    output reset_n;
    output d;
    output d8;
    output e;
    output f;
   // output i;
   // output j;
  endclocking : cb
  // End of clocking block definition 

endinterface : seq_untyped_if
// Automatically generated from VerifWorks's DVCreate-Go2UVM product
// Thanks for using VerifWorks products, see http://www.verifworks.com for more

import uvm_pkg::*;
`include "uvm_macros.svh"
// Import Go2UVM Package
import vw_go2uvm_pkg::*;
// Use the base class provided by the vw_go2uvm_pkg
class seq_untyped_test extends go2uvm_base_test;
  // Create a handle to the actual interface
  virtual seq_untyped_if vif;
  task reset;
    `uvm_info (log_id, "Start of reset", UVM_MEDIUM)
    //`uvm_info (log_id, "Fill in your reset logic here ", UVM_MEDIUM)
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
		  vif.cb.b <= 1'b1;
		  vif.cb.c <= 1'b1;
		  vif.cb.d <= 1'b1;
		  vif.cb.e <= 1'b1;
		  vif.cb.f <= 1'b1;
		  vif.cb.a8 <= 1'b1;
		  vif.cb.d8 <= 1'b1;
		@(vif.cb);
		@(vif.cb);
		@(vif.cb);
		@(vif.cb);
		@(vif.cb);
		@(vif.cb);
		  vif.cb.a <= 1'b0;
		  vif.cb.b <= 1'b0;
		  vif.cb.c <= 1'b0;
		  vif.cb.d <= 1'b0;
		  vif.cb.e <= 1'b0;
		  vif.cb.f <= 1'b0;
		  vif.cb.a8 <= 1'b0;
		  vif.cb.d8 <= 1'b0;
	end
#300 $finish;

    // this.vif.cb.inp_1 <= 1'b0;
    // this.vif.cb.inp_2 <= 22;
    // repeat (5) @ (this.vif.cb);
    `uvm_info (log_id, "End of main", UVM_MEDIUM)
  endtask : main
endclass : seq_untyped_test

module seq_untyped_go2uvm;
  timeunit 1ns;
  timeprecision 1ns;
  parameter VW_CLK_PERIOD = 10;

  // Simple clock generator
  bit clk ;
  always # (VW_CLK_PERIOD/2) clk <= ~clk;

  // Interface instance
  seq_untyped_if seq_untyped_if_0 (.*);

  // Connect TB clk to Interface instance clk

  // DUT instance
  seq_untyped seq_untyped_0 (.clk(clk),
				.reset_n(seq_untyped_if_0.reset_n),
				.a(seq_untyped_if_0.a),
				.b(seq_untyped_if_0.b),
				.c(seq_untyped_if_0.c),
				.d(seq_untyped_if_0.d),
				.e(seq_untyped_if_0.e),
				.f(seq_untyped_if_0.f),
				.a8(seq_untyped_if_0.a8),
				.d8(seq_untyped_if_0.d8)

				);


  // Using VW_Go2UVM
  seq_untyped_test seq_untyped_test_0;
  initial begin : go2uvm_test
    seq_untyped_test_0 = new ();
    // Connect virtual interface to physical interface
    seq_untyped_test_0.vif = seq_untyped_if_0;
    // Kick start standard UVM phasing
    run_test ();
  end : go2uvm_test
endmodule : seq_untyped_go2uvm

