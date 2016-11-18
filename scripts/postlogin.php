<?php

mysql_connect("mysql12.000webhost.com", "a9515949_su","parl9583");
	$db = mysql_select_db("a9515949_db");

$data = file_get_contents('php://input');
$json = json_decode($data);

$usuario = $json->user;
$contrasena = $json->pass;

$string = "SELECT * FROM users WHERE username = '$usuario' AND password = '$contrasena'";
$sqlquery = mysql_query($string);
$row = mysql_fetch_array($sqlquery);
if ($row){
	if ($row['type'] == 1){
		$response["type"] = 1;
		$response["iduser"] = $row["id"];
		$response["success"] = 1;
		$response["message"] = "You have been sucessfully login"; 
		die(json_encode($response));
	}
}

$response["success"] = 0;
die(json_encode($response));


?>