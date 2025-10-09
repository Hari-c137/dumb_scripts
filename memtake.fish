#!/usr/bin/env fish

function memtake
    set process_name $argv[1]
    set total_mem 0

    # Get process IDs using pgrep
    set pids (pgrep $process_name)

    # Loop through each PID and sum the memory usage
    for pid in $pids
        if test -f /proc/$pid/status
            # Extract the memory usage in kB from the status file
            set mem (grep "VmRSS" /proc/$pid/status | awk '{print $2}')
            set total_mem (math "$total_mem + $mem")
        end
    end

    # Convert memory usage to MB and display the total
    echo (math "$total_mem / 1024")" MB"
end
