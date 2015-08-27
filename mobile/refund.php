<?php 
include("catalog/controller/zhangbo/sign.php");
header("content-type:text/html; charset=utf-8");
/* 平台商密钥 
		$key = 'ed5b6d8f3fb9d393e9b161fd635a31e0a01f6a23997586b0d7e9fd47c328d31ce7c27b2237f64650d376872b0a31fcf829d5253a4a25987334323b5e7de4f716';

		// 平台商帐号 
		$chnid = 'SHKY001';
		
		
$xml  = '<?xml version="1.0" encoding="UTF-8"?>';
		$xml .= '<EasipayB2CRequest>';
		$xml .= '	<ReqData>';
		$xml .= '		<SRC_NCODE>'.$chnid.'</SRC_NCODE>';					//一级商户代码
		$xml .= '		<BILL_NO>201411170418902</BILL_NO>';						//原交易订单号
		$xml .= '		<REFUND_AMOUNT>655.10</REFUND_AMOUNT>';			//退款总金额
		$xml .= '		<CARGO_AMOUNT>591.00</CARGO_AMOUNT>';				//退货款金额
		
		$xml .= '		<TRANSPORT_AMOUNT>5.00</TRANSPORT_AMOUNT>';		//退运费金额
		$xml .= '		<TAX_AMOUNT>59.10</TAX_AMOUNT>';					//退税金额
		$xml .= '		<RDO_TIME></RDO_TIME>';						//原交易记账时间
		$xml .= '		<BGURL>http://www.shcoyee.com/index.php?route=checkout/returnrefundback</BGURL>';							//后台通知商户地址
		$xml .= '	</ReqData>';			
		$xml .= '</EasipayB2CRequest>';
		
		
		
		$prifix=substr($key,0,64);
		$suffix=substr($key,64,128);
		
		
		$b6xml=base64_encode($xml);
		$qmkey = md5($prifix.'^'.$chnid.'^'.base64_encode($xml).'^'.$suffix);
*/		
	
                
                
////模拟出关通知           
//$json='{"CommitTime":"20150612020241","MerchantOrderID":"201506090442468","Message":null,"ShipTypeID":"2","Status":"1","TrackingNumber":"111111111111111111111111111"}';
//
//
//$submit_url="method=Order.SOOutputCustoms&data=".$json."&format=json&version=1.0&nonce=0.77025906855494&appid=seller135&timestamp=20150612100735";        
//      $aasdf=new sign();          
//$tst=$aasdf->create($submit_url,  "kjt@135");
//
//	$ch = curl_init ('http://www.shcoyee.com/index.php?route=checkout/SOOutputCustoms');
//curl_setopt ( $ch, CURLOPT_CUSTOMREQUEST, "POST" );
//curl_setopt ( $ch, CURLOPT_RETURNTRANSFER, true );
//curl_setopt ( $ch, CURLOPT_POSTFIELDS, $tst["url"]."sign=".$tst["sign"] );
//curl_setopt ( $ch, CURLOPT_SSL_VERIFYPEER, false );
//curl_setopt ( $ch, CURLOPT_SSL_VERIFYHOST, false );
//curl_setopt ( $ch, CURLOPT_HTTPHEADER, array (
//		'Content-Type:application/x-www-form-urlencoded',
//		'Content-Length: ' . strlen ( $tst["url"]."sign=".$tst["sign"] ),
//		'Connection: Keep-Alive'
//) );
//$result = curl_exec ( $ch );
//$errorNo = curl_errno ( $ch );
//curl_close ( $ch );
//echo $result;         
//exit;               
   


//模拟库存变更通知

           
$json='{"SysNo":38,"SaleChannelSysNo":22,"Items":[{"ProductID":"136ARE338430002","Qty":10,"WareHouseID":51}]}';


$submit_url="method=Inventory.ChannelQ4SAdjustRequest&version=1.0&appid=seller135&format=json&timestamp=20150618114009&nonce=502270534&data=".$json;        
      $aasdf=new sign();          
$tst=$aasdf->create($submit_url,  "kjt@135");

	$ch = curl_init ('http://www.shcoyee.com/index.php?route=checkout/SOOutputCustoms');
