`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2022 12:23:50 PM
// Design Name: 
// Module Name: add_ip
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


module add_ip(
input clk,
input reset,
input start,
input [31:0]MAX,
input [31:0]data_in,
output reg [31:0]addr,
output reg done,
output reg [31:0]sum

    );
 reg en_add;
 reg en_sum;
 reg done_r;
always @*   en_add = start && (addr != MAX);

always @(posedge clk)
begin
if(!reset || !start) addr<=0;
else if(en_add)addr<= addr+1;
end

always @(posedge clk)
begin
if(!reset || !start) en_sum<=0;
en_sum<= en_add;

end

always @(posedge clk)
begin
if(!reset || !start) sum <= 0;
else if(en_sum) sum<= sum+data_in;
end


    
always @(posedge clk)
if(!reset || !start) done_r<=0;
 
else if (addr==MAX)done_r <= 1;
    
always @(posedge clk)
if(!reset || !start) done<=0;
 
else done <= done_r;
    
endmodule
