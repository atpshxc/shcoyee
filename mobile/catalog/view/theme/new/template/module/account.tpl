<div class="member-left">
	<ul class="nav">
	<?php if ($logged) { ?>
		<div style="padding-bottom:12px;">        
                    <div class="w150_bt f14w"><?php echo $text_orders;?></div>
			<ul class="bzzx">
				<li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
				<li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
				<li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
				<!--li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
				<li><a href="<?php echo $reward; ?>"><?php echo $text_reward; ?></a></li-->
			</ul>
		</div>
                

		<div style="padding-bottom:12px;">        
                    <div class="w150_bt f14w"><?php echo $text_service;?></div>
			<ul class="bzzx">
				<li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
			</ul>
		</div>
		<div style="padding-bottom:12px;">        
                    <div class="w150_bt f14w"><?php echo $text_info;?></div>
			<ul class="bzzx">
				<li><a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
				<li><a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
				<li><a href="<?php echo $address; ?>"><?php echo $text_address; ?></a></li>
				<li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
			</ul>
		</div>
		<div style="padding-bottom:12px;">        
                    <div class="w150_bt f14w"><?php echo $text_application;?></div>
			<ul class="bzzx">
				<li><a href="<?php echo $invite; ?>"><?php echo $text_invite; ?></a></li>
				<li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
			</ul>
		</div>
	 <?php }  else { ?>
		<div style="padding-bottom:12px;">        
                    <div class="w150_bt f14w"><?php echo $text_member_center;?></div>
			<ul class="bzzx">
				<li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
				<li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
				<li><a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a></li>
			</ul>
		</div>
	 <?php } ?>
	</ul>
</div>
        
