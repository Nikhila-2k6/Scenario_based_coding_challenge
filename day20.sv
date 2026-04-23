// 1. The Base Layer
class BasePacket;
  rand byte header; 
  virtual function void display();
    $display("Header: 0x%h", header);
  endfunction
endclass
// 2. The Extended Layer (Inheritance)
class DataPacket extends BasePacket;
  rand byte payload [];
  function new(int size);
    payload = new[size];
  endfunction
  // Overriding display (Polymorphism)
  virtual function void display();
    super.display(); // Call base header display
    $display("Payload Size: %0d, Data: %p", payload.size(), payload);
  endfunction
endclass
module day20_layered_oop;
  BasePacket pkt_h;     // Base Handle
  DataPacket data_obj;  // Specific Object
  initial begin
    data_obj = new(4);
    void'(data_obj.randomize() with {header == 8'hAA;});
    // Pointing Parent handle to Child object
    pkt_h = data_obj;
    // This calls the DataPacket's display because of 'virtual'
    pkt_h.display();
  end
endmodule
