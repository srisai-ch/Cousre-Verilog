module tb;

integer num;
integer i;
integer is_prime;

initial begin
    for(num=2; num<=100; num=num+1) begin
        is_prime = '1;
        for(i=2; i*i <=num; i=i+1) begin
            if(num % i == 0) begin
                is_prime = '0;
                i = num;
            end
        end
        if(is_prime) begin
            $display("%d is a prime number", num);
        end
    end
end



endmodule
