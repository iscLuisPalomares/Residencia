<?php
mysql_connect("mysql12.000webhost.com", "a9515949_su","parl9583");
$db = mysql_select_db("a9515949_db");

$data = file_get_contents('php://input');
$json = json_decode($data);

$idusuario = $json->userid;

$string = "SELECT * FROM juntas WHERE fsid IN (SELECT fsidjunta FROM invitados WHERE fsidusuario = '$idusuario')";
$responsea = array();
$sqlquery = mysql_query($string);
while ($result = mysql_fetch_assoc($sqlquery)){
	array_push($responsea, array("fsid" => $result['fsid'], "fstema" => $result['fstema'], "fsfecha" => $result['fsfecha']));
	$response["datos"] = $responsea;
}
$response["success"] = "1";
die(json_encode($response));
?>