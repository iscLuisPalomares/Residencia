<?php
mysql_connect("mysql12.000webhost.com", "a9515949_su","parl9583");
$db = mysql_select_db("a9515949_db");

$data = file_get_contents('php://input');
$json = json_decode($data);

$idjunta = $json->meeting;

$string = "DELETE FROM invitados WHERE fsidjunta = '$idjunta'";
$responsea = array();
$sqlquery = mysql_query($string);
if($sqlquery){
	$response['success'] = "1";
} else {
	$response["success"] = "0";
}
/*while ($result = mysql_fetch_assoc($sqlquery)){
	array_push($responsea, array("fsuserid" => $result['id'], "fsuserusername" => $result['username'], "fsuseremail" => $result['email'], "fsidjunta" => $result['fsidjunta']));
	$response["datos"] = $responsea;
}*/

die(json_encode($response));
?>
