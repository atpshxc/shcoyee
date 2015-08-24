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
  <div class="w1200 pt15">
    <div class="left w150">
       <?php echo $column_left; ?>
    </div>
    <div class="right w1028">
      <p class="w1028_bt bold"><?php echo $heading_title; ?></p>
  <?php if (isset($error_warning) && $error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
   <?php if (isset($text_message) && $text_message) { ?>
  <div class="success"><?php echo $text_message; ?></div>
  <?php } ?>
  <?php if (isset($success) && $success) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="edit" class="mt15">
      <h2 class="red f14w"><?php echo $text_your_details; ?></h2>
    <div class="content mt10">
      <table class="form table03">
      	<tr>
          <td><span class="required hs">*</span> <?php echo $entry_email; ?></td>
          <td><input type="text" name="email" readonly="true" value="<?php echo $email; ?>" class=" input01" />
            <?php if ($error_email) { ?>
            <span class="error"><?php echo $error_email; ?></span>
            <?php } ?></td>
        </tr>
        <tr>
          <td><span class="required hs">*</span> <?php echo $entry_firstname; ?></td>
          <td><input type="text" name="firstname" value="<?php echo $firstname; ?>" class=" input01"  />
            <?php if ($error_firstname) { ?>
            <span class="error"><?php echo $error_firstname; ?></span>
            <?php } ?></td>
        </tr>
       <tr>
          <td><span class="required hs">*</span> <?php echo $entry_telephone; ?></td>
          <td><input type="text" name="telephone" value="<?php echo $telephone; ?>"  class=" input01" />
            <?php if ($error_telephone) { ?>
            <span class="error"><?php echo $error_telephone; ?></span>
            <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_fax; ?></td>
          <td><input type="text" name="fax" value="<?php echo $fax; ?>" class=" input01"  /></td>
        </tr>
        <tr>
        	 <td>&nbsp;</td>
        	 <td>
        	 	<div class="left"><a onclick="$('#edit').submit();" class="button xgxx"><span><?php echo $button_continue; ?></span></a></div>
        	 </td>
        </tr>
      </table>
    </div>
  </form>
    </div>
  </div>
</div>
  
  
  


  <?php echo $content_bottom; ?>
<?php echo $footer; ?>