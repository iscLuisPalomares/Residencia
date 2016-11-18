<?php
mysql_connect("mysql12.000webhost.com", "a9515949_su","parl9583");
$db = mysql_select_db("a9515949_db");

$data = file_get_contents('php://input');
$json = json_decode($data);

$idjunta = $json->num;

$string = "SELECT * FROM acuerdos WHERE fsjuntaid = '$idjunta'";
$responsea = array();
$sqlquery = mysql_query($string);
while ($result = mysql_fetch_assoc($sqlquery)){
	array_push($responsea, array("fsid" => $result['fsid'], "fsjuntaid" => $result['fsjuntaid'], "fsasunto" => $result['fsasunto'], "fsacuerdo" => $result['fsacuerdo']));
	$response["datos"] = $responsea;

}
$response["success"] = "1";
die(json_encode($response));
?>