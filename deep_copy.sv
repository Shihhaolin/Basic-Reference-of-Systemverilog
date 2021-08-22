//deep copy copies all the class members and its nested class members.

class deep;
bit [7:0] addr;

//constructor
function new();
 addr = 'h12;
endfunction

//copy method
function deep copy();
  copy = new();
  copy.addr = this.addr;
endfunction

endclass

class deep_packet;

int data;
//get class handle from deep class
deep dep= new();

//copy method
function deep_packet copy();
  copy = new();
  copy.data = this.data;
  copy.dep = dep.copy();
endfunction

endclass

program test;

deep_packet de1, de2, de3;

initial begin
    
    de1 = new();
    de1.data = 'd32;



    de2 = de1.copy;
    de2.data = 'd19;
    de2.dep.addr = 'h27;
    //because deep copy would copy all members, hence all properties would be copy into new handle
    //new handle would be return
    //hence de2.dep.addr won't be update
    $display("de1 data is %0d, addr is %0b", de1.data, de1.dep.addr);
    $display("de2 data is %0d, addr is %0b", de2.data, de2.dep.addr);

  


end

endprogram