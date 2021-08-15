module test;


       int assoc_arry_test[string];
  
  initial begin
      
  //the order is 1,2,4,5,7,3,9,10,8,6. following the alphabet
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

   $display("assoc_arry_test.size() = %0d", assoc_arry_test.size());
   $display("assoc_arry_test.num() = %0d", assoc_arry_test.num());

   if(assoc_arry_test.exists("Delta"))
   $display("Delta is equal %0d", assoc_arry_test["Delta"]);

   begin
       string index;
       if(assoc_arry_test.first(index))//This function is succeeded and first key is already stored in "index"
       $display("assoc_arry_test.first[%s] = %0d", index, assoc_arry_test[index]);
   end
  
   begin
       string index;
       if(assoc_arry_test.last(index))//This function is succeeded and first key is already stored in "index"
       $display("assoc_arry_test.last[%s] = %0d", index, assoc_arry_test[index]);
   end
   
   begin
       string index = "Theta";
       if(assoc_arry_test.prev(index))//This function is succeeded and first key is already stored in "index"
       $display("assoc_arry_test.prev[%s] = %0d", index, assoc_arry_test[index]);
   end
   
   begin
       string index = "Theta";
       if(assoc_arry_test.next(index))//This function is succeeded and first key is already stored in "index"
       $display("assoc_arry_test.next[%s] = %0d", index, assoc_arry_test[index]);
   end
   
   

  end

endmodule