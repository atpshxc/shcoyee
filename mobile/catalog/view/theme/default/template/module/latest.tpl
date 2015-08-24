  <div class="ky_rmtj"  style="margin-top:10px;">
    <div class="ky_zxxp_bt">
      <p>最新新品</p>
      <div class="ky_zxxp_bt_right">
        <ul>
          <li><a href="index.php?route=product/search&filter_name=奶粉" target="_blank">迈高婴幼儿配方奶粉</a></li>
          <li><a href="index.php?route=product/search&filter_name=御酒" target="_blank">酒中圣品</a></li>
          <li><a href="index.php?route=product/search&filter_name=MACA" target="_blank">玛卡养生</a></li> 
        </ul>
        <input type="button" class="more_button2" value="更多"/>
      </div>
    </div>
    <div class="rmtj_content">
      <div class="rmtj_gg"><a href="index.php?route=product/product&product_id=55188" target="_blank"><img src="image/site/br_new/rmtj_banner.jpg" width="230" height="324" /></a></div>
      <div class="rmtj_list">
        <ul>
          <?php foreach ($products as $product) { ?>
          <li> 
            <a href="<?php echo $product['href']; ?>" target="_blank">
            
            <img src="<?php echo $product['thumb']; ?>"  /></a>
            <p class="tp_mc"><a href="<?php echo $product['href']; ?>" target="_blank"><?php echo $product['name']; ?></a></p>
            <p class="jg"><span style="font-size:22px;"><?php echo $product['price']; ?></span></p>
             <!--  <p class="yj"><?php echo $product['price']; ?></p>
           <p class="yj"><?php echo $product['price']; ?></p>
            zhangbo edit begin -->
            <p class="yj" style=" margin-top:-20px;text-align:right;  margin-right:60px;<?php if($product['tax_money']<=50) {?> color:#ccc;<?php }else{ ?>color:#000;text-decoration:none;  <?php }?> "><?php echo $product['text_tax_money']; ?><?php echo $product['tax_money']; ?> </p>
              <p class="yj" style="color:#000; margin-top:5px;text-align:right; margin-right:55px;text-decoration:none;">(税费≤50/订单 免征)</p>
              <p class="yj" style="margin-top:-308px; text-align:right;">
              <img  src="catalog/view/theme/default/image/<?php echo $product['classid']; ?>.png" /></p>
          <!-- zhangbo edit end -->
            <input type="button" class="lzqg_button"/>
          </li>
          <?php } ?>
           
        </ul>
      </div>
    </div>
  </div>
<!--div class="box">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content">
  <div class="box-product" >
    <?php foreach ($products as $product) { ?>
      <div class="ym-g25"> 
        <?php if ($product['thumb']) { ?>
        <div class="image"  ><a href="<?php echo $product['href']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
        <?php } ?>
        <div class="name"><a href="<?php echo $product['href']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>"><?php echo $product['name']; ?></a></div>
        <?php if ($product['price']) { ?>
        <div class="price">
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
          <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
          <?php } ?>
        </div>
        <?php } ?>
        <?php if ($product['rating']) { ?>
        <div class="rating"><img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
        <?php } ?>
        <div class="cart"><a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button"><span><?php echo $button_cart; ?></span></a></div>
      </div>
    
      <?php } ?>
     </div>
  </div>
</div-->
