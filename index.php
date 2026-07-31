<!doctype html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
</head>
<body class="bg-zinc-900">
<p class="text-3xl font-bold underline text-white text-center">
this is a <span class="text-green-500">horrible idea</span>.
</p>
<p class="text-white text-center">Arbitrary Code Execution intended!<span class="text-red-500">*</span></p>
<p class="text-red-500/25 text-center text-sm">*but not in a dangerous way</p>

<br><br><br>
<p class="text-white text-center">Last Ran Wren Code:</p>
<p class="text-white"><?php echo htmlspecialchars(str_replace("\n","<br>",file_get_contents("./script.wren"))) ?></p>
<br>
<p class="text-white text-center">Wren Output:</p>
<p class="text-white"><?php echo htmlspecialchars(file_get_contents("./output.txt")) ?></p>
<br><br><br>
<p class="text-white text-center">Last Ran C++ Code:</p>
<p class="text-white"><?php echo htmlspecialchars(str_replace("\n","<br>",file_get_contents("./script.cpp"))) ?></p>
<br>
<p class="text-white text-center">C++ Output:</p>
<p class="text-white"><?php echo htmlspecialchars(file_get_contents("./outputcpp.txt")) ?></p>
<br><br><br>
<p class="text-white text-center">Last Ran C Code:</p>
<p class="text-white"><?php echo htmlspecialchars(str_replace("\n","<br>",file_get_contents("./script.c"))) ?></p>
<br>
<p class="text-white text-center">C Output:</p>
<p class="text-white"><?php echo htmlspecialchars(file_get_contents("./outputc.txt")) ?></p>
</body>
</html>
