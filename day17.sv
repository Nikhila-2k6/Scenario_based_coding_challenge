// 1. Define an Abstract Class (Cannot be instantiated)
virtual class BaseDriver;
  string name;
  function new(string n);
    this.name = n;
  endfunction
  // 2. Pure Virtual Method: A 'promise' that must be kept by children
  pure virtual function void send_packet();  
  function void display_info();
    $display("Driver Name: %s", name);
  endfunction
endclass
// 3. Concrete Class: Must implement the pure virtual method
class PCI_Driver extends BaseDriver;
  function new(string n);
    super.new(n);
  endfunction
  // Keeping the promise made in the Base Class
  virtual function void send_packet();
    $display("%s: Sending PCI data bits...", name);
  endfunction
endclass
module day17_abstract;
  // BaseDriver base_h = new("Fail"); // ERROR: Cannot create object of virtual class
  PCI_Driver pci_h;
  initial begin
    pci_h = new("PCI_EXP_0");
    pci_h.display_info();
    pci_h.send_packet();
  end
endmodule
