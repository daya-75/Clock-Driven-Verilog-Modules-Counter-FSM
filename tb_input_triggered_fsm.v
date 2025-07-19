//Testbench for simulating the input-triggered FSM.
//It generates timed trigger pulses to validate state transitions and output behavior across multiple cycles. 
//Displays and logs state signals for waveform analysis.


module tb_input_triggered_fsm;

reg clk;
reg reset;
reg trigger;
wire active;
wire done;

// Instantiate DUT
input_triggered_fsm uut (
    .clk(clk),
    .reset(reset),
    .trigger(trigger),
    .active(active),
    .done(done)
);

// Clock generation: 10ns period (100MHz)
always #10 clk = ~clk;

initial begin
    // Initialize
    clk = 0;
    reset = 1;
    trigger = 0;

    // Hold reset for 20ns
    #20;
    reset = 0;

    // Wait a bit, then issue first trigger pulse
    #15;
    trigger = 1;
    #10;
    trigger = 0;

    // Wait to see ACTIVE and DONE states
    #50;

    // Second trigger after DONE completes
    trigger = 1;
    #10;
    trigger = 0;

    // Observe second ACTIVE/DONE cycle
    #50;

    // Third trigger with a longer delay
    #50;
    trigger = 1;
    #10;
    trigger = 0;

    // Observe third cycle
    #100;

    // Finish simulation
    $finish;
end

// Monitor outputs
initial begin
    $display("Time\tTrig\tAct\tDone");
    $monitor("%0t\t%b\t%b\t%b", $time, trigger, active, done);
end

endmodule
