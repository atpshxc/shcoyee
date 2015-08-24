<?php echo $checkout_header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <input name="verified" type="hidden" id="verified" vvalue="1" >
  <div id="warnning">
  </div>
  <div class="checkout">
      
      
      
      
    <div id="payment-method">
      <div class="checkout-heading">实名信息备案</div>
      <div class="checkout-content">
      		 <?php echo $card_methods; ?> 
      </div>
    </div>
      
      
      
 	<?php if ($shipping_required) { ?>
    <div id="shipping-address">
      <div class="checkout-heading"><?php echo $text_checkout_shipping_address; ?> <?php if($has_address) { ?>  <a><?php echo $text_modify; ?></a> <?php } ?> </div>
      <div class="checkout-content">
     	 <?php echo $shipping_address; ?>
      </div>
    </div>
        
        
        
     <div id="shipping-method">
	    <div class="checkout-heading"><?php echo $text_checkout_shipping_method; ?></div>
	      <div class="checkout-content">
	         <?php echo $shipping_methods; ?>
	        </div>
	 </div>
	<?php } ?>
        
    <div id="payment-method">
      <div class="checkout-heading"><?php echo $text_checkout_payment_method; ?></div>
      <div class="checkout-content">
      		 <?php echo $payment_methods; ?> 
      </div>
    </div>
        
        
        
    <div id="confirm">
	   <div class="checkout-heading"><?php echo $text_checkout_product; ?><a href="<?php echo $cart; ?>"><?php echo $text_modify_cart;?></a></div>
       <div class="checkout-content">
      		

            
          <?php 
          $all_prices=0;//总价
          foreach($this->session->data['orders'] as $key=>$ordernumber)
            {
            
                $this->session->data['zb_cart_orderid']=$key;//设置当前激活的订单
                $this->session->data['zb_ordernumber']=$ordernumber[0];//设置当前激活的订单编号
                $totals= $this->getchecked_totle();//获取当前激活订单 合计信息
                $products=$this->getCheckedProducts();//获取当前激活订单 产品信息
                
                $all_prices+=floatval(str_replace(',','', str_replace('￥','', $totals[count($totals)-1]['text'])));
                
                $COLOR='background-color:#E3FFE3;';
                $classname='自贸专区';
                if($ordernumber[0]=='2')
                {
                    $classname='直邮专区';
                    $COLOR='background-color:#DFDFFF;';
                }else if($ordernumber[0]=='3')
                {
                    $classname='一般进口';
                    $COLOR='background-color:#F0E1FF;';
                }
          ?>
 
          <div class="checkout-product" >               
                    <table>        
                        <thead>
                            <tr>
                                <td colspan=7 style="<?php echo $COLOR; ?> font-size:14px; font-weight:bold;"><label for="yb"><?php echo $classname; ?></label></td>
                            </tr>
                            <tr>
                                <td class="name" style="width: 50%;" ><?php echo $column_name; ?></td>
                              <td class="model" ><?php echo $column_model; ?></td>
                              <td class="quantity" ><?php echo $column_quantity; ?></td>
                              <td class="price" ><?php echo $column_price; ?></td>
                              <td class="total" ><?php echo $column_total; ?></td>
                            </tr>
                          </thead>
                          <tbody>
                          <?php
                                
                                foreach ($products as $product)
                                {
                                ?>
                                    <tr>
                                      <td class="name" style="width: 50%;"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                                        <?php foreach ($product['option'] as $option) { ?>
                                        <br />
                                        &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                                        <?php } ?></td>
                                      <td class="model"><?php echo $product['model']; ?></td>
                                      <td class="quantity"><?php echo $product['quantity']; ?></td>
                                      <td class="price"><?php echo $product['price']; ?></td>
                                      <td class="total"><?php echo $product['total']; ?></td>
                                    </tr>
                                <?php 
                                }
                                ?>
                       </tbody>
                    </table>        
                     </div>  
          
          
                    <div id="refersh_tax" style="margin-top: -10px; margin-bottom: 20px; padding-bottom: 35px; text-align: right;">
                       <?php foreach ($totals as $total)  {
                       
                       ?>
                        &nbsp;&nbsp;<?php echo $total['title']; ?>:<span class="total number"><b><?php echo $total['text']; ?> </b></span>   
                        <?php } ?>
                        
                   </div>
             <?php 
               }
               unset($this->session->data['zb_cart_orderid']);
             ?>
            
          </div>        
               
		<div class="cart-module">
		  <?php foreach ($modules as $module) { ?>
		  <?php echo $module; ?>
		  <?php } ?>
		</div>
           
    </div>
    
  
    <form  id="submit_order">
     <div id="payment-button">
	    <div class="checkout-content">
	     <div class="columns">

  		
                 <div  style="height: 40px; font-size: 25px; font-weight: bold; color: red; text-align: right;"> 应付总金额：￥<?php echo $all_prices; ?></div>
  		 <div class="payment c30r"><br/>
			<div class="buttons">
                            <div class="right"><a id="button-confirm" style="height: 40px; font-size: 30px;" class="button"><span  style="font-size: 20px; padding-top: 6px;">提交订单</span></a></div>
                        </div>
		</div>
		
  		</div>
		
	    	
	    </div>
    </div>
    </form>
 </div>
  <?php echo $content_bottom; ?>
