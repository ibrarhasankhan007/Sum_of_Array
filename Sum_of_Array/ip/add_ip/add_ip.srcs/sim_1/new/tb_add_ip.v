`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2022 04:32:56 PM
// Design Name: 
// Module Name: tb_add_ip
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_add_ip();
reg clk;
reg reset;
reg start;
reg [31:0]MAX;
reg [31:0]data_in;
 wire [31:0]addr;
 wire done;
 wire [31:0]sum;
 add_ip ins_tb(
 .clk    (clk    ),
 .reset  (reset  ) ,
 .start  (start  ),
 .MAX    (MAX    ) ,
 .data_in(data_in) ,
 .addr   (addr   ) ,
 .done   (done   ) ,
 .sum    (sum    )
 );
 
 initial
    begin
        clk=0;
        reset=0;
        start=0;
        MAX=10;
        data_in=1;
        forever
            #5 clk =~clk;
    end
 initial
    begin
        @( posedge clk )
            reset=1;
        repeat (5)@( posedge clk );
        
        @( posedge clk ) 
            reset=0;  
        
        @( posedge clk )
            start=1;
        wait(done)
        
        @( posedge clk ) 
            start=0;  
        repeat(10) @( posedge clk ); 
     end
 

endmodule
