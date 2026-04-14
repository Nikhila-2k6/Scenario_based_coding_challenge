class Header;
  int id;
endclass
class Packet;
  int data;
  Header hdr; // Nested class object
  function new();
    hdr = new();
  endfunction
  // Custom Method for Deep Copy
  function Packet deep_copy();
    deep_copy = new();
    deep_copy.data = this.data;
    deep_copy.hdr.id = this.hdr.id; // Manually copying nested data
  endfunction
endclass
module day13_copying;
  Packet p1, p2_shallow, p3_deep;
  initial begin
    p1 = new();
    p1.data = 100;
    p1.hdr.id = 1;
    // 1. SHALLOW COPY (Built-in)
    p2_shallow = new p1;
    p2_shallow.hdr.id = 99; // Modifying the copy... 
    $display("Shallow Copy Effect: P1 Header ID is now %0d (OOPS!)", p1.hdr.id);
    // 2. DEEP COPY (Custom)
    p3_deep = p1.deep_copy();
    p3_deep.hdr.id = 55; // Modifying the deep copy...
    $display("Deep Copy Effect: P1 Header ID is still %0d (SAFE!)", p1.hdr.id);
  end
endmodule
