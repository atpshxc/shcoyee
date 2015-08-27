<?php
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of sign
 *
 * @author zhangbo
 */

//include("kjt_order.php");
class sign
{
    public function create($submit_url,$appSecret) 
    {
        $tempurl="";
        $prams=explode("&",$submit_url);//使用&切割字符串为数组
        sort($prams);//参数排序
        foreach ($prams as $ttt)
        {
            $pvs=  explode("=", $ttt);
            $tempurl.=$pvs[0]."=".urlencode($pvs[1]).'&';//重组url 并且urlencode参数值
        }
        return array("sign"=>md5($tempurl.$appSecret),"url"=>$tempurl); //返回签名 和 重组url
    }
    
     //渠道商提交订单
	public function creareorder($order_info,$order_totals,$products,$cardifo_query,$db)
        {
            $order_id=$order_info["order_id"];
//            $this->load->model('checkout/order');
//            $order_totals=$this->model_checkout_order->Gettotals($order_id);
//            $products=$this->model_checkout_order->getproducts($order_id);
           //zhangbo
//            $cardifo_query=  $this->db->query("SELECT * FROM " . DB_PREFIX . "card where customer_id='".$order_info['customer_id']."'");
                        if ($cardifo_query->num_rows) 
                        {
                            $cardinfo= array
                                    (
                                        "card_id"=>$cardifo_query->row["card_id"],
                                        "customer_id"=>$cardifo_query->row["customer_id"],
                                        "card_name"=>$cardifo_query->row["card_name"],
                                        "card_code"=>$cardifo_query->row["card_code"],
                                        "card_type"=>$cardifo_query->row["card_type"],
                                        "card_email"=>$cardifo_query->row["card_email"],
                                        "card_phone"=>$cardifo_query->row["card_phone"]
                                    );
                        }
                        
                       
                        
                        
                        //zhangbo
            
                        //支付方式
                        if($order_info["payment_code"]=="alipay")
                        {
                            $peymentcode="112";
                        }else if($order_info["payment_code"]=="weixinpay")
                        {
                            $peymentcode="118";
                        }else if($order_info["payment_code"]=="tenpay")
                        {
                            $peymentcode="117";
                        }else if($order_info["payment_code"]=="tenpay")//银联待完成
                        {
                            $peymentcode="117";
                        }
                        
                        
                        
            $PayInfo= array  //订单支付信息
                   (
                        //"ProductAmount"=>900,            //必须   商品总金额，保留 2位小数（如 120.50 或 100.00，无费用时为 0）
                         "ProductAmount"=>$order_totals["total"],            //必须   商品总金额，保留 2位小数（如 120.50 或 100.00，无费用时为 0）
                        "ShippingAmount"=>$order_totals["shipping"],           //必须   运费总金额，保留 2位小数
                        "TaxAmount"=>$order_totals["tax"],                 //必须   商品行邮税总金额
                        "CommissionAmount"=>"0",         //必须   下单支付产生的手续费
                        "PayTypeSysNo"=>$peymentcode,              //必须   支付方式编号 111: 东方支付   112：支付宝   114:财付通 117: 银联支付  118微信支付
                        "PaySerialNumber"=>$order_info["payment_sn"]           //必须   支付流水号
                   );
              $ShippingInfo=array //订单配送信息
                  (
                        "ReceiveName"=>$order_info["shipping_firstname"],              //必须   收件人姓名
                        "ReceivePhone"=>$order_info["shipping_mobile"],             //必须   收件人电话
                        "ReceiveAddress"=>$order_info["shipping_address_1"],           //必须   收件人收货地址不包含省市区名称
                        "ReceiveAreaCode"=>$order_info["shipping_city_id"],          //必须   收货地区编号，至少需要到市级别
                        //"ReceiveZip"=>$order_info["shipping_postcode"],               //收件地邮政编码
                        "SenderName"=>"",               //发件人姓名
                        "SenderTel"=>"",               //发件人电话
                        "SenderCompanyName"=>"",       //发件人公司
                        "SenderAddr"=>"",              //发件人地址
                        "SenderZip"=>"",                //发件地邮编
                        "SenderCity"=>"",              //发件地城市SenderProvince
                        "SenderProvince"=>"",          //发件地省
                        "SenderCountry"=>"",          //发件地国家
                        "ReceiveAreaName"=>$order_info["shipping_zone"].",".$order_info["shipping_city"].", "          //必须     收件省市区名称
              );

              $AuthenticationInfo=array //下单用户实名认证信息 
                  (
                        "Name"=>$cardinfo["card_name"],                 //必须   下单用户真实姓名  
                        "IDCardType"=>"0",          //必须   （0 – 身份证）
                        "IDCardNumber"=>$cardinfo["card_code"],         //必须   用户户证件编号
                        "PhoneNumber"=>$cardinfo["card_phone"],         //必须   用户联系电话
                        "Email"=>$cardinfo["card_email"],               //必须   用户电子邮件
                        "Address"=>""            //用户联系地址 
                  );
                $ItemList=array();//订单中购买商品列表
              foreach($products as $prd)
              {
                  $taxprice=0;
                  if($order_totals["tax"]>50)//当总关税大约50时，单品的关税才使用，否则为零
                      $taxprice=$prd["tax"];
                  
                 $ItemList[]=array
                        (
                            //"ProductID"=>'136ARE338430001',                 //必须   商品 ID  
                            "ProductID"=>$prd["sku"],                 //必须   商品 ID  
                            "Quantity"=>$prd["quantity"],                 //必须   购买数量  
                            "SalePrice"=>$prd["price"],                 //必须   单品价格  
                            //"SalePrice"=>900,                 //必须   单品价格  
                            "TaxPrice"=>$taxprice                 //必须   单品关税  
                            //"TaxPrice"=>0                 //必须   单品关税  
                        );
              }
              
      

            $submit_url='method=Order.SOCreate&version=1.0&appid='.appid.'&format=json&timestamp=20150524123300&nonce=321435333&data=';



            //$kjt_order=new kjt_order('渠道编号','商户订单编号','S02','51',$PayInfo,$ShippingInfo,$AuthenticationInfo,$ItemList);
            $kjt_order=new kjt_order(SaleChannelSysNo,$order_id,'S02','51',$PayInfo,$ShippingInfo,$AuthenticationInfo,$ItemList);
            $submit_url.=json_encode($kjt_order);
            


            
            $sign_url=$this->create($submit_url, secretkey);

            
            
            
            $url='http://preapi.kjt.com/open.api?'.$sign_url["url"].'sign='.$sign_url["sign"];
           // $url='http://api.kjt.com/open.api?'.$sign_url["url"].'sign='.$sign_url["sign"];
            

           
            
            
            $html = file_get_contents($url); 
            
             $file = fopen("submitorder_log.txt",'a'); fwrite($file,$html."\n");   fclose($file);
            //{"Code":"0","Desc":"操作成功!","Data":{"MerchantOrderID":"1111111112223","ProductAmount":880.000000,"SOSysNo":10005609,"ShippingAmount":0,"TaxAmount":176.00}}
            $json=json_decode($html, true); 	
            if(isset($json["Code"]) && $json["Code"]=="0")
            {
                $db->query("UPDATE `" . DB_PREFIX . "order` SET kjtorderid='".$json["Data"]["SOSysNo"]."',order_status_id=2 where order_id='".$json["Data"]["MerchantOrderID"]."'");
           
                $db->query("INSERT INTO " . DB_PREFIX . "order_history SET order_id = '" . $json["Data"]["MerchantOrderID"] . "', order_status_id = '2', notify = '0', comment = '', date_added = NOW()");

                
            }else
            {
                $file = fopen("submitorder_error.txt",'a'); fwrite($file,"\n\n\n".date('Y-m-d H:i:s',time())."->提交自动通关失败：".$json["Desc"]."\n");   fclose($file);
                //自动提交订单失败 则需要手动操作
                 //$this->data['noadd']=$json["Desc"];
            }
        }
}
?>
