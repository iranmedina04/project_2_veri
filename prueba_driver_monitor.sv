
`include "fifo.sv"
`include "Library.sv"
`include "Router_library.sv"
`include "clases_interface.sv"
`include "sim_fifo.sv"
`include "driver.sv"
`include "monitor.sv"




module testbench();

    reg clk_i = 0;

    parameter ROWS = 4;
    parameter COLUMNS = 4;  
    parameter PAKG_SIZE = 32;
    parameter FIFO_DEPTH = 16;

    driver #(.ROWS(ROWS), .COLUMNS(COLUMNS), .PAKG_SIZE(PAKG_SIZE), .FIFO_DEPTH(FIFO_DEPTH)) my_drivers [15 :0];

    monitor #(.ROWS(ROWS), .COLUMNS(COLUMNS), .PAKG_SIZE(PAKG_SIZE), .FIFO_DEPTH(FIFO_DEPTH) ) my_monitors [15 :0];

    // Transacciones

    trans_mesh transaccion_envio;

    trans_mesh transaccion_recibido;

    // Mailboxes

    trans_mbx agent_to_drivers_mbx [15 : 0];

    trans_mbx monitor_to_checker_mbx;
    
    // Interfaces

    mesh_if #(

    .ROWS(ROWS),
    .COLUMNS(COLUMNS),  
    .PAKG_SIZE(PAKG_SIZE),
    .FIFO_DEPTH(FIFO_DEPTH)

    ) _if (

        input logic clk_i

    );

    mesh_gnrtr #(.ROWS(ROWS), .COLUMS(COLUMNS), .pckg_sz(PAKG_SIZE), .fifo_depth(FIFO_DEPTH), .bdcst({8{1'b1}})) DUT 
    (
        .pndng(_if.pndng),
        .data_out(_if.data_out),
        .popin(_if.popin),
        .pop(_if.pop),
        .data_out_i_in(_if.data_out_i_in),
        .pndng_i_in(_if.pndng_i_in),
        .clk(_if.clk_i),
        .reset(_if.rst_i)
    );

    always #5 clk_i = ~clk_i;

    initial begin
        
        for (int i = 0; i < 16; ++i) begin
            
            my_drivers[i] = new(.id(i));
            my_monitors[i] = new(.id(i));
            agent_to_drivers_mbx[i] = new();
            monitor_to_checker_mbx = new();
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
                    my_monitors[terminales].run();

                end  
                begin
                    
                    @(posedge clk_i);
                    @(posedge clk_i);
                    @(posedge clk_i);
                    @(posedge clk_i);
                    transaccion_envio = new();   
                    transaccion_envio.randomize():
                    transaccion_envio.fun_pckg();
                    $display("Transacción Enviada");
                    transaccion_envio.print();
                    @(posedge clk_i);
                    @(posedge clk_i);
                    @(posedge clk_i);
                    @(posedge clk_i);
                    agent_to_drivers_mbx[0].put(transaccion_envio);
                    @(posedge clk_i);
                    @(posedge clk_i);
                    @(posedge clk_i);
                    @(posedge clk_i);
                    @(posedge clk_i);
                    @(posedge clk_i);
                    @(posedge clk_i);
                    @(posedge clk_i);
                    @(posedge clk_i);
                    @(posedge clk_i);
                    @(posedge clk_i);
                    @(posedge clk_i);
                    @(posedge clk_i);
                    @(posedge clk_i);
                    @(posedge clk_i);
                    @(posedge clk_i);
                    transaccion_envio = new(); 
                    $display("Transacción Recibida");
                    monitor_to_checker_mbx.get(transaccion_envio);
                    transaccion_envio.print();
                    @(posedge clk_i);
                    $finish;                    

                end
            join_none
            
        end




    end

    
endmodule
