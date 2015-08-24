<!DOCTYPE html>
<html lang="<?php echo $lang; ?>">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>

<link href="catalog/view/theme/new/css/base.css" rel="stylesheet" type="text/css" />
<link href="catalog/view/theme/new/css/index.css" rel="stylesheet" type="text/css" />
<link href="catalog/view/theme/new/css/health.css" rel="stylesheet" type="text/css" />
<link href="catalog/view/theme/new/css/other.css" rel="stylesheet" type="text/css" />


<script src="catalog/view/theme/new/js/jquery.min.js"></script>
<script src="catalog/view/theme/new/js/ jquery.flexslider-min.js"></script>

<script src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.9.custom.min.js"></script>
<link type="text/css" href="catalog/view/javascript/jquery/ui/themes/flick/jquery-ui-1.8.16.custom.css" />
<script src="catalog/view/javascript/jquery/ui/external/jquery.cookie.js"></script>

<script src="catalog/view/javascript/common.js"></script>
<link rel="stylesheet" href="catalog/view/bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="catalog/view/bootstrap/js/bootstrap.min.js"></script>

<script>
function ajaxcart(mmObj)
{
    var mSubObj = mmObj.getElementsByTagName("div")[0];
	if(mSubObj.style.display != "block")
        {
        $.ajax({
			url: 'index.php?route=checkout/cart/update',
			dataType: 'json',
			success: function(json) {
                            
				if (json['output']) {
					$('#cctent').html(json['output']);
				}
			}
		});
            }
}
    
function MM_over(mmObj){
	var mSubObj = mmObj.getElementsByTagName("div")[0];
	mSubObj.style.display = "block";
	mSubObj.style.backgroundColor = "rgb";	
        
}
function MM_out(mmObj) {
	var mSubObj = mmObj.getElementsByTagName("div")[0];
	mSubObj.style.display = "none";
	
}
function removeCart(key,calssid) {
	$.ajax({
		url: 'index.php?route=checkout/cart/update&classid='+calssid,
		type: 'post',
		data: 'remove=' + key,
		dataType: 'json',
		success: function(json) {
			$('#carttotale').html(json['total']);
                        
			if (json['output']) {
				
				
				$('#cctent').html(json['output']);
			}			
		}
	});
}
</script>
</script>
<script language="javascript">          
	function switchMenustyle(num) {              
		for(var id = 1; id <= 4; id++) {                 
			if (id == num) {                                       
				if(document.getElementById("mynav" + id)){
					document.getElementById("mynav" + id).className= "hover";       
				}          
			}                  
			else {                                   
				if(document.getElementById("mynav" + id)){
					document.getElementById("mynav" + id).className = "";                 
				}
			}
		}         
	}          
</script>
</head>

<body>
<div class="container">
  <div class="row">
    <div class="col-xs-12">
      <div class="ky_logo">
        <a href="/">
          <img src="http://localhost/shcoyee/mobile/catalog/view/theme/default/kyimages20140915/ky_logo.jpg" width="100%"/>
        </a>
      </div>
    </div>
  </div>
  <div class="row">
      <div class="col-xs-12">
          <ul class="list-group list-inline text-center">
            <li class="list-group-item col-xs-6"><a id="mynav2" onclick="switchMenustyle(2)" href="/index.php?route=product/category&path=0&columnsid=1">益健康</a></li>
            <li class="list-group-item col-xs-6"><a id="mynav3" onclick="switchMenustyle(3)" href="/index.php?route=product/category&path=0&columnsid=2">益生活</a></li>
          </ul>
      </div>
  </div>
  <div class="row">
      <div class="col-xs-12">
          <div id="myCarousel" class="carousel slide">
              <!-- 轮播（Carousel）项目 -->
               <div class="carousel-inner">
                  <div class="item active">
                     <img src="http://localhost/shcoyee/mobile/image/cache/data/banner/img1-1920x438.jpg">
                  </div>
                  <div class="item">
                     <img src="http://localhost/shcoyee/mobile/image/cache/data/banner/img2-1920x438.jpg">
                  </div>
                  <div class="item">
                     <img src="http://localhost/shcoyee/mobile/image/cache/data/banner/img3-1920x438.jpg">
                  </div>
               </div>
            </div> 
        </div>
  </div>
  <script>
        $("#myCarousel").carousel('cycle');
  </script>
</div>
   
