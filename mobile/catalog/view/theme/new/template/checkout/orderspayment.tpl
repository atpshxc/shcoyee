<?php echo $checkout_header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<?php echo $content_top; ?>
<?php
$all_ords=0;
$all_total=0;
foreach ($paymentorders as $order) 
        {
        $all_ords++;
        $all_total+=$order['total'];
        }
   ?>     
<div class="bg2">
  <div class="f24 hs2 pt15"><i class="wdgwc_bt2"></i>完成支付</div>
    <div class="bg_bs dd mt10">
      <p class="f20 c35 dd_p">您的<span class="red"><?php echo $all_ords; ?></span> 笔订单已提交成功，请您在提交订单后<span class="red">2小时</span>内完成支付，否则订单会自动取消！</p>
      <p class="f16 red dd_p">订单总金额：¥<strong><?php echo $all_total; ?></strong></p>
    </div>
        <?php 
        foreach ($paymentorders as $order) 
        { 
            echo $order['button']; 
         }
         ?>
         
</div>
 <?php echo $content_bottom; ?>

<?php echo $footer; ?>