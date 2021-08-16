module test;

function void test_casez(logic [2:0] irq);
  logic int0, int1, int2;
  int0=0;
  int1=0;
  int2=0;
  casez (irq) 
    3'b1?? : int2 = 1'b1;
    3'b?1? : int1 = 1'b1;
    3'b??1 : int0 = 1'b1;
  endcase 
  $display("\ncasez int0=%b int1=%b int2=%b",int0,int1,int2);
endfunction

function void test_casex(logic [2:0] irq);
  logic int0, int1, int2;
  int0=0;
  int1=0;
  int2=0;
  casex (irq) 
    3'b1?? : int2 = 1'b1;
    3'b?1? : int1 = 1'b1;
    3'b??1 : int0 = 1'b1;
  endcase 
  $display("casex int0=%b int1=%b int2=%b",int0,int1,int2);
endfunction

initial begin
  #1; test_casez(3'b000); test_casex(3'b000);
  #2; test_casez(3'b001); test_casex(3'b001);
  #3; test_casez(3'b010); test_casex(3'b010);
  #4; test_casez(3'b011); test_casex(3'b011);
  #5; test_casez(3'b100); test_casex(3'b100);
  #6; test_casez(3'b101); test_casex(3'b101);
  #7; test_casez(3'b110); test_casex(3'b110);
  #8; test_casez(3'b111); test_casex(3'b111);

end

endmodule

//case treats ‘z’ & ‘x’ as it is
//casez treats ‘z’ as dont care
//casex treats ‘z’ & ‘x’ as dont care