module test;

// automatic function is reentrant and have separate variable when each time functio call 
   function automatic int factorial(int num);// put int as function data type
      if(num > 1)
         factorial = factorial(num - 1) * num;
      else
         factorial = 1;
   endfunction



int variable;
initial
begin
    $display("test from 0 to 10");

    for(int i = 0; i < 11; i++)
    begin

        variable = factorial(i);

      $display("\t %0d square = %0d", i, variable);
      $strobe("\t %0d square = %0d", i,variable);
        
end
$display("\n\t end test");
end
endmodule