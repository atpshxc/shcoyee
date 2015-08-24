<!--热销产品-->
<div class="rxcp">
  <div class="rxcp_bt">
    <p class="red f32">热销产品</p>
    <p class="red f14">Hot products</p>
  </div>
</div>
<div class="w1200 pt15"> 
<?php
$i=1;
$lr="left";
foreach ($products as $product) 
{
    $classname="自贸";
    if($product["classid"]=='1')
    {
        $classname="自贸";
    }else if($product["classid"]=='2')
    {
        $classname="直邮";
    }else
    {
         $classname="一般进口";
    }
    

    if($i%2==0)
    {
        $lr="right";
    }else
    {
        $lr="left";
    }
?>

  <div class="<?php echo $lr; ?> rxcp_nr">
    <div class="rmcp_tp">
        <div style="text-align: center;"><a href="<?php echo $product['href']; ?>" title="<?php echo $product['name']; ?>" target="_blank" ><img src="<?php echo $product['thumb1']; ?>" alt="<?php echo $product['name']; ?>" height="319" /></a></div>
      <div class="of">
          <div class="left dg_wz" style=" margin-left: 5px; margin-bottom: 5px;">
              <span class="cpzx f14" style="padding: 9px;">&nbsp;产地直销-<?php echo $classname; ?></span></div>
        <div class="right rmz">热卖中</div>
      </div>
    </div>
    <div class="rmwz of" style="height:145px;">
      <div class="left w375">
          <p class="c35" style="max-height:50px; min-height: 30px; overflow:hidden; font-size:18px;"><b><?php echo $product['name']; ?></b></p>
        <p class="lh20 c999" style=" max-height: 80px; overflow:hidden;"><?php echo $product['meta_description']; ?></p>
       <?php if($product['tags']) { ?>
       <div class="pt10">
            <?php
             $tags=explode(',',str_replace("，",",",$product['tags']));
             $k=0;
             foreach( $tags as $tag)
             {
             if($k<4)
             {
            ?>
                <a class="bq"><?php echo $tag; ?></a>
             <?php }
             $k++;
             } ?>
        </div>
        
        <?php } ?>
      </div>
      <div class="right w160">
        <p class="hs f20">
            <?php if (!$product['special']) { ?>  
                <span class="f32"><?php echo $product['price']; ?></span>
            <?php } else { ?>
                <span class="f32"><?php echo $product['special']; ?></span>
            <?php } ?>
        </p>
        <p class="hs"><?php if($product['tax_money']<=50) { ?>(关税≤50/订单 免征)<?php }else { ?><?php echo $product['text_tax_money']; ?><?php echo $product['tax_money']; ?><?php } ?></p>
        <p class="c999 pt15"><?php echo $product['viewed'] ?>人已关注</p>
        <a href="<?php echo $product['href']; ?>" target="_blank" class="ljgm" >立即购买</a>
      </div>
    </div>

</div>
<?php
$i++;
}
?> 
</div>
<!--热销产品 end-->
