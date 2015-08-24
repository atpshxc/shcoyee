  <?php
  if($products)
  {
  foreach ($products as $product) 
  {
  ?>
    <div class="of gwc_bb" style="margin-left: 5px;">
        <a href="<?php echo $product['href']; ?>">
            <img src="<?php echo $product['thumb']; ?>" width="207" height="207" class="tp left pr" />
        </a>
        <div class="left lh20">
            <p class="gwc_wz">
                <a href="<?php echo $product['href']; ?>" class="sc">
                   <?php echo $product['quantity']; ?>x<?php echo $product['name']; ?>
                </a>
            </p>
            <p>
                <span class="red pr">
                    <?php echo $product['total']; ?>
                </span>
                <a  href="javascript:removeCart('<?php echo $product['key']; ?>','<?php echo $product['classid']; ?>')" class="sc">
                    删除
                </a>
            </p>
        </div>
    </div>
   <?php 
   }}else
   {
   ?><div class="of gwc_bb" style="margin-left: 5px;">您的购物车没有宝贝，赶紧去选吧</div><?php 
   }
   ?>
