<div class="ym">
  <div class="w1200">
    <div class="left welcome">
      <div class="left">
       <?php if (!$logged) { ?>
			  <?php echo $text_welcome; ?>
			<?php } else { ?>
			  <?php echo $text_logged; ?>
			<?php } ?>
      </div>
    </div>
    <div class="right">
      <div class="right welcome">关注我们：<a href="#"><img src="catalog/view/theme/new/images/wb.jpg" width="16" height="16" class="pr" /></a><a href="#"><img src="catalog/view/theme/new/images/wx.jpg" width="16" height="16" /></a></div>
      <div class="right welcome ym_lj pr"><a href="/index.php?route=information/helpcenter">帮助中心&nbsp;&nbsp;|</a></div>
      <div class="right welcome ym_lj pr"><a class="favorite" rel="nofollow" href="javascript:bookmarksite('<?php echo $store_name;?>','<?php echo $home;?>');"><?php echo $text_fav;?>&nbsp;&nbsp;|</a></div>
      <div class="right wdzh" onmouseover="MM_over(this)" onmouseout="MM_out(this)"><?php echo $text_account;?>&nbsp;&nbsp;|
        <div style="display: none; z-index:9999;" class="wdzh_nr">
          <ul>
              <li><a rel="nofollow" href="<?php echo $order;?>"><?php echo $text_my_orders;?></a></li>
              <li><a rel="nofollow" href="<?php echo $address;?>"><?php echo $text_address;?></a></li>
              <li><a rel="nofollow" href="<?php echo $wishlist;?>"><?php echo $text_wishlist;?></a></li>
              <li><a rel="nofollow" href="<?php echo $download;?>"><?php echo $text_download;?></a></li>
              <li><a rel="nofollow" href="<?php echo $transaction;?>"><?php echo $text_transaction;?></a></li>
              <li><a rel="nofollow" href="<?php echo $reward;?>"><?php echo $text_reward;?></a></li>
              <li><a rel="nofollow" href="<?php echo $invite;?>"><?php echo $text_invite;?></a></li>
          </ul>
        </div>
      </div>
      <div class="right welcome ym_lj pr"><a href="/index.php?route=checkout/cart">购物车&nbsp;&nbsp;|</a></div>
      <div class="form right">
          <div  class="gwc"  onmouseover="ajaxcart(this);MM_over(this);" onmouseout="MM_out(this)"><img src="catalog/view/theme/new/images/jt.jpg" width="9" height="5" class="jt" /><p id="cart_total"><?php echo $text_items; ?></p>
            <div   style="display: none; z-index:9999;" class="gwc_nr">
                <p class="bold lh20 pt10">最近加入的宝贝</p>
              <div id="cctent">
                  
              </div> 
              <div class="gwc_ck"><a href="/index.php?route=checkout/checkout">去结账&nbsp;</a></div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>