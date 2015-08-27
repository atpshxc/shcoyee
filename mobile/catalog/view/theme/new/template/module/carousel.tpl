
<div style=" width: 1200px; margin: auto; overflow: auto; margin-bottom: 0px; margin-top: 10px; ">
    <div class="hz clear">
      <ul>
       <?php foreach ($banners as $banner) { ?>
       <li><a href="<?php echo $banner['link']; ?>"><img alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" src="<?php echo $banner['image']; ?>"  /></a></li>
        <?php } ?>
      </ul>
    </div>
</div>
