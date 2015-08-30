<?php echo $header; ?><?php echo $column_right; ?>
<?php echo $content_top; ?>


  <!--帮助中心-->
<div class="bg">
    <div class="left w150">
       <?php echo $column_left; ?>
    </div>
    <div class="right w1028" style="width:70%;margin-bottom:60px;">
      <p class="w1028_bt bold"><?php echo $heading_title; ?></p>
<?php if ($returns) { ?>
  <?php foreach ($returns as $return) { ?>
  <div class="return-list">
    <div class="return-id"><b><?php echo $text_return_id; ?></b> #<?php echo $return['return_id']; ?></div>
    <div class="return-status"><b><?php echo $text_status; ?></b> <?php echo $return['status']; ?></div>
    <div class="return-content">
      <div><b><?php echo $text_date_added; ?></b> <?php echo $return['date_added']; ?><br />
        <b><?php echo $text_order_id; ?></b> <?php echo $return['order_id']; ?></div>
      <div><b><?php echo $text_customer; ?></b> <?php echo $return['name']; ?><br />
        <b><?php echo $text_products; ?></b> <?php echo $return['products']; ?></div>
      <div class="return-info"><a href="<?php echo $return['href']; ?>" class="button"><span><?php echo $button_view; ?></span></a></div>
    </div>
  </div>
  <?php } ?>
  <div class="pagination"><?php echo $pagination; ?></div>
  <?php } else { ?>
  <div class="content mt15"><?php echo $text_empty; ?></div>
  <?php } ?>
    </div>
</div>
  
  
  


  <?php echo $content_bottom; ?>
<?php echo $footer; ?>