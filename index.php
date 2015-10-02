<?php
//Main Controller
session_start();
include_once("model/param.inc.php");
include_once("config/config.inc.php");

if (!isset($_GET["module"])) {
	$module = "blog";
} else {
	$module = $_GET["module"];
}

if (!isset($_GET["action"])) {
	$action = "index";
} else {
	$action = $_GET["action"];
}
$url = "controller/".$module."/".$action.".php";

if (file_exists($url)) {
	include($url);
} else {
	include ('view/404.php');
}