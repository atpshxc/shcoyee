<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
</head>

<body>

<?php


/*$json='';
{
    "version": "v1.2",
    "commitTime": "20141114111750",
    "coName": "上海可益生物技术有限公司",
    "coCode": "SHKY001",
    "serialNumber": "20141114111751",
    "merchantOrderId": "201411141166566",
    "assBillNo": "",
    "orderCommitTime": "20141114111149",
    "senderName": "沈向群",
    "senderTel": "0085-21113020",
    "senderCompanyName": "香港可益应用科技有限公司",
    "senderAddr": "香港中环德辅道中141号，中保集团大厦705室",
    "senderZip": "999077",
    "senderCity": "香港",
    "senderProvince": "香港特别行政区",
    "senderCountry": "HKG",
    "cargoDescript": "食品相关",
    "allCargoTotalPrice": 591,
    "allCargoTotalTax": 59.1,
    "expressPrice": 5,
    "otherPrice": 0,
    "recPerson": "张三",
    "recPhone": "010-8763837",
    "recCountry": "中国",
    "recProvince": "上海",
    "recCity": "上海",
    "recAddress": "浦东张江88号",
    "recZip": "430000",
    "serverType": "S02",
    "custCode": "2216",
    "operationCode": "1",
    "spt": "",
    "cargoes": [
        {
            "cargoName": "星巴克咖啡星冰乐2",
            "cargoCode": "B001W020LEF02E",
            "cargoNum": 50,
            "cargoUnitPrice": 11.82,
            "cargoTotalPrice": 591,
            "cargoTotalTax": 59.1
        }
    ],
    "payMethod": "EASIPAY",
    "payMerchantName": "香港可益应用科技有限公司",
    "payMerchantCode": "SHKY001",
    "payAmount": 655.1,
    "payCUR": "CNY",
    "payID": "T2014111411113400000003083",
    "payTime": "20141113103221"
}*/





$json='{"version": "v1.2","commitTime": "20141114111750","coName": "上海可益生物技术有限公司","coCode": "SHKY001","serialNumber": "20141114111755","merchantOrderId": "201411140112551","assBillNo": "","orderCommitTime": "20141114111149","senderName": "沈向群","senderTel": "0085-21113020","senderCompanyName": "香港可益应用科技有限公司","senderAddr": "香港中环德辅道中141号，中保集团大厦705室","senderZip": "999077","senderCity": "香港","senderProvince": "香港特别行政区","senderCountry": "HKG","cargoDescript": "食品相关","allCargoTotalPrice": 591.00,"allCargoTotalTax": 59.10,"expressPrice": 5,"otherPrice": 0,"recPerson": "张三","recPhone": "010-8763837","recCountry": "中国","recProvince": "上海","recCity": "上海","recAddress": "浦东张江88号","recZip": "430000","serverType": "S02","custCode": "2216","operationCode": "1","spt": "","cargoes": [{"cargoName": "星巴克咖啡星冰乐2","cargoCode": "B001W020LEF02E","cargoNum": 50,"cargoUnitPrice": 11.82,"cargoTotalPrice": 591.00,"cargoTotalTax": 59.10}],"payMethod": "EASIPAY","payMerchantName": "香港可益应用科技有限公司","payMerchantCode": "SHKY001","payAmount": 655.10,"payCUR": "CNY","payID": "T2014111413460900000003097","payTime": "20141113103221"}';


	$sigkey=strtoupper(md5($json.'467567s2ff05435311967978978979798923gsdgsgsggd'));	
	$data='EData='.urlencode($json).'&SignMsg='.$sigkey;

		//$ch = curl_init ('http://61.152.165.77:8081/cboi/order/orderlist.htm');
		$ch = curl_init ('http://www.shcoyee.com/catalog/controller/payment/product_callback.php');
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
		echo urldecode($result);

?>





</body>
</html>



