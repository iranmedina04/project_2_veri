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

            if ($root.testbench.DUT._rw_[1]._clm_[1].rtr._nu_[0].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 1;
                transaccion_monitor_interno.colum = 1;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[1]._clm_[1].rtr._nu_[0].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[1]._clm_[1].rtr._nu_[1].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 1;
                transaccion_monitor_interno.colum = 1;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[1]._clm_[1].rtr._nu_[1].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[1]._clm_[1].rtr._nu_[2].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 1;
                transaccion_monitor_interno.colum = 1;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[1]._clm_[1].rtr._nu_[2].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[1]._clm_[1].rtr._nu_[3].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 1;
                transaccion_monitor_interno.colum = 1;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[1]._clm_[1].rtr._nu_[3].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[1]._clm_[2].rtr._nu_[0].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 1;
                transaccion_monitor_interno.colum = 2;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[1]._clm_[2].rtr._nu_[0].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[1]._clm_[2].rtr._nu_[1].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 1;
                transaccion_monitor_interno.colum = 2;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[1]._clm_[2].rtr._nu_[1].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[1]._clm_[2].rtr._nu_[2].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 1;
                transaccion_monitor_interno.colum = 2;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[1]._clm_[2].rtr._nu_[2].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[1]._clm_[2].rtr._nu_[3].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 1;
                transaccion_monitor_interno.colum = 2;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[1]._clm_[2].rtr._nu_[3].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[1]._clm_[3].rtr._nu_[0].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 1;
                transaccion_monitor_interno.colum = 3;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[1]._clm_[3].rtr._nu_[0].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[1]._clm_[3].rtr._nu_[1].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 1;
                transaccion_monitor_interno.colum = 3;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[1]._clm_[3].rtr._nu_[1].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[1]._clm_[3].rtr._nu_[2].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 1;
                transaccion_monitor_interno.colum = 3;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[1]._clm_[3].rtr._nu_[2].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[1]._clm_[3].rtr._nu_[3].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 1;
                transaccion_monitor_interno.colum = 3;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[1]._clm_[3].rtr._nu_[3].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[1]._clm_[4].rtr._nu_[0].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 1;
                transaccion_monitor_interno.colum = 4;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[1]._clm_[4].rtr._nu_[0].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[1]._clm_[4].rtr._nu_[1].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 1;
                transaccion_monitor_interno.colum = 4;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[1]._clm_[4].rtr._nu_[1].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[1]._clm_[4].rtr._nu_[2].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 1;
                transaccion_monitor_interno.colum = 4;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[1]._clm_[4].rtr._nu_[2].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[1]._clm_[4].rtr._nu_[3].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 1;
                transaccion_monitor_interno.colum = 4;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[1]._clm_[4].rtr._nu_[3].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[2]._clm_[1].rtr._nu_[0].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 2;
                transaccion_monitor_interno.colum = 1;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[2]._clm_[1].rtr._nu_[0].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[2]._clm_[1].rtr._nu_[1].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 2;
                transaccion_monitor_interno.colum = 1;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[2]._clm_[1].rtr._nu_[1].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[2]._clm_[1].rtr._nu_[2].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 2;
                transaccion_monitor_interno.colum = 1;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[2]._clm_[1].rtr._nu_[2].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[2]._clm_[1].rtr._nu_[3].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 2;
                transaccion_monitor_interno.colum = 1;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[2]._clm_[1].rtr._nu_[3].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[2]._clm_[2].rtr._nu_[0].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 2;
                transaccion_monitor_interno.colum = 2;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[2]._clm_[2].rtr._nu_[0].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[2]._clm_[2].rtr._nu_[1].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 2;
                transaccion_monitor_interno.colum = 2;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[2]._clm_[2].rtr._nu_[1].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[2]._clm_[2].rtr._nu_[2].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 2;
                transaccion_monitor_interno.colum = 2;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[2]._clm_[2].rtr._nu_[2].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[2]._clm_[2].rtr._nu_[3].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 2;
                transaccion_monitor_interno.colum = 2;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[2]._clm_[2].rtr._nu_[3].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[2]._clm_[3].rtr._nu_[0].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 2;
                transaccion_monitor_interno.colum = 3;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[2]._clm_[3].rtr._nu_[0].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[2]._clm_[3].rtr._nu_[1].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 2;
                transaccion_monitor_interno.colum = 3;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[2]._clm_[3].rtr._nu_[1].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[2]._clm_[3].rtr._nu_[2].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 2;
                transaccion_monitor_interno.colum = 3;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[2]._clm_[3].rtr._nu_[2].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[2]._clm_[3].rtr._nu_[3].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 2;
                transaccion_monitor_interno.colum = 3;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[2]._clm_[3].rtr._nu_[3].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[2]._clm_[4].rtr._nu_[0].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 2;
                transaccion_monitor_interno.colum = 4;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[2]._clm_[4].rtr._nu_[0].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[2]._clm_[4].rtr._nu_[1].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 2;
                transaccion_monitor_interno.colum = 4;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[2]._clm_[4].rtr._nu_[1].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[2]._clm_[4].rtr._nu_[2].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 2;
                transaccion_monitor_interno.colum = 4;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[2]._clm_[4].rtr._nu_[2].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[2]._clm_[4].rtr._nu_[3].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 2;
                transaccion_monitor_interno.colum = 4;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[2]._clm_[4].rtr._nu_[3].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[3]._clm_[1].rtr._nu_[0].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 3;
                transaccion_monitor_interno.colum = 1;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[3]._clm_[1].rtr._nu_[0].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[3]._clm_[1].rtr._nu_[1].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 3;
                transaccion_monitor_interno.colum = 1;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[3]._clm_[1].rtr._nu_[1].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[3]._clm_[1].rtr._nu_[2].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 3;
                transaccion_monitor_interno.colum = 1;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[3]._clm_[1].rtr._nu_[2].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[3]._clm_[1].rtr._nu_[3].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 3;
                transaccion_monitor_interno.colum = 1;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[3]._clm_[1].rtr._nu_[3].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[3]._clm_[2].rtr._nu_[0].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 3;
                transaccion_monitor_interno.colum = 2;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[3]._clm_[2].rtr._nu_[0].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[3]._clm_[2].rtr._nu_[1].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 3;
                transaccion_monitor_interno.colum = 2;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[3]._clm_[2].rtr._nu_[1].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[3]._clm_[2].rtr._nu_[2].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 3;
                transaccion_monitor_interno.colum = 2;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[3]._clm_[2].rtr._nu_[2].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[3]._clm_[2].rtr._nu_[3].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 3;
                transaccion_monitor_interno.colum = 2;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[3]._clm_[2].rtr._nu_[3].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[3]._clm_[3].rtr._nu_[0].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 3;
                transaccion_monitor_interno.colum = 3;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[3]._clm_[3].rtr._nu_[0].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[3]._clm_[3].rtr._nu_[1].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 3;
                transaccion_monitor_interno.colum = 3;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[3]._clm_[3].rtr._nu_[1].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[3]._clm_[3].rtr._nu_[2].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 3;
                transaccion_monitor_interno.colum = 3;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[3]._clm_[3].rtr._nu_[2].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[3]._clm_[3].rtr._nu_[3].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 3;
                transaccion_monitor_interno.colum = 3;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[3]._clm_[3].rtr._nu_[3].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[3]._clm_[4].rtr._nu_[0].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 3;
                transaccion_monitor_interno.colum = 4;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[3]._clm_[4].rtr._nu_[0].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[3]._clm_[4].rtr._nu_[1].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 3;
                transaccion_monitor_interno.colum = 4;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[3]._clm_[4].rtr._nu_[1].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[3]._clm_[4].rtr._nu_[2].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 3;
                transaccion_monitor_interno.colum = 4;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[3]._clm_[4].rtr._nu_[2].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[3]._clm_[4].rtr._nu_[3].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 3;
                transaccion_monitor_interno.colum = 4;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[3]._clm_[4].rtr._nu_[3].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[4]._clm_[1].rtr._nu_[0].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 4;
                transaccion_monitor_interno.colum = 1;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[4]._clm_[1].rtr._nu_[0].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[4]._clm_[1].rtr._nu_[1].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 4;
                transaccion_monitor_interno.colum = 1;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[4]._clm_[1].rtr._nu_[1].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[4]._clm_[1].rtr._nu_[2].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 4;
                transaccion_monitor_interno.colum = 1;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[4]._clm_[1].rtr._nu_[2].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[4]._clm_[1].rtr._nu_[3].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 4;
                transaccion_monitor_interno.colum = 1;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[4]._clm_[1].rtr._nu_[3].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[4]._clm_[2].rtr._nu_[0].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 4;
                transaccion_monitor_interno.colum = 2;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[4]._clm_[2].rtr._nu_[0].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[4]._clm_[2].rtr._nu_[1].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 4;
                transaccion_monitor_interno.colum = 2;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[4]._clm_[2].rtr._nu_[1].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[4]._clm_[2].rtr._nu_[2].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 4;
                transaccion_monitor_interno.colum = 2;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[4]._clm_[2].rtr._nu_[2].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[4]._clm_[2].rtr._nu_[3].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 4;
                transaccion_monitor_interno.colum = 2;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[4]._clm_[2].rtr._nu_[3].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[4]._clm_[3].rtr._nu_[0].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 4;
                transaccion_monitor_interno.colum = 3;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[4]._clm_[3].rtr._nu_[0].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[4]._clm_[3].rtr._nu_[1].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 4;
                transaccion_monitor_interno.colum = 3;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[4]._clm_[3].rtr._nu_[1].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[4]._clm_[3].rtr._nu_[2].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 4;
                transaccion_monitor_interno.colum = 3;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[4]._clm_[3].rtr._nu_[2].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[4]._clm_[3].rtr._nu_[3].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 4;
                transaccion_monitor_interno.colum = 3;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[4]._clm_[3].rtr._nu_[3].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[4]._clm_[4].rtr._nu_[0].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 4;
                transaccion_monitor_interno.colum = 4;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[4]._clm_[4].rtr._nu_[0].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[4]._clm_[4].rtr._nu_[1].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 4;
                transaccion_monitor_interno.colum = 4;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[4]._clm_[4].rtr._nu_[1].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[4]._clm_[4].rtr._nu_[2].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 4;
                transaccion_monitor_interno.colum = 4;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[4]._clm_[4].rtr._nu_[2].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end

            if ($root.testbench.DUT._rw_[4]._clm_[4].rtr._nu_[3].rtr_ntrfs_.popin) begin 
                $display("Estoy poniendo una transaccion");
                transaccion_monitor_interno = new(); 
                transaccion_monitor_interno.row = 4;
                transaccion_monitor_interno.colum = 4;
                transaccion_monitor_interno.terminal_recibido = {transaccion_monitor_interno.row,transaccion_monitor_interno.colum};
                transaccion_monitor_interno.pckg = $root.testbench.DUT._rw_[4]._clm_[4].rtr._nu_[3].rtr_ntrfs_.data_out_i_in;
                transaccion_monitor_interno_mbx.put(transaccion_monitor_interno);
            end


            
            end
                
        
    endtask


endclass