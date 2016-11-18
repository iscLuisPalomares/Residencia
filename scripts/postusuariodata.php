<?php 
mysql_connect("mysql12.000webhost.com", "a9515949_su","parl9583");
$db = mysql_select_db("a9515949_db"); 

//$username=$_POST["username"]; 
//$password=$_POST["password"];

//nuevo metodo para recolectar informacion del post
$data = file_get_contents('php://input');
$json = json_decode($data);

$userid=$json->num;

$query = " SELECT * FROM users WHERE id = '$userid'";
$sql1=mysql_query($query);
$row = mysql_fetch_array($sql1);
if ($row){
	$response['success'] = 1;
	$response['fsid'] = $row['id'];
	$response['fsusername'] = $row['username'];
	$response['fsemail'] = $row['email'];
	die(json_encode($response));
} else {
	$response["success"] = 0;
	$response["message"] = "invalid username or password "; 
	die(json_encode($response));
}

mysql_close(); 
?>