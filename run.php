<?php

$data = json_decode(file_get_contents('php://input'),true);

if ($data["passcode"] != "9828") {
    die;
}

$script = "";

foreach ($data["pages"] as $page) {
    $script = $script . $page["raw"] . "\n";
}

file_put_contents("./script.wren",$script);

echo shell_exec("bash ./limit.sh compile gcc ./main.c -lwren -Iinclude -o ./test");
echo shell_exec("bash ./limit.sh run ./test > output.txt");

echo file_get_contents("./output.txt");
?>
