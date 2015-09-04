<footer>
    <nav class="ect-nav"><ul class="ect-diaplay-box text-center">
  <li class="ect-box-flex"><a href="<?php echo HTTP_SERVER?>"><i class="ect-icon ect-icon-home"></i>首页</a></li>
  <li class="ect-box-flex"><a href="<?php echo HTTP_SERVER?>index.php?route=product/search"><i class="ect-icon ect-icon-search"></i>搜索</a></li>
  <li class="ect-box-flex"><a href="<?php echo HTTP_SERVER?>index.php?route=checkout/cart"><span id="cart_total_bottom_menu" class="badge" style="background-color:red;float:right;margin-right:10%;">0</span><i class="ect-icon ect-icon-flow"></i>购物车</a></li>
  <li class="ect-box-flex"><a href="<?php echo HTTP_SERVER?>index.php?route=account/account"><i class="ect-icon ect-icon-user"></i>会员中心</a></li>
</ul>
</nav>
</footer>
<script type="text/javascript"><!--
	$.ajax({
		url: 'index.php?route=checkout/cart/getTotal',
		type: 'post',
		dataType: 'json',
		success: function(json) {
			$('#cart_total_bottom_menu').html(json['total']);
		}
	});
//--></script>
</body>
</html>