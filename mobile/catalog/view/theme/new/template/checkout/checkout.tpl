<?php echo $checkout_header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<?php echo $content_top; ?>

<!--我的购物车-->


<div class="bg2">
    
  <?php echo $card_methods; ?> 
  
  <div class="w1000">
    <div class="f18 pt20">选择收货地址</div>
    <div id="shipping-address" class="selectads mt10">
      <ul id="shippingAddressListPanel" class="myaddrlist">
          <div id="adds"><?php echo $shipping_address; ?></div>
        <li class="last">
            <label >
                <input type="radio" id="addsel" name="shipping_address" style=" display: none;" value="new" onclick="shownewadd();">
            <span class="name name_newaddr" >使用新收货地址</span></label>
        </li>
      </ul>
      <div id="newadd" class="newaddr formsub formsubB mt5" style=" display: none;"></div>
    </div>
  </div>
    
   <div class="w1000">
    <div class="f18 pt20">选择配送方式</div>
    <div id="shipping-method" class="selectads mt10">
      <ul id="shippingAddressListPanel" class="myaddrlist">
        <?php echo $shipping_methods; ?>
      </ul>
    </div>
  </div> 

<div class="w1000">
    <div class="f18 pt20">选择支付方式</div>
    <div class="bg_bs mt10" style="border-top:2px solid #e1e1e1; position:relative;">
      <div style="height:39px; border-bottom:1px solid #f5f5f5;"></div>
      <div class="zffs">
        <ul>
          <li id="b1"  class="hover8">支付平台</li>
        </ul>
      </div>
      <div id="payment-method" class="of clear zffs_nr">
        <div id="con_b_1">
            <?php echo $payment_methods; ?> 
        </div>
        
      </div>
    </div>
  </div>
 
  <div class="w1000">
    <div class="f18 pt20"><a href="/index.php?route=checkout/cart" class="right sc_a f18">[返回购物车]</a>选购商品清单</div>
    <div class="wxts" >
      <div class="wxts_left left hs2 center f14w">温馨提示：</div>
      <div class="left c57">将根据具体拆单情况，确定最终税费，每单关税低于50（含）免税。 </div>
      <div class="wxts_jt"></div>
    </div>
    <div class="pt10">
      
      <?php 
          $all_prices=0;//总价
          $all_pis=0;//总商品数量
          $all_pisprice=0;//总商总价
          $all_tax=0;//总关税
          $all_shapping=0;//总运费
          foreach($this->session->data['orders'] as $key=>$ordernumber)
            {
                $this->session->data['zb_cart_orderid']=$key;//设置当前激活的订单
                $this->session->data['zb_ordernumber']=$ordernumber[0];//设置当前激活的订单编号
                $totals= $this->getchecked_totle();//获取当前激活订单 合计信息
                $products=$this->getCheckedProducts();//获取当前激活订单 产品信息
          
                foreach ($totals as $total)  
                {
                    if($total["code"]=="total")
                    {
                        $all_prices+=$total['value'];//总价
                    }
                    if($total["code"]=="shipping")
                    {
                        $all_shapping+=$total['value'];//总运费
                    }
                    if($total["code"]=="tax")
                    {
                        $all_tax+=$total['value'];//总关税
                    }
                }
                
                
                $classname='自贸专区';
                if($ordernumber[0]=='2')
                {
                    $classname='直邮专区';
                }else if($ordernumber[0]=='3')
                {
                    $classname='一般进口';
                }
          ?> 
      <table class="table1 f14w">
        <tr>
          <td style="width:45%">商品名称</td>
          <td style="width:10%">单价</td>
          <td style="width:10%">进口税</td>
          <td style="width:12%">数量</td>
          <td style="width:10%">小计</td>
        </tr>
      </table>
       <?php
            foreach ($products as $product)
            {
                $all_pis+=$product['quantity'];//总商品数量
                $all_pisprice+=$product['price']*$product['quantity'];//总商总价
        ?>
      <table class="table2 center">
        <tr>
          <td style="width:45%; text-align:left;"><a href="<?php echo $product['href']; ?>" class="spt left"><img src="<?php echo $product['thumb']; ?>" width="207" height="207" /></a><a href="<?php echo $product['href']; ?>" class="bt5 left"><?php echo $product['name']; ?></a></td>
          <td style="width:10%">¥<?php echo $product['price']; ?></td>
          <td style="width:10%">¥<?php echo $product['tax']; ?></td>
          <td style="width:12%"><?php echo $product['quantity']; ?></td>
          <td style="width:10%"><?php echo $product['total']; ?></td>
        </tr>
      </table>
        <?php 
        }
       ?>
      <div class="kyzm of lh20 c57">
        <div class="left kyzm_ck"></div>
        <div class="left kyzm_ck"><?php echo $classname; ?></div>
        <div class="right">
        <?php 
        
            foreach ($totals as $total)  
            {
           ?>
          <span class="right ml20"><?php echo $total['title']; ?>：<span class="f14w c35"> <?php echo str_replace('</strong></span>','',str_replace('<span class="red"><strong class="f20">￥','', $total['text'])); ?> </span></span>
           <?php 
            }
            ?>
        </div>
      </div>
       <?php 
     }
     unset($this->session->data['zb_cart_orderid']);
   ?>    
          
  </div>
    
    
    
    
  
  <div class="w1000 pt10">
    <div class="hs2 f18 bold pt20">提交订单</div>
    <div class="bg_bs mt10">
      <div class="tjdd of">
        <?php foreach ($modules as $module) { ?>
		  <?php echo $module; ?>
		  <?php } ?>

        <div class="right">
          <p class="f14 pb12 of"><span class="right qian7 hs2">¥<?php echo $all_pisprice; ?></span><span class="right spxj c57">共 <span class="hs2"><?php echo $all_pis; ?></span> 件商品商品金额总计：</span></p>
          <p class="f14 pb12 of"><span class="right qian7">¥<?php echo $all_shapping; ?></span><span class="right spxj c57">运费小计：</span></p>
          <p class="f14 pb12 of"><span class="right qian7">¥<?php echo $all_tax; ?></span><span class="right spxj c57">税费小计：</span></p>
          <p class="right f14 mr20 c57"><input type="checkbox" />我已阅读并同意<a href="javascript:void(0);">《跨境通消费者购物须知》</a></p>
        </div>
      </div>
      <div class="of tj00">
        <div class="right"><a href="javascript:void(0);" id="button-confirm" class="btn_booklist_sub"></a></div>
        <span class="right f32 hs2 bold lh50">应付总金额：¥<?php echo $all_prices; ?></span>
      </div>
    </div>
  </div>
  <div class="w1000 pt15">
    <div class="f18 pt20">配送说明</div>
    <div class="bg_bs mt10 tbsm c57"><span class="bold hs2">特别说明：</span>受中国国家航空管制影响，电池、液体、清洗剂、易燃易爆等产品无法里德空运，可益可能会根据实际情况采用的快递方式，若造成一定延误，请谅解。请随时关注你的订单状态及出库后的包裹跟踪信息（我们会有短信通知）。</div>
  </div>
