<script src="/catalog/controller/payment/chinabank_class/static/js/wyplus-ctrl.js"></script>
<form method="post" action="/catalog/controller/payment/chinabank_class/api/WebPaySign.php" id="payment">

    <input type="hidden" name="version" value="<?php echo $version; ?>"/>
    <input type="hidden" name="token" value="<?php echo $token; ?>"/><!--no-->
    <input type="hidden" name="merchantSign" value="<?php echo $merchantSign; ?>"/>
    <input type="hidden" name="merchantNum" value="<?php echo $merchantNum; ?>"/>
    <input type="hidden" name="merchantRemark" value="<?php echo $merchantRemark; ?>"/><!--no-->
    <input type="hidden" name="tradeNum" value="<?php echo $tradeNum; ?>"/>
    <input type="hidden" name="tradeName" value="<?php echo $tradeName; ?>"/>
    <input type="hidden" name="tradeTime" value="<?php echo $tradeTime; ?>"/>
    <input type="hidden" name="tradeAmount" value="<?php echo $tradeAmount; ?>"/>
    <input type="hidden" name="currency" value="<?php echo $currency; ?>"/>
    <input type="hidden" name="notifyUrl" value="<?php echo $notifyUrl; ?>"/>
    <input type="hidden" name="successCallbackUrl" value="<?php echo $successCallbackUrl; ?>"/>
    <input type="hidden" name="forPayLayerUrl" value="<?php echo $forPayLayerUrl; ?>"/>
    <input type="hidden" name="successCallbackUrl" value="<?php echo $successCallbackUrl; ?>"/>
    <input type="hidden" name="ip" value="<?php echo $ip; ?>"/>

    
<div class="buttons" style='border: 0px;'>
    <span style="font-size: 14px; font-weight: bold; color:  #5e5c5b; padding-top: 6px;">您的订单号：<?php echo $order_info['order_id']; ?><br/><br/></span>
    <span style="font-size: 14px; font-weight: bold; color:  #5e5c5b; padding-top: 6px;">应付金额：<?php echo $order_info['total']; ?><br/><br/></span>
    <span style="font-size: 14px; font-weight: bold; color:  #5e5c5b; padding-top: 6px;">支付方式：<?php echo $order_info['payment_method']; ?><br/><br/></span>
    <div class="right" style="margin-top: -50px;"><a  id="showlayerButton" style="height: 40px; font-size: 30px;" class="button"><span style="font-size: 20px; padding-top: 6px;">&nbsp;&nbsp;<?php echo $button_confirm; ?>&nbsp;&nbsp;</span></a></div>
</div>
    <iframe id="iframeLayer" frameborder="0" name="iframeLayer" class="iframeLayer" allowTransparency="true" style="display:none;position:absolute; z-index:999; width:100%; height:100%; top: 0px; left: 0px; right:0; bottom: 0; background:url('/catalog/controller/payment/chinabank_class/static/images/loading.gif') center center no-repeat;" src=""></iframe>

</form>
<script>
        (function(){
            var submitBtn = document.getElementById('showlayerButton');
            submitBtn.onclick = function(){

                // 需要传入的参数：
                // 1、formId (提交的表单ID)
                // 2、iframeId (嵌入的iframeID)

                WYPLUS.open({
                    //需要提交的表单ID
                    formId: 'payment',
                    //iframe ID
                    iframeId: 'iframeLayer'
                });
                document.getElementById('payment').submit();   
            }
        })();
    </script>