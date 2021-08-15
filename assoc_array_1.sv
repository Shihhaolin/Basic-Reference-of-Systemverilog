module test;

function void test_array;
    int assoc_arry_test[string];
    string index;
  assoc_arry_test='{"Alpha":1,
                      "Beta":2,
                      "Gamma":3,
                      "Delta":4,
                      "Epsilon":5,
                      "Zeta":6,
                      "Eta":7,
                      "Theta":8,
                      "Iota":9,
                    "Kappa":10};
   if(assoc_arry_test.first(index)) begin
    do begin 
        $display("assoc_arry_test[%s]=%0d", index, assoc_arry_test[index]);
    end while (assoc_arry_test.next(index));
   end 
endfunction

initial begin
    test_array();
end


endmodule
//the order is 1,2,4,5,7,3,9,10,8,6. following the alphabet