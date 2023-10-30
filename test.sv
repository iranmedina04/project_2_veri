//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////// 
////// El siguiente archivo posee el test donde este se encarga de enviar cada una de las transacciones al agente  y
////// además aquí se realiza la instancia del ambiente, donde este recibe la instrucción para iniciar desde el testbench
//////
////// Autores:
//////  Irán Medina Aguilar
//////  Ivannia Fernandez Rodriguez
//////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class test #(   parameter ROWS = 4, 
                parameter COLUMNS = 4,
                parameter PAKG_SIZE = 32,
                parameter FIFO_DEPTH = 16);

//Definición de los mailboxes
test_agente_mbx test_agnt_mbx;
test_sb_mbx test_sb_mbx;

//Definición de instrucciones
instrucciones_agente instr_agnt;
instrucciones_test_sb instr_test_sb;

//Definición del ambiente de prueba
ambiente #(.ROWS(ROWS), .COLUMNS(COLUMNS), .PAKG_SIZE(PAKG_SIZE), .FIFO_DEPTH(FIFO_DEPTH)) ambiente_inst;

// Definición de la variable virtual
virtual mesh_if #(.ROWS(ROWS), .COLUMNS(COLUMNS), .PAKG_SIZE(PAKG_SIZE), .FIFO_DEPTH(FIFO_DEPTH)) vif;

//Definición de las condiciones iniciales para el test
function new();

//Creación de los mailboxes
test_agnt_mbx = new();
test_sb_mbx = new();

//Creación del ambiente yy conexión de este
ambiente_inst = new();
ambiente_inst.vif = vif;
ambiente_inst.test_sb_mbx = test_sb_mbx;
ambiente_inst.test_agnt_mbx= test_agnt_mbx;

endfunction

task run();

    $display("[%g] El Test fue inicializado",$time);

    fork begin
        ambiente_inst.run();
    end
    join_none

    #1000;

    instr_agnt = un_paquete; //Envío de la primera instrucción
    test_agnt_mbx.put(instr_agnt);
    $display("\nTest: Se envió la primera instrucción al agente envío de un paquete \n");
    repeat(1000)begin

        @(posedge vif.clk_i);

    end

    instr_test_sb = reporte; //Asignación de la instrucción al scoreboard
    test_sb_mbx.put(instr_test_sb); //Envío de la instrucción al mailbox del test al scoreboard
    #10;    
    

    disable fork;


    fork begin
        ambiente_inst.run();
    end
    join_none

    #1000;

    instr_agnt = varios_dispositivos_envio_recibido; //Envío de la primera instrucción
    test_agnt_mbx.put(instr_agnt);
    $display("\nTest: Se envió la segunda instrucción al agente de varios paquetes\n");
    
    
    repeat(10000)begin

        @(posedge vif.clk_i);

    end

    instr_test_sb = reporte; //Asignación de la instrucción al scoreboard
    test_sb_mbx.put(instr_test_sb); //Envío de la instrucción al mailbox del test al scoreboard
    #10;

    disable fork;

    fork begin
        ambiente_inst.run();
    end
    join_none

    #1000;

    instr_agnt = llenado_fifos; //Envío de la primera instrucción
    test_agnt_mbx.put(instr_agnt);
    $display("\nTest: Se envió la tercera instrucción al agente de llenado_fifos\n");
    
    
    repeat(10000)begin

        @(posedge vif.clk_i);

    end

    instr_test_sb = reporte; //Asignación de la instrucción al scoreboard
    test_sb_mbx.put(instr_test_sb); //Envío de la instrucción al mailbox del test al scoreboard
    #10;

    disable fork;

    fork begin
        ambiente_inst.run();
    end
    join_none

    #1000;

    instr_agnt = envio_fuera_de_rango; //Envío de la primera instrucción
    test_agnt_mbx.put(instr_agnt);
    $display("\nTest: Se envió la cuarta instrucción al agente de envio fuera de rango\n");
    
    
    repeat(10000)begin

        @(posedge vif.clk_i);

    end

    instr_test_sb = reporte; //Asignación de la instrucción al scoreboard
    test_sb_mbx.put(instr_test_sb); //Envío de la instrucción al mailbox del test al scoreboard
    #10;

    disable fork;

    fork begin
        ambiente_inst.run();
    end
    join_none

    #1000;

    instr_agnt = reset_inicio; //Envío de la primera instrucción
    test_agnt_mbx.put(instr_agnt);
    $display("\nTest: Se envió la quinta instrucción al agente de envio reset inicio\n");
    
    
    repeat(10000)begin

        @(posedge vif.clk_i);

    end

    instr_test_sb = reporte; //Asignación de la instrucción al scoreboard
    test_sb_mbx.put(instr_test_sb); //Envío de la instrucción al mailbox del test al scoreboard
    #10;

    disable fork;

    fork begin
        ambiente_inst.run();
    end
    join_none

    #1000;

    instr_agnt = reset_mitad; //Envío de la primera instrucción
    test_agnt_mbx.put(instr_agnt);
    $display("\nTest: Se envió la sexta instrucción al agente de envio reset mitad\n");
    
    
    repeat(10000)begin

        @(posedge vif.clk_i);

    end

    instr_test_sb = reporte; //Asignación de la instrucción al scoreboard
    test_sb_mbx.put(instr_test_sb); //Envío de la instrucción al mailbox del test al scoreboard
    #10;

    disable fork;

    fork begin
        ambiente_inst.run();
    end
    join_none

    #1000;

    instr_agnt = reset_final; //Envío de la primera instrucción
    test_agnt_mbx.put(instr_agnt);
    $display("\nTest: Se envió la sétima instrucción al agente de envio reset final\n");
    
    
    repeat(10000)begin

        @(posedge vif.clk_i);

    end

    instr_test_sb = reporte; //Asignación de la instrucción al scoreboard
    test_sb_mbx.put(instr_test_sb); //Envío de la instrucción al mailbox del test al scoreboard
    #10;
  
    $finish;

endtask 


endclass