interface bus_if(input logic clk);
  logic [7:0] addr;
  logic [15:0] data;
  logic sel;
  // 1. Clocking Block: Prevents Race Conditions
  clocking cb @(posedge clk);
    default input #1step output #2ns; // Sample 1step before, drive 2ns after
    output addr, sel;
    input  data;
  endclocking
  // 2. Modports: Define signal directions
  modport TB  (clocking cb, input clk); // TB uses the clocking block
  modport DUT (input clk, addr, sel, output data);
endinterface
module simple_dut(bus_if.DUT b);
  always @(posedge b.clk) begin
    if (b.sel) 
      $display("Time: %0t, DUT received Addr: %h", $time, b.addr);
  end
endmodule
module tb_top;
  bit clk;
  always #5 clk = ~clk;
  bus_if intf(clk);
  simple_dut u_dut(intf.DUT); // Connect using DUT modport
  initial begin
    // Driving signals through the Clocking Block (use <= for CB)
    intf.TB.cb.sel  <= 1;
    intf.TB.cb.addr <= 8'hFE;
    @(intf.TB.cb); // Wait for the next clocking event
    intf.TB.cb.sel  <= 0; 
    #20 $finish;
  end
endmodule
