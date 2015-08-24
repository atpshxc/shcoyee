<?php echo $header; ?><?php echo $column_right; ?>

<!--益健康 hot-->
<?php if ($special_products) { 
	$hot_product = $special_products[0];
?>
<div class="w12002 hot dw">
  <div class="left dw"><a target="_blank"  href="<?php echo $hot_product['href']; ?>"><img src="<?php echo $hot_product['thumb']; ?>" width="588" height="319" /></a>
    <div class="sp f14">进口商品</div>
  </div>
  <div class="right dw w600">
    <p class="bt3"><a target="_blank"  href="<?php echo $hot_product['href']; ?>"><?php echo $hot_product['name']; ?></a></p>
    <ul class="desc">
      <li><?php echo $hot_product['meta_title']; ?></li>
    </ul>
    <div class="pt15">
		<div id="end_time" style="display:none"><?php echo $hot_product['date_end']; ?></div>
      <div class="left c57 f14"><img src="catalog/view/theme/new/images/sj.jpg" width="17" height="16" class="left sj" /><p id="remainTime" style="width:300;height:20px" ></p></div>
      <div class="right f14 c57"><span class="bold hs"><?php echo $hot_product['totalSeller']; ?></span>件已售</div>
    </div>       
  </div>
  <div class="msq"><a  target="_blank"  href="<?php echo $hot_product['href']; ?>">马上抢</a><span class="qian4"><span class="f32 bold"><?php echo $hot_product['special']; ?></span><span class="qian5"><?php echo $hot_product['price']; ?></span></span></div> 
  <div class="clear"></div>
</div>

<?php } ?>

<!--益健康 hot end-->

  <?php if ($products) { ?>
<div id="product_classid" style="display:none"><?php echo $columnsid; ?></div>
<div class="w1200 px">
  <div class="left px_left">
    <span class="left lh26"><?php echo $text_sort; ?> </span>
    <ul class="pxnav left">
        <?php foreach ($sorts as $sorts) { ?>
        <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
			<li><a class="hover2" id="pxnav1" href="<?php echo $sorts['href'].'&class='.$classid; ?>"><?php echo $sorts['text']; ?></a></li>
        <?php } else { ?>
			<li><a id="pxnav2" href="<?php echo $sorts['href'].'&class='.$classid; ?>"><?php echo $sorts['text']; ?></a></li>
        <?php } ?>
        <?php } ?>
    </ul>
  </div>
</div>

<div class="w1200">

    <?php 
	$i=1;
	foreach ($products as $product) { 
		if($i%5==0)
		{
			$marginRight="margin-right:0";
		}else
		{
			$marginRight="";
		}
	?>
	
  <div class="yjk_sp" style="<?php echo $marginRight;?>" >
    <p class="yjk_sp_tp">
		<a  target="_blank"  href="<?php echo $product['href'].'&class='.$classid; ?>"><img src="<?php echo $product['thumb']; ?>" 
		title="<?php echo $product['name']; ?>" width="207" height="210" 
		alt="<?php echo $product['name']; ?>" /></a></p>
    <div class="yjk_sp_wz">
      <a  target="_blank"  href="<?php echo $product['href'].'&class='.$classid; ?>" class="f14 lh20 c71">
		<p style="height: 40px;"><?php echo $product['name']; ?></p></a>
		<div class="jq hs"><span class="right pt8">新品上线</span> 
		
        <?php if (!$product['special']) { ?>
			<span class="f14"><span class="f20"><?php echo $product['price']; ?></span>
        <?php } else { ?>
			<span class="f14"><span class="f20"><?php echo $product['special']; ?></span><span class="qian2 pl8">¥<?php echo $product['price']; ?></span></span>
        <?php } ?>
        <?php if ($product['tax']) { ?>
        <br />
        <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
        <?php } ?>
		</div>
    </div>
    <div class="sp2 f14"><?php 
	switch($product['classid']){
		case 1:
			echo $text_class_id_1;
			break;
		case 2:
			echo $text_class_id_2;
			break;
		case 3:
			echo $text_class_id_3;
			break;
	}
	?></div>

  </div>
	
    <?php $i++;} ?>
</div>

<div class="paginator">
	<?php echo $pagination; ?>
</div>
  
<?php } ?>
<!-- end of product -->
  