</div>
<script>

function shownewadd() {
		$.ajax({
			url: 'index.php?route=checkout/address/shipping&action=modifyad',
			dataType: 'json',
			success: function(json) {
				if (json['output']) {
					$('#newadd').html(json['output']);
					
					$('#newadd').slideDown('slow');
					
                                        $('.form_newaddr select[name=\'zone_id\']').load('index.php?route=common/localisation/zone&country_id=<?php echo $country_id; ?>');

				}
			}
		});	
	
    }
function hiddnewadd() {
		$('#newadd').slideUp('slow');
    }
    
function addadd ()
{
	$.ajax({
		url: 'index.php?route=checkout/address/shipping',
		type: 'post',
		data: $('#shipping-address input[type=\'text\'], #shipping-address input[type=\'password\'], #shipping-address input[type=\'checkbox\']:checked, #shipping-address input[type=\'radio\']:checked, #shipping-address select'),
		dataType: 'json',
		beforeSend: function() {
			$('.btn').attr('disabled', true);
			$('.btn').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},	
		complete: function() {
			$('.btn').attr('disabled', false);
			$('.wait').remove();
		},			
		success: function(json) { 
			$('#shipping-address .need').remove();
			if (json['redirect']) {
				location = json['redirect'];
			}
			if (json['error']) {
				if (json['error']['firstname']) {
					$('#shipping-address input[name=\'firstname\']').after('<span class="need">' + json['error']['firstname'] + '</span>');
				}

				if (json['error']['email']) {
					$('#shipping-address input[name=\'email\']').after('<span class="need">' + json['error']['email'] + '</span>');
				}
				
				if (json['error']['mobile']) {
					$('#shipping-address input[name=\'mobile\']').after('<span class="need">' + json['error']['mobile'] + '</span>');
				}		
										
				if (json['error']['address_1']) {
					$('#shipping-address input[name=\'address_1\']').after('<span class="need">' + json['error']['address_1'] + '</span>');
				}	
				
				if (json['error']['city']) {
					$('#shipping-address input[name=\'city\']').after('<span class="need">' + json['error']['city'] + '</span>');
				}	
				
				if (json['error']['postcode']) {
					$('#shipping-address input[name=\'postcode\']').after('<span class="need">' + json['error']['postcode'] + '</span>');
				}	
			
				
				if (json['error']['zone']) {
					$('#shipping-address select[name=\'zone_id\']').after('<span class="need">' + json['error']['zone'] + '</span>');
				}
			} else { 
				if (json['address']) {
					$('#adds').html(json['address']);
                                        $('#newadd').slideUp('slow');
				}	
				
				

				checkoutComfirm();
			}  	
		}
	});	
    }
