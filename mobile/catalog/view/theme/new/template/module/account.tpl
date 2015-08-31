<nav class="navbar navbar-default" role="navigation">
	   <div class="navbar-header">
	      <button type="button" class="navbar-toggle" data-toggle="collapse" 
	         data-target="#account-navbar-collapse">
	         <span class="sr-only">切换导航</span>
	         <span class="icon-bar"></span>
	         <span class="icon-bar"></span>
	         <span class="icon-bar"></span>
	      </button>
	   </div>
	   <div class="collapse navbar-collapse" id="account-navbar-collapse">
	      <ul class="nav navbar-nav">
	         <li class="dropdown">
	            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
	               <?php echo $text_orders;?> <b class="caret"></b>
	            </a>
	            <ul class="dropdown-menu">
	               <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
	               <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
	               <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
	            </ul>
	         </li>
	         <li class="dropdown">
	            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
	               <?php echo $text_service;?> <b class="caret"></b>
	            </a>
	            <ul class="dropdown-menu">
	               <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
	            </ul>
	         </li>
	         <li class="dropdown">
	            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
	               <?php echo $text_info;?> <b class="caret"></b>
	            </a>
	            <ul class="dropdown-menu">
	               <li><a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
	               <li><a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
	               <li><a href="<?php echo $address; ?>"><?php echo $text_address; ?></a></li>
	               <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
	            </ul>
	         </li>
	         <!--<li class="dropdown">
	            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
	               <?php echo $text_application;?> <b class="caret"></b>
	            </a>
	            <ul class="dropdown-menu">
	               <li><a href="<?php echo $invite; ?>"><?php echo $text_invite; ?></a></li>
	               <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
	            </ul>
	         </li>-->
	      </ul>
	   </div>
	</nav>
<!--	
<div class="member-left">
	<ul class="nav">
	<?php if ($logged) { ?>
		<div style="padding-bottom:12px;">        
                    <div class="w150_bt f14w"><?php echo $text_orders;?></div>
			<ul class="bzzx">
				<li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
				<li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
				<li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
				--<li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
				<li><a href="<?php echo $reward; ?>"><?php echo $text_reward; ?></a></li--
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
--> 
