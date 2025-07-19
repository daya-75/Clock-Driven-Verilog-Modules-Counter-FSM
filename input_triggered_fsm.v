//Implements a finite state machine (FSM) that transitions between IDLE, ACTIVE, and DONE states based on an external input trigger.
//It uses edge detection to respond to trigger pulses and outputs controlled ACTIVE and DONE signals for a defined duration.

module input_triggered_fsm (
    input wire clk,
    input wire reset,      // Synchronous reset
    input wire trigger,    // External trigger input
    output reg active,     // Output high when ACTIVE
    output reg done        // Output high when DONE
);

// State encoding
parameter IDLE   = 2'b00;
parameter ACTIVE = 2'b01;
parameter DONE   = 2'b10;

reg [1:0] current_state, next_state;

reg [2:0] active_counter;  // Counts cycles in ACTIVE

// Edge detection
reg trigger_prev;
wire trigger_rising;

assign trigger_rising = trigger & ~trigger_prev;

// State register
always @(posedge clk) begin
    if (reset) begin
        current_state <= IDLE;
        trigger_prev <= 1'b0;
    end else begin
        current_state <= next_state;
        trigger_prev <= trigger;
    end
end

// Next state logic
always @(*) begin
    case (current_state)
        IDLE: begin
            if (trigger_rising)
                next_state = ACTIVE;
            else
                next_state = IDLE;
        end
        ACTIVE: begin
            if (active_counter == 3'd4)
                next_state = DONE;
            else
                next_state = ACTIVE;
        end
        DONE: begin
            next_state = IDLE;
        end
        default: next_state = IDLE;
    endcase
end

// Outputs and ACTIVE counter
always @(posedge clk) begin
    if (reset) begin
        active <= 1'b0;
        done <= 1'b0;
        active_counter <= 3'd0;
    end else begin
        case (next_state)
            IDLE: begin
                active <= 1'b0;
                done <= 1'b0;
                active_counter <= 3'd0;
            end
            ACTIVE: begin
                active <= 1'b1;
                done <= 1'b0;
                active_counter <= active_counter + 1'b1;
            end
            DONE: begin
                active <= 1'b0;
                done <= 1'b1;
                active_counter <= 3'd0;
            end
        endcase
    end
end
