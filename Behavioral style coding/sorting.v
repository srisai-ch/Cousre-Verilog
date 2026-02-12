module tb; //buble sort
integer arrA [9:0];
integer i, j, temp;

initial begin
    for (i = 0; i < 10; i = i + 1) begin
       arrA[i] = $urandom_range(0, 200);
    end
    $write("Original array:");
    for (i = 0; i < 10; i = i + 1) begin
         $write(" %0d", arrA[i]);
    end
    $write("\n");
    for (i = 0; i < 10; i = i + 1) begin
        for (j = i+1; j < 10; j = j + 1) begin
            if (arrA[j] < arrA[i]) begin     // change to > for descending order
                temp = arrA[j];
                arrA[j] = arrA[i];
                arrA[i] = temp;
            end
        end
    end

    $write("Sorted array:");
    for (i = 0; i < 10; i = i + 1) begin
         $write(" %0d", arrA[i]);
    end

end


endmodule