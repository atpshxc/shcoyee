<?php echo $header; ?><?php echo $column_right; ?>
<?php echo $content_top; ?>
<style>
    .table03 tr td{ padding: 6px 0;}
    .input01{ border: 1px solid #e0e0e0; height: 30px; line-height: 30px; margin-left: 5px; text-indent: 5px;}
</style>

  <!--帮助中心-->
<div class="bg">
    <div class="left w150">
       <?php echo $column_left; ?>
    </div>
    <div class="right w1028" style="width:70%;margin-bottom:60px;">
      <p class="w1028_bt bold"><?php echo $heading_title; ?></p>
      
      
    <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
    <?php if ($success) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="invite" class="mt15">
      <p style="line-height: 30px;" class="red"><?php echo $text_invite_description; ?></p>
      <h2 class="f14w bold" style="color: #646464; line-height: 30px;"><?php echo $text_your_email; ?></h2>
    <div class="content">
      <table class="form table03">
        <tr>
          <td><?php echo $entry_email; ?></td>
          <td><input type="text" name="email" value="" class=" input01" /></td>
          <td><a onclick="$('#invite').submit();" class="button sc_a ml10"><span><?php echo $button_invite; ?></span></a></td>
        </tr>
       </table>
    </div>
     <h2 class="f14w bold" style="color: #646464; line-height: 30px;"><?php echo $text_invite_copy; ?></h2>
     
    <div class="content">
    	<table class="form">
      	<tr>
          <!--<td><?php echo $entry_invite; ?></td>-->
          <td>
              <input type="text" size="30" value="<?php echo $invite; ?>" name="link"  class=" input01">
              <input type="hidden" value="<?php echo $invite; ?>" name="sns" id="sns" >
          </td>
          <td>	
           <div id="copy-botton">
          	 <a  class="button"><span><?php echo $button_copy_link;?></span></a>
           </div>
        </td>
        </tr>
   		
       </table>
	</div>
    <script type="text/javascript" src="<?php echo HTTP_SERVER?>catalog/view/javascript/ZeroClipboard.js"></script>

    <script type="text/javascript">

			ZeroClipboard.setMoviePath("<?php echo HTTP_SERVER?>"+ZeroClipboard.moviePath);
			
			clip = new ZeroClipboard.Client();
			
			clip.setHandCursor(true); // 设置鼠标为手型
			
			clip.setText(document.getElementById('sns').value);
			
			clip.glue("copy-botton"); // 和上一句位置不可调换
			
			clip.addEventListener( "complete", function(){
			    alert("<?php echo $text_success_invite_copy;?>");
			});
	</script>
	
    <h2 class="f14w bold" style="color: #646464; line-height: 30px;"><?php echo $text_invite_sns; ?></h2>
    <div class="content">
    	<table class="form">
   		<tr>
          <td colspan="2"> <!-- AddThis Button BEGIN -->
          <div class="addthis_default_style"><a class="addthis_button_compact" u="<?php echo $invite;?>" ></a> <a class="addthis_button_email"></a><a class="addthis_button_print"></a> <a class="addthis_button_facebook"></a> <a class="addthis_button_twitter"></a></div>
          <script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js"></script> 
          <!-- AddThis Button END -->  </td>
        </tr>
       </table>
    </div>
    <?php if($invites){?>
    <h2><?php echo $text_invite_list; ?></h2>
    <div class="content">
      <table class="form">
       <?php foreach ($invites as $invite) { ?>
        <tr>
          <td><?php echo $invite['email']; ?></td>
          <td><?php echo $invite['firstname']; ?>&nbsp;&nbsp;<?php echo $invite['lastname']; ?></td>
          <td><?php echo $invite['date_added']; ?></td>
        </tr>
        <?php }?>
      </table>
    </div>
     <?php }?>
  </form>
  
  
  
    </div>
</div>
  
  
  


  <?php echo $content_bottom; ?>
<?php echo $footer; ?>