<?php if (isset($_SERVER['HTTP_USER_AGENT']) && !strpos($_SERVER['HTTP_USER_AGENT'], 'MSIE 6')) echo '<?xml version="1.0" encoding="UTF-8" ?>'. "\n"; ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" xml:lang="<?php echo $lang; ?>">
<head>
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
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/stylesheet.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/form.css" />

<link href="catalog/view/theme/default/kycss20140915/index.css" rel="stylesheet" type="text/css" />
<link href="catalog/view/theme/default/kycss20140915/base.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/checkout.css" />
<script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.6.1.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/common.js"></script>

<!--[if IE 7]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie7.css" />
<![endif]-->

<!--[if lt IE 7]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie6.css" />
<script type="text/javascript" src="catalog/view/javascript/DD_belatedPNG_0.0.8a-min.js"></script>
<script type="text/javascript">
DD_belatedPNG.fix('#logo img');
</script>
<![endif]-->

</head>
<body>

<?php echo $topnav; ?>

<br/><br/>

<script type=text/javascript src="catalog/view/theme/default/kyjs20140915/lrtk.js"></script>
<script type=text/javascript src="catalog/view/theme/default/kyjs20140915/jquery-1.4.2.min.js"></script>
<div class="ky_h90">
  <div class="ky_logo"><a href="#"><img src="catalog/view/theme/default/kyimages20140915/ky_logo.jpg" width="389" height="58" /></a></div>
  <div class="ky_ss">
    <div>
      <input type="text" class="ky_ss_input" value="进口奶粉全场八折优惠" />
      <input type="button" class="ky_ss_button" value="搜索" />
    </div>
    <div class="ky_gjc">
      <p>热门关键词：</p>
      <ul> 
      <li><a href="#">辅酶Q10</a>&nbsp;&nbsp;</li>
      <li><a href="#">锐宝氏牌</a>&nbsp;&nbsp;</li>
      <li><a href="#">KANEKA甘草提取物软胶囊</a>&nbsp;&nbsp;</li>
      <li><a href="#">迈高奶粉</a></li>
      </ul>
    </div>
  </div>
</div>
<div class="ky_cd">
  <div class="ky_menu">
    <ul>
      <li><a href="/" style="font-size:16px;text-decoration:none;">首页</a></li>
      <li><a href="index.php?route=product/category&path=0&class=1" style="font-size:16px;text-decoration:none;">自贸专区</a></li>
      <li><a href="index.php?route=product/category&path=0&class=2" style="font-size:16px;text-decoration:none;">直邮专区</a></li>
      <li><a href="index.php?route=product/category&path=0&class=3" style="font-size:16px;text-decoration:none;">一般进口</a></li>
      <li><a href="index.php?route=information/information&information_id=23" style="font-size:16px;text-decoration:none;">自贸区介绍</a></li>
      <!--<li><a href="index.php?route=information/information&information_id=24" style="font-size:16px;text-decoration:none;">热门活动</a></li> -->
      <li><a href="index.php?route=information/information&information_id=4" style="font-size:16px;text-decoration:none;">关于我们</a></li>
    </ul>
    <p>客服热线: 400-829-8568</p>
  </div>
</div>
<div class="ky_content"> 
<?php if ($categories) { ?>
 <br/>
<?php } ?>
<?php if(isset($menu)) {?>
<?php echo $menu; ?>
<?php } ?>
<div id="notification"></div>
