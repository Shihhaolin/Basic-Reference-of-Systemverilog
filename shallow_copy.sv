//not like deep copy, shallow copy will only copy class handle
class shallow;

 bit [7:0] addr = 'h12;

endclass 

class shallow_packet;

 int data;
 shallow sha = new();
endclass


program test;

 shallow_packet sh1, sh2;

 initial begin
     sh1 = new();
     sh1.data = 'd32;
     
     //shallow copy
     sh2 = new sh1;

     //update value
     sh2.data = 'd19;

     //because sh2 and sh1 share same handle sha, hence addr would be update
     //sh1.sha.addr would no longer be 12
     sh2.sha.addr = 'h27;
     
     $display("sh1 data is %0d, addr is %0b", sh1.data, sh1.sha.addr);
     $display("sh2 data is %0d, addr is %0b", sh2.data, sh2.sha.addr);
 end

endprogram

