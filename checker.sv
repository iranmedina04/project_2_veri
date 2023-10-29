class chcker #(

    parameter ROWS = 4,
    parameter COLUMNS = 4,  
    parameter PAKG_SIZE = 32,
    parameter FIFO_DEPTH = 16

);

    virtual mesh_if #(

        .ROWS(ROWS),
        .COLUMNS(COLUMNS),
        .PAKG_SIZE(PAKG_SIZE),
        .FIFO_DEPTH(FIFO_DEPTH) 
    
    ) vif;

    int match;

    // Mailbox para las transacciones que vinen de los monitores

    trans_mbx #(.PAKG_SIZE(PAKG_SIZE)) mon_chckr_mbx;
    trans_mbx #(.PAKG_SIZE(PAKG_SIZE)) transaccion_monitor_interno_mbx;

    // Mailboxes para solicitudes 

    trans_mbx #(.PAKG_SIZE(PAKG_SIZE)) mon_sb_slocitud_final_mbx;
    trans_mbx #(.PAKG_SIZE(PAKG_SIZE)) mon_sb_slocitud_interna_mbx;

    // Mailboxes para respuestas

    trans_mbx #(.PAKG_SIZE(PAKG_SIZE)) mon_sb_slocitud_final_respuesta_final_mbx;
    trans_mbx #(.PAKG_SIZE(PAKG_SIZE)) mon_sb_slocitud_interna_respuesta_mbx;

    // Transacciones monitores al checker

    trans_mesh #(.PAKG_SIZE(PAKG_SIZE)) transaccion_mon_chckr_final;
    trans_mesh #(.PAKG_SIZE(PAKG_SIZE)) transaccion_mon_chckr_intermedio;

    // Transacciones solicitudes

    trans_mesh #(.PAKG_SIZE(PAKG_SIZE)) transaccion_mon_sb_slocitud_final;
    trans_mesh #(.PAKG_SIZE(PAKG_SIZE)) transaccion_mon_sb_slocitud_interna;

    // Transaccion respuesta

    trans_mesh #(.PAKG_SIZE(PAKG_SIZE)) transaccion_mon_sb_slocitud_final_respuesta_final;
    trans_mesh#(.PAKG_SIZE(PAKG_SIZE)) transaccion_mon_sb_slocitud_interna_respuesta;

    task run ();
        
        forever begin
            
            @(posedge vif.clk_i)

            while (transaccion_monitor_interno_mbx.num() > 0) begin
                
                match = 0;

                transaccion_mon_chckr_intermedio = new();
                transaccion_monitor_interno_mbx.get(transaccion_mon_chckr_intermedio);
                mon_sb_slocitud_interna_mbx.put(transaccion_mon_chckr_intermedio); // Salicita un valor al Scoreboard

                while ( mon_sb_slocitud_interna_respuesta_mbx.num() > 0) begin

                    transaccion_mon_sb_slocitud_interna_respuesta = new();
                    mon_sb_slocitud_interna_respuesta_mbx.get(transaccion_mon_sb_slocitud_interna_respuesta); // Espera la respuestas del Scoreboard
                    
                    // Compara los valores necesarios para saber si es parte del ruta, entonces

                    if (transaccion_mon_sb_slocitud_interna_respuesta.pckg[PAKG_SIZE - 9 : 0] == transaccion_mon_chckr_intermedio.pckg[PAKG_SIZE - 9 : 0] ) begin
                                            
                        for (int i=0; i< transaccion_mon_sb_slocitud_interna_respuesta.ruta.size(); ++i) begin
                            
                                if( transaccion_mon_sb_slocitud_interna_respuesta.ruta[i] == transaccion_mon_chckr_intermedio.terminal_recibido) begin
                                    
                                    match = match + 1;

                                end 

                            end

                        if(match < 1)
                        begin
                            
                            $display("Error con el paquete: %h, este no debe pasar por la terminal: %h", transaccion_mon_chckr_intermedio.pckg, transaccion_mon_chckr_intermedio.terminal_recibido);
                            $finish; 

                        end
                        else begin
                            
                            $display("La ruta se esta cumpliendo correctamente");

                        end
                    
                    end
                end
                
            end




        end

    endtask

endclass