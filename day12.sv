class Transaction;
  logic [31:0] addr;
  logic [31:0] data;
  // 1. The Custom Constructor
  // Note: 'new' is the only function that DOES NOT have a return type
  function new(logic [31:0] a = 32'h0, logic [31:0] d = 32'hFFFF);
    this.addr = a;
    this.data = d;
  endfunction
  function void display(string name);
    $display("Time: %0t , %s -> Addr: 0x%h, Data: 0x%h", $time, name, addr, data);
  endfunction
endclass

module day12_constructor;
  Transaction tr1, tr2;
  initial begin
    // 2. Creating an object with CUSTOM values
    tr1 = new(32'h1234_5678, 32'hAAAA_BBBB);
    tr1.display("TR1");
    // 3. Creating an object with DEFAULT values (using arguments from 'new' definition)
    tr2 = new(); 
    tr2.display("TR2");
  end
endmodule
