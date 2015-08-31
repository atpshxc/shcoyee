<?php echo $header; ?><?php echo $column_right; ?>
<?php echo $content_top; ?>
<style>
    .tab01{width: 100%; }
    .tab01 tr td{ padding:5px 0;}
</style>

  <!--帮助中心-->
<div class="bg">
       <?php echo $column_left; ?>
    <div class="w1028" style="width:100%;margin-bottom:60px;">
      <p class="w1028_bt bold"><?php echo $heading_title; ?></p>
                    <?php if ($orders) { ?>
                    <table class="list tab01">
                    <thead>
                        <tr style=" border-bottom: 1px solid #e7e7e7;">
                                    <td class="left bold"><?php echo $text_order_id; ?></td>
                                    <td class="bold"><?php echo $text_status; ?></td>
                                    <td class="bold"><?php echo $text_products; ?></td>
                                    <td class="bold"><?php echo $text_total; ?></td>
                                    <td class="bold"><?php echo $text_date_added; ?></td>

                                    <td class="center"><?php echo $text_action; ?></td>
                            </tr>
                    </thead>
                    <tbody>
                    <?php foreach ($orders as $order) { ?>
                            <tr>
                                    <td class="left">#<?php echo $order['order_id']; ?></td>
                                    <td><?php echo $order['status']; ?></td>
                                    <td><?php echo $order['products']; ?></td>
                                    <td class="red"><?php echo $order['total']; ?></td>
                                    <td><?php echo $order['date_added']; ?></td>

                                    <td class="center">
                                        <a href="<?php echo $order['href']; ?>" class=" sc_a"><span><?php echo $button_view; ?></span></a>
                            <?php
                            if($order['order_status_id']==16)
                            {
                             ?>
                                            /<a href="index.php?route=account/order&updateid=<?php echo $order['order_id']; ?>" class=" sc_a"><span>取消</span></a>
                            <?php }?>
                                    </td>
                            </tr>
                    <?php } ?>
                    </tbody>
              </table>
              <script>
              function updateid(order_id)
              {

              }

              </script>
              <div class="pagination" style=" border-top: 1px solid #e0e0e0; padding: 10px 0; margin-top: 5px;"><?php echo $pagination; ?></div>
              <?php } else { ?>
              <div class="content"><?php echo $text_empty; ?></div>
              <?php } ?>
  	</div>
</div>
  
  
  


  <?php echo $content_bottom; ?>
<?php echo $footer; ?>