/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////// 
////// El siguiente archivo corresponde al scoreboard. Este alamcena todos las transacciones realizadas. .
////// Además, será el encargado de calcular la ruta que cada paquete segurá, así como de realizar los reportes de 
////// de las transacciones realizadas, tiempo promedio, y ancho de banda.
//////
////// Autores:
//////  Irán Medina Aguilar
//////  Ivannia Fernandez Rodriguez
//////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class scoreboard #(

    parameter ROWS = 4,
    parameter COLUMNS = 4,  
    parameter PAKG_SIZE = 32,
    parameter FIFO_DEPTH = 16

);

    trans_mesh #(.PAKG_SIZE(PAKG_SIZE)) transaccion_agente;
    trans_mesh #(.PAKG_SIZE(PAKG_SIZE)) transacciones_agente [$];
    trans_mesh #(.PAKG_SIZE(PAKG_SIZE)) transacciones_checker [$];

    task run ();
        
        forever begin
            
            #1;

            if()

        end

    endtask;
    

endclass