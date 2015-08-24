<?php 
echo phpinfo();
header("content-type:text/html; charset=utf-8");
?>

<form action="http://www.shcoyee.com/index.php?route=payment/alipay/callback" method="post" id="payment">
	<input type="hidden" name="out_trade_no"  id="out_trade_no" value="201507150987851"  /> 
        <input type="hidden" name="trade_no"  id="trade_no" value="流水号"  /> 
	<input type="hidden" name="trade_status"  id="trade_status" value="状态"  /> 
	<input type="hidden" name="total_fee"  id="total_fee" value="金额"  /> 		 
 
   <input type="submit" value="支付宝回调模拟" />
</form>	
<br/>
<br/>
<form action="http://www.shcoyee.com/catalog/controller/payment/weixinnotifyurl.php" method="post" id="payment">
	<input type="hidden" name="out_trade_no"  id="out_trade_no" value="201507150987851"  /> 	 
 
   <input type="submit" value="微信支付回调模拟" />
</form>	

<form action="http://www.shcoyee.com/index.php?route=payment/tenpay/callback" method="post" id="payment">
	<input type="hidden" name="out_trade_no"  id="out_trade_no" value="201507150987851"  /> 	 
 
   <input type="submit" value="财付通支付回调模拟" />
</form>	


<form action="http://www.shcoyee.com/index.php?route=checkout/cart/update&classid=2" method="post" id="payment">
    <input type="text" name="remove"  id="remove" value="55177"  /> 
   <input type="submit" value="购物车ajax测试" />
</form>	