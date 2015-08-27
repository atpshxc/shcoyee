<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
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
<script src="catalog/view/theme/new/js/jquery.flexslider-min.js"></script>

<script src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.9.custom.min.js"></script>
<link type="text/css" href="catalog/view/javascript/jquery/ui/themes/flick/jquery-ui-1.8.16.custom.css" />
<script src="catalog/view/javascript/jquery/ui/external/jquery.cookie.js"></script>

<script src="catalog/view/javascript/common.js"></script>

<link href="catalog/view/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="catalog/view/css/ectouch.css" rel="stylesheet" type="text/css" />
<script src="catalog/view/bootstrap/js/bootstrap.js"></script>

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
<!--top end-->
<!--搜索-->
<script type=text/javascript src="catalog/view/theme/default/kyjs20140915/lrtk.js"></script>
<script type=text/javascript src="catalog/view/theme/default/kyjs20140915/jquery-1.4.2.min.js"></script>

<div class="row">
		<div class="col-xs-12">
			<a href="<?php echo HTTP_SERVER?>"><img class="img-responsive" src="catalog/view/theme/new/images/logo.jpg"/></a>
		</div>
</div>
<!--导航-->
<div class="dh">
  <div class="w1200">
    <div class="left meau">
      <ul>
        <li><a class="hover" id="mynav1" onclick="switchMenustyle(1)" href="<?php echo HTTP_SERVER?>">首页</a></li>
        <li><a id="mynav2" onclick="switchMenustyle(2)" href="<?php echo HTTP_SERVER?>/index.php?route=product/category&path=0&columnsid=1">益健康</a></li>
        <li><a id="mynav3" onclick="switchMenustyle(3)" href="<?php echo HTTP_SERVER?>/index.php?route=product/category&path=0&columnsid=2">益生活</a></li>
      </ul>
    </div>
  </div>
</div>
<!--导航 end-->
<div id="notification" class="notification"></div>
