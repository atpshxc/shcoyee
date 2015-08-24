<?php

//echo "UPDATE `s_order` SET kjtorderid='12312' where order_id='1233'";
//exit;
header("content-type:text/html; charset=utf-8");
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of zb_submitorder
 *
 * @author zhangbo
 */
include("kjt_order.php");
include("sign.php");

$PayInfo= array  //订单支付信息
       (
            "ProductAmount"=>"950.00",            //必须   商品总金额，保留 2位小数（如 120.50 或 100.00，无费用时为 0）
            "ShippingAmount"=>"10.00",           //必须   运费总金额，保留 2位小数
            "TaxAmount"=>"0",                 //必须   商品行邮税总金额
            "CommissionAmount"=>"0",         //必须   下单支付产生的手续费
            "PayTypeSysNo"=>"112",              //必须   支付方式编号 111: 东方支付 112: 支付宝 114:  财付通 117: 银联支付 118微信支付
            "PaySerialNumber"=>"T2014111716262000000003221"           //必须   支付流水号
       );
  $ShippingInfo=array //订单配送信息
      (
            "ReceiveName"=>"张三",              //必须   收件人姓名
            "ReceivePhone"=>"13874916678",             //必须   收件人电话
            "ReceiveAddress"=>"万达广场c3懂",           //必须   收件人收货地址不包含省市区名称
            "ReceiveAreaCode"=>"430105",          //必须   收货地区编号，至少需要到市级别
//            "ReceiveZip"=>"410146",               //收件地邮政编码
//            "SenderName"=>" ",               //发件人姓名
//            "SenderTel"=>"22",               //发件人电话
//            "SenderCompanyName"=>"22",       //发件人公司
//            "SenderAddr"=>"22",              //发件人地址
//            "SenderZip"=>"410146",                //发件地邮编
//            "SenderCity"=>"22",              //发件地城市SenderProvince
//            "SenderProvince"=>"22",          //发件地省
//            "SenderCountry "=>"22",          //发件地国家
            "ReceiveAreaName"=>"湖南省,长沙市, "         //必须   收件省市区名称
  );
  
  $AuthenticationInfo=array//下单用户实名认证信息 
      (
            "Name"=>"zhangsan",                     //必须   下单用户真实姓名  
            "IDCardType"=>"0",                     //必须   （0 – 身份证）
            "IDCardNumber"=>"430121198703066713",  //必须   用户户证件编号
            "PhoneNumber"=>"13874915560",          //必须   用户联系电话
            "Email"=>"zhangsan@kjt.com",           //必须   用户电子邮件
            "Address"=>""                          //用户联系地址 
      );
  
  $ItemList=array //订单中购买商品列表
      (
            array
            (
                "ProductID"=>"136ARE338430001",                 //必须   商品 ID  
                "Quantity"=>"1",                                 //必须   购买数量  
                "SalePrice"=>"950",                              //必须   单品价格  
                "TaxPrice"=>"0"                                  //必须   单品关税  
            )
      );

$submit_url='method=Order.SOCreate&version=1.0&appid=seller135&format=json&timestamp=20150524123300&nonce=321435333&data=';
  
//$kjt_order=new kjt_order('渠道编号','商户订单编号','S02','51',$PayInfo,$ShippingInfo,$AuthenticationInfo,$ItemList);
   $kjt_order=new kjt_order('38','2015061904137383','S02','51',$PayInfo,$ShippingInfo,$AuthenticationInfo,$ItemList);
   $submit_url.=json_encode($kjt_order);
//echo $submit_url;

$sign=new sign();
$sign_url=$sign->create($submit_url, "kjt@135");//生成签名
echo '<a href="http://preapi.kjt.com/open.api?'.$sign_url["url"].'sign='.$sign_url["sign"].'" >提交订单</a>';


//$html = file_get_contents($url); 
//            
//             //$file = fopen("submitorder_log.txt",'a'); fwrite($file,$html."\n");   fclose($file);
//            //{"Code":"0","Desc":"操作成功!","Data":{"MerchantOrderID":"11111111122232","ProductAmount":880.000000,"SOSysNo":10005609,"ShippingAmount":0,"TaxAmount":176.00}}
//            $json=json_decode($html, true); 	
//            if(isset($json["Code"]) && $json["Code"]=="0")
//            {
//                echo $json["Data"]["SOSysNo"];
//                exit;
//                //$this->db->query("UPDATE `" . DB_PREFIX . "order` SET kjtorderid='".$json["Data"]["SOSysNo"]"'");
//               // $this->model_checkout_order->updateOrderStatus($order_id,'2');
//            }else
//            {
//                 $this->data['noadd']=$json["Desc"];
//            }


?>
