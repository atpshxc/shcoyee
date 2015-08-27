<form action="<?php echo $action; ?>" method="post" id="payment" target="_blank">
	<input type="hidden"  name="SENDER_CODE" id="SENDER_CODE" value="<?php echo $chnid; ?>"  /> 			 
    <input type="hidden" name="TRX_CONTENT" id="TRX_CONTENT" value="<?php echo $xml; ?>"/> 
    <input type="hidden" name="SIGNATURE" id="SIGNATURE" value="<?php echo $key; ?>"/> 
  
<div class="bg_bs dd">
     <div class="bg_bs dd">
      <div class="of f14w pb12">
        <div class="left ddh c35">您的订单编号：</div>
        <div class="left">
          <p class="c64"><strong><?php echo $order_info['order_id']; ?> </strong><a href="/index.php?route=account/order/info&order_id=<?php echo $order_info['order_id']; ?>" class="sc_a">[查看订单]</a></p>
          <p class="c64">请您记下订单号码，以便您在付款和享受跨境通提供给的售后服务时使用</p>
        </div>
      </div>
      <div class="of f14w pb12">
        <div class="left ddh c35">应付金额：</div>
        <div class="left">
          <p class="red"><?php echo $order_info['total']; ?></p>
        </div>
      </div>
      <div class="of f14w pb12">
        <div class="left ddh c35">支付状态：</div>
        <div class="left">
          <p class="red">待支付</p>
        </div>
      </div>
      <div class="of f14w pb12">
        <div class="left ddh c35">支付方式：</div>
        <div class="left">
          <p class="red">在线支付（东方支付）</p>
        </div>
      </div>
      <div class="ljzf of">
        <div class="pay"><img src="/catalog/view/theme/new/images/easipay.gif" width="127" height="40" /></div>
        <div class="pay"><a  onclick="$('#payment').submit();"  class="nowpay inblock" href="javascript:void(0)">立即支付</a></div>
      </div>
    </div>
</div>

</form>

