<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
         <div class="breadcrumb w1200" >
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
   <div class="w1200 px">

	<div class="w840">
		<div style=" margin: 10px 0; border-style:none; height :30; width:21%;  float:left;  ">
				<p>
				<span style="display:inline-block; " >
				  <select  id="filter_category_id" class="left" >
					<option value="0"><?php echo $text_category; ?></option>
					<?php foreach ($categories as $category_1) { ?>
					<?php if ($category_1['category_id'] == $filter_category_id) { ?>
					<option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
					<?php } else { ?>
					<option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
					<?php } ?>
					<?php foreach ($category_1['children'] as $category_2) { ?>
					<?php if ($category_2['category_id'] == $filter_category_id) { ?>
					<option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
					<?php } else { ?>
					<option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
					<?php } ?>
					<?php foreach ($category_2['children'] as $category_3) { ?>
					<?php if ($category_3['category_id'] == $filter_category_id) { ?>
					<option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
					<?php } else { ?>
					<option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
					<?php } ?>
					<?php } ?>
					<?php } ?>
					<?php } ?>
				 </select>
				  &nbsp;&nbsp;&nbsp;&nbsp;
				</span>
				</p>
		</div>
		<div style=" margin: 3px 0; border-style:none; height :30; width:77%;  float:right;  ">
			  <?php if ($filter_name) { ?>
			  <input type="text" name="filter_name" id="search-filter_name" class="ss left" value="<?php echo $filter_name; ?>" />
			  <?php } else { ?>
			  <input type="text" name="filter_name" id="search-filter_name" class="ss left" value="<?php echo $filter_name; ?>" onclick="this.value = '';" onkeydown="this.style.color = '000000'" style="color: #999;" />
			  <?php } ?>
				<input id="button-search" type="button" value="搜索" class="ss_btn left"/>
		</div>
		<input type="hidden" name="filter_sub_category" value="1" id="sub_category"  />
		<input type="hidden" name="filter_description" value="1" id="description"  />
		</div>
	</div>
 </div>
  <?php if ($products) { ?>
<div class="w1200 px">
  <div class="left px_left">
    <span class="left lh26"><?php echo $text_sort; ?> </span>
    <ul class="pxnav left">
        <?php foreach ($sorts as $sorts) { ?>
        <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
			<li><a class="hover2" id="pxnav1" href="<?php echo $sorts['href'].'&filter_category_id='.$filter_category_id.'&filter_name='.$filter_name; ?>"><?php echo $sorts['text']; ?></a></li>
        <?php } else { ?>
			<li><a id="pxnav2" href="<?php echo $sorts['href'].'&filter_category_id='.$filter_category_id.'&filter_name='.$filter_name; ?>"><?php echo $sorts['text']; ?></a></li>
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
		<a  tager="_blank"  href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" 
		title="<?php echo $product['name']; ?>" width="207" height="210" 
		alt="<?php echo $product['name']; ?>" /></a></p>
    <div class="yjk_sp_wz">
      <a  tager="_blank"  href="<?php echo $product['href']; ?>" class="f14 lh20 c71">
		<p style="height: 40px;"><?php echo $product['name']; ?></p></a>
<!--		<div class="jq hs"><span class="right pt8">新品上线</span>  -->
		<div class="hs"><span class="right pt8">新品上线</span> 
		
        <?php if (!$product['special']) { ?>
			<span class="f14"><span class="f20"><?php echo $product['price']; ?></span>
        <?php } else { ?>
			<span class="f14"><p class="f20"><?php echo $product['special']; ?></p><p  style=" float: left; margin-top: 0px; font-size: 14px;" class="qian2"><?php echo $product['price']; ?></p></span>
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
  
  <?php } else { ?>
	<div class="w1200 px">
	  <div class="left px_left">
		<span ><?php echo $text_empty; ?></span>
	  </div>
	</div>
  <?php }?>
  <?php echo $content_bottom; ?></div>
<script type="text/javascript"><!--
$('#content input[name=\'filter_name\']').keydown(function(e) {
	if (e.keyCode == 13) {
		$('#button-search').trigger('click');
	}
});

$('#button-search').bind('click', function() {
	url = 'index.php?route=product/search';
	
	var filter_name = $('#search-filter_name').val();
	
	if (filter_name) {
		url += '&filter_name=' + encodeURIComponent(filter_name);
	}

	var filter_category_id = $('#filter_category_id').val();
	
	if ( filter_category_id > 0) {
		url += '&filter_category_id=' + encodeURIComponent(filter_category_id);
	}
	
	var filter_sub_category = $('#content input[name=\'filter_sub_category\']:checked').attr('value');
	
	if (filter_sub_category) {
		url += '&filter_sub_category=true';
	}
		
	var filter_description = $('#content input[name=\'filter_description\']:checked').attr('value');
	
	if (filter_description) {
		url += '&filter_description=true';
	}
	location = url;
});

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
	display('list');
}
//--></script> 
<?php echo $footer; ?>