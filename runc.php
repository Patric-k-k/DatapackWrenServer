<?php

$data = json_decode(file_get_contents('php://input'),true);

if ($data["passcode"] != "9828") {
    die;
}

$script = "";

foreach ($data["pages"] as $page) {
    $script = $script . $page["raw"] . "\n";
}

file_put_contents("./script.c",$script);

echo shell_exec("bash ./runc.sh > ./output.txt");

sleep(2);

echo file_get_contents("./output.txt");
?>