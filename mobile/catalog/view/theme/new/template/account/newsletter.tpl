<?php echo $header; ?><?php echo $column_right; ?>
<?php echo $content_top; ?>


  <!--帮助中心-->
<div class="bg">
       <?php echo $column_left; ?>
    <div class="w1028" style="width:100%;margin-bottom:60px;">
      <p class="w1028_bt bold"><?php echo $heading_title; ?></p>
      
      
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="newsletter">
    <div class="content">
      <table class="form mt15">
        <tr>
          <td><?php echo $entry_newsletter; ?></td>
          <td><?php if ($newsletter) { ?>
            <input type="radio" name="newsletter" value="1" checked="checked" />
            <?php echo $text_yes; ?>&nbsp;
            <input type="radio" name="newsletter" value="0" />
            <?php echo $text_no; ?>
            <?php } else { ?>
            <input type="radio" name="newsletter" value="1" />
            <?php echo $text_yes; ?>&nbsp;
            <input type="radio" name="newsletter" value="0" checked="checked" />
            <?php echo $text_no; ?>
            <?php } ?></td>
        </tr>
      </table>
    </div>
  </form>
<script type="text/javascript">
	$('input[name=\'newsletter\']').bind('change',function(){ $('#newsletter').submit(); });
</script>
  
  
  
    </div>
</div>
  
  
  


  <?php echo $content_bottom; ?>
<?php echo $footer; ?>