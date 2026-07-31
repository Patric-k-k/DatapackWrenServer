<?php

if ($_GET["passcode"] != "9828") {
    die;
}

file_put_contents("./script.wren",$_GET["code"]);

echo shell_exec("gcc ./main.c -lwren -Iinclude -o ./test");
echo shell_exec("./test > output.txt");

echo file_get_contents("./output.txt");
?>