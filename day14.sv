// Parent Class (Base)
class Transaction;
  bit [31:0] addr;
  function void display();
    $display("Base Class: Addr = 0x%h", addr);
  endfunction
endclass
// Child Class (Extended)
class ErrorTransaction extends Transaction;
  bit bad_crc;
  // Overriding the display method
  function void display();
    super.display(); // Call the parent's version first
    $display("Child Class: Bad_CRC = %b", bad_crc);
  endfunction
endclass
module day14_inheritance;
  ErrorTransaction err_tr;
  initial begin
    err_tr = new(); 
    // Accessing inherited property
    err_tr.addr = 32'hFEED_FACE;  
    // Accessing child-specific property
    err_tr.bad_crc = 1'b1;
    // Calling the overridden method
    err_tr.display();
  end
endmodule
