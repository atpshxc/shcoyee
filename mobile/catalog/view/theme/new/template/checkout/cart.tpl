<?php echo $checkout_header; ?>
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="basket">
<div class="bg2" style=' margin-bottom: -50px'>
  <div class="w1000">
   <?php 
   if (count($products)>0) { ?>   
      
    <div class="f24 hs2 pt15"><i class="wdgwc_bt"></i>我的购物车</div>
    <br/>
    <div class="wxts" id='notification' style="display: none;border: 1px solid greenyellow;"><div class="wxts_left left hs2 center f14w" style="background:greenyellow; color: green;">温馨提示：</div>
        <div id='ts' class="left c57" ></div>
    </div>
    
    <?php if ($attention) { ?>
        <div class="wxts">
          <div class="wxts_left left hs2 center f14w">温馨提示：</div>
          <div class="left c57"><?php echo $attention; ?></div>
          <div class="wxts_jt"></div>
        </div>
    <?php } ?>    
    
    <?php if ($success) { ?>
        <div class="wxts" style=' border: 1px solid greenyellow;'>
          <div class="wxts_left left hs2 center f14w"  style="background:greenyellow; color: green;">温馨提示：</div>
          <div class="left c57"><?php echo $success; ?></div>
          <div class="wxts_jt"></div>
        </div>
    <?php } ?>
    
    <?php if ($error_warning) { ?>
        <div class="wxts">
          <div class="wxts_left left hs2 center f14w">温馨提示：</div>
          <div class="left c57"><?php echo $error_warning; ?></div>
          <div class="wxts_jt"></div>
        </div>
    <?php } ?>

     
     <?php
    if(count($products)>0)
    {
     ?>
    <div>
      <table class="table1 f14w">
        <tr>
          <td style="width:45%">商品名称</td>
          <td style="width:10%">单价</td>
          <td style="width:10%">进口税</td>
          <td style="width:12%">数量</td>
          <td style="width:10%">小计</td>
          <td style="width:13%">操作</td>
        </tr>
      </table>
        <?php 
        foreach ($products as $product) 
        {
        ?>
      <table class="table2 center" id="prs">
        <tr>
          <td style="width:45%; text-align:left;">
              <a href="<?php echo $product['href']; ?>" class="spt left"><img src="<?php echo $product['thumb']; ?>" width="207" height="207" /></a><a href="<?php echo $product['href']; ?>" class="bt5 left"><?php echo $product['name']; ?> <?php if (!$product['stock']) { ?><span class="red bold"> ***    </span><?php } ?></a>
          </td>
          <td style="width:10%"><?php echo $product['price']; ?></td>
          <td style="width:10%"><?php echo $product['tax_money']; ?><?php if ($product['tax_money']<=50) { ?><span class="red bold">（免税）</span><?php } ?></td>
          <td style="width:12%; padding-left:16px;"><div class="wrap-input"> <a class="btn-reduce" onclick="minus('quantity[<?php echo $product['key']; ?>]','1');" href="javascript:;">-</a> <a class="btn-add" onclick="plus('quantity[<?php echo $product['key']; ?>]','1');" href="javascript:;">+</a>
                  <input class="text" readonly="readonly"  name="quantity[<?php echo $product['key']; ?>]" id="buy-num" value="<?php echo $product['quantity']; ?>" >
            </div></td>
          <td style="width:10%"><?php echo $product['total']; ?></td>
          <td style="width:13%"><a href="javascript:addToWishList('<?php echo $product['product_id']; ?>')" class="sc_a">收藏</a>&nbsp;&nbsp;<a href="<?php echo $product['remove']; ?>&classid=1" class="sc_a">移除</a></td>
        </tr>
      </table>
        <?php
     }
     ?>
     
     
    </div>

    <div class="zj c64"> 
        <?php
         foreach ($totals as $total) 
           { 
         ?>
             <span class="mr20"><?php echo $total['title']; ?><?php echo $total['text']; ?></span> 
        <?php
           }
        ?>
    </div>
     <?php
   }?>
     
     
     
     
    
     <div class="js"> 
         <a href="#" style="display:none" class="right inblock btn_checkout_disabled"></a> 
         <a href="/index.php?route=checkout/checkout" class="right inblock inblock btn_checkout"></a> 
         <a href="/index.php?route=common/home" class="btn_goon mr10"><span>继续购物</span></a>  
    
  </div>
     <?php
     }
     else
     {
     ?>
     <div class="f24 hs2 pt15"><i class="wdgwc_bt"></i>我的购物车</div>
     <div class="f24 hs2 pt15"></div>
 
     <div style="border: 1px solid #f0f0f0; background: white; margin-top: 25px; box-shadow: 0px 2px 0px #fbfbfb; width: 980px; margin: auto; overflow: auto;">
         <div class="left px_left" style="padding: 9px 14px;">
		<span>您的购物车没有添加商品!</span>
	  </div>   
     </div>
         <?php
   }
     ?> 
     
</div>
</form>
<script type="text/javascript">
    function addToWishList(product_id) {
	$.ajax({
		url: 'index.php?route=account/wishlist/update',
		type: 'post',
		data: 'product_id=' + product_id,
		dataType: 'json',
		success: function(json) {
			//$('.wxts').remove();
						
			if (json['success']) {
				$('#ts').html(json['success']);
				
				$('#notification').fadeIn('slow');
				
				//$('#wishlist_total').html(json['total']);
				
				$('html, body').animate({ scrollTop: 0 }, 'slow'); 				
			}	
		}
	});
}
    
function plus(name,classid){
	var number=parseInt($('#prs input[name=\''+name+'\']').val())+ 1
	$('#prs input[name=\''+name+'\']').val(number);
	
	$('#basket').attr("action",$('#basket').attr("action")+'&classid='+classid);
	$('#basket').submit();
}

function minus(name,classid){
	var number=parseInt($('#prs input[name=\''+name+'\']').val())- 1
	$('#prs input[name=\''+name+'\']').val(number);
	
	$('#basket').attr("action",$('#basket').attr("action")+'&classid='+classid);
	$('#basket').submit();
}
</script>
<?php echo $footer; ?>