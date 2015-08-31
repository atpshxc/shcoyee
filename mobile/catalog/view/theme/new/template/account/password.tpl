<?php echo $header; ?><?php echo $column_right; ?>
<?php echo $content_top; ?>
<style>
    .table03 tr td{ padding: 6px 0;}
    .input01{ border: 1px solid #e0e0e0; height: 30px; line-height: 30px; margin-left: 5px; text-indent: 5px;}
    .xgxx{ background: #c40001; padding:0 12px; height: 28px; line-height: 28px; color: #fff; display: block; text-align: center; cursor: pointer; margin-left: 5px; }
    .xgxx:hover{ background: #ff3048;}
</style>

  <!--帮助中心-->
<div class="bg">
       <?php echo $column_left; ?>
    <div class="w1028" style="width:100%;margin-bottom:60px;">
      <p class="w1028_bt bold"><?php echo $heading_title; ?></p>
      
      
    <?php if (isset($success) && $success) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="password">
    <div class="content">
      <table class="form table03">
       <tr>
          <td><span class="required hs">*</span> <?php echo $entry_old_password; ?></td>
          <td><input type="password" name="old_password" class="span4 input01" value="<?php echo $old_password; ?>" />
            <?php if ($error_old_password) { ?>
            <span class="error"><?php echo $error_old_password; ?></span>
            <?php } ?></td>
        </tr>
        <tr>
          <td><span class="required hs">*</span> <?php echo $entry_password; ?></td>
          <td><input type="password" name="password" class="span4 input01" value="<?php echo $password; ?>" />
            <?php if ($error_password) { ?>
            <span class="error"><?php echo $error_password; ?></span>
            <?php } ?></td>
        </tr>
        <tr>
          <td><span class="required hs">*</span> <?php echo $entry_confirm; ?></td>
          <td><input type="password" name="confirm" class="span4 input01" value="<?php echo $confirm; ?>" />
            <?php if ($error_confirm) { ?>
            <span class="error"><?php echo $error_confirm; ?></span>
            <?php } ?></td>
        </tr>
         <tr>
        	 <td>&nbsp;</td>
        	 <td>
        	 	<div class="left"><a onclick="$('#password').submit();" class="button xgxx"><span><?php echo $button_confirm; ?></span></a></div>
        	 </td>
          </tr>
      </table>
    </div>
  </form>
  
  
  
    </div>
</div>
  
  
  


  <?php echo $content_bottom; ?>
<?php echo $footer; ?>