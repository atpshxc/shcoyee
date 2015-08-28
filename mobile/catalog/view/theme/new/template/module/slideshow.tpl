<!--
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
-->
<div class="row">
		<div class="col-xs-12">
			<div id="myCarousel" class="carousel slide">
			   <!-- 轮播（Carousel）指标 -->
			   <ol class="carousel-indicators">
			   <?php
			   		$i = 0; 
			   		foreach ($banners as $banner) { 
			   			if($i==0){
			   ?>
			      		<li data-target="#myCarousel" data-slide-to="<?echo $i?>" class="active"></li>
			    		<?php
				    	} else {
				    	?> 
				    		<li data-target="#myCarousel" data-slide-to="<?echo $i?>"></li>
				    	<?php
				    	}
				    	$i++;
				    }
			    		?>   
			   </ol>   
			   <!-- 轮播（Carousel）项目 -->
			   <div class="carousel-inner">
			   		<?php $i = 0; foreach ($banners as $banner) { ?>
				    <?php if ($banner['link']) { ?>
				    <div class="item <?php if($i==0) echo 'active';?>">
				    	<a target="_blank" href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>"></a>
				    </div>	
				    <?php } else { ?>
				    <div class="item">
				    	<img src="<?php echo $banner['image']; ?>">
				    </div>	
				    <?php } ?>
				    <?php 
				    $i++;
				    } ?>
			   </div>
			   <!-- 轮播（Carousel）导航 -->
			   <a class="carousel-control left" href="#myCarousel" 
			      data-slide="prev">&lsaquo;</a>
			   <a class="carousel-control right" href="#myCarousel" 
			      data-slide="next">&rsaquo;</a>
			</div> 
		</div>
	</div>




