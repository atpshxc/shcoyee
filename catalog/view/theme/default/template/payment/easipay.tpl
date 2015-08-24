<form action="<?php echo $action; ?>" method="post" id="payment" target="_blank">
	<input type="hidden"  name="SENDER_CODE" id="SENDER_CODE" value="<?php echo $chnid; ?>"  /> 			 
    <input type="hidden" name="TRX_CONTENT" id="TRX_CONTENT" value="<?php echo $xml; ?>"/> 
    <input type="hidden" name="SIGNATURE" id="SIGNATURE" value="<?php echo $key; ?>"/> 
    
<div class="buttons" style='border: 0px;'>
    <span style="font-size: 14px; font-weight: bold; color:  #5e5c5b; padding-top: 6px;">您的订单号：<?php echo $order_info['order_id']; ?><br/><br/></span>
    <span style="font-size: 14px; font-weight: bold; color:  #5e5c5b; padding-top: 6px;">应付金额：<?php echo $order_info['total']; ?><br/><br/></span>
    <span style="font-size: 14px; font-weight: bold; color:  #5e5c5b; padding-top: 6px;">支付方式：<?php echo $order_info['payment_method']; ?><br/><br/></span>
    <div class="right" style="margin-top: -50px;"><a onclick="$('#payment').submit();"   style="height: 40px; font-size: 30px;" class="button"><span style="font-size: 20px; padding-top: 6px;">&nbsp;&nbsp;<?php echo $button_confirm; ?>&nbsp;&nbsp;</span></a></div>
</div>
</form>

