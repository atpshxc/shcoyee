<!--div class="box">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content">
    <div class="box-product">ddddd
      <?php foreach ($products as $product) { ?>
      <div class="product">
        <?php if ($product['thumb']) { ?>
        <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
        <?php } ?>
        <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
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
  <!--热门推荐-->
  <div class="ky_rmtj" style="margin-top:10px;">
    <div class="ky_rmtj_bt">
      <p>热门推荐</p>
      <div class="ky_rmtj_bt_right">
        <ul>
          <li><a href="index.php?route=product/search&filter_name=东革" target="_blank">马来西亚阿里</a></li>
          <li><a href="index.php?route=product/search&filter_name=洗发水" target="_blank">无硅洗发水</a></li>
          <li><a href="index.php?route=product/search&filter_name=顾儿达" target="_blank">顾儿达奶份全系</a></li>
          <li><a href="index.php?route=product/search&filter_name=Q10" target="_blank">Q10</a></li>
          <li><a href="index.php?route=product/search&filter_name=KANE" target="_blank">减肥圣品</a></li>
        </ul>
        <input type="button" class="more_button" value="更多"/>
      </div>
    </div>
    <div class="rmtj_content">
      <div class="rmtj_gg"><a href="index.php?route=product/product&product_id=55190" target="_blank"><img src="image/site/br_hot/rmtj_banne2r.jpg" width="230" height="324" /></a></div>
      <div class="rmtj_list">
        <ul>
          <?php foreach ($products as $product) { ?>
          <li> 
			
            <a href="<?php echo $product['href']; ?>" target="_blank">
            
            <img src="<?php echo $product['thumb']; ?>" /></a>
            <p class="tp_mc"><a href="<?php echo $product['href']; ?>" target="_blank"><?php echo $product['name']; ?></a></p>
            <p class="jg"><span style="font-size:22px;"><?php echo $product['price']; ?></span></p>
            <!--  <p class="yj"><?php echo $product['price']; ?></p>
           <p class="yj"><?php echo $product['price']; ?></p>
            zhangbo edit begin -->
            <p class="yj" style=" margin-top:-20px;text-align:right;  margin-right:60px;<?php if($product['tax_money']<=50) {?> color:#ccc;<?php }else{ ?>color:#000;text-decoration:none;  <?php }?> "><?php echo $product['text_tax_money']; ?><?php echo $product['tax_money']; ?> </p>
              <p class="yj" style="color:#000; margin-top:4px;text-align:right; margin-right:55px;text-decoration:none;">(税费≤50/订单 免征)</p>
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
  <!--热门推荐 end-->
