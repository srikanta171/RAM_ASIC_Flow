# gcd flow pipe cleaner
set path /home/srikanta/OpenROAD/test
source "$path/helpers.tcl"
source "$path/flow_helpers.tcl"
source "$path/Nangate45/Nangate45.vars"

set design "sp_ram"
set top_module "rams_sp_wf"
set synth_verilog "/home/srikanta/Desktop/23ec4223/sp_ram/synthesis/sp_ram_nangate45.v"
set sdc_file "constraints.sdc"
#set die_area {0 0 1000.13 1000.8}
#set core_area {50.07 51.2 950.25 950.8}

#source -echo "$path/flow.tcl"
