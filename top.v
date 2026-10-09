module top(

    input [0:7] sw,
    output [0:5] led


);


    wire LSB_Cout;

    light light_inst(

        .downstairs(sw[0]),
        .upstairs(sw[1]),
        .stair_light(led[0])

    );


    adder adder_inst(

        .A(sw[2]),
        .B(sw[3]),
        .Y(led[1]),
        .Carry(led[2])

    );

    full_adder LSB_inst(

        .A(sw[4]),
        .B(sw[6]),
        .Cin(1'b0),
        .Y(led[3]),
        .Cout(LSB_Cout)

    );
    


    full_adder MSB_inst(

        .A(sw[5]),
        .B(sw[7]),
        .Cin(LSB_Cout),
        .Y(led[4]),
        .Cout(led[5])

    );


endmodule
