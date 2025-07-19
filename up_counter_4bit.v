//Implements a 4-bit synchronous up-counter using Verilog. 
//The counter increments on every positive clock edge and resets to 0 on an active-high synchronous reset signal.

module up_counter_4bit (
    input wire clk,
    input wire reset,     // Synchronous reset
    output reg [3:0] count
);

always @(posedge clk) begin
    if (reset) begin
        count <= 4'b0000; // Reset to zero
    end else begin
        count <= count + 1'b1;
    end
end

endmodule
