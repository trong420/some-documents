

module m_equivalent (input clk, enb, reset_n,
  input [1:0] req,output [1:0]ack, done,input intrpt); // ERR: Range must be bounded by constant expressions
timeunit 1ns;
timeprecision 1ns;

  
  // checker local variables and declarations
   //   begin : checker_equivalent 
       //default clocking @(clk); endclocking
       //default disable iff (!reset_n);
	   // ** For simplicity, we're ignoring the disable iff in assertions
	   `define max_cp0 3
	   logic req_delay_cp0;  // separate copies for each instance (_cp postfix for CoPy) 
       sequence q_reqack_cp0; req[0] ##[1:`max_cp0] ack[0] 
                             ##1 done[0]; endsequence : q_reqack_cp0
       property p_reqack_cp0; req[0] |-> ##[1:`max_cp0] ack[0] 
                              ##1 done[0]; endproperty : p_reqack_cp0
	    `define max_cp1 4	
	   logic req_delay_cp1;  // separate copies for each instance (_cp postfix for CoPy) 
       sequence q_reqack_cp1; req[1] ##[1:`max_cp1] ack[1] 
                              ##1 done[1]; endsequence : q_reqack_cp1
       property p_reqack_cp1; req[1] |-> ##[1:`max_cp1] ack[1] 
                  ##1 done[1]; endproperty : p_reqack_cp1		       
       always @ (posedge clk) begin : a1
        if(enb) 
  //        for (int i=0; i<2; i++) begin : lp1
		  begin : lp0 
  //         reqack_chk reqack_chk_loop 
  //          (posedge clk, i+3, req[i], ack[i], done[i], intrpt[i], reset_n);
            csq_reqack_cp0 : cover property (@ (posedge clk) q_reqack_cp0);
            ap_reqack_cp0: assert property(@ (posedge clk) p_reqack_cp0) 
                                        else $error("property p_reqack  error");
            ap_req_intrpt_cp0: assert property(@ (posedge clk) 
                      req_delay_cp0 |=> ##[0:$] intrpt);	   
      //always @(posedge clk) begin : a1 
            if(done) begin : d1 
    		  ap_interrupt_cp0: assert property(##[0:3] intrpt); // procedural assertion
    		   assert(!ack) else  // immediate assertion
                     $error("acknowledge asserted when done");
    	    end : d1
      //end  : a1 			
          end : lp0
	  // 2nd loop
		  begin : lp1 
  //         reqack_chk reqack_chk_loop 
  //          (posedge clk, i+3, req[i], ack[i], done[i], intrpt[i], reset_n);
            csq_reqack_cp1 : cover property (@ (posedge clk) q_reqack_cp1);
            ap_reqack_cp1: assert property(@ (posedge clk) p_reqack_cp1) 
                                        else $error("property p_reqack  error");
          ap_req_intrpt_cp1: assert property(@ (posedge clk) req_delay_cp1 |=> ##[0:$] intrpt);	   
      //always @(posedge clk) begin : a1 
            if(done) begin : d1 
    		  ap_interrupt_cp1: assert property(##[0:3] intrpt); // procedural assertion
    		   assert(!ack) else  // immediate assertion
                     $error("acknowledge asserted when done");
    	    end : d1
      //end  : a1 			
          end : lp1

		 
     end : a1

   //end : checker_equivalent
  
 // dut dut1(.*);
endmodule : m_equivalent

module dut;
endmodule
