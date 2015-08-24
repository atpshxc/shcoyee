<?php echo $header; ?><?php echo $column_right; ?>
<?php echo $content_top; ?>
<style>
    .tab02{ width: 100%; margin-top: 10px;}
    .sc02{ background: #c40001;width: 60px; height: 28px; line-height: 28px; color: #fff; display: block; text-align: center; cursor: pointer}
    .sc02:hover{ background: #ff3048}
</style>

  <!--帮助中心-->
<div class="bg">
  <div class="w1200 pt15">
    <div class="left w150">
       <?php echo $column_left; ?>
    </div>
    <div class="right w1028">
      <p class="w1028_bt bold"><?php echo $heading_title; ?></p>
 <?php if ($products) { ?>
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="wishlist">
    <div class="wishlist-product">
        <table class="tab02">
        <thead>
          <tr>
            <td class="remove bold"><?php echo $column_remove; ?></td>
            <td class="image bold"><?php echo $column_image; ?></td>
            <td class="name bold"><?php echo $column_name; ?></td>
            <td class="model bold"><?php echo $column_model; ?></td>
            <td class="stock bold"><?php echo $column_stock; ?></td>
            <td class="price bold"><?php echo $column_price; ?></td>
            <td class="cart bold"><?php echo $column_cart; ?></td>
          </tr>
        </thead>
        <tbody>
          <?php foreach ($products as $product) { ?>
          <tr style=" border-bottom: 1px solid #e9e9e9;">
            <td class="remove"><input type="checkbox" name="remove[]" value="<?php echo $product['product_id']; ?>" /></td>
            <td class="image"><?php if ($product['thumb']) { ?>
              <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
              <?php } ?></td>
            <td class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></td>
            <td class="model"><?php echo $product['model']; ?></td>
            <td class="stock"><?php echo $product['stock']; ?></td>
            <td class="price"><?php if ($product['price']) { ?>
              <div class="price">
                <?php if (!$product['special']) { ?>
                <?php echo $product['price']; ?>
                <?php } else { ?>
                <s><?php echo $product['price']; ?></s> <b><?php echo $product['special']; ?></b>
                <?php } ?>
              </div>
              <?php } ?></td>
            <td class="cart"><a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button sc_a" style=" cursor: pointer;"><span><?php echo $button_cart; ?></span></a></td>
          </tr>
          <?php } ?>
        </tbody>
      </table>
    </div>
  </form>
  <div class="buttons">
   <div class="left"><a onclick="$('#wishlist').submit();" class="button sc02 mt15"><span><?php echo $button_delete; ?></span></a></div>
  </div>
  <?php } else { ?>
  <div class="content"><?php echo $text_empty; ?></div>
  <?php } ?>
    </div>
  </div>
</div>
  
  
  


  <?php echo $content_bottom; ?>
<?php echo $footer; ?>