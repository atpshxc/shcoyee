<?php
header("content-type:text/html; charset=utf-8");
class ControllerCheckoutSOOutputCustoms extends Controller 
{
	//订单支付状态
	 var 	$MerchantOrderID;   //商家订单编号
	 var  	$Status ;           //-1 表示出关失败  1  表示出关成功
	 var 	$ShipTypeID;        //订单物流运输公司编号
	 var  	$TrackingNumber;    //订单物流编号
	 var  	$CommitTime;        //出库时间 20071117020101 
         var    $Message;           //说明订单出关失败的原因
	public function index() 
        {
           try
           {
            $urlparm=  urldecode(file_get_contents("php://input"));
            
           
            $this->load->model('checkout/order');
            $this->load->model('checkout/product'); 
            $method=$_POST['method'];
            if($method)
            {
                //库存变化通知
                if( strtolower('Inventory.ChannelQ4SAdjustRequest')==strtolower($method))
                {
                   // $file = fopen("logttttt.txt",'a'); fwrite($file,$urlparm."\n");   fclose($file);
                    $sk=$this->singvi($urlparm, secretkey);
                   
                    if($sk["istrue"])//验证签名
                    {
                        $json=json_decode($sk["data"],true);
                            foreach($json["Items"] as $ipdut)
                            {
                                $this->model_checkout_product->update($ipdut["ProductID"],$ipdut["Qty"]);
                            }
                         echo "SUCCESS";
                    }else
                    {
                        echo "FAILURE";
                    }
                }
                else if(strtolower('Order.SOOutputCustoms')==strtolower($method))//发货通知
                {
                    $file = fopen("logttttt.txt",'a'); fwrite($file,$urlparm."\n");   fclose($file);
                    $sk=$this->singvi($urlparm, secretkey);
                    if($sk["istrue"])//验证签名
                    {
                        $json= json_decode($sk["data"],true);
                        if($json["Status"]=='1')
                        {
                            //更新订单状态为已付款
                            $this->model_checkout_order->update($json['MerchantOrderID'],'3','',TRUE);
                           
                            if($json['ShipTypeID']=='1')
                                $this->db->query("UPDATE `" . DB_PREFIX . "order` SET express_no = '" . $json["TrackingNumber"] . "', express = '顺丰速递', express_website = 'http://www.sf-express.com/cn/sc/', date_modified = NOW() WHERE order_id = '" . $json["MerchantOrderID"]  . "'");
                            else 	
                                $this->db->query("UPDATE `" . DB_PREFIX . "order` SET express_no = '" . $json["TrackingNumber"] . "', express = '圆通快递', express_website = 'http://www.yto.net.cn/', date_modified = NOW() WHERE order_id = '" . $json["MerchantOrderID"]  . "'");

                            $this->db->query("INSERT INTO " . DB_PREFIX . "order_history SET order_id = '" .  $json["MerchantOrderID"] . "', order_status_id = '3', notify = '0', comment = '', date_added = NOW()");
                            
                             
                            echo "SUCCESS";
                        }else
                       {
                            $this->model_checkout_order->update($json['MerchantOrderID'],'10',$json["Message"],TRUE);
                            echo 'SUCCESS';
                        }
                    }else
                    {
                        echo "FAILURE";
                    }
                }else
                {
                    echo "FAILURE";
                }
                    
            }  
            else 
            {
                echo "FAILURE";
            }
                 
           
           }  catch (Exception $s)
           {
              echo "FAILURE"; 
           }
            
        }
    public function singvi($submit_url,$appSecret) 
    {
        $keysign='';
        $tempurl="";
        $prams=explode("&",$submit_url);//使用&切割字符串为数组
        sort($prams);//参数排序
        
        $data="";
        foreach ($prams as $ttt)
        {
            $pvs=  explode("=", $ttt);
            if($pvs[0]!="sign")
            { 
                $tempurl.=$pvs[0]."=".urlencode($pvs[1]).'&';//重组url 并且urlencode参数值
                if($pvs[0]=="data")
                {
                    $data=$pvs[1];
                }
            }else
            {
                $keysign=$pvs[1];
            }
        }
        if(md5($tempurl.$appSecret)==$keysign)
        {
            return array("istrue"=>TRUE,"data"=>$data);
        }else
        {
           return array("istrue"=>FALSE,"data"=>$data);
        }
    }
}
?>