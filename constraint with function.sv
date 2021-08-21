class base;

rand bit [9:0] x;

function int get(bit [9:0] a);
    return a;
endfunction

  constraint c1 {get(x) inside {[1:500]};}
  constraint c2 {! (get(x) inside {[100:400]});}
  constraint c3 {get(x) dist{[1:10]:=10, [11:99]:=178, [401:500]:=100};}
  

endclass


program test;

base b1;

initial begin
    b1 = new();
    
    //b1.c3.constraint_mode(1);
    repeat(20)
    begin
        assert(b1.randomize());//assertion to randomize the variable in base class
        $display("var is equal to %0d", b1.x);
    end

    #100;

    $finish;

end

endprogram
