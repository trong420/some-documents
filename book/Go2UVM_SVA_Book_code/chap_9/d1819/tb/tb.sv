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
module top1(); 
timeunit 1ns;
timeprecision 100ps;

reg write,read,addr,wdata,rd_served,rdata;
reg clk,wr_valid;

parameter Addr2ReadDelay = 0;  // Cycle delay between a READ and the data output.
default clocking cb @(posedge clk);
endclocking
d1819 dut (.*);

endmodule:top1
