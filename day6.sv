// Code your testbench here
// or browse Examples
module day6_unions;
//  Define the different "views" of the 32-bit bus
  typedef struct packed {
    logic [11:0] page;
    logic [19:0] offset;
  } addr_t;

  typedef struct packed {
    logic [7:0]  opcode;
    logic [23:0] payload;
  } cmd_t;
   // Define the Union (Total size = size of the largest member)
  typedef union packed {
    addr_t address;
    cmd_t  command;
    logic [31:0] raw_bits;
  } bus_u;

  bus_u my_bus;

  initial begin
    // Write to the bus as an Address
    my_bus.address = '{12'hABC, 20'h12345};
    $display("Time: %0t, Bus as Address: Page=%h, Offset=%h", $time, my_bus.address.page, my_bus.address.offset);
    $display("Time: %0t, Raw Bits on wires: 32'h%h", $time, my_bus.raw_bits);
   //Read the SAME bits
    $display("Time: %0t, Bus interpreted as Command: Opcode=%h", $time, my_bus.command.opcode);
   // Modify the raw bits directly
    my_bus.raw_bits = 32'hFFFF_FFFF;
    $display("Time: %0t, After raw write, Opcode is now: %h", $time, my_bus.command.opcode);
  end
endmodule
