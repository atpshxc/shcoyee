<?php echo $header; ?><?php echo $column_right; ?>
<?php echo $content_top; ?>
<style>
    .table03{ width: 100%}
    .table03 tr td{ padding: 6px 0;}
</style>

  <!--帮助中心-->
<div class="bg">
       <?php echo $column_left; ?>
    <div class="w1028" style="width:100%;margin-bottom:60px;">
      <p class="w1028_bt bold"><?php echo $heading_title; ?></p>
      
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>

  <table class="list mt15 table03">
    <thead>
        <tr>
        <td class="left red bold f16" colspan="2" ><?php echo $text_order_detail; ?></td>
      </tr>
    </thead>
    <tbody class="table03">
        <tr style=" line-height: 24px;">
	        <td class="left"">
	          <b><?php echo $text_order_id; ?></b> 
	        </td>
	        <td class="left"">
	          #<?php echo $order_id; ?>
	        </td>
       </tr>
        <tr style=" line-height: 24px;">
	        <td class="left"">
	          <b><?php echo $text_date_added; ?></b> 
	        </td>
	        <td class="left"">
	          <?php echo $date_added; ?>
	        </td>
       </tr>
        <tr style=" line-height: 24px;">
	        <td class="left"">
	          <?php if ($shipping_method) { ?>
	          	<b><?php echo $text_shipping_method; ?></b> 
	          <?php } ?>
	        </td>
	        <td class="left"">
	          <?php if ($shipping_method) { ?>
	          <?php echo $shipping_method; ?>
	          <?php } ?>
	        </td>
       </tr>
    </tbody>
  </table>
  <?php if ($shipping_required) { ?>
  <table class="list">
    <thead>
      <tr>
          <td class="left red bold f16 mt10" style="margin-bottom: 10px;"><?php echo $text_shipping_address; ?></td>
      </tr>
    </thead>
    <tbody>
      <tr  style=" line-height: 24px; ">
       	<td class="left"><?php echo $shipping_address; ?></td>
      </tr>
      
	</tbody>
  </table>
  <?php if(isset($express)&&$express){?>
	  <table class="list">
	  <thead>
	  <tr>
	  <td class="left"><?php echo $text_shipping_express; ?></td>
	        </tr>
	      </thead>
	      <tbody>
	        <tr>
	        <td class="left"> 
	        <?php if(isset($express)&&$express){?>
	  			<?php echo $text_express;?> :<a href="<?php echo $express_website;?>"><b><?php echo $express;?></b></a> , <?php echo $text_express_no;?> :<b><?php echo $express_no;?></b>
	  	 	 <?php } ?>
	  		 </td>
	    	 </tr>
	  	</tbody>
	    </table>
    <?php } ?>
   <?php } ?>

    <table class="list table03">
      <thead>
        <tr>
            <td class="left bold" style=" width: 50%"><?php echo $column_name; ?></td>
            <td class="left bold" style=" width: 10%"><?php echo $column_model; ?></td>
            <td class="right bold" style=" width: 10%"><?php echo $column_quantity; ?></td>
          <td class="right bold" style=" width: 15%"><?php echo $column_price; ?></td>
          <td class="right bold" style=" width: 10%"><?php echo $column_total; ?></td>
        </tr>
      </thead>
      <tbody>
        <?php foreach ($products as $product) { ?>
        <tr>
          <td class="left" style=" width: 50%"><?php echo $product['name']; ?>
            <?php foreach ($product['option'] as $option) { ?>
            <br />
            &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
            <?php } ?></td>
          <td class="left" style=" width: 10%"><?php echo $product['model']; ?>
          </td>
          <td class="right" style=" width: 10%"><?php echo $product['quantity']; ?></td>
          <td class="right" style=" width: 15%"><?php echo $product['price']; ?>(<?php echo $product['tax_money']; ?>)</td>
          <td class="right" style=" width: 10%"><?php echo $product['total']; ?></td>
        </tr>
        <?php } ?>
      </tbody>
      <tfoot>
        
     
        
      </tfoot>
    </table>
<div style=" border-top: 1px solid #e9e9e9;border-bottom: 1px solid #e9e9e9; overflow:  auto; margin-top: 10px;">
    <?php foreach ($totals as $total) { ?>     
    <span class="left mr20" style=" height: 40px; line-height: 40px;"><?php echo $total['title']; ?>:<?php echo $total['text']; ?></span>
    <?php } ?>
   </div>
   <!-- 支付 -->
      <?php if($payment!=''){?>
  <div class=" left">
  		<?php echo $payment;?>
  </div>
  <?php } ?>
 <!--收货-->
  <?php if($shouhuo!=''){?>
  <div class="right">
  		<?php echo $shouhuo;?>
  </div>
  <?php } ?>
  
  <?php if ($comment) { ?>
  <table class="list">
    <thead>
      <tr>
        <td class="left"><?php echo $text_comment; ?></td>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td class="left"><?php echo $comment; ?></td>
      </tr>
    </tbody>
  </table>
  <?php } ?>
  <?php if ($histories) { ?>
  <h2><?php echo $text_history; ?></h2>
  <table class="list">
    <thead>
      <tr>
        <td class="left"><?php echo $column_date_added; ?></td>
        <td class="left"><?php echo $column_status; ?></td>
        <td class="left"><?php echo $column_comment; ?></td>
      </tr>
    </thead>
    <tbody>
      <?php foreach ($histories as $history) { ?>
      <tr>
        <td class="left"><?php echo $history['date_added']; ?></td>
        <td class="left"><?php echo $history['status']; ?></td>
        <td class="left"><?php echo $history['comment']; ?></td>
      </tr>
      <?php } ?>
    </tbody>
  </table>
  <?php } ?>
  
  
  
    </div>
</div>
  
  
  


  <?php echo $content_bottom; ?>
<?php echo $footer; ?>