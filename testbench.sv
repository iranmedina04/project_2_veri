`timescale 10ns/1ps
`define FIFOS
`include "fifo.sv"
`include "Library.sv"
`define LIB
`include "Router_library.sv"
`include "clases_interface.sv"
`include "sim_fifo.sv"
`include "driver.sv"
`include "monitor.sv"
`include "monitor_interno.sv"
`include "checker.sv"
`include "scoreboard.sv"
`include "agente_generador.sv"
`include "ambiente.sv"
`include "test.sv"


module testbench();

    reg clk_i = 0;

    parameter ROWS = 4;
    parameter COLUMNS = 4;  
    parameter PAKG_SIZE = 32;
    parameter FIFO_DEPTH = 16;

    mesh_if #(.ROWS(ROWS), .COLUMNS(COLUMNS), .PAKG_SIZE(PAKG_SIZE), .FIFO_DEPTH(FIFO_DEPTH)) _if (.clk_i(clk_i));

    test #(.ROWS(ROWS), .COLUMNS(COLUMNS), .PAKG_SIZE(PAKG_SIZE), .FIFO_DEPTH(FIFO_DEPTH)) my_test;

    mesh_gnrtr #(.ROWS(ROWS), .COLUMS(COLUMNS), .pckg_sz(PAKG_SIZE), .fifo_depth(FIFO_DEPTH), .bdcst({8{1'b1}})) DUT 
    (
        .pndng(_if.pndng),
        .data_out(_if.data_out),
        .popin(_if.popin),
        .pop(_if.pop),
        .data_out_i_in(_if.dato_out_i_in),
        .pndng_i_in(_if.pdng_i_in),
        .clk(_if.clk_i),
        .reset(_if.rst_i)
    );

    always #5 clk_i = ~clk_i;

    initial begin

        my_test = new();
        my_test.vif = _if;

        fork

            my_test.run();
        
        join_none
    end

    
endmodule
