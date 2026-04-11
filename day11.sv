// Code your testbench here
// or browse Examples
//  Define the Class (The Blueprint)
class Instruction;
  // Properties (Data)
  logic [3:0] opcode;
  logic [7:0] address;
  // Method (Action)
  function void display();
    $display("Time: %0t, Opcode: 0x%h, Addr: 0x%h", $time, opcode, address);
  endfunction
endclass
module day11_class_basics;
  //  Declare a Handle (This is just a pointer, it's currently null)
  Instruction instr_h;
  initial begin
    //  Construction (Allocating memory)
    instr_h = new(); 
    //  Accessing properties using the dot (.) operator
    instr_h.opcode  = 4'hA;
    instr_h.address = 8'hFF;

    //  Calling a method
    instr_h.display();

    // What happens if we null the handle?
    instr_h = null;
    if (instr_h == null)
      $display("Handle is now NULL. Memory will be cleared by Garbage Collector.");
  end
endmodule
