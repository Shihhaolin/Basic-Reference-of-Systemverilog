class base;
  //::can only access to static data type or function 
  static int A;

  static function void print();
    $display("A is %0d", A);
  endfunction

endclass:base


program test;
  initial begin
  //don't need to call constructor
  //using :: to directly call print() in base class
  base::A=32'b1234;
  base::print();

  end

endprogram