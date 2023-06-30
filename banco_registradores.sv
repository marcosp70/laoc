module registerBox (
    Read1,
    Read2,
    RegWrite,
    WriteData,
    EscReg,
    Data1,
    Data2,
    clock
);
    input [2:0] Read1, EscReg;
    input [1:0] Read2;
    input [7:0] WriteData;
    input RegWrite, clock;
    output reg [7:0] Data1, Data2;
    reg [7:0] RF [7:0];

    initial begin
        RF[0] = 8'b00000000; // registrador zero
        RF[1] = 8'b00000000;
        RF[2] = 8'b00000000;
        RF[3] = 8'b00000000;
        RF[4] = 8'b00000000;
        RF[5] = 8'b00000000;
        RF[6] = 8'b00000000;
        RF[7] = 8'b00000000;
    end

    always @(negedge clock or EscReg) begin
        if (RegWrite==1) begin
            if (EscReg != 3'b000) begin
                RF[EscReg] = WriteData;
            end
        end
    end

    assign Data1 = RF[Read1];
    assign Data2 = RF[Read2];

endmodule