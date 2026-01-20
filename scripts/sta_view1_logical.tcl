set_multi_cpu_usage -localCpu 16
read_view_definition ../design/viewDefinition_view1.tcl
read_verilog "../design/ECO_INIT_11_optSetup.enc.dat/dtmf_recvr_core.v.gz"
set_top_module dtmf_recvr_core
read_spef -rc_corner corner_worst_RCMAX "../design/SPEF/corner_worst_RCMAX.spef.gz"
save_design view1_logical 


