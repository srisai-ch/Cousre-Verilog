class A;
    
    task automatic print();
        real count;
    begin
        count = count + 1;
        $display("Count: %d", count);
    end
    endtask
endclass

class B;
    
    task static print();
        real count;
    begin
        count = count + 1;
        $display("Count: %d", count);
    end
    endtask
endclass


module tb;

A a_inst = new();
B b_inst = new();

initial begin
    $display("Testing automatic task in class A:");
    repeat (5) begin
        a_inst.print();    
    end

    $display("Testing static task in class B:");
    repeat (5) begin
        b_inst.print();    
    end
end
endmodule