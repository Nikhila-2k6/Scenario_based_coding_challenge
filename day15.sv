class BasePacket;
  int id;
  // 1. WITHOUT 'virtual', the handle type wins.
  // WITH 'virtual', the object type wins.
  virtual function void display();
    $display("Time: %0t | [Base] ID: %0d", $time, id);
  endfunction
endclass
class ExtPacket extends BasePacket;
  int data;
  // Overriding the base method
  function void display();
    $display("Time: %0t , [Extended] ID: %0d, Data: %h", $time, id, data);
  endfunction
endclass
module day15_polymorphism;
  BasePacket pkt_h; // Parent handle
  ExtPacket  ext_obj; // Child object
  initial begin
    // 2. Pointing a Parent handle to a Child object
    ext_obj = new();
    ext_obj.id = 10;
    ext_obj.data = 32'hABCD; 
    pkt_h = ext_obj; // Valid (Upcasting)
    // 3. Calling the method
    // Because 'display' is virtual, it calls the Child's version!
    pkt_h.display(); 
  end
endmodule
