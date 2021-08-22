

module test;

 bit [7:0] addr;

initial begin
    repeat(10)
     begin
         if(std::randomize(addr))

         $display("addr = %0d", addr);
     end
end

endmodule