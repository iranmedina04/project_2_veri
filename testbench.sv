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


module testbench();

    reg clk_i = 0;

    parameter ROWS = 4;
    parameter COLUMNS = 4;  
    parameter PAKG_SIZE = 32;
    parameter FIFO_DEPTH = 16;

    ambiente #(.ROWS(ROWS), .COLUMNS(COLUMNS), .PAKG_SIZE(PAKG_SIZE), .FIFO_DEPTH(FIFO_DEPTH)) my_ambiente;

    instrucciones_agente instrucciones_agente;


    test_agente_mbx test_agente_mbx;



    mesh_if #(

    .ROWS(ROWS),
    .COLUMNS(COLUMNS),  
    .PAKG_SIZE(PAKG_SIZE),
    .FIFO_DEPTH(FIFO_DEPTH)

    ) _if (

        .clk_i(clk_i)

    );

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

      
        my_ambiente = new();
        my_ambiente.vif = _if;
        test_agente_mbx = new();
        my_ambiente.test_agente_mbx = test_agente_mbx;
        my_ambiente.virtualc();
        
        fork
            
            my_ambiente.run();

        join_none

        repeat (10) begin
        
            @(posedge _if.clk_i);
        
        end

        instrucciones_agente = un_paquete;
        test_agente_mbx.put(instrucciones_agente);

        repeat (10000) begin
        
            @(posedge _if.clk_i);
        
        end

        instrucciones_test_sb = reporte;

        test_sb_mbx.put(instrucciones_test_sb);

        repeat (10) begin
        
            @(posedge _if.clk_i);
        
        end

    end

    
endmodule
