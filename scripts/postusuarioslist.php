<?php
mysql_connect("mysql12.000webhost.com", "a9515949_su","parl9583");
$db = mysql_select_db("a9515949_db");
$string = "SELECT * FROM users";
$responsea = array();
$sqlquery = mysql_query($string);
while ($result = mysql_fetch_assoc($sqlquery)){
	array_push($responsea, array("fsid" => $result['id'], "fsusername" => $result['username'], "fsemail" => $result['email']));
	$response["datos"] = $responsea;
}
$response["success"] = "1";
die(json_encode($response));
?>