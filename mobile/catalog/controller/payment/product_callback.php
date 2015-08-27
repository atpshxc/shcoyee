<?php 
$data=file_get_contents("php://input"); 

$ch = curl_init ('http://www.shcoyee.com/index.php?route=payment/productcallbacktax');
curl_setopt ( $ch, CURLOPT_CUSTOMREQUEST, "POST" );
curl_setopt ( $ch, CURLOPT_RETURNTRANSFER, true );
curl_setopt ( $ch, CURLOPT_POSTFIELDS, $data );
curl_setopt ( $ch, CURLOPT_SSL_VERIFYPEER, false );
curl_setopt ( $ch, CURLOPT_SSL_VERIFYHOST, false );
curl_setopt ( $ch, CURLOPT_HTTPHEADER, array (
		'Content-Type:application/x-www-form-urlencoded',
		'Content-Length: ' . strlen ( $data ),
		'Connection: Keep-Alive'
) );
$result = curl_exec ( $ch );
$errorNo = curl_errno ( $ch );
curl_close ( $ch );
echo $result;

 ?>