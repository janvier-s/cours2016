<?php
session_destroy();
session_unset();

setcookie("mem", "", time()-1000);

header("location:?");
?>