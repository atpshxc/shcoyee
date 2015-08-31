<?php echo $header; ?><?php echo $column_right; ?>
<?php echo $content_top; ?>

  <!--帮助中心-->
<div class="bg">
       <?php echo $column_left; ?>
    <div class="w1028" style="width:100%;margin-bottom:60px;">
      <p class="w1028_bt bold"><?php echo $heading_title; ?></p>
      
      
  <?php if ($success) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>

  <div class="buttons nbd mt15">
    <div class=left><a href="<?php echo $insert; ?>" class="button sc_a"><span><?php echo $button_new_address; ?></span></a></div>
  </div>
  <?php foreach ($addresses as $result) { ?>
  <div class="content">
    <table style="width: 100%; line-height: 30px">
      <tr>
        <td style="width: 75%;"><p><?php echo $result['address']; ?></p></td>
        <td style="text-align: right;"><a href="<?php echo $result['update']; ?>" class="button sc_a"><span><?php echo $button_edit; ?></span></a> &nbsp; <a href="<?php echo $result['delete']; ?>" class="button sc_a"><span><?php echo $button_delete; ?></span></a></td>
      </tr>
    </table>
  </div>
  <?php } ?>
  
  
  
    </div>
</div>
  
  
  


  <?php echo $content_bottom; ?>
<?php echo $footer; ?>