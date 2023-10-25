/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////// 
////// El siguiente archivo corresponde al monitor. Este controla todo lo realacionado a la recepcion de los 
////// paquetes.
//////
////// Autores:
//////  Irán Medina Aguilar
//////  Ivannia Fernandez Rodriguez
//////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


class monitor #(

    parameter ROWS = 4,
    parameter COLUMNS = 4,  
    parameter PAKG_SIZE = 32,
    parameter FIFO_DEPTH = 16

);

     // Objeto fifo de salida en lo cual se almacenarán los paquetes recibidos

    sim_fifo fifo_salida;

    // Constantes necesarias para el funcionamiento

    int id_terminal;

    // Transacciones que se utilizarán para los datos recibidos

    trans_mesh #(.PAKG_SIZE(PAKG_SIZE)) transaccion_checker; 

    // Mailboxes que se utilizarán para enviar datos al checker

    trans_mbx #(.PAKG_SIZE(PAKG_SIZE)) mon_chckr_mbx;

    // Interfaz virutal que controlará el sistema

    virtual mesh_if #(

        .ROWS(ROWS),
        .COLUMNS(COLUMNS),
        .PAKG_SIZE(PAKG_SIZE),
        .FIFO_DEPTH(FIFO_DEPTH) 
    
    ) vif;

    // Inicializacón de los monitores

    function  new (int id);

        fifo_salida = new();
        transaccion_checker = new();
        $display("Se creo el checker con el id: %g", id);
        this.id_terminal = id;
        
    endfunction

    task run();

        vif.pop[id_terminal] = '0;

        forever begin

            @(posedge vif.clk_i);

            if (vif.pndng[id_terminal]) begin

                transaccion_checker = new();
                transaccion_checker.tiempo_recibido = $time;
                transaccion_checker.terminal_recibido = id_terminal;
                transaccion_checker.pckg = vif.data_out[id_terminal];
                fifo_salida.push(transaccion_checker.pckg);
                mon_chckr_mbx.put(transaccion_checker);
                vif.pop[id_terminal] = '1;
                @(posedge vif.clk_i);
                vif.pop[id_terminal] = '0;

            end

        end
        
    endtask



endclass