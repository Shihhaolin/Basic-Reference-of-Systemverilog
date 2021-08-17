class test_inheritance;

string my_object;

function new(string object);
   my_object = object;
endfunction:new

function void print();
  $display("it is %s", my_object);    
endfunction:print

endclass


class sub_class1 extends test_inheritance;
  string object1;
    function new(string object1);
        super.new(object1);
    endfunction 
endclass:sub_class1

program top;
test_inheritance base;
sub_class1       c1, c2, c3;

initial begin
    //print "Alpha" in the parent class
    base = new("Alpha");
    base.print();
    
    //Assign Child class into Parent class. 
    c1   = new("Beta");
    base = c1;//It is always legal to assign a child class variable to a variable of a class higher in the inheritance tree (parent class).
    base.print();

    c1   = new("Gamma");
    base = c1;
    base.print();

    $display("-----$cast-----");
    
    //it is legal to assign a super-class (parent class) handle to a subclass (child class) variable 
    //if the super-class (parent class) handle refers to an object of the given subclass(child class)
    c1.object1 = "Delta";
    $cast(c2, base);//using $cast to avoid the error message
    c2.print();//The answer is still "Gamma". Because c2 only get the handle from base.
    $display("has %s", c2.object1);
    
    $display("---------------");
    
    //copy c1 handle into c3. Hence the answer would be same.
    c3 = c1;
    c3.print();
    $display("has %s", c3.object1);

    $display("---------------");
    
    //The answer is"Epsilon". Because c2 only get the handle from base.
    c1.object1 = "Epsilon";
    c2.print();
    $display("has %s", c2.object1);
    
    $display("---------------");

    c3.print();
    $display("has %s", c3.object1);
end

endprogram