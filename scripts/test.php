<?php
require('fpdf.php');
require('class.phpmailer.php');

$pdf = new FPDF();
$pdf->AddPage();
$pdf->SetFont('Arial','B',16);
$pdf->Cell(40,10,'Hello World!');
$resolution = $pdf->Output('attachment.pdf', 'S');

$email = new PHPMailer();
$email->From      = 'you@example.com';
$email->FromName  = 'Your Name';
$email->Subject   = 'Message Subject';
$email->Body      = "hello";
$email->AddAddress('iscluispalomares@gmail.com');

$file_to_attach = 'PATH_OF_YOUR_FILE_HERE';

$email->AddStringAttachment($resolution , 'attachment.pdf');

return $email->Send();

?>