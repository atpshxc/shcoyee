<!--div id="hotsell" class="box">
  <div class="box-heading"><h2><?php echo $heading_title; ?></h2></div>
  <div class="box-content">
    <div class="box-product">
      <?php foreach ($products as $product) { ?>
      <div class="product">
        <?php if ($product['thumb']) { ?>
        <div class="image"><a href="<?php echo $product['href']; ?>" title="<?php echo $product['name']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
        <?php } ?>
        <div class="name"><a href="<?php echo $product['href']; ?>" title="<?php echo $product['name']; ?>"><?php echo $product['name']; ?></a></div>
        <?php if ($product['price']) { ?>
        <div class="price">
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
          <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
          <?php } ?>
        </div>
        <?php } ?>
      </div>
      <?php } ?>
    </div>
  </div>
</div-->
<!--热门推荐-->
  <div class="ky_rmtj">
    <div class="ky_rmtj_bt">
      <p>热门推荐</p>
      <div class="ky_rmtj_bt_right">
        <ul>
          <li><a href="#">湿巾</a></li>
          <li><a href="#">3段奶粉</a></li>
          <li><a href="#">婴儿肉松</a></li>
          <li><a href="#">洗衣液</a></li>
          <li><a href="#">婴儿床</a></li>
          <li><a href="#">孕妇装</a></li>
        </ul>
        <input type="button" class="more_button" value="更多"/>
      </div>
    </div>
    <div class="rmtj_content">
      <div class="rmtj_gg"><a href="#"><img src="catalog/view/theme/default/kyimages20140915/rmtj_banner.jpg" width="230" height="324" /></a></div>
      <div class="rmtj_list">
        <ul>
          <li> 
            <a href="#"><img src="catalog/view/theme/default/kyimages20140915/cp_pic.jpg" width="240" height="227" /></a>
            <p class="tp_mc"><a href="#">Wyeth/惠氏 进口奶源 S-26金装幼...</a></p>
            <p class="jg">￥<span style="font-size:22px;">213.00</span></p>
            <p class="yj">￥213.00</p>
            <input type="button" class="lzqg_button"/>
          </li>
          <li> 
            <a href="#"><img src="catalog/view/theme/default/kyimages20140915/cp_pic.jpg" width="240" height="227" /></a>
            <p class="tp_mc"><a href="#">Wyeth/惠氏 进口奶源 S-26金装幼...</a></p>
            <p class="jg">￥<span style="font-size:22px;">213.00</span></p>
            <p class="yj">￥213.00</p>
            <input type="button" class="lzqg_button"/>
          </li>
          <li> 
            <a href="#"><img src="catalog/view/theme/default/kyimages20140915/cp_pic.jpg" width="240" height="227" /></a>
            <p class="tp_mc"><a href="#">Wyeth/惠氏 进口奶源 S-26金装幼...</a></p>
            <p class="jg">￥<span style="font-size:22px;">213.00</span></p>
            <p class="yj">￥213.00</p>
            <input type="button" class="lzqg_button"/>
          </li>
        </ul>
      </div>
    </div>
  </div>
  <!--热门推荐 end-->
