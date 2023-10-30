/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////// 
////// El siguiente archivo posee el testbench en el cual se llaman todas las clases creadas y se instancia el dispositivo
////// y se envía la instrucción al agente para que las pruebas empiecen, además aquí se realiza la covertura funcional
//////
////// Autores:
//////  Irán Medina Aguilar
//////  Ivannia Fernandez Rodriguez
//////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


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
`include "clases_interface.sv"
`include "checker.sv"
`include "scoreboard.sv"
`include "agente_generador.sv"
`include "ambiente.sv"
`include "test.sv"
`include "my_package.sv"
`default_nettype none

module test_bench();

    reg clk = 0;

    import my_package::*;

    //Definición de la variable virtual
    mesh_if #(.ROWS(ROWS), .COLUMNS(COLUMNS), .PAKG_SIZE(PAKG_SIZE), .FIFO_DEPTH(FIFO_DEPTH)) _if(.clk_i(clk));
    
    always #5 clk = ~clk;

    //Definición del test
    test #(.ROWS(my_package::ROWS), .COLUMNS(my_package::COLUMNS), .PAKG_SIZE(my_package::PAKG_SIZE), .FIFO_DEPTH(my_package::FIFO_DEPTH)) test_inst;
    
    //Instancia del dispositivo
    mesh_gnrtr #(.ROWS(my_package::ROWS), .COLUMS(my_package::COLUMNS), .pckg_sz(my_package::PAKG_SIZE), .fifo_depth(my_package::FIFO_DEPTH), .bdcst(my_package::BROADCAST)) DUT 
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
   
    //Inicialización del test

    initial begin
       
        
        test_inst = new(); 
        test_inst.vif = _if;
        test_inst.ambiente_inst.vif = _if;
        test_inst.run();
       
    end

    
endmodule