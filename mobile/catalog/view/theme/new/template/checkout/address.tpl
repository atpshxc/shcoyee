<?php if ($addresses) { 
		foreach ($addresses as $address) { 
		?><li class='curr' sysno='13718160' aid='2046'>
			<label style="width:100%;padding:0px;margin:0px;" onclick='hiddnewadd();'>
				<?php if ($address['address_id'] == $address_id) { 
					?><input type='radio' name='addSel' checked='true'>
				<?php }else{ ?><input type='radio' name='addSel' ><?php } ?>
				<span class='name' style="width:15%;margin:0px;">&nbsp;<?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?></span> 
				<span class='addrinfo' style="width:80%;margin-right:0px;"><?php echo $address['zone']; ?><?php echo $address['city']; ?><?php echo $address['address_1']; ?> <?php echo $address['address_2']; ?></span>
				<!--<span class='phone' style="padding-left:120px"><?php echo $entry_mobile; ?><span> <?php echo $address['mobile']; ?></span></span>-->
			</label>
			<!--<a href='<?php echo HTTP_SERVER?>/index.php?route=account/address/delete&address_id=<?php echo $address['address_id']; ?>' class='edit orange' >[删除]</a>--> 
		  </li>
		<?php }} ?>