function selectshppingmethod() {
    alert('ss');
	$.ajax({
		url: 'index.php?route=checkout/shipping',
		type: 'post',
		data: $('#shipping-method input[type=\'radio\']:checked, #shipping-method textarea'),
		dataType: 'json',
		beforeSend: function() { alert('11');
			$('#button-shipping').attr('disabled', true);
			$('#button-shipping').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},	
		complete: function() { alert('22');
			$('#button-shipping').attr('disabled', false);
			$('.wait').remove();
		},			
		success: function(json) { alert('33');
			$('.warning').remove();
			
			if (json['redirect']) {
				location = json['redirect'];
			}
			
			if (json['error']) {
				if (json['error']['warning']) {
					$('#shipping-method .shippingAddressListPanel').prepend('<div class="warning" style="display: none;">' + json['error']['warning'] + '</div>');
					
					$('.warning').fadeIn('slow');
				}			
			} else {
				checkoutComfirm();		
			}
		}
	});	
}
function selectpaymentmethod() {
	$.ajax({
		url: 'index.php?route=checkout/payment', 
		type: 'post',
		data: $('#payment-method input[type=\'radio\']:checked, #payment-method input[type=\'checkbox\']:checked, #payment-method textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-payment').attr('disabled', true);
			$('#button-payment').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},	
		complete: function() {
			$('#button-payment').attr('disabled', false);
			$('.wait').remove();
		},			
		success: function(json) {
			$('.warning').remove();
			
			if (json['redirect']) {
				location = json['redirect'];
			}
			
			if (json['error']) {
				if (json['error']['warning']) {
					$('#payment-method .con_b_1').prepend('<div class="warning" style="display: none;">' + json['error']['warning'] + '</div>');
					
					$('.warning').fadeIn('slow');
				}			
			} else {
				checkoutComfirm();			
			}
		}
	});	
}



