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

        forever begin
            
            @(posedge vig.clk_i);

            for (int r=1; r<5; ++i) begin
                for (int c=1; c<5; ++c) begin
                    for (int g=0; g<4; ++g) begin

                       if ($root.testbench.DUT._rw_[r]._clm_[c].rtr._nu_[g].rtr_ntrfs_.popin) begin

                            transaccion_monitor_interno = new();
                            transaccion_monitor_interno.row = r;
                            transaccion_monitor_interno.colum = c;
                            transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[r]._clm_[c].rtr._nu_[g].rtr_ntrfs_.data_out_i_in;
                            transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);

                       end 

                    end
                end
            end 


        end
        
    endtask




endclass