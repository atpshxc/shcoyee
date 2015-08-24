<div class="left">
          <p><a onclick="openShutManager(this,'box4',false)" class="c57" style="cursor:pointer"><span class="jia left"></span>使用我的优惠券</a></p>
          <div id="box4" style="display:none" class="bm c57">
            <p><span class="left">优惠券编码：</span>
                <input type="text" class="yhq_ipt left" id="coupon" name="coupon" value="<?php echo $coupon; ?>" />
                <a href="javascript:void(0)" id="button-coupon" class="tjyhq"></a></p>
          </div>
        </div>
<script type="text/javascript"><!--
     //=点击展开关闭效果=
		function openShutManager(oSourceObj,oTargetObj,shutAble,oOpenTip,oShutTip){
		var sourceObj = typeof oSourceObj == "string" ? document.getElementById(oSourceObj) : oSourceObj;
		var targetObj = typeof oTargetObj == "string" ? document.getElementById(oTargetObj) : oTargetObj;
		var openTip = oOpenTip || "";
		var shutTip = oShutTip || "";
		if(targetObj.style.display!="none"){
		   if(shutAble) return;
		   targetObj.style.display="none";
		   if(openTip  &&  shutTip){
			sourceObj.innerHTML = shutTip; 
		   }
		} else {
		   targetObj.style.display="block";
		   if(openTip  &&  shutTip){
			sourceObj.innerHTML = openTip; 
		   }
		}
		}
$('#button-coupon').bind('click', function() {
	$.ajax({
		type: 'POST',
		url: 'index.php?route=total/coupon/calculate',
		data: {coupon: $('#coupon').val()},
		dataType: 'json',		
		beforeSend: function() {
			$('.success, .warning').remove();
			$('#button-coupon').attr('disabled', true);
			$('#button-coupon').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},
		complete: function() {
			$('#button-coupon').attr('disabled', false);
			$('.wait').remove();
		},		
		success: function(json) { 
			if (json['error']) { 
				$('#basket').before('<div class="warning">' + json['error'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
			}
			
			if (json['redirect']) {
				location = json['redirect'];
			}
		}
	});
});
//--></script> 