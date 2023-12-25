set_attr init_lib_search_path /home/vlsi1/Downloads/scl_pdk/stdlib/fs120/liberty/lib_flow_ff/
set_attr init_hdl_search_path /home/vlsi1/23EC4224/project/RAM/rtl/
set_attr library tsl18fs120_scl_ff.lib


read_hdl ram.v
elaborate
read_sdc /home/vlsi1/23EC4224/project/RAM/synthesis/constraints.sdc
set_attribute syn_generic_effort high
set_attribute syn_map_effort high
set_attribute syn_opt_effort high


syn_generic
syn_map
syn_opt


write_hdl > ram_netlist.v
write_sdc > ram_sdc.sdc
report_area > area_fast.txt
report_power > power_fast.txt
report_timing > timing_fast.txt
