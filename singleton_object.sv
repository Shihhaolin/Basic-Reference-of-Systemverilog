//singleton class is applied when only one object of some classes like configuration classes
//only one object would be created when we wanna create new object

class singleton;

//declare class as local to restrict constructor being call outside the class
static singleton object1;

int A;

local function new();
   this.A = A;
endfunction

function void print();
  $display("A = %0d", A);
endfunction:print

static function singleton get_value();
  if(object1 == null )//object1 is null to create new object
    object1 = new();
   return object1; 
endfunction:get_value

endclass


program test;

singleton o1,o2;

//o1 = new() doesn't work because new() is local at base class

initial begin
     o1 = singleton::get_value();
     o2 = singleton::get_value();
     $display("start testing singleton--------------");
     o1.A = 32;
     o1.print();
     o2.print();

     o2.A = 99;
     o1.print();
     o2.print();
    
     $display("finish testing singleton--------------");

end

endprogram