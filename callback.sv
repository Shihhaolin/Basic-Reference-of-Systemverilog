
    class Driver_cbs;
        //inplementing empty virtual method
        virtual task pre_run(); endtask
        virtual task main_run(); endtask
        virtual task post_run(); endtask

    endclass 
    
    class Driver;
       //instantiate the cbs class into Driver
        Driver_cbs drv_cb= new();
      
        
        task pre_run();
            drv_cb.pre_run();
        endtask

         task main_run();
            drv_cb.main_run();
        endtask

        task post_run();
            drv_cb.post_run();
        endtask

        task run();
            
            //hook
            pre_run();
            main_run();
            post_run();

        endtask //run

    endclass //Driver

    class test extends Driver_cbs;
       //task in cbs is virtual function. Hence the actual task would be call at here 
        task pre_run();
            $display("\n\ncall before main task\n");
        endtask 

        task main_run();
            $display("here is main function");  
        endtask

        task post_run();
        $display("\ncall after main task\n");
        endtask
    endclass //test

program test_callback;
   
    Driver drv;
    test t_h;

    initial
    begin
      //instantiate class into Driver
        drv = new();
        t_h = new();
      //put test variable into cb class
        drv.drv_cb = t_h;

        drv.run();
        #30;

        $finish;
    end
endprogram
