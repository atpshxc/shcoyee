<?php echo $header; ?>
<div id="content">
	<!--面包屑导航-->
	  <div class="breadcrumb">
	    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
	    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
	    <?php } ?>
	  </div>
	<!--面包屑导航 END-->
  
  <!--购买产品-->
  <div class="product-info">
    <?php if ($thumb || $images) { ?>
	    <div class="row">
	    	<div class="col-xs-12">
	    	 	<div class="left w450 dw">
		    		 <?php if ($thumb) { ?>
				      <div class="image zoom-small-image" >
				      <a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="cloud-zoom" id="zoom1" rel="adjustX: 10, adjustY:-4" >
				      <img class="img-responsive" src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image"   /></a>
				      </div>
				  	<?php } ?>
				  	
				  	<?php if ($images) { ?>
					      <div class="image-additional" id="image-additional-carousel">
						      <ul class="jcarousel-skin-opencart">
						          <?php if($small) {?>
						          <li>
						      		<a class="cloud-zoom-gallery" rel="useZoom: 'zoom1', smallImage: '<?php echo $thumb; ?>' " href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>">
						      			<img src="<?php echo $small; ?>" class="zoom-tiny-image" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image" />
						      		</a>
						       	 </li>
						       	 <?php }?>
						        <?php foreach ($images as $image) { ?>
						         <li>
						        	<a class="cloud-zoom-gallery"  rel="useZoom: 'zoom1', smallImage: '<?php echo $image['middle'] ?>' " href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="" rel="">
						        		<img src="<?php echo $image['thumb']; ?>" class="zoom-tiny-image" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
						        	</a>
						        </li>
						        <?php } ?>
						    </ul>
				       	 </div>
				      <?php } ?>
				      
						<div class="sp f14">进口商品</div>
				<!-- end left w450 dw -->
				</div>
			<!-- end col-xs-12 -->
	    	</div>
	    <!-- end row -->
	    </div>
   	<?php } ?>
   	
    <div class="row">
    	<div class="col-xs-12">
		      <div>
		        <span class="left w698_bt"><?php echo $heading_title; ?></span>
		        <!--<span class="right cpzx f14">产地直销 — 自贸</span>-->
		      </div>
		      
		      <div class="price clear">
			      	<span class="jg">价格</span>
			        
			        <?php if (!$special) { ?>
						<span class="hs bold f18"><span class="f32"><?php echo $price; ?></span></span><br />
			        <?php } else { ?>
						<span class="qian2 f14"><?php echo $price; ?></span> 
						<span class="hs bold f18"><span class="f32"><?php echo $special; ?></span></span>
			        <?php } ?>
					
			        <?php if ($discounts) { ?>
			        <br />
			        <div class="discount">
			          <?php foreach ($discounts as $discount) { ?>
			         	 <?php echo sprintf($text_discount, $discount['quantity'], $discount['price']); ?><br />
			          <?php } ?>
			        </div>
			        <?php } ?>
		      <!--END price clear-->
			  </div>
			  
		        <?php if ($tax_money) { ?>
				  <div class="gs clear"><span class="jg"><?php echo $text_tax_money; ?></span><?php echo $tax_money; ?> <span class="hs"><?php echo $text_tax_money_rat; ?></span></div>
		        <?php } ?>
				
		      <div class="yh clear">
		      	<div class="left" style="padding:10px 0;"><span class="jg">优惠</span><span class="hs">《夏·狂热》免税自营全场免邮</span></div>
		        <div class="clear"></div>
		      </div>
		      
		      <div class="gs"><span class="jg">运费</span>免运费 </div>
		
		      <div class="sl of"><span class="jg left lh26">数量</span>
			  	<div class="wrap-input left">
		            <a class="btn-reduce" href="javascript:;" onclick="setAmount('quantity', -1)">-</a>
		            <a class="btn-add" href="javascript:;" onclick="setAmount('quantity', 1)">+</a>
		            <input type="text" id="quantity" value="1">
					  <input type="hidden" name="product_id" size="2" value="<?php echo $product_id; ?>" />
		        </div>
		        <a href="tencent://message/?menu=yes&amp;site=可益健康&amp;uin=10000"  class="lxkf left">联系客服</a>
		      </div>
			  
		<script language="javascript">          
			function setAmount(element,value) { 
				var quantity = document.getElementById(element);
				var orgValue = quantity.value;
				quantity.value = parseInt(orgValue) +  parseInt(value);
			}
		</script>
		
		      <div class="yh pd26 clear">
		        <a rel="nofollow" id="button-cart" style="cursor: pointer;"><span><?php echo $button_cart; ?></span></a>
		        <a rel="nofollow" style="cursor: pointer;" onclick="addToWishList('<?php echo $product_id; ?>');"><?php echo $button_wishlist; ?></a> 
		      </div>
		
		<script src="<?php echo HTTP_SERVER?>catalog/view/javascript/product.js"></script>
		      <div class="gs of"><span class="jg left lh23">分享</span>
		<!--        <a onclick="shareTSina('<?php echo $heading_title; ?>', '<?php echo $share_link; ?>');" style="cursor: pointer;" class="fx"><img src="<?php echo HTTP_SERVER?>catalog/view/theme/new/images/wx_tb.jpg" width="20" height="20" /></a> -->
		        <a onclick="shareTSina('<?php echo $heading_title; ?>', '<?php echo $share_link; ?>');" style="cursor: pointer;" class="fx"><img src="<?php echo HTTP_SERVER?>catalog/view/theme/new/images/xl_tb.jpg" width="20" height="20" /></a>
		        <a onclick="shareToWb('<?php echo $heading_title; ?>', '<?php echo $share_link; ?>');" style="cursor: pointer;" class="fx"><img src="<?php echo HTTP_SERVER?>catalog/view/theme/new/images/tx_tb.jpg" width="20" height="20" /></a>
		        <a onclick="shareQzone('<?php echo $heading_title; ?>', '<?php echo $share_link; ?>');" style="cursor: pointer;" class="fx"><img src="<?php echo HTTP_SERVER?>catalog/view/theme/new/images/kj_tb.jpg" width="20" height="20" /></a>
		        <a onclick="shareRR('<?php echo $heading_title; ?>', '<?php echo $share_link; ?>');" style="cursor: pointer;" class="fx"><img src="<?php echo HTTP_SERVER?>catalog/view/theme/new/images/rrw.jpg" width="20" height="20" /></a>
		        <a onclick="shareToDouBan('<?php echo $heading_title; ?>', '<?php echo $share_link; ?>');" style="cursor: pointer;" class="fx"><img src="<?php echo HTTP_SERVER?>catalog/view/theme/new/images/db.jpg" width="20" height="20" /></a>
		<!--        <a onclick="shareToDouBan('<?php echo $heading_title; ?>', '<?php echo $share_link; ?>');" style="cursor: pointer;" class="fx"><img src="<?php echo HTTP_SERVER?>catalog/view/theme/new/images/mls.jpg" width="20" height="20" /></a> -->
		
			  </div>
		<!--END col-xs-12 -->
    	</div>
    <!--END row-->
    </div>
    
    <div class="row">
    	<div class="col-xs-12">
    		<!--商品详情-->
			  <div class="pt15">
			    <div class="left w840">
			      <div class="w840_top">
			        <ul id="tab-menu0" class="xq">
			          <li ><a class="hover3" onclick="switchMenustyle(0,0)" href="javascript:void(0);">商品详情</a></li>
			  <!-- <li><a id="xqnav2" onclick="switchMenustyle(2)" href="javascript:void(0);">购买须知</a></li> -->
			          <li><a onclick="switchMenustyle(0,1)" href="javascript:void(0);"><?php echo $tab_review; ?></a></li>
			        </ul>
						<script language="javascript">          
							function switchMenustyle(m,n) { 
								var tli=document.getElementById("tab-menu"+m).getElementsByTagName("li"); 
								var mli=document.getElementById("tab-main"+m).getElementsByTagName("ul"); 
								for(i=0;i<tli.length;i++){ 
									var tli_a = tli[i].getElementsByTagName('a')[0];
									tli_a.className=i==n?"hover3":""; 
								   mli[i].style.display=i==n?"block":"none";
								}
							}
						</script>
				  <!--END w840_top-->
			      </div>
			      <div id="tab-main0" class="xq_nr">
			        <ul>
			          <li>
							<p>商品名称：<?php echo $heading_title; ?></p>
							<p>商品编号：<?php echo $model; ?></p>
							<p>上架时间：<?php echo $date_added; ?></p>
					<!--        <p>商品产地：韩国</p> -->
							<p><?php echo $description; ?></p>
					  </li>
			        </ul>
			        <ul style="display: none;">
			        	<li>
							  <?php if ($review_status) { ?>
							  <div id="tab-review" class="tab-content">
								<div id="review"></div>
								<?php if($purchased_status){?>
								<h2 id="review-title"><?php echo $text_write; ?></h2>
								<input type="hidden" name="name" value="<?php echo $customer_name;?>" />
								<b><?php echo $entry_review; ?></b>
								<textarea name="text" cols="40" rows="8" style="width: 98%;"></textarea>
								<span style="font-size: 11px;"><?php echo $text_note; ?></span><br />
								<br />
								<b><?php echo $entry_rating; ?></b> <span><?php echo $entry_bad; ?></span>&nbsp;
								<input type="radio" name="rating" value="1" />
								&nbsp;
								<input type="radio" name="rating" value="2" />
								&nbsp;
								<input type="radio" name="rating" value="3" />
								&nbsp;
								<input type="radio" name="rating" value="4" />
								&nbsp;
								<input type="radio" name="rating" value="5" />
								&nbsp; <span><?php echo $entry_good; ?></span><br />
								<br />
								<div class="captcha">
								<b><?php echo $entry_captcha; ?></b><br />
								<input type="text" name="captcha" value="" />
								
								<img src="<?php echo HTTP_SERVER?>index.php?route=product/product/captcha" alt="" id="captcha" /><br />
								</div>
								<br />
								<div class="left"><a id="button-review" class="button"><span><?php echo $button_review; ?></span></a></div>
								<?php } else {?>
								   <?php echo $text_login_review; ?>
								 <?php } ?>
							  </div>
							  <?php } ?>
					 	 </li>
					</ul>
				  <!--END xq_nr-->
			      </div>
			    <!--END left w840-->
			    </div>
			  <!--END pt15 -->
			  </div>
			  <!--商品详情 end-->
			<!--END col-xs-12 -->
	    	</div>
	    <!--END row -->
	    </div>
	<!--END product-info -->
	</div>
