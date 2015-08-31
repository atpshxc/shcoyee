<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<?php echo $content_top; ?>

  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>

<!--注册-->
<div class="bg2">
    <div class="f18 pt20">新用户注册</div>
    <div class="bg_bs mt10 of">
           <form class="form-horizontal" role="form" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="register">
           		 <div class="form-group" style="margin-left:0px;margin-right:0px">
				      <label for="email" class="col-xs-3 control-label" style="line-height:52px;">电子邮箱：</label>
				      <div class="col-xs-9">
				         <input type="text" class="dl_input" name="email"  value="<?php if($email) echo $email;?>"
				            placeholder="您常用的Email地址">
				         <?php if ($error_email) { ?><div style="color:red; height: 30px; padding-left: 20px;"><span class="error"><?php echo $error_email; ?></span></div><?php } ?>
				      </div>
			  	</div>
           		 <div class="form-group" style="margin-left:0px;margin-right:0px">
				      <label for="password" class="col-xs-3 control-label" style="line-height:52px;">输入密码：</label>
				      <div class="col-xs-9">
				         <input type="password" name="password" value="<?php echo $password; ?>" class="dl_input">
				         <?php if ($error_password) { ?><div style="color:red; height: 30px; padding-left: 20px;"><span class="error"><?php echo $error_password; ?></span></div><?php } ?>
				      </div>
			  	</div>
           		 <div class="form-group" style="margin-left:0px;margin-right:0px">
				      <label for="confirm" class="col-xs-3 control-label" style="line-height:52px;">确认密码：</label>
				      <div class="col-xs-9">
				         <input type="password" name="confirm" value="<?php echo $confirm; ?>" class="dl_input"  />
				         <?php if ($error_confirm) { ?><div style="color:red; height: 30px; padding-left: 20px;"><span class="error"><?php echo $error_confirm; ?></span></div><?php } ?>
				      </div>
			  	</div>
           		 <div class="form-group" style="margin-left:0px;margin-right:0px">
				      <label for="captcha" class="col-xs-3 control-label" style="line-height:52px;">
				      	验证码：
				      </label>
				      <div class="col-xs-7">
				      	<input type="text" name="captcha" value="<?php echo $captcha; ?>" class="dl_input" style="width:104px"/>
				         <div class="left ml10"> <img id="captcha" src="index.php?route=information/contact/captcha" width="106" height="54" onclick="refreshCaptcha($(this).attr('id'),$(this).attr('src'));" title="<?php echo $text_refresh_captcha; ?>" alt="" /></div>
				         <?php if ($error_captcha) { ?><div style="color:red; height: 30px; padding-left: 20px;"><span class="error"><?php echo $error_captcha; ?></span></div><?php } ?>
				      </div>
			  	</div>
          <?php if ($text_agree) { ?>
          <div class="pt15 c64">
		<?php if ($agree) { ?> 
		<input type="checkbox" name="agree" value="1" checked="checked" />
		<?php } else { ?> 
		<input type="checkbox" name="agree" value="1" /> 
		<?php } ?> <?php echo $text_agree; ?>

	<?php } ?>
          </div>
          <div class="pt15"><a href="javascript:void(0);" onclick="$('#register').submit();" class="dl_btn" style="margin-bottom:10px;">注 册</a></div>
          <input type="hidden" name="newsletter" value="1" /> 
            <input type="hidden" name="invite_code" value="<?php echo $invitecode; ?>" />
        </div>
  </form>
  <br>
     <!-- <div class="left w237 center">
        <p><a href="#"><img src="/catalog/view/theme/new/images/ggt.jpg" width="237" height="224" /></a></p>
        <p class="mt30"><a href="/index.php?route=account/login" class="xzdl f14w">现在登录</a></p>
      </div>-->
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


