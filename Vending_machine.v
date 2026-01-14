module ven_machine(
    input clk, 
    input rst,
    input [1:0] in,
    output reg out,
    output reg [1:0] change
);

    parameter s0 = 2'b00;
    parameter s1 = 2'b01;
    parameter s2 = 2'b10;

    reg [1:0] c_state, n_state;

    // Combinational next-state + next-output logic
    reg out_n;
    reg [1:0] change_n;

    always @(*) begin
        // defaults
        n_state   = c_state;
        out_n     = 0;
        change_n  = 2'b00;

        case (c_state)
            s0: begin
                if (in == 2'b00)       n_state = s0;
                else if (in == 2'b01)  n_state = s1;
                else if (in == 2'b10)  n_state = s2;
                else                   n_state = s0;
            end

            s1: begin
                if (in == 2'b00) begin
                    n_state  = s0;
                    change_n = 2'b01;
                end
                else if (in == 2'b01)  n_state = s2;
                else if (in == 2'b10) begin
                    n_state = s0;
                    out_n   = 1;
                end
                else n_state = s1;
            end

            s2: begin
                if (in == 2'b00) begin
                    n_state  = s0;
                    change_n = 2'b10;
                end
                else if (in == 2'b01) begin
                    n_state = s0;
                    out_n   = 1;
                end
                else if (in == 2'b10) begin
                    n_state  = s0;
                    out_n    = 1;
                    change_n = 2'b01;
                end
                else n_state = s2;
            end

            default: begin
                n_state   = s0;
                out_n     = 0;
                change_n  = 2'b00;
            end
        endcase
    end

    // Sequential block (synchronous reset)
    always @(posedge clk) begin
        if (rst) begin
            c_state <= s0;
            out     <= 0;
            change  <= 2'b00;
        end
        else begin
            c_state <= n_state;
            out     <= out_n;
            change  <= change_n;
        end
    end

endmodule
