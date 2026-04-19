class ComplexScoreboard;
  int match_count;
  int mismatch_count;
  // 1. Declare methods as 'extern'
  // This tells the compiler: "The logic is coming later!"
  extern function void check_packet(int data, int expected);
  extern virtual function void report();
endclass
// 2. Define the logic outside using the scope resolution operator (::)
function void ComplexScoreboard::check_packet(int data, int expected);
  if (data == expected) begin
    $display("Time: %0t, [PASS] Data: %h matches Expected: %h", $time, data, expected);
    match_count++;
  end else begin
    $display("Time: %0t, [FAIL] Data: %h != Expected: %h", $time, data, expected);
    mismatch_count++;
  end
endfunction
function void ComplexScoreboard::report();
  $display("Matches: %0d, Mismatches: %0d", match_count, mismatch_count);
endfunction
module day19_extern;
  ComplexScoreboard scb;
  initial begin
    scb = new();
    scb.check_packet(32'hAAAA, 32'hAAAA);
    scb.check_packet(32'h1234, 32'h5678);
    scb.report();
  end
endmodule
