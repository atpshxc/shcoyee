<div class="bg_bs dd">
     <div class="bg_bs  dd">
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
          <p class="red">在线支付（支付宝）</p>
        </div>
      </div>
      <div class="ljzf of">
        <div class="pay"><img src="/catalog/view/theme/new/images/alipay.gif" width="127" height="40" /></div>
        <div class="pay"><a  id="button-confirm<?php echo $order_info['order_id']; ?>" class="nowpay inblock" href="javascript:void(0)">立即支付</a></div>
      </div>
    </div>
</div>

<script type="text/javascript"><!--
<?php if(isset($reorder)){?>
$('#button-confirm<?php echo $order_info['order_id']; ?>').bind('click', function() {
	//window.location ='<?php echo $action; ?>';
        window.open('<?php echo $action; ?>');
});
<?php }else {?>
$('#button-confirm<?php echo $order_info['order_id']; ?>').bind('click', function() {
	$.ajax({ 
		url: 'index.php?route=checkout/checkout/validate&token=<?php echo $token; ?>',
		type: 'post',
		data: $('#checkout-comment textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-confirm').attr('disabled', true);
		},	
		complete: function() {
			$('#button-confirm').attr('disabled', false);
		},	
		success: function(json) {
			if (json['error']) {
				if (json['error']['warning']) {
					alert(json['error']['warning']);
				}
			}else{
				 window.location ='<?php echo $action; ?>';
			}
		}		
	});
});

<?php }?>
//--></script> 