</div>
<script type="text/javascript"><!--
$('.cart-module .cart-heading').bind('click', function() {
	if ($(this).hasClass('active')) {
		$(this).removeClass('active');
	} else {
		$(this).addClass('active');
	}
		
	$(this).parent().find('.cart-content').slideToggle('slow');
});

$('#checkout-comment .checkout-heading').bind('click', function() {
	$('#checkout-comment .checkout-content').slideDown('slow');
});

// Shipping Address			
$('#shipping-address #button-address').live('click', function() {
	$('#warnning').html('');
	$.ajax({
		url: 'index.php?route=checkout/address/shipping',
		type: 'post',
		data: $('#shipping-address input[type=\'text\'], #shipping-address input[type=\'password\'], #shipping-address input[type=\'checkbox\']:checked, #shipping-address input[type=\'radio\']:checked, #shipping-address select'),
		dataType: 'json',
		beforeSend: function() {
			$('#shipping-address #button-address').attr('disabled', true);
			$('#shipping-address #button-address').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},	
		complete: function() {
			$('#shipping-address #button-address').attr('disabled', false);
			$('.wait').remove();
		},			
		success: function(json) {
			$('.error').remove();
			
			if (json['redirect']) {
				location = json['redirect'];
			}
			
			if (json['error']) {
				if (json['error']['firstname']) {
					$('#shipping-address input[name=\'firstname\']').after('<span class="error">' + json['error']['firstname'] + '</span>');
				}

				if (json['error']['email']) {
					$('#shipping-address input[name=\'email\']').after('<span class="error">' + json['error']['email'] + '</span>');
				}
				
				if (json['error']['mobile']) {
					$('#shipping-address input[name=\'mobile\']').after('<span class="error">' + json['error']['mobile'] + '</span>');
				}		
										
				if (json['error']['address_1']) {
					$('#shipping-address input[name=\'address_1\']').after('<span class="error">' + json['error']['address_1'] + '</span>');
				}	
				
				if (json['error']['city']) {
					$('#shipping-address input[name=\'city\']').after('<span class="error">' + json['error']['city'] + '</span>');
				}	
				
				if (json['error']['postcode']) {
					$('#shipping-address input[name=\'postcode\']').after('<span class="error">' + json['error']['postcode'] + '</span>');
				}	
			
				
				if (json['error']['zone']) {
					$('#shipping-address select[name=\'zone_id\']').after('<span class="error">' + json['error']['zone'] + '</span>');
				}
			} else {
				if (json['address']) {
					$('#shipping-address .checkout-content').html(json['address']);
				}	
				
				$.ajax({
					url: 'index.php?route=checkout/shipping',
					dataType: 'json',
					success: function(json) {
						if (json['redirect']) {
							location = json['redirect'];
						}
									
						if (json['output']) {
							$('#shipping-method .checkout-content').html(json['output']);
							
							$('#shipping-address .checkout-heading a').remove();
							$('#shipping-address .checkout-heading').prepend('<a><?php echo $text_modify; ?></a>');							
						}
					}
				});	

				$.ajax({
					url: 'index.php?route=checkout/payment',
					dataType: 'json',
					success: function(json) {
						if (json['redirect']) {
							location = json['redirect'];
						}
									
						if (json['output']) {
							$('#payment-method .checkout-content').html(json['output']);
						}
					}
				});	

				checkoutComfirm();
			}  
		}
	});	
});

 $('#shipping-address .checkout-heading a').live('click', function() {
	$(document).ready(function() {
		
	    $('#shipping-address .checkout-heading a').remove();
		$.ajax({
			url: 'index.php?route=checkout/address/shipping&action=modifyad',
			dataType: 'json',
			success: function(json) {
				if (json['output']) {
					$('#shipping-address .checkout-content').html(json['output']);
					
					$('#shipping-address .checkout-content').slideDown('slow');
					
				}
			}
		});	
	});
});

