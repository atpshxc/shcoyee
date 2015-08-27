<?php echo $header; ?><?php echo $column_right; ?>
<?php echo $content_top; ?>


  <!--帮助中心-->
<div class="bg">
  <div class="w1200 pt15">
    <div class="left w150">
       <?php echo $column_left; ?>
    </div>
    <div class="right w1028">
      <p class="w1028_bt bold"><?php echo $heading_title; ?></p>
<p><?php echo $text_total; ?><b> <?php echo $total; ?></b>.</p>
  <table class="list">
    <thead>
      <tr>
        <td class="left"><?php echo $column_date_added; ?></td>
        <td class="left"><?php echo $column_description; ?></td>
        <td class="right"><?php echo $column_amount; ?></td>
      </tr>
    </thead>
    <tbody>
      <?php if ($transactions) { ?>
      <?php foreach ($transactions  as $transaction) { ?>
      <tr>
        <td class="left"><?php echo $transaction['date_added']; ?></td>
        <td class="left"><?php echo $transaction['description']; ?></td>
        <td class="right"><?php echo $transaction['amount']; ?></td>
      </tr>
      <?php } ?>
      <?php } else { ?>
      <tr>
        <td class="center" colspan="5"><?php echo $text_empty; ?></td>
      </tr>
      <?php } ?>
    </tbody>
  </table>
  <div class="pagination"><?php echo $pagination; ?></div>
    </div>
  </div>
</div>
  
  
  


  <?php echo $content_bottom; ?>
<?php echo $footer; ?>