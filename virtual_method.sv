class base;

string o1 = "Alpha";
string o2 = "Beta" ;

//data type void apply when function without ant return value 
function void print_o1();
  $display("base:o1 is %s", o1);
    
endfunction

virtual function void print_o2();
  $display("base:o2 is %s", o2);
    
endfunction

endclass:base


class sub_class extends base;

string o1 = "Gamma";
string o2 = "Delta";

function void print_o1();
  $display("sub_class: o1 is %s", o1);
    
endfunction

virtual function void print_o2();
  $display("sub_class: o2 is %s", o2);
    
endfunction

endclass:sub_class

program test;

base p;
sub_class c;

initial begin
    p=new();//instantiate base class
    c=new();//instantiate sub_class 
    p.print_o1();
    p.print_o2();
    p=c;//can't directly declare c.print_o2;
    p.print_o1();
    p.print_o2();
    c.print_o1();
    c.print_o2();

end



endprogram