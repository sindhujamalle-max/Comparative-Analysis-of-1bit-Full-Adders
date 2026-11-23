// Method 1: Gate-level full adder
module full_adder_gate(input A, B, Cin, output Sum, Cout);
    wire x1, c1, c2;
    xor (x1, A, B);
    xor (Sum, x1, Cin);
    and (c1, A, B);
    and (c2, x1, Cin);
    or  (Cout, c1, c2);
endmodule

// Method 2: Dataflow full adder
module full_adder_dataflow(input A, B, Cin, output Sum, Cout);
    assign Sum = A ^ B ^ Cin;
    assign Cout = (A & B) | (B & Cin) | (A & Cin);
endmodule

// Method 3: MUX-based carry full adder
module full_adder_mux(input A, B, Cin, output Sum, Cout);
    assign Sum = A ^ B ^ Cin;
    assign Cout = A ? (B | Cin) : (B & Cin);
endmodule
