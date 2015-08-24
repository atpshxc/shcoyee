<?php
$tempurl='';

$submit_url='spbill_create_ip=127.0.0.1&fee_type=1&total_fee=1&out_trade_no=20150&partner=1239207601&notify_url=sss&return_url=sss&subject=nnnn&body=cccc';


$prams=explode("&",$submit_url);//使用&切割字符串为数组
sort($prams);
foreach ($prams as $ttt)
{
    $pvs=  explode("=", $ttt);
    
    $tempurl.=$pvs[0]."=".$pvs[1].'&';
}
$md5str=strtoupper(md5($tempurl.'&key=027102'));
echo '<a href="https://gw.tenpay.com/gateway/pay.htm?'.$tempurl.'sign='.$md5str.'" >asdasd</a>';
//bin2hex(

exit;
?>
