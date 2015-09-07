<div class="bg_bs mt20 dd">
      <div class="of f14w pb12">
        <div class="left ddh c35">您的订单编号：</div>
        <div class="left">
          <p class="c64"><strong><?php echo $order_info['order_id']; ?> </strong><a href="<?php echo HTTP_SERVER;?>/index.php?route=account/order/info&order_id=<?php echo $order_info['order_id']; ?>" class="sc_a">[查看订单]</a></p>
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
          <p class="red">微信扫描支付</p>
        </div>
      </div>
     <div class="pay" id="qrcode<?php echo $order_info['order_id']; ?>"></div>
     <!--<div class="pay"  style=" margin-right: 0px;  float: right; "><img class="responsive" src="<?php echo HTTP_SERVER;?>/catalog/view/theme/new/images/weixinpay.gif" /></div>-->
</div>
<br><br><br>
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