<!--END w12002 -->
</div>
   	
  
<br/><br/><br/>
  <!--
  <div id="tabs" class="htabs"><a href="#tab-description"><?php echo $tab_description; ?></a>
    <?php if ($attribute_groups) { ?>
    <a href="#tab-attribute"><?php echo $tab_attribute; ?></a>
    <?php } ?>
    <?php if ($review_status) { ?>
    <a href="#tab-review"><?php echo $tab_review; ?></a>
    <?php } ?>
  </div>
  <div id="tab-description" class="tab-content"></div>
  
  <?php if ($attribute_groups) { ?>
  <div id="tab-attribute" class="tab-content">
    <table class="attribute">
      <?php foreach ($attribute_groups as $attribute_group) { ?>
      <thead>
        <tr>
          <td colspan="2"><?php echo $attribute_group['name']; ?></td>
        </tr>
      </thead>
      <tbody>
        <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
        <tr>
          <td><?php echo $attribute['name']; ?></td>
          <td><?php echo $attribute['text']; ?></td>
        </tr>
        <?php } ?>
      </tbody>
      <?php } ?>
    </table>
  </div>
  <?php } ?>

  
  <?php if ($review_status) { ?>
  <div id="tab-review" class="tab-content">
    <div id="review"></div>
    <?php if($purchased_status){?>
    <h2 id="review-title"><?php echo $text_write; ?></h2>
    <input type="hidden" name="name" value="<?php echo $customer_name;?>" />
    <b><?php echo $entry_review; ?></b>
    <textarea name="text" cols="40" rows="8" style="width: 98%;"></textarea>
    <span style="font-size: 11px;"><?php echo $text_note; ?></span><br />
    <br />
    <b><?php echo $entry_rating; ?></b> <span><?php echo $entry_bad; ?></span>&nbsp;
    <input type="radio" name="rating" value="1" />
    &nbsp;
    <input type="radio" name="rating" value="2" />
    &nbsp;
    <input type="radio" name="rating" value="3" />
    &nbsp;
    <input type="radio" name="rating" value="4" />
    &nbsp;
    <input type="radio" name="rating" value="5" />
    &nbsp; <span><?php echo $entry_good; ?></span><br />
    <br />
    <div class="captcha">
    <b><?php echo $entry_captcha; ?></b><br />
    <input type="text" name="captcha" value="" />
    
    <img src="<?php echo HTTP_SERVER?>index.php?route=product/product/captcha" alt="" id="captcha" /><br />
    </div>
    <br />
    <div class="left"><a id="button-review" class="button"><span><?php echo $button_review; ?></span></a></div>
    <?php } else {?>
       <?php echo $text_login_review; ?>
     <?php } ?>
  </div>
  <?php } ?>
  
 <?php echo $content_bottom; ?>

 
 </div>

 -->
