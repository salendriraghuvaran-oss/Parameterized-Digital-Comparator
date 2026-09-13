create_clock -name virtual_clock -period 10.0

set_input_delay 3.0 -clock virtual_clock [get_ports {A[*] B[*]}]

set_output_delay 2.0 -clock virtual_clock [get_ports {G E L}]
