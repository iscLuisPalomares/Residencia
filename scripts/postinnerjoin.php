<?php
mysql_connect("mysql12.000webhost.com", "a9515949_su","parl9583");
$db = mysql_select_db("a9515949_db");

$data = file_get_contents('php://input');
$json = json_decode($data);

$idjunta = $json->num;

//$string = "SELECT users.id, users.username, users.email, invitados.fsidjunta FROM users LEFT JOIN invitados ON invitados.fsidusuario = users.id WHERE invitados.fsidjunta = '2'";
$string = "SELECT users.id, users.username, users.email, invitados.fsidjunta FROM users LEFT JOIN invitados ON invitados.fsidjunta = '$idjunta' AND users.id = invitados.fsidusuario";
$responsea = array();
$sqlquery = mysql_query($string);
while ($result = mysql_fetch_assoc($sqlquery)){
	array_push($responsea, array("fsuserid" => $result['id'], "fsuserusername" => $result['username'], "fsuseremail" => $result['email'], "fsidjunta" => $result['fsidjunta']));
	$response["datos"] = $responsea;
}
$response["success"] = "1";
die(json_encode($response));
?>
