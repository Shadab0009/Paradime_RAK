set_multi_cpu_usage -localCpu 16
read_lib -lef {../libs/lef/FreePDK45_lib_v1.0.lef ../libs/MACRO/LEF/pllclk.lef ../libs/MACRO/LEF/ram_256X16A.lef ../libs/MACRO/LEF/rom_512x16A.lef}
read_view_definition ../design/viewDefinition_view2.tcl
read_verilog "../design/ECO_INIT_11_optSetup.enc.dat/dtmf_recvr_core.v.gz" ; 

set_top_module dtmf_recvr_core 
read_def "../design/full.def"
read_spef -rc_corner corner_worst_RCMIN "../design/SPEF/corner_worst_RCMIN.spef.gz"
save_design view2_physical 