<script type="text/javascript"><!--
function changeUrl() {
	var redirect;
	redirect = document.getElementById('product-color').value;
	if(redirect!='#')
		document.location.href = redirect;
}
//--></script>
<script type="text/javascript"><!--
$('#button-cart').bind('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/update&classid=<?php echo $classid; ?>',
		type: 'post',
		data: 'quantity=' + encodeURIComponent($('input[id=\'quantity\']').val()) + '&product_id=' + encodeURIComponent($('input[type=\'hidden\']').val()),
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, information, .error').remove();
			
			if (json['error']) {
				if (json['error']['warning']) {
					$('#notification').html('<div class="warning" style="display: none;">' + json['error']['warning'] + '<img src="<?php echo HTTP_SERVER?>catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
				
					$('.warning').fadeIn('slow');
				}
				
				for (i in json['error']) {
					$('#option-' + i).after('<span class="error">' + json['error'][i] + '</span>');
				}
			}	 
						
			if (json['success']) {
				$('#notification').html('<div class="attention" style="display: none;">' + json['success'] + '<img src="<?php echo HTTP_SERVER?>catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
					
				$('.attention').fadeIn('slow');
					
				$('#cart_total').html(json['total']);
				$('#cart_total_bottom_menu').html(json['total'].match(/^\d*/));
				
				$('html, body').animate({ scrollTop: 0 }, 'slow'); 
			}	
		}
	});
});