function checkoutComfirm(){
	$.ajax({
		url: 'index.php?route=checkout/checkout/update',
		dataType: 'json',
		success: function(json) {
			if (json['redirect']) {
				location = json['redirect'];
			}
                        history.go(0);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			//alert(thrownError);
		}
	});
}
    
    
    
    $('#button-confirm').bind('click', function() { 
        var xm="";
        var cd="";
        var ph="";
        var em="";
    $('.form_newaddr .need').remove(); 
    xm=encodeURIComponent(document.getElementById("xm").value);
    cd=document.getElementById("cd").value;
    ph=document.getElementById("ph").value;
    em=document.getElementById("em").value;
    if(xm=="")
    {
        $('.form_newaddr input[id=\'xm\']').after('<span class="need"> 请填写实名信息：姓名！</span>');
        $('html, body').animate({ scrollTop: 0 }, 'slow'); 
        return;
    }
    if(cd=="")
    {
        $('.form_newaddr input[id=\'cd\']').after('<span class="need"> 请填写实名信息：证件号码！</span>');
        $('html, body').animate({ scrollTop: 0 }, 'slow'); 
        return;
    }else
    {
        if(!IdCardValidate(cd))
            {
                $('.form_newaddr input[id=\'cd\']').after('<span class="need"> 请填写实名信息：证件号码不对！</span>');
                $('html, body').animate({ scrollTop: 0 }, 'slow');
            return;     
                }
    }    
    
    if(ph=="")
    {
        $('.form_newaddr input[id=\'ph\']').after('<span class="need"> 请填写实名信息：手机号码！</span>');
                $('html, body').animate({ scrollTop: 0 }, 'slow');
        return;
    }else
     {
         var reg = /^0?1[3|4|5|8][0-9]\d{8}$/;
         if (!reg.test(ph)) 
             {
                  $('.form_newaddr input[id=\'ph\']').after('<span class="need"> 请填写实名信息：手机号码不对！</span>');
                $('html, body').animate({ scrollTop: 0 }, 'slow');
            return;    
             }
     }
    if(em=="")
    {
        $('.form_newaddr input[id=\'em\']').after('<span class="need"> 请填写实名信息：Email！</span>');
        $('html, body').animate({ scrollTop: 0 }, 'slow');
        return;
    }else
    {
        var pattern = /^([\.a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;  
        if (!pattern.test(em))
        { 
            $('.form_newaddr input[id=\'em\']').after('<span class="need"> 请填写实名信息：Email不对！</span>');
             $('html, body').animate({ scrollTop: 0 }, 'slow');
            return;
        }
    }

	$.ajax({ 
		url: 'index.php?route=checkout/checkout/validate&xm='+xm+'&cd='+cd+'&ph='+ph+'&em='+em+'&token=<?php echo $token; ?>',
		type: 'post',
		data: $('#checkout-comment textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-confirm').attr('disabled', true);
		},	
		complete: function() {
			$('#button-confirm').attr('disabled', false);
		},	
		success: function(json) {
			if (json['error']) {
				if (json['error']['warning']) {
					alert(json['error']['warning']);
				}
			}else
			{
				//$('#submit_order').submit();
                                //document.getElementById("submit_order").submit();
                                 window.location.href="index.php?route=checkout/orderspayment";
			}
		}		
	});
});

var Wi = [ 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2, 1 ];    // 加权因子   
var ValideCode = [ 1, 0, 10, 9, 8, 7, 6, 5, 4, 3, 2 ];            // 身份证验证位值.10代表X   
function IdCardValidate(idCard) { 
    idCard = trim(idCard.replace(/ /g, ""));               //去掉字符串头尾空格                     
    if (idCard.length == 15) {   
        return isValidityBrithBy15IdCard(idCard);       //进行15位身份证的验证    
    } else if (idCard.length == 18) {   
        var a_idCard = idCard.split("");                // 得到身份证数组   
        if(isValidityBrithBy18IdCard(idCard)&&isTrueValidateCodeBy18IdCard(a_idCard)){   //进行18位身份证的基本验证和第18位的验证
            return true;   
        }else {   
            return false;   
        }   
    } else {   
        return false;   
    }   
}   
/**  
 * 判断身份证号码为18位时最后的验证位是否正确  
 * @param a_idCard 身份证号码数组  
 * @return  
 */  
function isTrueValidateCodeBy18IdCard(a_idCard) {   
    var sum = 0;                             // 声明加权求和变量   
    if (a_idCard[17].toLowerCase() == 'x') {   
        a_idCard[17] = 10;                    // 将最后位为x的验证码替换为10方便后续操作   
    }   
    for ( var i = 0; i < 17; i++) {   
        sum += Wi[i] * a_idCard[i];            // 加权求和   
    }   
    valCodePosition = sum % 11;                // 得到验证码所位置   
    if (a_idCard[17] == ValideCode[valCodePosition]) {   
        return true;   
    } else {   
        return false;   
    }   
}   
/**  
  * 验证18位数身份证号码中的生日是否是有效生日  
  * @param idCard 18位书身份证字符串  
  * @return  
  */  
function isValidityBrithBy18IdCard(idCard18){   
    var year =  idCard18.substring(6,10);   
    var month = idCard18.substring(10,12);   
    var day = idCard18.substring(12,14);   
    var temp_date = new Date(year,parseFloat(month)-1,parseFloat(day));   
    // 这里用getFullYear()获取年份，避免千年虫问题   
    if(temp_date.getFullYear()!=parseFloat(year)   
          ||temp_date.getMonth()!=parseFloat(month)-1   
          ||temp_date.getDate()!=parseFloat(day)){   
            return false;   
    }else{   
        return true;   
    }   
}   
  /**  
   * 验证15位数身份证号码中的生日是否是有效生日  
   * @param idCard15 15位书身份证字符串  
   * @return  
   */  
  function isValidityBrithBy15IdCard(idCard15){   
      var year =  idCard15.substring(6,8);   
      var month = idCard15.substring(8,10);   
      var day = idCard15.substring(10,12);   
      var temp_date = new Date(year,parseFloat(month)-1,parseFloat(day));   
      // 对于老身份证中的你年龄则不需考虑千年虫问题而使用getYear()方法   
      if(temp_date.getYear()!=parseFloat(year)   
              ||temp_date.getMonth()!=parseFloat(month)-1   
              ||temp_date.getDate()!=parseFloat(day)){   
                return false;   
        }else{   
            return true;   
        }   
  }   
//去掉字符串头尾空格   
function trim(str) {   
    return str.replace(/(^\s*)|(\s*$)/g, "");   
}
</script>
<!--我的购物车 end--> 
<?php echo $footer; ?>