<!--div class="slideshow">
  <div id="slideshow<?php echo $module; ?>" class="nivoSlider" style="width: <?php echo $width; ?>px; height: <?php echo $height; ?>px;">
    <?php foreach ($banners as $banner) { ?>
    <?php if ($banner['link']) { ?>
    <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" /></a>
    <?php } else { ?>
    <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" />
    <?php } ?>
    <?php } ?>
  </div>
</div>
<script type="text/javascript"><!
$(document).ready(function() {
	$('#slideshow<?php echo $module; ?>').nivoSlider();
});
></script-->
<div class="content_top" style="margin-top:-5px;">
    <div class="content_top_left">
      <div class="spfl_bt">商品分类</div>
      <ul class="spfl_list" style="font-size:14px;">
        <li><a href="index.php?route=product/category&path=81">玛卡系列</a></li>
        <li><a href="index.php?route=product/category&path=82">KANEKA系列</a></li>
        <li><a href="index.php?route=product/category&path=83">进口奶粉系列</a></li>
        <li><a href="index.php?route=product/category&path=100">胶原蛋白</a></li>
        <li><a href="index.php?route=product/category&path=101">御酒丸</a></li>
        <li><a href="index.php?route=product/category&path=102">其它进口产品</a></li>
        <li><a href="#">待进口...</a></li>
      </ul>
    </div>
    <div class="content_top_right">
        <div style="HEIGHT:300px; OVERFLOW: hidden;" id=idTransformView>
          <ul id=idSlider class=slider>
            <div style="POSITION: relative">
              <a href="index.php?route=product/product&product_id=55177" target="_blank"><img src="image/site/br/1.jpg" width="731" height="300" /></a>
            </div>
            <div style="POSITION: relative">
              <a href="#" target="_blank"><img src="image/site/br/2.jpg" width="731" height="300" /></a>
            </div>  
            <div style="POSITION: relative">
              <a href="#" target="_blank"><img src="image/site/br/3.jpg" width="731" height="300" /></a>
            </div>
         </ul>
      </div>
    <div>
    <ul id=idNum class=hdnum>
      <li>玛卡－秘鲁进口保健精品正品保证</li>
      <li>全段婴儿奶粉养娃不易给你福利</li>
      <li style="width:243px">我要健康养发，无硅洗发水</li>
    </ul>
    <script language=javascript>
      mytv("idNum","idTransformView","idSlider",300,3,true,2000,3,true,"onmouseover");
      //按钮容器aa，滚动容器bb，滚动内容cc，滚动宽度dd，滚动数量ee，滚动方向ff，延时gg，滚动速度hh，自动滚动ii，
    </script>
    </div>
    </div>
  </div>