<?php echo $header; ?>
<div class="container"><?php echo $column_left; ?><?php echo $column_right; ?>
  <div id="content"><?php echo $content_top; ?>
    <div class="breadcrumb">
      <?php foreach ($breadcrumbs as $breadcrumb) { ?>
      <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
      <?php } ?>
    </div>
    <h1><?php echo $heading_title; ?>
      <?php if ($weight) { ?>
      &nbsp;(<?php echo $weight; ?>)
      <?php } ?>
    </h1>
	<br />
    <?php if ($attention) { ?>
    <div class="attention"><?php echo $attention; ?></div>
    <?php } ?>    
    <?php if ($success) { ?>
    <div class="success"><?php echo $success; ?></div>
    <?php } ?>
    <?php if ($error_warning) { ?>
    <div class="warning"><?php echo $error_warning; ?></div>
    <?php } ?>
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="basket">
      <div class="cart-info">
        <table>
          <thead>
            <tr>
              <td class="image"><?php echo $column_image; ?></td>
              <td class="name"><?php echo $column_name; ?></td>
              <td class="model"><?php echo $column_model; ?></td>
              <td class="quantity"><?php echo $column_quantity; ?></td>
              <td class="price"><?php echo $column_price; ?></td>
              <td class="total"><?php echo $column_total; ?></td>
              <td class="remove"><?php echo $column_remove; ?></td>
            </tr>
          </thead>
          <tbody>
		  
            <?php 

		$zmprs=array();
                $zyprs=array();
                $ybjkprs=array();
                
                
                 foreach ($products as $product) 
                 {
                    if($product['classid']==1)
                    {
                        $zmprs[]=$product;
                    }
                    
                    if($product['classid']==2)
                    {
                        $zyprs[]=$product;
                    }
                    
                    if($product['classid']==3)
                    {
                        $ybjkprs[]=$product;
                    }
                 }
       
                 
                 
                 if(count($zmprs)>0)
                 {
                	 
                     
                    $ischecked='';
                 	if(isset($this->session->data['ischeckedclassid']))
                    {
                    	if(isset($this->session->data['ischeckedclassid']) && is_int(strpos($this->session->data['ischeckedclassid'],'1')))
                        {
                    		$ischecked='checked="checked"';
                        }
                    }
                 ?>
                 
                 <tr>
              		<td colspan=7 style="background-color:#E3FFE3; font-size:14px; font-weight:bold;"><label for="zm">自贸专区</label></td>
           		 </tr>
<?php
                 }
                 
				foreach ($zmprs as $product) 
                {if($product['ischecked'])
{
  ?>
  <tr>
  <?php }else{?>
   <tr style="opacity: 0.30; filter:alpha(opacity=30);">
  <?php }?>
              <td class="image"><?php if ($product['thumb']) { ?>
                 
				<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" />
				
				</a>
                <?php } ?></td>
              <td class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                <?php if (!$product['stock']) { ?>
                <span class="stock">***</span>
                <?php } ?>
                <div>
                  <?php foreach ($product['option'] as $option) { ?>
                  - <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small><br />
                  <?php } ?>
                </div>
                <?php if ($product['points']) { ?>
                <small><?php echo $product['points']; ?></small>
                <?php } ?></td>
              <td class="model"><?php echo $product['model']; ?></td>
              <td class="quantity">
              <input type="button" value=" - " onclick="minus('quantity[<?php echo $product['key']; ?>]','1');" alt="<?php echo $text_minus; ?>" title="<?php echo $text_minus; ?>">
              <input style="min-width:10px;"type="text"  readonly="true" name="quantity[<?php echo $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" size="3" />
              <input type="button" value=" + " onclick="plus('quantity[<?php echo $product['key']; ?>]','1');" alt="<?php echo $text_plus; ?>" title="<?php echo $text_plus; ?>">
              </td>
              <td class="price"><?php echo $product['price']; ?>(<?php echo $product['tax_money']; ?>)</td>
             
              <td class="total"><?php echo $product['total']; ?></td>
              <td class="center">
              <a href="<?php echo $product['remove']; ?>&classid=1" title="<?php echo $text_remove; ?>">
              	<img src="catalog/view/theme/default/image/remove.png" alt="<?php echo $text_remove; ?>" title="<?php echo $text_remove; ?>">
              </a>
              </td>
            </tr>
            <?php } ?>
            <?php foreach ($vouchers as $voucher) { ?>
            <tr>
              <td class="image"></td>
              <td class="name"><?php echo $voucher['description']; ?></td>
              <td class="model"></td>
              <td class="quantity">1</td>
              <td class="price"><?php echo $voucher['amount']; ?></td>
              <td class="total"><?php echo $voucher['amount']; ?></td>
              <td></td>
            </tr>
            <?php 
            
            } 
            
            
            
            
            
            
             if(count($zyprs)>0)
                 {
                 	 $ischecked='';
                 	if(isset($this->session->data['ischeckedclassid']) && is_int(strpos($this->session->data['ischeckedclassid'],'2')))
                        {
                    		$ischecked='checked="checked"';
                        }
                 ?>
                 
                 <tr>
              		<td colspan=7 style="background-color:#DFDFFF; font-size:14px; font-weight:bold;"><label for="zy">直邮专区</label></td>
           		 </tr>
<?php
                 }
                 
				foreach ($zyprs as $product) 
                {if($product['ischecked'])
{
  ?>
  <tr>
  <?php }else{?>
   <tr style="opacity: 0.30; filter:alpha(opacity=30);">
  <?php }?>
              <td class="image"><?php if ($product['thumb']) { ?>
                 
				<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" />
				
				</a>
                <?php } ?></td>
              <td class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                <?php if (!$product['stock']) { ?>
                <span class="stock">***</span>
                <?php } ?>
                <div>
                  <?php foreach ($product['option'] as $option) { ?>
                  - <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small><br />
                  <?php } ?>
                </div>
                <?php if ($product['points']) { ?>
                <small><?php echo $product['points']; ?></small>
                <?php } ?></td>
              <td class="model"><?php echo $product['model']; ?></td>
              <td class="quantity">
              <input type="button" value=" - " onclick="minus('quantity[<?php echo $product['key']; ?>]','2');" alt="<?php echo $text_minus; ?>" title="<?php echo $text_minus; ?>">
              <input style="min-width:10px;"type="text" readonly="true"  name="quantity[<?php echo $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" size="3" />
              <input type="button" value=" + " onclick="plus('quantity[<?php echo $product['key']; ?>]','2');" alt="<?php echo $text_plus; ?>" title="<?php echo $text_plus; ?>">
              </td>
              <td class="price"><?php echo $product['price']; ?>(<?php echo $product['tax_money']; ?>)</td>
             
              <td class="total"><?php echo $product['total']; ?></td>
              <td class="center">
              <a href="<?php echo $product['remove']; ?>&classid=2" title="<?php echo $text_remove; ?>">
              	<img src="catalog/view/theme/default/image/remove.png" alt="<?php echo $text_remove; ?>" title="<?php echo $text_remove; ?>">
              </a>
              </td>
            </tr>
            <?php } ?>
            <?php foreach ($vouchers as $voucher) { ?>
            <tr>
              <td class="image"></td>
              <td class="name"><?php echo $voucher['description']; ?></td>
              <td class="model"></td>
              <td class="quantity">1</td>
              <td class="price"><?php echo $voucher['amount']; ?></td>
              <td class="total"><?php echo $voucher['amount']; ?></td>
              <td></td>
            </tr>
            <?php 
            
            } 
            
            
            
            
            
            
             if(count($ybjkprs)>0)
                 {
                 	 $ischecked='';
                 	if(isset($this->session->data['ischeckedclassid']) && is_int(strpos($this->session->data['ischeckedclassid'],'3')))
                        {
                    		$ischecked='checked="checked"';
                        }
                 ?>
                 <tr>
              		<td colspan=7 style="background-color:#F0E1FF; font-size:14px; font-weight:bold;"><label for="yb">一般进口</label></td>
           		 </tr>
<?php
                 }
                 
				foreach ($ybjkprs as $product) 
                {if($product['ischecked'])
{
  ?>
  <tr >
  <?php }else{?>
   <tr style="opacity: 0.30; filter:alpha(opacity=30);">
  <?php }?>
              <td class="image"><?php if ($product['thumb']) { ?>
                 
				<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" />
				
				</a>
                <?php } ?></td>
              <td class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                <?php if (!$product['stock']) { ?>
                <span class="stock">***</span>
                <?php } ?>
                <div>
                  <?php foreach ($product['option'] as $option) { ?>
                  - <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small><br />
                  <?php } ?>
                </div>
                <?php if ($product['points']) { ?>
                <small><?php echo $product['points']; ?></small>
                <?php } ?></td>
              <td class="model"><?php echo $product['model']; ?></td>
              <td class="quantity">
              <input type="button" value=" - " onclick="minus('quantity[<?php echo $product['key']; ?>]','3');" alt="<?php echo $text_minus; ?>" title="<?php echo $text_minus; ?>">
              <input style="min-width:10px;"type="text" readonly="true" name="quantity[<?php echo $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" size="3" />
              <input type="button" value=" + " onclick="plus('quantity[<?php echo $product['key']; ?>]','3');" alt="<?php echo $text_plus; ?>" title="<?php echo $text_plus; ?>">
              </td>
              <td class="price"><?php echo $product['price']; ?>(<?php echo $product['tax_money']; ?>)</td>
             
              <td class="total"><?php echo $product['total']; ?></td>
              <td class="center">
              <a href="<?php echo $product['remove']; ?>&classid=3" title="<?php echo $text_remove; ?>">
              	<img src="catalog/view/theme/default/image/remove.png" alt="<?php echo $text_remove; ?>" title="<?php echo $text_remove; ?>">
              </a>
              </td>
            </tr>
            <?php } ?>
            <?php foreach ($vouchers as $voucher) { ?>
            <tr>
              <td class="image"></td>
              <td class="name"><?php echo $voucher['description']; ?></td>
              <td class="model"></td>
              <td class="quantity">1</td>
              <td class="price"><?php echo $voucher['amount']; ?></td>
              <td class="total"><?php echo $voucher['amount']; ?></td>
              <td></td>
            </tr>
            <?php 
            
            } 
            ?>
      
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            <tr>
            <td colspan="7" align="right">
            	<a href="<?php echo $continue; ?>"><span><?php echo $button_shopping; ?></span></a>
            	<a onclick="$('#basket').submit();" class="button highlight"><span><?php echo $button_update; ?></span></a>
            </tr>
          </tbody>
        </table>
      </div>
    </form>

    <div class="cart-total">
      <table>
          <?php
  /** zhangbo tax begin **/
  $showindex=0;
  
   foreach ($totals as $total) 
   { 
       ?>
  <tr>
    <td align="right"><b><?php echo $total['title']; ?></b>:&nbsp;&nbsp;</td>
    <td align="right"><?php echo $total['text'];?></td>
  </tr>
  <?php
   } /** zhangbo tax begin **/
   ?>
      </table>
    </div>
    <div class="clear"></div>
    <div class="buttons no_border">
    <div class="right">
      <a href="<?php echo $checkout; ?>" class="button highlight"><span><?php echo $button_checkout; ?></span></a>
    </div></div>
    <?php echo $content_bottom; ?></div>
</div>
<script type="text/javascript"><!--

function ischecked(classid,obj)
{
	if(obj.checked)
	{
		$('#basket').attr("action",$('#basket').attr("action")+'&classid='+classid);
	}
	else
	{
		$('#basket').attr("action",$('#basket').attr("action")+'&unclassid='+classid);
	}
	$('#basket').submit();
}

function plus(name,classid){
	var number=parseInt($('.cart-info input[name=\''+name+'\']').val())+ 1
	$('.cart-info input[name=\''+name+'\']').val(number);
	
	$('#basket').attr("action",$('#basket').attr("action")+'&classid='+classid);
	$('#basket').submit();
}

function minus(name,classid){
	var number=parseInt($('.cart-info input[name=\''+name+'\']').val())- 1
	$('.cart-info input[name=\''+name+'\']').val(number);

	$('#basket').attr("action",$('#basket').attr("action")+'&classid='+classid);
	$('#basket').submit();
}
//--></script> 
<?php echo $footer; ?>