`timescale 1ns/1ps
module full_adder_tb;
    reg A, B, Cin;
    wire sg, cg, sd, cd, sm, cm;
    integer i, errors;

    full_adder_gate g(A, B, Cin, sg, cg);
    full_adder_dataflow d(A, B, Cin, sd, cd);
    full_adder_mux m(A, B, Cin, sm, cm);

    initial begin
`ifdef DUMP_WAVE
        $dumpfile("full_adder.vcd");
        $dumpvars(0, full_adder_tb);
`endif
        errors = 0;
        $display("A B Cin | Gate S/C | Dataflow S/C | MUX S/C");
        for (i = 0; i < 8; i = i + 1) begin
            {A, B, Cin} = i;
            #5;
            $display("%b %b  %b  |   %b/%b   |     %b/%b    |  %b/%b",
                     A, B, Cin, sg, cg, sd, cd, sm, cm);
            if ((sg !== sd) || (cg !== cd) || (sg !== sm) || (cg !== cm))
                errors = errors + 1;
        end
        if (errors == 0)
            $display("ALL FULL ADDER TESTS PASSED");
        else
            $display("FULL ADDER TESTS FAILED: %0d error(s)", errors);
        $finish;
    end
endmodule
