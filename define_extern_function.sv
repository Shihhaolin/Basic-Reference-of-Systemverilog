class base;

 string o1 = "Gamma";
 string o2 = "Delta";

 function void print_o1();
  $display("sub_class: o1 is %s", o1);
    
 endfunction
 
//extern function doesn't need keyword endfunction
 extern virtual function void print_o2();


endclass:base

//function outside the class
function void base::print_o2();
  $display("sub_class: o2 is %s", o2);
    
endfunction


program test;

base p;


initial begin
     p = new();//call constructor
     p.print_o2();

end



endprogram