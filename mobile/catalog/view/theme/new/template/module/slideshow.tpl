<div class="flexslider">
  <ul class="slides">
   <?php foreach ($banners as $banner) { ?>
    <?php if ($banner['link']) { ?>
    <li style="background:url(<?php echo $banner['image']; ?>) 50% 0 no-repeat;"><a target="_blank" href="<?php echo $banner['link']; ?>"><div style="height:100%; width: 100%;"></div></a></li>
    <?php } else { ?>
    <li style="background:url(<?php echo $banner['image']; ?>) 50% 0 no-repeat;"></li>
    <?php } ?>
    <?php } ?>
  </ul>
</div>