$('#button-cart-second').bind('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/update&classid=<?php echo $classid; ?>',
		type: 'post',
		data: 'quantity=' + encodeURIComponent($('input[id=\'quantity\']').val()) + '&product_id=' + encodeURIComponent($('input[type=\'hidden\']').val()),
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, information, .error').remove();
			
			if (json['error']) {
				if (json['error']['warning']) {
					$('#notification').html('<div class="warning" style="display: none;">' + json['error']['warning'] + '<img src="<?php echo HTTP_SERVER?>catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
				
					$('.warning').fadeIn('slow');
				}
				
				for (i in json['error']) {
					$('#option-' + i).after('<span class="error">' + json['error'][i] + '</span>');
				}
			}	 
						
			if (json['success']) {
				$('#notification').html('<div class="attention" style="display: none;">' + json['success'] + '<img src="<?php echo HTTP_SERVER?>catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
					
				$('.attention').fadeIn('slow');
					
				$('#cart_total').html(json['total']);
				$('#cart_total_bottom_menu').html(json['total']);
				
				$('html, body').animate({ scrollTop: 0 }, 'slow'); 
			}	
		}
	});
});
//--></script>

<?php if ($options) { ?>
<script type="text/javascript" src="<?php echo HTTP_SERVER?>catalog/view/javascript/jquery/ajaxupload.js"></script>
<?php foreach ($options as $option) { ?>
<?php if ($option['type'] == 'file') { ?>
<script type="text/javascript"><!--
$(document).ready(function(){
new AjaxUpload('#button-option-<?php echo $option['product_option_id']; ?>', {
	action: 'index.php?route=product/product/upload',
	name: 'file',
	autoSubmit: true,
	responseType: 'json',
	onSubmit: function(file, extension) {
		$('#button-option-<?php echo $option['product_option_id']; ?>').after('<img src="<?php echo HTTP_SERVER?>catalog/view/theme/default/image/loading.gif" id="loading" style="padding-left: 5px;" />');
	},
	onComplete: function(file, json) {
		$('.error').remove();
		
		if (json.success) {
			alert(json.success);
			
			$('input[name=\'option[<?php echo $option['product_option_id']; ?>]\']').attr('value', json.file);
		}
		
		if (json.error) {
			$('#option-<?php echo $option['product_option_id']; ?>').after('<span class="error">' + json.error + '</span>');
		}
		
		$('#loading').remove();	
	}
});
});
//--></script>
<?php } ?>
<?php } ?>
<?php } ?>

