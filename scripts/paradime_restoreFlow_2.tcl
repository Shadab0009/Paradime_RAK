set_distribute_host -local -timeout 60
set_multi_cpu_usage -localCpu 4 -remoteHost 2 -cpuPerRemoteHost 2
    
set_distribute_mmmc_mode -eco true   
set_distribute_mmmc_mode -merge_view_definitions
set eco_setup_view_list {func_slow_RCMAX func_slow_RCMIN}
set eco_hold_view_list {func_slow_RCMAX func_slow_RCMIN}
set eco_def_file_list "../design/full.def"
set eco_lef_file_list "../libs/lef/FreePDK45_lib_v1.0.lef ../libs/MACRO/LEF/pllclk.lef ../libs/MACRO/LEF/ram_256X16A.lef ../libs/MACRO/LEF/rom_512x16A.lef"

distribute_read_design -restore_design {view1_physical view2_physical} -outdir restore_mode3 


set_eco_opt_mode -retime path_slew_propagation
set_eco_opt_mode -allow_multiple_incremental true
set_eco_opt_mode -verbose true
eco_opt_design -setup
eco_opt_design -hold
eco_opt_design -drv
eco_opt_design -power
eco_opt_design -area



