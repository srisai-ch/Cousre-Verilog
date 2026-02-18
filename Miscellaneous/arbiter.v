module qos_arbiter_32 (
    input  wire         clk,
    input  wire         rst_n,
    input  wire [31:0]  req,
    input  wire [127:0] qos,
    output reg  [31:0]  grant,
    output reg          grant_valid,
    output reg  [4:0]   grant_idx
);

    reg [4:0] rr_ptr;

    integer i;
    integer k;
    integer idx;
    reg [3:0] best_qos;
    reg       found_req;

    function [3:0] qos_at;
        input [127:0] qos_bus;
        input integer requester;
        begin
            qos_at = qos_bus[(requester*4) +: 4];
        end
    endfunction

    always @(*) begin
        grant       = 32'b0;
        grant_valid = 1'b0;
        grant_idx   = 5'd0;
        best_qos    = 4'd0;
        found_req   = 1'b0;

        // Pass 1: find highest QoS among active requests.
        for (i = 0; i < 32; i = i + 1) begin
            if (req[i]) begin
                if (!found_req || (qos_at(qos, i) > best_qos)) begin
                    best_qos  = qos_at(qos, i);
                    found_req = 1'b1;
                end
            end
        end

        // Pass 2: among highest QoS requesters, choose in round-robin order.
        if (found_req) begin
            for (k = 0; k < 32; k = k + 1) begin
                idx = rr_ptr + k;
                if (idx >= 32)
                    idx = idx - 32;

                if (!grant_valid && req[idx] && (qos_at(qos, idx) == best_qos)) begin
                    grant[idx]  = 1'b1;
                    grant_valid = 1'b1;
                    grant_idx   = idx[4:0];
                end
            end
        end
    end

    // Move pointer after each successful grant.
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            rr_ptr <= 5'd0;
        else if (grant_valid)
            rr_ptr <= (grant_idx == 5'd31) ? 5'd0 : (grant_idx + 5'd1);
    end

endmodule
