<?php
mysql_connect("mysql12.000webhost.com", "a9515949_su","parl9583");
	$db = mysql_select_db("a9515949_db");

$data = file_get_contents('php://input');
$json = json_decode($data);

$registro = $json->registro;

$query = "UPDATE invitados SET asistencia = 'true' WHERE fsid = '$registro'";
$sqlquery = mysql_query($query);
if ($sqlquery) {
	$response["success"] = "1";
	die(json_encode($response));
}
$response['success'] = "0";
die(json_encode($response));
mysql_close();

?>