<script type="text/javascript"><!--
function display(view) {
	if (view == 'list') {
		$('.product-grid').attr('class', 'product-list');
		
		$('.product-list > div').each(function(index, element) {
			html  = '<div class="right">';
			html += '  <div class="cart">' + $(element).find('.cart').html() + '</div>';
			html += '  <div class="wishlist">' + $(element).find('.wishlist').html() + '</div>';
			html += '  <div class="compare">' + $(element).find('.compare').html() + '</div>';
			html += '</div>';			
			
			html += '<div class="left">';
			
			var image = $(element).find('.image').html();
			
			if (image != null) { 
				html += '<div class="image">' + image + '</div>';
			}
			
			var price = $(element).find('.price').html();
			
			if (price != null) {
				html += '<div class="price">' + price  + '</div>';
			}
					
			html += '  <div class="name">' + $(element).find('.name').html() + '</div>';
			html += '  <div class="description">' + $(element).find('.description').html() + '</div>';
			
			var rating = $(element).find('.rating').html();
			
			if (rating != null) {
				html += '<div class="rating">' + rating + '</div>';
			}
				
			html += '</div>';

						
			$(element).html(html);
		});		
		
		$('.display').html('<b><?php echo $text_display; ?></b> <?php echo $text_list; ?> <b>/</b> <a onclick="display(\'grid\');"><?php echo $text_grid; ?></a>');
		
		$.cookie('display', 'list'); 
	} else {
		$('.product-list').attr('class', 'product-grid');
		
		$('.product-grid > div').each(function(index, element) {
			html = '';
			
			var image = $(element).find('.image').html();
			
			if (image != null) {
				html += '<div class="image">' + image + '</div>';
			}
			
			html += '<div class="name">' + $(element).find('.name').html() + '</div>';
			html += '<div class="description">' + $(element).find('.description').html() + '</div>';
			
			
			
			
			
			
			var price = $(element).find('.price').html();
			
			if (price != null) {
				html += '<div class="price">' + price  + '</div>';
			}

			
			var rating = $(element).find('.rating').html();
			
			if (rating != null) {
				html += '<div class="rating">' + rating + '</div>';
			}
						
			html += '<div class="cart">' + $(element).find('.cart').html() + '</div>';
			html += '<div class="wishlist">' + $(element).find('.wishlist').html() + '</div>';
			html += '<div class="compare">' + $(element).find('.compare').html() + '</div>';
			
			
			$(element).html(html);
		});	
					
		$('.display').html('<b><?php echo $text_display; ?></b> <a onclick="display(\'list\');"><?php echo $text_list; ?></a> <b>/</b> <?php echo $text_grid; ?>');
		
		$.cookie('display', 'grid');
	}
}

view = $.cookie('display');

if (view) {
	display(view);
} else {
	display('grid');
}
//--></script> 

<script type="text/javascript"> 

window.onload = function() {
	var classid = parseInt($("#product_classid").html())+1;
	switchMenustyle(classid);
}; 

 $(document).ready(function() { 
  window.setInterval(SetRemainTime, 1000); //间隔函数，1秒执行 
 }); 
 
 function SetRemainTime() { 
  var time_start = new Date().getTime();  //设定当前时间
  var timeend = $("#end_time").html() + "";
  timeend = timeend.replace(/-/, "/")
  timeend = timeend.replace(/-/, "/") + " 00:00:00"
  var time_end =  new Date(timeend).getTime(); //设定目标时间

  // 计算时间差
  var time_distance = time_end - time_start; 
  if (time_distance > 0) { 
   var day = Math.floor(time_distance / 86400000);        //计算天 
   time_distance -= day * 86400000;

   var hour = Math.floor(time_distance / 3600000);      //计算小时 
   time_distance -= hour * 3600000;
 
   var minite = Math.floor(time_distance / 60000);      //计算分 
   time_distance -= minite * 60000;

   var second = Math.floor(time_distance / 1000);             // 计算秒     

   $("#remainTime").html(" 还剩: " + day + "天" + hour + "小时" + minite + "分" + second + "秒"); 
  } else {//剩余时间小于或等于0的时候，就停止间隔函数 
   window.clearInterval(time_distance); 
   //这里可以添加倒计时时间为0后需要执行的事件 
  } 
 } 

 </script> 


<?php echo $footer; ?>