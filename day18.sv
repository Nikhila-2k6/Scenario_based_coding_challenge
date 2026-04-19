// 1. Define the Class with a Parameter (Default is 32)
class GenericPacket #(parameter int WIDTH = 32);
  logic [WIDTH-1:0] data;

  function void display();
    $display("Time: %0t, Width: %0d, Data: 0x%h", $time, WIDTH, data);
  endfunction
endclass

module day18_parameters;
  // 2. Specifying the parameter during handle declaration
  GenericPacket #(8)  ctrl_pkt; // 8-bit version
  GenericPacket #(64) data_pkt; // 64-bit version

  initial begin
    // 3. Constructing the specialized objects
    ctrl_pkt = new();
    ctrl_pkt.data = 8'hFF;
    ctrl_pkt.display();

    data_pkt = new();
    data_pkt.data = 64'hDEAD_BEEF_CAFE_BABE;
    data_pkt.display();
  end
endmodule
