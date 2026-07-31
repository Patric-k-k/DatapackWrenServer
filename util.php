<?php
function get_server_memory_usage(){

    $free = shell_exec('free');
    $free = (string)trim($free);
    $free_arr = explode("\n", $free);
    $mem = explode(" ", $free_arr[1]);
    $mem = array_filter($mem);
    $mem = array_merge($mem);
    $memory_usage = $mem[2]/$mem[1]*100;

    return $memory_usage;
}

function get_server_cpu_usage(){

    $load = sys_getloadavg();
    return $load[0];

}

#echo "CPU: " . floor(get_server_cpu_usage());
#echo file_get_contents("util");
#shell_exec(<<<EOD
#echo "CPU Usage: "$[100-$(vmstat 1 2|tail -1|awk '{print $15}')]"%" > ./util.txt
#EOD);
#echo file_get_contents("./util.txt");
echo "RAM: " . floor(get_server_memory_usage()) . "%";

?>