<script type="text/javascript"><!--
$('#review .pagination a').live('click', function() {
	$('#review').slideUp('slow');
		
	$('#review').load(this.href);
	
	$('#review').slideDown('slow');
	
	return false;
});			

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').bind('click', function() {
	$.ajax({
		type: 'POST',
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		dataType: 'json',
		data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
		beforeSend: function() {
			$('.success, .warning').remove();
			$('#button-review').attr('disabled', true);
			$('#review-title').after('<div class="attention"><img src="<?php echo HTTP_SERVER?>catalog/view/theme/default/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
		},
		complete: function() {
			$('#button-review').attr('disabled', false);
			$('.attention').remove();
		},
		success: function(data) {
			if (data.error) {
				$('#review-title').after('<div class="warning">' + data.error + '</div>');
			}
			
			if (data.success) {
				$('#review-title').after('<div class="success">' + data.success + '</div>');
								
				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').attr('checked', '');
				$('input[name=\'captcha\']').val('');
			}
		}
	});
});
//--></script> 
<script type="text/javascript" src="<?php echo HTTP_SERVER?>catalog/view/javascript/jquery/tabs.js"></script>
<script type="text/javascript"><!--
$('#tabs a').tabs();
//--></script>

<script type="text/javascript" src="<?php echo HTTP_SERVER?>catalog/view/javascript/jquery/jquery.ae.image.resize.min.js"></script>
<script type="text/javascript" src="<?php echo HTTP_SERVER?>catalog/view/javascript/jquery/cloud-zoom.1.0.2.min.js"></script>
<link rel="stylesheet" type="text/css" href="<?php echo HTTP_SERVER?>catalog/view/javascript/jquery/cloud-zoom.css" media="screen" />

<script type="text/javascript" src="<?php echo HTTP_SERVER?>catalog/view/javascript/jquery/jquery.jcarousel.min.js"></script>
<link rel="stylesheet" type="text/css" href="<?php echo HTTP_SERVER?>catalog/view/theme/default/stylesheet/carousel.css" media="screen" />


<script type="text/javascript">
$('#image-additional-carousel ul').jcarousel({
	vertical: false,
	visible: 3,
	scroll: 1
});


$('#related-jcarousel ul').jcarousel({
	vertical: false,
	visible: 4,
	scroll: 1
});

</script>


<script type="text/javascript" src="<?php echo HTTP_SERVER?>catalog/view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script>
<script type="text/javascript" src="<?php echo HTTP_SERVER?>catalog/view/javascript/jquery/ui/i18n/jquery-ui-i18n.js"></script> 

<script type="text/javascript"><!--
$(document).ready(function(){
//	if ($.browser.msie && $.browser.version == 6) {
//		if($('.date, .datetime, .time').length > 0){
//			$('.date, .datetime, .time').bgIframe();
//		}
//	}
	
	if($('.date').length > 0){
		$('.date').datepicker({dateFormat: 'yy-mm-dd'});
	}
	
	if($('.datetime').length > 0){
		$('.datetime').datetimepicker({
			dateFormat: 'yy-mm-dd',
			timeFormat: 'h:m'
		});
	}
	
	if($('.time').length > 0){
		$('.time').timepicker({timeFormat: 'h:m'});
	}
});


$(function(){
	$(".cloud-zoom img").aeImageResize({ height: <?php echo $image_thumb_height; ?>, width: <?php echo $image_thumb_width; ?>});	
	$('.cloud-zoom,.cloud-zoom-gallery').CloudZoom();
});
//--></script> 

<?php echo $footer; ?>