$("input[name='shipping_method']").live('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/shipping',
		type: 'post',
		data: $('#shipping-method input[type=\'radio\']:checked, #shipping-method textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-shipping').attr('disabled', true);
			$('#button-shipping').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},	
		complete: function() {
			$('#button-shipping').attr('disabled', false);
			$('.wait').remove();
		},			
		success: function(json) {
			$('.warning').remove();
			
			if (json['redirect']) {
				location = json['redirect'];
			}
			
			if (json['error']) {
				if (json['error']['warning']) {
					$('#shipping-method .checkout-content').prepend('<div class="warning" style="display: none;">' + json['error']['warning'] + '</div>');
					
					$('.warning').fadeIn('slow');
				}			
			} else {
				checkoutComfirm();		
			}
		}
	});	
});


$("input[name='payment_method']").live('click', function() {
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
					$('#payment-method .checkout-content').prepend('<div class="warning" style="display: none;">' + json['error']['warning'] + '</div>');
					
					$('.warning').fadeIn('slow');
				}			
			} else {
				checkoutComfirm();			
			}
		}
	});	
});



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

		
	//$.ajax({
	//	url: 'index.php?route=checkout/confirm/payment',
	//	dataType: 'json',
	//	success: function(json) {
	//		if (json['redirect']) {
	//			location = json['redirect'];
	//		}	
	//	
	//		if (json['output']) {
	//			$('#refersh_tax').html(json['output']);
	//		}
	//	},
	//	error: function(xhr, ajaxOptions, thrownError) {
	//		alert(thrownError);
	//	}
	//});	
	
}

//--></script> 

<script type="text/javascript">
<!--

$('#button-confirm').bind('click', function() {
        var xm="";
        var cd="";
        var ph="";
        var em="";
        
    xm=encodeURIComponent(document.getElementById("xm").value);
    cd=document.getElementById("cd").value;
    ph=document.getElementById("ph").value;
    em=document.getElementById("em").value;
    if(xm=="")
    {
        alert("请填写实名信息：姓名！");
        return;
    }
    if(cd=="")
    {
        alert("请填写实名信息：证件号码！");
        return;
    }else
    {
        if(!IdCardValidate(cd))
            {
                 alert("请填写实名信息：证件号码不对！"); 
            return;     
                }
    }    
    
    if(ph=="")
    {
        alert("请填写实名信息：手机号码！");
        return;
    }else
     {
         var reg = /^0?1[3|4|5|8][0-9]\d{8}$/;
         if (!reg.test(ph)) 
             {
             alert("请填写实名信息：手机号码不对！"); 
            return;    
             }
     }
    if(em=="")
    {
        alert("请填写实名信息：Email！");
        return;
    }else
    {
        var pattern = /^([\.a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;  
        if (!pattern.test(em))
        {  
            alert("请填写实名信息：Email不对！"); 
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


//--></script> 
<?php echo $footer; ?>