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
    logic [8:0] ruta [$];
    rand int terminal_envio;
    int tiempo_envio;
    int tiempo_recibido;
    int terminal_recibido; 
    logic [7:0] posicion_actual;
    logic [3: 0]  row2;
    logic [3 : 0] colum2;
    int row_target;
    int colum_target;
    
    constraint c1 {row < 6 ; row >= 0;}
    constraint c2 { row == 0 -> colum < 6 ; row == 0 -> colum >= 0; row == 5 -> colum < 6 ; row == 5 -> colum >= 0;  row != 0 -> colum == 0 ; row != 0 -> colum == 5;}
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
        this.posicion_actual = 0;
        
    endfunction

    // Funcion de calculo del paquete
    
    function  fun_pckg();

        this.pckg = {this.next_jump,this.row,this.colum,this.mode,this.payload};
        
    endfunction

    function print();

      $display("El paquete posee los siguiente elementos:");
      $display("Nex jump: %h \nRow: %h \nColum: %h \nMode: %h \nPayload: %h \nPackage: %h \nTerminal Envio: %g \nTiempo envio: %g \nTerminal recibido: %g \nTiempo recibido: %g \n Ruta:  \n",
        
        this.next_jump,
        this.row,
        this.colum,
        this.mode,
        this.payload,
        this.pckg,
        this.terminal_envio,
        this.tiempo_envio,
        this.terminal_recibido,
        this.tiempo_recibido,
        this.ruta
        
      );
        
    endfunction

    function fun_ruta();

        case (terminal_envio)
            0: begin
                
                this.posicion_actual = {4'd1, 4'd1};
                ruta.push_back(posicion_actual);

            end
            1: begin

                posicion_actual = {4'd1, 4'd2};
                ruta.push_back(posicion_actual);

            end
            2: begin

                posicion_actual = {4'd1, 4'd3};
                ruta.push_back(posicion_actual);

            end
            3: begin

                posicion_actual = {4'd1, 4'd4};
                ruta.push_back(posicion_actual);

            end
            4: begin

                posicion_actual = {4'd1, 4'd1};
                ruta.push_back(posicion_actual);

            end
            5: begin

                posicion_actual = {4'd2, 4'd1};
                ruta.push_back(posicion_actual);

            end
            6: begin

                posicion_actual = {4'd3, 4'd1};
                ruta.push_back(posicion_actual);

            end
            7: begin

                posicion_actual = {4'd4, 4'd1};
                ruta.push_back(posicion_actual);

            end
            8: begin

                posicion_actual = {4'd4, 4'd1};
                ruta.push_back(posicion_actual);

            end
            9: begin

                posicion_actual = {4'd4, 4'd2};
                ruta.push_back(posicion_actual);

            end
            10: begin

                posicion_actual = {4'd4, 4'd3};
                ruta.push_back(posicion_actual);

            end
            11: begin

                posicion_actual = {4'd4, 4'd4};
                ruta.push_back(posicion_actual);

            end
            12: begin

                posicion_actual = {4'd1, 4'd4};
                ruta.push_back(posicion_actual);

            end
            13: begin

                posicion_actual = {4'd2, 4'd4};
                ruta.push_back(posicion_actual);

            end
            14: begin

                posicion_actual = {4'd3, 4'd4};
                ruta.push_back(posicion_actual);

            end
            15: begin

                posicion_actual = {4'd4, 4'd4};
                ruta.push_back(posicion_actual);

            end
            default: begin

                posicion_actual = posicion_actual;

            end 
        endcase

        case ({row,colum})

            8'h01: begin

                row_target = 1;
                colum_target = 1;

            end
            8'h02: begin

                row_target = 1;
                colum_target = 2;

            end
            8'h03: begin
               
                row_target = 1;
                colum_target = 3;

            end
            8'h04: begin

                row_target = 1;
                colum_target = 4;

            end
            8'h10: begin

            row_target = 1;
            colum_target = 1;

            end
            8'h20: begin

                row_target = 2;
                colum_target = 1;

            end
            8'h30: begin

                row_target = 3;
                colum_target = 1;

            end
            8'h40: begin

                row_target = 4;
                colum_target = 1;

            end
            8'h15: begin

                row_target = 1;
                colum_target = 4;

            end
            8'h25: begin

                row_target = 2;
                colum_target = 4;

            end
            8'h35: begin

                row_target = 3;
                colum_target = 4;

            end
            8'h45: begin

                row_target = 4;
                colum_target = 4;

            end
            8'h51: begin

                row_target = 4;
                colum_target = 1;

            end
            8'h52: begin

                row_target = 4;
                colum_target = 2;

            end
            8'h53: begin

                row_target = 4;
                colum_target = 3;

            end
            8'h54: begin
                
                row_target = 4;
                colum_target = 4;

            end
            default: begin

                posicion_actual = posicion_actual;

            end 
        endcase        

        if (mode) begin
            
            if (posicion_actual[3:0] != colum_target) begin
            while (posicion_actual[3:0] != colum_target) begin
                while (posicion_actual[7:4] != row_target) begin

                    if (posicion_actual[7:4] < row) begin

                        row2 = posicion_actual[7:4] + 1'b1;
                        posicion_actual[7:4] = row2;
                        ruta.push_back(posicion_actual);
                        
                    end else begin
                        
                        row2 = posicion_actual[7:4] - 1'b1;    
                        posicion_actual[7:4] = row2;
                        ruta.push_back(posicion_actual);
                        
                    end

                end    

                if (posicion_actual[3:0] < row) begin

                    row2 = posicion_actual[3:0] + 1'b1;
                    posicion_actual[3:0] = row2;
                    ruta.push_back(posicion_actual);
                        
                end else begin
                        
                    row2 = posicion_actual[3:0] - 1'b1;    
                    posicion_actual[3:0] = row2;
                    ruta.push_back(posicion_actual);
                        
                end    

            end
            end
            else begin

                while (posicion_actual[7:4] != row_target) begin

                    if (posicion_actual[7:4] < row) begin

                        row2 = posicion_actual[7:4] + 1'b1;
                        posicion_actual[7:4] = row2;
                        ruta.push_back(posicion_actual);
                        
                    end else begin
                        
                        row2 = posicion_actual[7:4] - 1'b1;    
                        posicion_actual[7:4] = row2;
                        ruta.push_back(posicion_actual);
                        
                    end

                end 


            end

        end
        else begin

            if  (posicion_actual[7:4] != row_target) begin
                while (posicion_actual[7:4] != row_target) begin
                    while (posicion_actual[3:0] != colum_target) begin

                        if (posicion_actual[3:0] < colum) begin

                            row2 = posicion_actual[3:0] + 1'b1;
                            posicion_actual[3:0] = row2;
                            ruta.push_back(posicion_actual);
                                
                        end else begin
                                
                            row2 = posicion_actual[3:0] - 1'b1;    
                            posicion_actual[3:0] = row2;
                            ruta.push_back(posicion_actual);
                                
                        end

                        end    

                        if (posicion_actual[7:4] < row) begin

                            row2 = posicion_actual[7:4] + 1'b1;
                            posicion_actual[7:4] = row2;
                            ruta.push_back(posicion_actual);
                                
                        end else begin
                                
                            row2 = posicion_actual[7:4] - 1'b1;    
                            posicion_actual[7:4] = row2;
                            ruta.push_back(posicion_actual);
                                
                        end    

                    end            
            end
            else begin

                while (posicion_actual[3:0] != colum_target) begin

                    if (posicion_actual[3:0] < colum) begin

                        row2 = posicion_actual[3:0] + 1'b1;
                        posicion_actual[3:0] = row2;
                        ruta.push_back(posicion_actual);
                                
                    end else begin
                                
                        row2 = posicion_actual[3:0] - 1'b1;    
                        posicion_actual[3:0] = row2;
                        ruta.push_back(posicion_actual);
                                
                    end

                end 

            end

        end
        

    endfunction


endclass

typedef mailbox #(trans_mesh) trans_mbx;