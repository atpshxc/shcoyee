

<div class="buttons" style="border: 0px; height: 700px;">
    <span style="font-size: 14px; font-weight: bold; color:  #5e5c5b; padding-top: 6px;">您的订单号：<?php echo $order_info['order_id']; ?><br/><br/></span>
    <span style="font-size: 14px; font-weight: bold; color:  #5e5c5b; padding-top: 6px;">应付金额：<?php echo $order_info['total']; ?><br/><br/></span>
    <span style="font-size: 14px; font-weight: bold; color:  #5e5c5b; padding-top: 6px;">支付方式：<?php echo $order_info['payment_method']; ?><br/><br/></span>
    <div class="right" id="qrcode<?php echo $order_info['order_id']; ?>" style="margin-top: -110px;"><a id="button-confirm<?php echo $order_info['order_id']; ?>"  style="height: 40px; font-size: 20px;" class="button"><span style="font-size: 15px; padding-top: 6px;">&nbsp;&nbsp;扫码支付&nbsp;&nbsp;</span></a></div>
</div>

<script src="/catalog/view/theme/default/ky_js/weixincode.js"></script>
<script type="text/javascript">
            <!--
if(<?php echo $unifiedOrderResult["code_url"] != NULL; ?>)
		{
			var url = "<?php echo $unifiedOrderResult['code_url'];?>";
			//参数1表示图像大小，取值范围1-10；参数2表示质量，取值范围'L','M','Q','H'
			var qr = qrcode(8, 'M');
			qr.addData(url);
			qr.make();
			var element=document.getElementById("qrcode<?php echo $order_info['order_id']; ?>");
			element.innerHTML += qr.createImgTag();
			
		}
//--></script> 