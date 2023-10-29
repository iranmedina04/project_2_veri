class monitor_interno #(

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


    trans_mesh #(.PAKG_SIZE(PAKG_SIZE)) transaccion_monitor_interno;
    trans_mbx #(.PAKG_SIZE(PAKG_SIZE)) transaccion_monitor_interno_mbx;

    task run();
        $display("El Monitor interno está corriendo \n");
        forever begin
            
            @(posedge vif.clk_i);

            //for (int r=1; r<5; ++r) begin
              //  for (int c=1; c<5; ++c) begin
                //    for (int g=0; g<4; ++g) begin
            $display("En este ciclo de relog el pop in es: %g \n", $root.testbench.DUT._rw_[1]._clm_[1].rtr._nu_[1].rtr_ntrfs_.popin);
            if ($root.testbench.DUT._rw_[1]._clm_[1].rtr._nu_[1].rtr_ntrfs_.popin) begin

                transaccion_monitor_interno = new();
                transaccion_monitor_interno.row = 1;
                transaccion_monitor_interno.colum = 1;
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[1]._clm_[1].rtr._nu_[3].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);

            end 

                  //  end
                //end
            //end 


        end
        
    endtask




endclass