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
module seq_trigger3(input clk,reset_n,load_mem=0, done=0, output ready=0, ready2=0);
  timeunit 1ns;
  timeprecision 1ns;
  reg temp, temp1;
  //assign a = qDoneSetup.triggered;
  
  sequence qDoneSetup; @ (posedge clk)  
      first_match($rose(load_mem) ##[0:5] done); endsequence : qDoneSetup
      // ($rose(load_mem) ##[0:5] done); endsequence : qDoneSetup		  cp_qDoneSetup: cover property (qDoneSetup);
	
  ap_qDone: assert property(@ (posedge clk) qDoneSetup |-> 1);
  always @ qDoneSetup begin : a1
  // The trigger point using the end point of the sequence 
       $info( "done memory load" );   
       temp <= 1'b1; 
       @ (posedge clk)  
       temp <= 1'b0;
  end : a1
assign ready=temp;

   always @ qDoneSetup.triggered begin : a1b
  // The trigger point using the end point of the sequence 
       $info ( "done memory load with triggered" );   
       temp1 <= 1'b1; 
       @ (posedge clk)  
      temp1 <= 1'b0;
   end : a1b
assign ready2=temp1;
		
	
   
endmodule : seq_trigger3

				 		   







