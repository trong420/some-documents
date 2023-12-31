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
/* -----\/----- EXCLUDED -----\/-----

checker reqack_chk (event  clk, 
                    untyped max,					  
    				logic   request, acknowledge, done, interrupt, reset_n);
   default clocking @(clk); endclocking
   default disable iff (!reset_n);
   logic req_delay;
   sequence q_reqack; request ##[1:max] acknowledge ##1 done; endsequence : q_reqack
   csq_reqack : cover sequence(q_reqack);
	   
   property p_reqack; request |-> ##[1:max] acknowledge ##1 done; endproperty : p_reqack
   // concurrent assertions
   ap_reqack: assert property(p_reqack) else $error("property p_reqack  error");
   ap_req_intrpt: assert property(req_delay |=> ##[0:$] intrpt);
	 
	 always @(clk) begin : a1
	 req_delay <= req;
      if(done) begin : d1 
		ap_interrupt: assert property(@ (posedge clk) ##[0:3] interrupt); // procedural assertion
		assert(!acknowledge) else  // immediate assertion
                 $error("acknowledge asserted when done");
	  end : d1
     end  : a1 
 endchecker : reqack_chk

 
module m;
  logic clk, req, ack, done, intrpt, reset_n;
  reqack_chk reqack_chk1 (posedge clk, req, ack, done, intrpt, reset_n, 5);
  reqack_chk reqack_chkMax (posedge clk, req, ack, done, intrpt, reset_n, $); 
  dut dut1(.*);
endmodule : m
 -----/\----- EXCLUDED -----/\----- */
 `define max 5

module m_equivalent(input clk, req, intrpt, reset_n,output ack, done); // ERR: Range must be bounded by constant expressions
timeunit 1ns;
timeprecision 1ns;

 
    //  begin : checker_equivalent 
       //default clocking @(clk); endclocking
       //default disable iff (!reset_n);
	   logic req_delay_cp1;  // separate copies for each instance (_cp postfix for CoPy) 
       sequence q_reqack_cp1; req ##[1:`max] ack ##1 done; endsequence : q_reqack_cp1
       csq_reqack_cp1 : cover sequence(@ (posedge clk) q_reqack_cp1);
    	   
       property p_reqack_cp1; req |-> ##[1:`max] ack ##1 done; endproperty : p_reqack_cp1
       // concurrent assertions
       ap_reqack_cp1: assert property(@ (posedge clk) p_reqack_cp1) 
         else $error("property p_reqack  error");
    
       ap_req_intrpt: assert property(@ (posedge clk) req_delay_cp1 |=> ##[0:$] intrpt);	   
		   
       always @(posedge clk) 
       begin : a1 
          if(done) begin : d1 
    		ap_interrupt_cp1: assert property(@ (posedge clk) ##[0:3] intrpt); // procedural assertion
    		assert(!ack) else  // immediate assertion
                     $error("acknowledge asserted when done");
    	  end : d1
         end  : a1 
  //     end : checker_equivalent
  

endmodule : m_equivalent

//module dut;
//endmodule
