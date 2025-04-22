`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:26:32 06/12/2019 
// Design Name: 
// Module Name:    Divider 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description:    Clock divider generating 1Hz enable signal
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module Divider(
    input clk,
    input rst,
    output reg oneHz_enable
);

    localparam [24:0] HZ_CONSTANT = 25'd10;  // Change this value based on input clock frequency
    reg [24:0] counter;

    always @(posedge clk) begin
        if (rst) begin
            counter <= HZ_CONSTANT;
            oneHz_enable <= 1'b0;
        end else begin
            if (counter == 0) begin
                counter <= HZ_CONSTANT;
                oneHz_enable <= 1'b1;
            end else begin
                counter <= counter - 1;
                oneHz_enable <= 1'b0;
            end
        end
    end

endmodule
