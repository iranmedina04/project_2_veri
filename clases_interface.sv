/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////// 
////// El siguiente archivo posee las las interfaces del puerto DUT y las clases de las transacciones que se
////// utilizarán para comunicarse entre los distintos dispositivos del testbench 
//////
////// Autores:
//////  Irán Medina Aguilar
//////  Ivannia Fernandez Rodriguez
//////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Interfaz de las transacciones 
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


interface mesh_if #(

    parameter ROWS = 4,
    parameter COLUMNS = 4,  
    parameter PAKG_SIZE = 32,
    parameter FIFO_DEPTH = 16

)(

    input logic clk_i

);

// Entradas

    logic rst_i;
    logic pop [ROWS * 2 + COLUMNS * 2] ;
    logic [PAKG_SIZE - 1 : 0] dato_out_i_in [ROWS * 2 + COLUMNS * 2];
    logic pdng_i_in [ROWS * 2 + COLUMNS * 2];

// Salidas

    logic pndng  [ROWS * 2 + COLUMNS * 2];
    logic [PAKG_SIZE - 1 : 0] data_out [ROWS * 2 + COLUMNS * 2];
    logic popin [ROWS * 2 + COLUMNS * 2];

endinterface


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Transacción de envio
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class trans_mesh #(

    parameter PAKG_SIZE = 32

);

    logic [7 : 0] next_jump;
    rand logic [3: 0]  row;
    rand logic [3 : 0] colum;
    rand logic mode;
    rand logic [PAKG_SIZE - 18 : 0] payload;
    logic [PAKG_SIZE - 1 : 0] pckg;
    rand int terminal_envio;
    int tiempo_envio;
    int tiempo_recibido;
    int terminal_recibido; 
    
    constraint c1 {row < 6 ; row >= 0;}
    constraint c2 {colum < 6 ; colum >= 0;}
    constraint c3 {mode >= 0; mode < 2;}
  	constraint c4 {terminal_envio >= 0 ; terminal_envio < 16;}

    // Funcion de inicialización del objeto

    function  new();

        this.next_jump = 0;
        this.row = 0;
        this.colum = 0;
        this.mode = 0;
        this.payload = 0;
        this.pckg = 0;
        this.terminal_envio = 0;
        this.tiempo_envio = 0;
        this.tiempo_recibido = 0;
        this.terminal_recibido = 0;
        
    endfunction

    // Funcion de calculo del paquete
    
    function  fun_pckg;

        this.pckg = {this.next_jump,this.row,this.colum,this.mode,this.payload};
        
    endfunction

    function print();

      $display("El paquete posee los siguiente elementos:");
      $display("Nex jump: %h \nRow: %h \nColum: %h \nMode: %h \nPayload: %h \nPackage: %h \nTerminal Envio: %g \nTiempo envio: %g \nTerminal recibido: %g \nTiempo recibido: %g \n",
        
        this.next_jump,
        this.row,
        this.colum,
        this.mode,
        this.payload,
        this.pckg,
        this.terminal_envio,
        this.tiempo_envio,
        this.tiempo_recibido,
        this.terminal_recibido
        
       );
        
    endfunction

    typedef mailbox #(trans_mesh) trans_mesh_mbx;


endclass