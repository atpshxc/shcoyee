<!--益健康-->
<div class="w1200" >
  <div class="yjk_bt of">
      <div class="left red"><a target="_blank" href="index.php?route=product/category&path=0&columnsid=1" ><img src="catalog/view/theme/new/images/yjk.jpg" width="30" height="37" class="yjk_tb" /> </a><span class="f38">益健康</span>&nbsp;告别亚健康，做健康幸福人</div>
    <a target="_blank" href="index.php?route=product/category&path=0&columnsid=1" class="more right"><span class="bold">MORE</span>更多商品<img src="catalog/view/theme/new/images/jt_you.jpg" width="6" height="10" /></a>
  </div>
  <div class="yjk_nr of">
    <div class="">
      <div class="left" style="width:251px; border-bottom: 1px solid #eee;"><a target="_blank" href="index.php?route=product/category&path=0&columnsid=2" ><img src="catalog/view/theme/new/images/tp03.jpg" width="251" height="483" /></a></div>
      <div class="right" style="width:946px" >
   
         <?php
         $i=1;
         foreach ($products1 as $product)
         {
                if($i%4==0 )
		{ $maleft='style="border-left:none;"';}
                else
                {$maleft="";}
         ?>
         <div class="cpxx right" <?php echo $maleft; ?>>
             <p class="center cpxx_p pt10"><a target="_blank" title="<?php echo $product['name']; ?>" href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" width="207" height="207" /></a></p>
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
         $i++;
         }
         ?>
         
      </div>
    </div>
    <div class="hz clear" >
      <ul>
        <?php
         foreach ($manufacturers1 as $manufacturer)
         {
         ?>
         <li><a target="_blank" href="/index.php?route=product/category&path=0&manufacturerid=<?php echo $manufacturer['manufacturer_id']; ?>"><img src="<?php echo $manufacturer['image']; ?>" width="100" height="40" alt="<?php echo $manufacturer['name']; ?>" /></a></li>
         <?php
         }
         ?>
      </ul>
    </div>
  </div>
</div>
<!--益健康 end-->       


<!--益生活-->
<div class="w1200" >
  <div class="yjk_bt of">
      <div class="left red"><a target="_blank" href="index.php?route=product/category&path=0&columnsid=2" ><img src="catalog/view/theme/new/images/ysh.jpg" width="28" height="37" class="yjk_tb" /></a><span class="f38">益生活</span>&nbsp;美丽生活，从此开始</div>
    <a href="index.php?route=product/category&path=0&columnsid=2" class="more right"><span class="bold">MORE</span>更多商品<img src="catalog/view/theme/new/images/jt_you.jpg" width="6" height="10" /></a>
  </div>
  <div class="yjk_nr of">
    <div class="">
        <div class="left" style=" border-bottom: 1px solid #eee;"><a target="_blank" href="index.php?route=product/category&path=0&columnsid=2" ><img src="catalog/view/theme/new/images/tp04.jpg" width="251" height="483" /></a></div>
      <div class="right" style="width:946px" >
       
          <?php
         foreach ($products2 as $product)
         {
                if($i%4==0 )
		{ $maleft='style="border-left:none;"';}
                else
                {$maleft="";}
         ?>
         <div class="cpxx right" <?php echo $maleft; ?>>
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
         $i++;
         }
         ?>
         
       
      </div>
    </div>
      <div class="hz clear" >
      <ul>
        <?php
         foreach ($manufacturers2 as $manufacturer)
         {
         ?>
         <li><a target="_blank" href="/index.php?route=product/category&path=0&manufacturerid=<?php echo $manufacturer['manufacturer_id']; ?>"><img src="<?php echo $manufacturer['image']; ?>" width="100" height="40" alt="<?php echo $manufacturer['name']; ?>" /></a></li>
         <?php
         }
         ?>
      </ul>
    </div>

    </div>
  </div>
</div>
<!--益生活 end-->   