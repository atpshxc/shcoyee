<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
<!--top-->
<?php echo $topnav; ?>
<!--top end-->
<!--搜索-->
<script type=text/javascript src="catalog/view/theme/default/kyjs20140915/lrtk.js"></script>
<script type=text/javascript src="catalog/view/theme/default/kyjs20140915/jquery-1.4.2.min.js"></script>
<div class="w1200">
  <div class="logo left"><a href="/"><img src="catalog/view/theme/new/images/logo.jpg" width="555" height="76" /></a></div>
  <div class="right w510">
    <div><form action="index.php?route=product/search" method="post">
        <input type="text" name="filter_name" id="filter_name" class="ss left" value="KANEKA还原型辅酶Q10" onfocus="if(this.value=='KANEKA还原型辅酶Q10'){this.value=''}" onblur="if(this.value==''){this.value='KANEKA还原型辅酶Q10'}"/>
        <input type="submit" value="搜索" class="ss_btn left"/>
        </form>
    </div>
    <div class="ss_gjc"> 
      <ul>
        <li><a href="index.php?route=product/search&filter_name=甲壳素"><span class="red">甲壳素</span>&nbsp;&nbsp;|</a></li>
        <li><a href="index.php?route=product/search&filter_name=Q10">Q10&nbsp;&nbsp;|</a></li>
        <li><a href="index.php?route=product/search&filter_name=无硅洗发水"><span class="red">无硅洗发水</span>&nbsp;&nbsp;|</a></li>
        <li><a href="index.php?route=product/search&filter_name=花洒">花洒&nbsp;&nbsp;|</a></li>
        <li><a href="index.php?route=product/search&filter_name=222生酵素"><span class="red">222生酵素</span>&nbsp;&nbsp;|</a></li>
        <li><a href="index.php?route=product/search&filter_name=面膜">面膜&nbsp;&nbsp;|</a></li>
      </ul>
    </div>
  </div>
</div>
<!--搜索 end-->
<!--导航-->
<div class="dh">
  <div class="w1200">
    <div class="left meau">
      <ul>
        <li><a class="hover" id="mynav1" onclick="switchMenustyle(1)" href="/">首页</a></li>
        <li><a id="mynav2" onclick="switchMenustyle(2)" href="/index.php?route=product/category&path=0&columnsid=1">益健康</a></li>
        <li><a id="mynav3" onclick="switchMenustyle(3)" href="/index.php?route=product/category&path=0&columnsid=2">益生活</a></li>
      </ul>
    </div>
    <div class="right spfl" onmouseover="MM_over(this)" onmouseout="MM_out(this)"><img src="catalog/view/theme/new/images/gd.png" width="16" height="14" />商品分类

        <div style="display: none; z-index: 999;" class="spfl_nr">
            
        <?php 
        if ($categories) 
        { 
            foreach ($categories as $category) 
            { 
            ?> 
            <div class="spfl_nr_lb of">
            <p class="flbt"><a class="track" href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></p>
            <?php
            
                if ($category['children']) 
                { ?> 
                <ul class="flbt_nr">
            <?php
                    for ($i = 0; $i < count($category['children']);)  
                    {

                        $j = $i + ceil(count($category['children']) / $category['column']); 
                        for (; $i < $j; $i++) 
                        { 
                            if (isset($category['children'][$i]))
                            { 
                                ?> 
                                <li><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a></li>
                                <?php
                            }  
                        } 
                    }
                    ?>
                    </ul>
                    <?php
                }
           ?>  
            </div>
        <?php
            }
        }
        else
        {
        ?> 
            <div class="spfl_nr_lb of">
                <p class="flbt">暂无栏目</p>
            </div>
        <?php 
        }
        ?> 
        </div>
    </div>
  </div>
</div>
<!--导航 end-->
<div id="notification" class="notification"></div>
