//Testbench for simulating the 4-bit up-counter module. 
//It provides a clock signal and reset sequence to verify counting and reset behavior. 
//Displays the counter output over time.

module tb_up_counter_4bit;
reg clk;
reg reset;
wire [3:0] count;

// Instantiate DUT (Device Under Test)
up_counter_4bit uut (
    .clk(clk),
    .reset(reset),
    .count(count)
);

// Clock generation: 10ns period (100MHz)
always #5 clk = ~clk;

initial begin
    // Initialize signals
    clk = 0;
    reset = 1;

    // Hold reset for a few cycles
    #20;
    reset = 0;

    // Let the counter count for 100ns
    #100;

    // Assert reset again
    reset = 1;
    #10;
    reset = 0;

    // Continue counting
    #50;

    // Finish simulation
    $finish;
end

// Monitor output
initial begin
    $monitor("Time=%0t | reset=%b | count=%b", $time, reset, count);
end

endmodule
