<!--益健康-->
<div class="row" >
  <div class="col-xs-12">
  	<div class="yjk_bt of">
      <div class="left red"><a target="_blank" href="index.php?route=product/category&path=0&columnsid=1" ><img src="catalog/view/theme/new/images/yjk.jpg" width="30" height="37" class="yjk_tb" /> </a><span class="f38">益健康</span>&nbsp;告别亚健康，做健康幸福人</div>
    <!--<a target="_blank" href="index.php?route=product/category&path=0&columnsid=1" class="more right"><span class="bold">MORE</span>更多商品<img src="catalog/view/theme/new/images/jt_you.jpg" width="6" height="10" /></a>-->
    </div>
  </div>
</div>  
   
<?php
	$row = 2;
	$col = 2;
	$products_row_col = Array();
	
	for($i=0;$i<$row;$i++){
		$products_row_col[$i] = Array();
		for($k=0;$k<$col;$k++){
			if(count($products1) > $i*$row+$k){
				$products_row_col[$i][$k] = $products1[$i*$row+$k];
			}
		}	
	}
	
	foreach ($products_row_col as $product_row) {
?>
 	<div class="row">
 	<?php
 		foreach ($product_row as $product) {
 	?>
		<div class="col-xs-6">
	         <p class="center cpxx_p pt10"><a target="_blank" title="<?php echo $product['name']; ?>" href="<?php echo $product['href']; ?>"><img class="img-responsive" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>"/></a></p>
	         <p class="pt10 cpxx_w"><a target="_blank" href="<?php echo $product['href']; ?>" title="<?php echo $product['name']; ?>" class="f14w cpxx_a"><?php echo $product['name']; ?></a></p>
		      <p class="hs lh23">
		        <?php if (!$product['special']) { ?>  
		            <span class="f12"><?php echo $product['price']; ?></span>
		        <?php } else { ?>
		            <span class="f12"><?php echo $product['special']; ?></span> &nbsp;<span class="qian2"><?php echo $product['price']; ?></span>
		        <?php } ?>
		      </p>
	    </div>
<?php
		}
?>
 	</div>
 <?php
	}
?>
<!--益健康 end-->       


<!--益生活-->
<div class="row">
  <div class="col-xs-12">
  	<div class="yjk_bt of">
      <div class="left red"><a target="_blank" href="index.php?route=product/category&path=0&columnsid=2" ><img src="catalog/view/theme/new/images/ysh.jpg" width="28" height="37" class="yjk_tb" /></a><span class="f38">益生活</span>&nbsp;美丽生活，从此开始</div>
    </div>
  </div>
</div>
<?php
	//$row = 2;
	//$col = 2;
	$products2_row_col = Array();
	
	for($i=0;$i<$row;$i++){
		$products2_row_col[$i] = Array();
		for($k=0;$k<$col;$k++){
			if(count($products2) > $i*$row+$k){
				$products2_row_col[$i][$k] = $products2[$i*$row+$k];
			}	
		}	
	}
	
	foreach ($products2_row_col as $product_row) {
?>
 	<div class="row">
 	<?php
 		foreach ($product_row as $product) {
 	?>
		<div class="col-xs-6">
	         <p class="center cpxx_p pt10"><a target="_blank" title="<?php echo $product['name']; ?>" href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" width="207" height="207" /></a></p>
             <p class="pt10 cpxx_w"><a target="_blank" title="<?php echo $product['name']; ?>" href="<?php echo $product['href']; ?>" class="f14w cpxx_a"><?php echo $product['name']; ?></a></p>
          	<p class="hs lh23">
            <?php if (!$product['special']) { ?>  
                <span class="f12"><?php echo $product['price']; ?></span>
            <?php } else { ?>
                <span class="f12"><?php echo $product['special']; ?></span> &nbsp;<span class="qian2"><?php echo $product['price']; ?></span>
            <?php } ?>
        	</p>
	    </div>
<?php
		}
?>
 	</div>
 <?php
	}
?>  
<!--益生活 end-->   
<br/><br/><br/>