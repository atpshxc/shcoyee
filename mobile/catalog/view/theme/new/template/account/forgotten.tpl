<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>

  
  
  <!--注册-->
<div class="bg2">
  <div class="w1000">
    <div class="f18 pt20"><?php echo $heading_title; ?></div>
    <div class="bg_bs mt10 of">
      <div class="left w353" style="padding:40px 178px 35px 50px; border-right:1px solid #dedede;">
          <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="forgotten">
              <p style="font-size: 15px; line-height: 25px;"><?php echo $text_email; ?><br/><br/></p>
                <?php if ($error_warning) { ?>
                <div class="warning"><?php echo $error_warning; ?></div>
                <?php } ?>


                <div class="" style="height: 200px;">
                        <div class="dl_ipt">
                            <span class="left dl_wz c64 f14w"><?php echo $entry_email; ?></span><td><input type="text" class="dl_input" name="email" value="您常用的Email地址" onfocus="if(this.value=='您常用的Email地址'){this.value=''}" onblur="if(this.value==''){this.value='您常用的Email地址'}"  />

                        </div>
                    <div class="pt15">
                        <a href="javascript:void(0);" onclick="$('#register').submit();" class="dl_btn"><?php echo $button_submit; ?></a>
                    </div>
               </div>
             </form> 
      </div>

      <div class="left w237 center">
        <p><a href="#"><img src="/catalog/view/theme/new/images/ggt.jpg" width="237" height="224" /></a></p>
        <p class="mt30"><a href="/index.php?route=account/login" class="xzdl f14w">现在登录</a></p>
      </div>
    </div>
  </div>
</div>
  
  
  
  
  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>