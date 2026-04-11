// Code your testbench here
// or browse Examples
module day5_enums;
  //  Define the enum type
  typedef enum {IDLE, SETUP, WRITE, READ} state_t;
  state_t current_state, next_state;
  initial begin
    //  Assigning a named value
    current_state = IDLE;
    $display("Time: %0t, Current State: %s (%0d)", $time, current_state.name(), current_state);
    next_state = SETUP;
    $display("Time: %0t, Next State: %s (%0d)", $time, next_state.name(), next_state);
    //  Using Enum Methods: .first(), .next(), .prev(), .last()
    current_state = current_state.next(); // Moves from IDLE to SETUP
    $display("Time: %0t, After .next(): %s", $time, current_state.name());
    // current_state = 2; //this will cause a COMPILER ERROR!
    // We must use current_state = state_t'(2); // Static casting
  end
endmodule
