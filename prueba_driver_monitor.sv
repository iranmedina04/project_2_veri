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


module testbench();

    reg clk_i = 0;

    parameter ROWS = 4;
    parameter COLUMNS = 4;  
    parameter PAKG_SIZE = 32;
    parameter FIFO_DEPTH = 16;

    driver #(.ROWS(ROWS), .COLUMNS(COLUMNS), .PAKG_SIZE(PAKG_SIZE), .FIFO_DEPTH(FIFO_DEPTH)) my_drivers [15 :0];

    monitor #(.ROWS(ROWS), .COLUMNS(COLUMNS), .PAKG_SIZE(PAKG_SIZE), .FIFO_DEPTH(FIFO_DEPTH) ) my_monitors [15 :0];

    monitor_interno #(.ROWS(ROWS), .COLUMNS(COLUMNS), .PAKG_SIZE(PAKG_SIZE), .FIFO_DEPTH(FIFO_DEPTH) ) my_monitor_intern;

    chcker #(.ROWS(ROWS), .COLUMNS(COLUMNS), .PAKG_SIZE(PAKG_SIZE), .FIFO_DEPTH(FIFO_DEPTH)) my_chcker;


    // Transacciones

    trans_mesh #(.PAKG_SIZE(PAKG_SIZE)) transaccion_envio;

    trans_mesh #(.PAKG_SIZE(PAKG_SIZE)) transaccion_recibido;

    trans_mesh #(.PAKG_SIZE(PAKG_SIZE)) transaccion_interna;

    // Mailboxes

    trans_mbx #(.PAKG_SIZE(PAKG_SIZE)) agent_to_drivers_mbx [15 : 0];

    trans_mbx #(.PAKG_SIZE(PAKG_SIZE)) monitor_to_checker_mbx;

    trans_mbx #(.PAKG_SIZE(PAKG_SIZE)) monitor_interno_mbx; 

    trans_mesh #(.PAKG_SIZE(PAKG_SIZE)) transaccion_mon_sb_slocitud_interna; // Es del checker

    trans_mbx #(.PAKG_SIZE(PAKG_SIZE)) mon_sb_slocitud_interna_mbx;    

     trans_mbx #(.PAKG_SIZE(PAKG_SIZE)) mon_sb_slocitud_interna_respuesta_mbx;
    
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
         my_chcker = new();
         my_monitor_intern.transaccion_monitor_interno_mbx = monitor_interno_mbx;
         my_chcker.transaccion_monitor_interno_mbx = monitor_interno_mbx;
         mon_sb_slocitud_interna_mbx = new();
         my_chcker.mon_sb_slocitud_interna_mbx = mon_sb_slocitud_interna_mbx;
         mon_sb_slocitud_interna_respuesta_mbx = new();
         my_chcker.mon_sb_slocitud_interna_respuesta_mbx = mon_sb_slocitud_interna_respuesta_mbx;
         my_chcker.mon_chckr_mbx =  monitor_to_checker_mbx;
         my_monitor_intern.vif = _if;
         my_chcker.vif = _if;


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
            my_chcker.run();
            
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
                    agent_to_drivers_mbx[4].put(transaccion_envio);
                    for (int i=0; i<6; ++i) begin
                   
                         mon_sb_slocitud_interna_respuesta_mbx.put(transaccion_envio);

                    end

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

        repeat(100) begin
        
            @(posedge clk_i);
        
        end

        $finish;            
           



    end

    
endmodule
