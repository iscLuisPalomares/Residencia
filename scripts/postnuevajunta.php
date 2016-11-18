<?php
mysql_connect("mysql12.000webhost.com", "a9515949_su","parl9583");
	$db = mysql_select_db("a9515949_db");

$data = file_get_contents('php://input');
$json = json_decode($data);

$tema = $json->tema;
$fecha = $json->fecha;

$query = "INSERT INTO juntas (tema, fecha) VALUES ('$tema', '$fecha')";
$sqlquery = mysqli_query($conn, $query);
if ($sqlquery) {
	$response["success"] = "1";
	$response["message"] = "Registered successfully!";
	die(json_encode($response));
}
$response['success'] = "0";
die(json_encode($response));
mysql_close();

?>