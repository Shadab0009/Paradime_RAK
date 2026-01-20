set_distribute_host -local -timeout 60
set_multi_cpu_usage -localCpu 4 -remoteHost 2 -cpuPerRemoteHost 2
set_distribute_mmmc_mode -eco true

set eco_setup_view_list {func_slow_RCMAX func_slow_RCMIN}
set eco_hold_view_list {func_slow_RCMAX func_slow_RCMIN}
  
distribute_design_views -design_script ../scripts/sta_full_analysis_logical.tcl -out_dir fullAnalysis_mode2 -views [list  func_slow_RCMAX func_slow_RCMIN] -analysis_script ../scripts/sta.tcl -save_design all

set_eco_opt_mode -retime path_slew_propagation
set_eco_opt_mode -allow_multiple_incremental true
set_eco_opt_mode -verbose true
eco_opt_design -setup
eco_opt_design -hold
eco_opt_design -drv
eco_opt_design -power
eco_opt_design -area




