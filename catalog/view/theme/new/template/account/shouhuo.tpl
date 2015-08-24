<div class="buttons" style='border: 0px;'>
  <div class="right"  style="margin-top: 0px;"><a  style="height: 40px; font-size: 30px;" id="button-confirm" class="button"><span style="font-size: 20px; padding-top: 6px;">&nbsp;&nbsp;确认收货<?php echo $order_id; ?>&nbsp;&nbsp;</span></a></div>
</div>
<script type="text/javascript"><!--
//url: 'index.php?route=account/shouhuo/ajxsh',
$('#button-confirm').bind('click', function() {

	$.ajax({ 
		url: 'index.php?route=account/shouhuo/ajxsh',
		type: 'post',
		data: $('#checkout-comment textarea'),
		dataType: 'json',
		beforeSend: function() {
                        document.getElementById("button-confirm").style.disabled=true;
			
		},	
		complete: function() {
			document.getElementById("button-confirm").style.disabled=false;
		},	
		success: function(json) {
                    
			if (json['status']=="ok") 
                        {
                            alert("操作成功！"); 
                            window.location.reload();
			}else
                        {
				alert("操作失败！"); 
			}
		}		
	});
});
//--></script> 