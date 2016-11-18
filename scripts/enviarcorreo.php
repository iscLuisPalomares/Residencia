<?php
require('fpdf.php');
require('class.phpmailer.php');

mysql_connect("mysql12.000webhost.com", "a9515949_su","parl9583");
$db = mysql_select_db("a9515949_db");

$data = file_get_contents('php://input');
$json = json_decode($data);

$idjunta = $json->juntaid;

$string = "SELECT users.email, juntas.fsfecha, juntas.fstema FROM users INNER JOIN juntas WHERE juntas.fsid IN (SELECT fsidjunta FROM invitados WHERE fsidjunta = '$idjunta') AND users.id IN (SELECT fsidusuario FROM invitados WHERE fsidjunta = '$idjunta')";
$responsea = array();

$listacorreos = array();
$fecha = "";
$tema = "";

$sqlquery = mysql_query($string);
while ($variable = mysql_fetch_assoc($sqlquery)){
	array_push($listacorreos, $variable['email']);
}

$sqlquery = mysql_query($string);
while ($variable = mysql_fetch_assoc($sqlquery)){
	$fecha = $variable['fsfecha'];
}
$sqlquery = mysql_query($string);
while ($variable = mysql_fetch_assoc($sqlquery)){
	$tema = $variable['fstema'];
}

$pdf = new FPDF();
$pdf->AddPage();
$pdf->SetFont('Arial','B',16);
$pdf->Cell(40,10,'Junta para el dia: '.$fecha.' Con el Tema de: '.$tema);
$resolution = $pdf->Output('attachment.pdf', 'S');

$email = new PHPMailer();
$email->From      = 'you@example.com';
$email->FromName  = 'SECRETARIA';
$email->Subject   = 'Informacion de Junta';
$email->Body      = "Buen dia: ";
foreach ($listacorreos as $ad) {
	$email->AddAddress($ad); 
}

$email->AddStringAttachment($resolution , 'attachment.pdf');
return $email->Send();

?>