curl_setopt ( $ch, CURLOPT_CUSTOMREQUEST, "POST" );
curl_setopt ( $ch, CURLOPT_RETURNTRANSFER, true );
curl_setopt ( $ch, CURLOPT_POSTFIELDS, $tst["url"]."sign=".$tst["sign"] );
curl_setopt ( $ch, CURLOPT_SSL_VERIFYPEER, false );
curl_setopt ( $ch, CURLOPT_SSL_VERIFYHOST, false );
curl_setopt ( $ch, CURLOPT_HTTPHEADER, array (
		'Content-Type:application/x-www-form-urlencoded',
		'Content-Length: ' . strlen ( $tst["url"]."sign=".$tst["sign"] ),
		'Connection: Keep-Alive'
) );
$result = curl_exec ( $ch );
$errorNo = curl_errno ( $ch );
curl_close ( $ch );
echo $result;         
exit; 
                
                
                
                
                $xml="<xml><appid><![CDATA[wx941bf5e46cae7ec7]]></appid>";
$xml.="<bank_type><![CDATA[CFT]]></bank_type>";
$xml.="<cash_fee><![CDATA[1]]></cash_fee>";
$xml.="<fee_type><![CDATA[CNY]]></fee_type>";
$xml.="<is_subscribe><![CDATA[Y]]></is_subscribe>";
$xml.="<mch_id><![CDATA[10130558]]></mch_id>";
$xml.="<nonce_str><![CDATA[onb2a5066evjq73m4jhw3ls37dersmz8]]></nonce_str>";
$xml.="<openid><![CDATA[oQA70swWYeoRaAsebHMfR-YN8-eE]]></openid>";
$xml.="<out_trade_no><![CDATA[201505310261295]]></out_trade_no>";
$xml.="<result_code><![CDATA[SUCCESS]]></result_code>";
$xml.="<return_code><![CDATA[SUCCESS]]></return_code>";
$xml.="<sign><![CDATA[1410BE164C1242BDB75C238EAF9AE106]]></sign>";
$xml.="<time_end><![CDATA[20150531225144]]></time_end>";
$xml.="<total_fee>1</total_fee>";
$xml.="<trade_type><![CDATA[NATIVE]]></trade_type>";
$xml.="<transaction_id><![CDATA[1006560126201505310191876090]]></transaction_id>";
$xml.="</xml>";
?>

<form action="http://www.shcoyee.com/index.php?route=checkout/Weixinnotifyurl" method="post" id="payment">
	<input type="hidden" name="ss"  id="SENDER_CODE" value="<?php echo $xml; ?>"  /> 			 
 
   <input type="submit" value="退款" />
</form>	
<?php 



$json='{"CommitTime":"20150612020241","MerchantOrderID":"201506090442468","Message":null,"ShipTypeID":"2","Status":"1","TrackingNumber":"111111111111111111111111111"}';

$aasdf=new sign();
$submit_url="method=Order.SOOutputCustoms&data=".$json."&format=json&version=1.0&nonce=0.770259068706194&appid=seller135&timestamp=20150612100735";


$keysing=$aasdf->create($submit_url,  "kjt@135");
echo $keysing["sign"];
$json=  urlencode($json);
?>


<form action="http://www.shcoyee.com/index.php?route=checkout/SOOutputCustoms" method="post" id="payment">
	<input type="hidden" name="method"  id="SENDER_CODE" value="Order.SOOutputCustoms"  /> 
        <input type="hidden" name="data"  id="SENDER_CODE" value="<?php echo $json;?>"  /> 
	<input type="hidden" name="format"  id="SENDER_CODE" value="json"  /> 
	<input type="hidden" name="version"  id="SENDER_CODE" value="1.0"  /> 
	<input type="hidden" name="nonce"  id="SENDER_CODE" value="0.770259068706194"  /> 
	<input type="hidden" name="appid"  id="SENDER_CODE" value="seller135"  /> 
	<input type="hidden" name="timestamp"  id="SENDER_CODE" value="20150612100735"  /> 
	<input type="hidden" name="sign"  id="SENDER_CODE" value="<?php echo $keysing["sign"];?>"  /> 			 
 
   <input type="submit" value="模拟出关通知" />
</form>	