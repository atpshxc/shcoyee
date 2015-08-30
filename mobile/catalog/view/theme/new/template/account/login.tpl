<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<?php echo $content_top; ?>


    
    
<?php if ($success) { ?>
<div class="success"><?php echo $success; ?></div>
<?php } ?> <?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
    
    
<!--登录-->
<div class="bg2">
    <div class="f18 pt20">用户登录</div>
    <div class="bg_bs mt10 of">
      <!--<div class="left"><img src="<?php echo HTTP_SERVER?>/catalog/view/theme/new/images/dl_img.jpg" width="538" height="368" /></div>-->
        <div class="f18 red pb12"><a href="<?php echo HTTP_SERVER?>/index.php?route=account/register" class="ljzc f14w"><img src="<?php echo HTTP_SERVER?>/catalog/view/theme/new/images/ljzc.jpg" width="16" height="16" />&nbsp;立即注册</a>可益会员</div>
        <form class="form-horizontal" role="form" action="<?php echo $action; ?>" method="post"
              enctype="multipart/form-data" id="login">
			    <div class="col-sm-12">
	              <div class="input-group">
	              	<span class="input-group-addon">电子邮箱：</span>
				    <input class="form-control" type="text" name="email" placeholder="请输入电子邮箱" />
				  </div>
	              <div class="input-group">
	              	<span class="input-group-addon">输入密码：</span>
				    <input type="password" class="form-control"  name="password" placeholder="请输入密码">
				  </div>
			  	</div>
			  </div>
			  
            <div class="">
              
              <div class="pt15"><a href="javascript:void(0);" onclick="$('#login').submit();" class="dl_btn">登 陆</a></div>
            <div class="pt15 c64"><a href="<?php echo $forgotten; ?>" class="right forget">忘记密码</a><?php if ($redirect) { ?> <input type="hidden" name="redirect"
            value="<?php echo $redirect; ?>" /> <?php } ?><br/></div>
            </div>
        </form>
    </div>
</div>
<!--登录 end-->     

<?php echo $content_bottom; ?>
<script type="text/javascript"><!--
$('#login input').keydown(function(e) {
	if (e.keyCode == 13) {
		$('#login').submit();
	}
});
//--></script>

<script
	type="text/javascript"
	src="catalog/view/javascript/jquery/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css"
	href="catalog/view/javascript/jquery/fancybox/jquery.fancybox-1.3.4.css"
	media="screen" />
<script type="text/javascript"><!--
$('.fancybox').fancybox({
	width: 560,
	height: 560,
	autoDimensions: false
});
//--></script>
<?php echo $footer; ?>