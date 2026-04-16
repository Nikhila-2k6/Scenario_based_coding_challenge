class Transaction;
  // 1. Static variable: Shared by ALL objects of this class
  static int count = 0;
  // Normal variable: Each object has its own unique ID
  int packet_id;
  function new();
    count++;            // Increment the shared global counter
    packet_id = count;  // Assign the current count as the unique ID
  endfunction
  // 2. Static Method: Can be called even if no object exists!
  static function void display_total();
    $display("Total Packets Generated so far: %0d", count);
    // Note: Static methods cannot access non-static variables like 'packet_id'
  endfunction
endclass
module day16_static;
  Transaction t1, t2, t3;
  initial begin
    t1 = new();
    t2 = new();
    t3 = new();
    $display("T1 ID: %0d", t1.packet_id);
    $display("T2 ID: %0d", t2.packet_id);
    $display("T3 ID: %0d", t3.packet_id);
    // Calling static method using the class name and :: operator
    Transaction::display_total(); 
  end
endmodule
