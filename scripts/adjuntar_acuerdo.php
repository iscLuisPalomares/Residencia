<?php
mysql_connect("mysql12.000webhost.com", "a9515949_su","parl9583");
$db = mysql_select_db("a9515949_db");

$data = file_get_contents('php://input');
$json = json_decode($data);

$idjunta = $json->num;
$asunto = $json->asunto;
$acuerdo = $json->acuerdo;

$string = "INSERT INTO acuerdos (fsjuntaid, fsasunto, fsacuerdo) VALUES ('$idjunta', '$asunto','$acuerdo')";

$sqlquery = mysql_query($string);
if ($sqlquery){
	$response['success'] = "1";
	die(json_encode($response));
} else {
	$response['success'] = "0";
	die(json_encode($response));
}

?>