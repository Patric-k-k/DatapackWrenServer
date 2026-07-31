<?php

$data = json_decode(file_get_contents('php://input'),true);

if ($data["passcode"] != "9828") {
    die;
}

$script = "";

foreach ($data["pages"] as $page) {
    $script = $script . $page["raw"] . "\n";
}

file_put_contents("./script.cpp",$script);

echo shell_exec("bash ./run.sh > output.txt");

echo file_get_contents("./output.txt");
?>