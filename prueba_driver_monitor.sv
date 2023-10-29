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


module testbench();

    reg clk_i = 0;

    parameter ROWS = 4;
    parameter COLUMNS = 4;  
    parameter PAKG_SIZE = 32;
    parameter FIFO_DEPTH = 16;

    driver #(.ROWS(ROWS), .COLUMNS(COLUMNS), .PAKG_SIZE(PAKG_SIZE), .FIFO_DEPTH(FIFO_DEPTH)) my_drivers [15 :0];

    monitor #(.ROWS(ROWS), .COLUMNS(COLUMNS), .PAKG_SIZE(PAKG_SIZE), .FIFO_DEPTH(FIFO_DEPTH) ) my_monitors [15 :0];

    monitor_interno #(.ROWS(ROWS), .COLUMNS(COLUMNS), .PAKG_SIZE(PAKG_SIZE), .FIFO_DEPTH(FIFO_DEPTH) ) my_monitor_intern;

    // Transacciones

    trans_mesh #(.PAKG_SIZE(PAKG_SIZE)) transaccion_envio;

    trans_mesh #(.PAKG_SIZE(PAKG_SIZE)) transaccion_recibido;

    trans_mesh #(.PAKG_SIZE(PAKG_SIZE)) transaccion_interna;

    // Mailboxes

    trans_mbx #(.PAKG_SIZE(PAKG_SIZE)) agent_to_drivers_mbx [15 : 0];

    trans_mbx #(.PAKG_SIZE(PAKG_SIZE)) monitor_to_checker_mbx;

    trans_mbx #(.PAKG_SIZE(PAKG_SIZE)) monitor_interno_mbx; 
    
    // Interfaces

    int recibidos = 0;

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

         monitor_to_checker_mbx = new();
         monitor_interno_mbx = new();
         my_monitor_intern = new();
         my_monitor_intern.transaccion_monitor_interno_mbx = monitor_interno_mbx;
         my_monitor_intern.vif = _if;

        for (int i = 0; i < 16; ++i) begin
            
            my_drivers[i] = new(.id(i));
            my_monitors[i] = new(.id(i));
            agent_to_drivers_mbx[i] = new();
           
            my_drivers[i].agnt_drv_mbx = agent_to_drivers_mbx[i];
            my_monitors[i].mon_chckr_mbx = monitor_to_checker_mbx;
            my_drivers[i].vif = _if;
            my_monitors[i].vif = _if;

        end

        for (int i=0; i < 16; ++i) begin

            fork

                automatic int terminales = i;

                begin

                    my_drivers[terminales].run();


                end  

                begin

                    my_monitors[terminales].run();

                end
  
            join_none
            
        end

        fork

            my_monitor_intern.run();
            
        join_none

        @(posedge clk_i);
        @(posedge clk_i);
        @(posedge clk_i);
        @(posedge clk_i);

        for (int i=0; i<1; ++i) begin
                   
                    transaccion_envio = new();   
                    transaccion_envio.randomize();
                    transaccion_envio.terminal_envio = 4;
                    transaccion_envio.row = 4;
                    transaccion_envio.colum = 5;
                    transaccion_envio.fun_pckg();
                    transaccion_envio.fun_ruta();
                    $display("Transacción Enviada\n");
                    transaccion_envio.print();
                    agent_to_drivers_mbx[i].put(transaccion_envio);

        end

        while (recibidos < 1) begin
            
            while(monitor_to_checker_mbx.num() < 1)begin
                //$display("Esperando transaccion\n");
                @(posedge clk_i);
            end

            $display("Transacción Recibida %g\n", recibidos);
            transaccion_envio = new(); 
            monitor_to_checker_mbx.get(transaccion_envio);
            transaccion_envio.print();
            recibidos = recibidos + 1;

        end

        @(posedge clk_i);

        while (monitor_interno_mbx.num() > 0) begin

            transaccion_interna = new();
            monitor_interno_mbx.get(transaccion_interna);
            $display("Salida de la ruta");
            transaccion_interna.print();
            
        end


        $finish;            
           



    end

    
endmodule
