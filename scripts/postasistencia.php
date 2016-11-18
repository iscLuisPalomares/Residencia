<?php
mysql_connect("mysql12.000webhost.com", "a9515949_su","parl9583");
$db = mysql_select_db("a9515949_db");

$data = file_get_contents('php://input');
$json = json_decode($data);

$idjunta = $json->nojunta;

$string = "SELECT users.username, users.email, invitados.asistencia, invitados.fsid FROM users LEFT JOIN invitados ON invitados.fsidusuario = users.id WHERE fsidjunta = '$idjunta'";
$responsea = array();
$sqlquery = mysql_query($string);
while ($result = mysql_fetch_assoc($sqlquery)){
	array_push($responsea, array("fsusername" => $result['username'], "fsasistencia" => $result['asistencia'], "fsemail" => $result['email'], "fsid" => $result['fsid']));
	$response["datos"] = $responsea;
}
$response["success"] = "1";
die(json_encode($response));


?>