module virtual_class_test;

   class A;
       function void print();
        $display("Hello from A");
              
      endfunction

   endclass

    class B extends A;
       virtual function void print();
       $display("Hello from B");
           
       endfunction //new()
   endclass //B extends A


   A aclass;
   B bclass;

   initial begin
       bclass=new();//create class B
       bclass.print();//run print function in class B

       aclass= bclass;//copy class B into A
       aclass.print();//run print function at A 


   end

endmodule

//answer
//Hello from B
//Hellp from A