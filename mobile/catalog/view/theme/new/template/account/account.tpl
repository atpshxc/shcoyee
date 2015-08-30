<?php echo $header; ?><?php echo $column_right; ?>
<?php echo $content_top; ?>
<style>
    .tab01{width: 100%; }
    .tab01 tr td{ padding:5px 0;}
</style>

  <!--帮助中心-->
<div class="bg">
    <div class="left w150">
       <?php echo $column_left; ?>
    </div>
    <div class="right w1028" style="width:70%;">
      <p class="w1028_bt bold"><?php echo $display_name;?></p>
      

    <?php if ($success) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>
  <div class="content account-info" style=" border-bottom: 1px solid #e7e7e7; margin-bottom: 10px; margin-top: 10px;">
    <div id="remind" style="margin-bottom: 60px; ">
            <div class="oinfo">
                <dl>
                    <dt class=" bold"><?php echo $text_transaction_total?>：<span class="red"><?php echo $total;?></span></dt>
                    <dd>&nbsp;</dd>
                </dl>
                <dl class="fore">
					<dt class=" bold"><?php echo $text_reward?>：<span class="red"><?php echo $points;?></span></dt>
                    <dd>&nbsp;</dd>
                </dl>
   			 </div>
            <div class="ainfo">
                <dl class="fore">
					 <dt  class=" bold"><?php echo $text_contact_info;?>：<span class="red"><?php echo $email;?>&nbsp;&nbsp;&nbsp;&nbsp; <?php echo $tel;?></span></dt>
                    <dd>&nbsp;</dd>
                </dl>
                
             </div>
        </div>
  </div>
  <?php if ($orders) { ?>
  <table class="list tab01" style=" border-bottom: 1px solid #e7e7e7; margin-bottom: 10px;">
  	<thead>
  		<tr>
  			<td class="left bold"><?php echo $text_order_id; ?></td>
  			<td class="bold"><?php echo $text_status; ?></td>
  			<td class="bold"><?php echo $text_products; ?></td>
  			<td class="bold"><?php echo $text_total; ?></td>
  			<td class="bold"><?php echo $text_date_added; ?></td>
  			
  			<td class="center"><?php echo $text_action; ?></td>
  		</tr>
  	</thead>
  	<tbody >
  	<?php foreach ($orders as $order) { ?>
  		<tr>
  			<td class="left">#<?php echo $order['order_id']; ?></td>
  			<td><?php echo $order['status']; ?></td>
  			<td><?php echo $order['products']; ?></td>
  			<td class="red"><?php echo $order['total']; ?></td>
  			<td><?php echo $order['date_added']; ?></td>
  			
  			<td class="center"><a href="<?php echo $order['href']; ?>" class="sc_a"><span><?php echo $text_order_detail; ?></span></a></td>
  		</tr>
  	<?php } ?>
  	</tbody>
  </table>
    <div class="pagination"><?php echo $pagination; ?></div>
    <?php } else { ?>
    <div class="content"><?php echo $text_empty; ?></div>
    <?php } ?>
  
  
  
    </div>
</div>
  
  
  


  <?php echo $content_bottom; ?>
<?php echo $footer; ?>