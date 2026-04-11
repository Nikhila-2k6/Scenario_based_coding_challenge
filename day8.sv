// Code your testbench here
// or browse Examples
// 1. Define the Interface
interface mem_intf(input logic clk);
  logic [7:0] addr;
  logic [15:0] data_in;
  logic [15:0] data_out;
  logic write_en;
  logic read_en;
endinterface

// 2. A simple Memory Module using the Interface
module memory_dut (mem_intf vif);
  logic [15:0] ram [255:0];

  always @(posedge vif.clk) begin
    if (vif.write_en)
      ram[vif.addr] <= vif.data_in;
    if (vif.read_en)
      vif.data_out <= ram[vif.addr];
  end
endmodule

// 3. The Testbench Top
module tb_top;
  bit clk;
  always #5 clk = ~clk; // 100MHz Clock

  // Instantiate the Interface
  mem_intf intf_inst(clk);

  // Connect DUT using the interface instance
  memory_dut dut (.vif(intf_inst));

  initial begin
    // Driving signals through the interface
    @(posedge clk);
    intf_inst.addr = 8'hA5;
    intf_inst.data_in = 16'hDEAD;
    intf_inst.write_en = 1;
    
    @(posedge clk);
    intf_inst.write_en = 0;
    intf_inst.read_en = 1;

    @(posedge clk);
    $display("Time: %0t | Read Data: 0x%h", $time, intf_inst.data_out);
    $finish;
  end
endmodule
