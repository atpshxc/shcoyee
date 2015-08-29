<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
<title>购物车</title>
<link href="catalog/view/theme/new/css/base.css" rel="stylesheet" type="text/css" />
<link href="catalog/view/theme/new/css/other.css" rel="stylesheet" type="text/css" />
<link href="catalog/view/theme/new/css/index.css" rel="stylesheet" type="text/css" />
<script src="catalog/view/theme/new/js/jquery.min.js"></script>
<script src="catalog/view/theme/new/js/jquery.flexslider-min.js"></script>
<script src="catalog/view/javascript/common.js"></script>
<link href="<?php echo HTTP_SERVER?>catalog/view/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="<?php echo HTTP_SERVER?>catalog/view/css/ectouch.css" rel="stylesheet" type="text/css" />
<script src="<?php echo HTTP_SERVER?>catalog/view/bootstrap/js/bootstrap.js"></script>
<script>
$(function(){
	$('.flexslider').flexslider({
		directionNav: true,
		pauseOnAction: false
	});
});
</script>
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
<script language="javascript">          function switchMenustyle(num) {              for(var id = 1; id <= 4; id++) {                 if (id == num) {                                       document.getElementById("mynav" + id).className= "hover";                 }                  else {                                   document.getElementById("mynav" + id).className = "";                 }}         }          </script>
</head>

<body>
 <!--top-->
<?php echo $topnav; ?>
<!--top end-->

<?php 
$img='1';
if(strpos($_SERVER['REQUEST_URI'],'checkout'))
{
    $img='2';
}
if(strpos($_SERVER['REQUEST_URI'],'orderspayment'))
{
    $img='3';
}
if(strpos($_SERVER['REQUEST_URI'],'cart'))
{
    $img='1';
}
?>
<!--
<div class="w1000">
  <div class="logo left"><a href="/"><img src="catalog/view/theme/new/images/logo3.jpg" class="responsive"/></a></div>
  -->
  <!--<div class="right sopping_cart"><img src="catalog/view/theme/new/images/shopping_cart<?php echo $img; ?>.jpg" width="538" height="58" /></div>-->
<!--</div>

<div class="dh2"></div>--> 
