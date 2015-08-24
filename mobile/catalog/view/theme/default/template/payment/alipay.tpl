



<div class="buttons" style='border: 0px;'>
  <span style="font-size: 14px; font-weight: bold; color:  #5e5c5b; padding-top: 6px;">您的订单号：<?php echo $order_info['order_id']; ?><br/><br/></span>
    <span style="font-size: 14px; font-weight: bold; color:  #5e5c5b; padding-top: 6px;">应付金额：<?php echo $order_info['total']; ?><br/><br/></span>
    <span style="font-size: 14px; font-weight: bold; color:  #5e5c5b; padding-top: 6px;">支付方式：<?php echo $order_info['payment_method']; ?><br/><br/></span>
    <div class="right"  style="margin-top: -50px;"><a  style="height: 40px; font-size: 30px;" id="button-confirm<?php echo $order_info['order_id']; ?>" class="button"><span style="font-size: 20px; padding-top: 6px;">&nbsp;&nbsp;<?php echo $button_confirm; ?>&nbsp;&nbsp;</span></a></div>
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