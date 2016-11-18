<?php
mysql_connect("mysql12.000webhost.com", "a9515949_su","parl9583");
	$db = mysql_select_db("a9515949_db");

$data = file_get_contents('php://input');
$json = json_decode($data);

$nombre = $json->username;
$contrasena = $json->password;
$correo = $json->email;

$query = "INSERT INTO users (username, password, email, type, direccion, telefono1, telefono2) VALUES ('$nombre' , '$contrasena', '$correo', '1', 'priv', 'priv', 'priv')";
$sqlquery = mysql_query($query);
if ($sqlquery) {
	$response['success'] = '1';
	die(json_encode($response));
} else {
	$response['success'] = '0';
	die(json_encode($response));
}
mysql_close();

?>