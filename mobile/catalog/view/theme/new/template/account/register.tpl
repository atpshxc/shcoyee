<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<?php echo $content_top; ?>

  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>

<!--注册-->
<div class="bg2">
  <div class="w1000">
    <div class="f18 pt20">新用户注册</div>
    <div class="bg_bs mt10 of">
      <div class="left w353" style="padding:40px 178px 35px 50px; border-right:1px solid #dedede;">
           <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="register">
          <div class="">
          <div class="dl_ipt">
              <span class="left dl_wz c64 f14w">电子邮箱：</span><input type="text" class="dl_input" name="email"  value="<?php if($email) echo $email; else echo '您常用的Email地址'; ?>" onfocus="if(this.value=='您常用的Email地址'){this.value=''}" onblur="if(this.value==''){this.value='您常用的Email地址'}" />
                
          </div>
            <?php if ($error_email) { ?><div style="color:red; height: 30px; padding-left: 20px;"><span class="error"><?php echo $error_email; ?></span></div><?php } ?>   
                
          <div class="dl_ipt">
              <span class="left dl_wz c64 f14w">输入密码：</span><input type="password" name="password" value="<?php echo $password; ?>" class="dl_input"  />
          </div>
            <?php if ($error_password) { ?><div style="color:red; height: 30px; padding-left: 20px;"><span class="error"><?php echo $error_password; ?></span></div><?php } ?>   
               
            
          <div class="dl_ipt">
              <span class="left dl_wz c64 f14w">确认密码：</span><input type="password" name="confirm" value="<?php echo $confirm; ?>" class="dl_input"  />
          </div>
             <?php if ($error_confirm) { ?><div style="color:red; height: 30px; padding-left: 20px;"><span class="error"><?php echo $error_confirm; ?></span></div><?php } ?>   
               
          <div class="pt10 of">
            <div class="dl_ipt left" style="width:194px;"><span class="left dl_wz c64 f14w">验证码：</span><input type="text" name="captcha" value="<?php echo $captcha; ?>" class="dl_input" style="width:104px"/></div>
            <div class="left ml10"> <img id="captcha" src="index.php?route=information/contact/captcha" width="106" height="54" onclick="refreshCaptcha($(this).attr('id'),$(this).attr('src'));" title="<?php echo $text_refresh_captcha; ?>" alt="" />
            </div>
          </div>
              <?php if ($error_captcha) { ?><div style="color:red; height: 30px; padding-left: 20px;"><span class="error"><?php echo $error_captcha; ?></span></div><?php } ?>   
              
             
          <?php if ($text_agree) { ?>
          <div class="pt15 c64">
		<?php if ($agree) { ?> 
		<input type="checkbox" name="agree" value="1" checked="checked" />
		<?php } else { ?> 
		<input type="checkbox" name="agree" value="1" /> 
		<?php } ?> <?php echo $text_agree; ?>

	<?php } ?>
          </div>
          <div class="pt15"><a href="javascript:void(0);" onclick="$('#register').submit();" class="dl_btn">注 册</a></div>
          <input type="hidden" name="newsletter" value="1" /> 
            <input type="hidden" name="invite_code" value="<?php echo $invitecode; ?>" />
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
<!--注册 end--> 
  <?php echo $content_bottom; ?>

<script type="text/javascript" src="catalog/view/javascript/jquery/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
<script type="text/javascript"><!--
$('.fancybox').fancybox({
	width: 560,
	height: 560,
	autoDimensions: false
});
//--></script>  
<?php echo $footer; ?>


