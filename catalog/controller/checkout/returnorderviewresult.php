<?php 
header("content-type:text/html; charset=utf-8");
include("catalog/controller/zhangbo/kjt_order.php");
include("catalog/controller/zhangbo/sign.php");

class ControllerCheckoutReturnorderviewresult extends Controller 
{
	//订单支付状态
	 var 	$RTN_INFO;//支付详细说明
	 var  	$BILL_NO;//订单编号
	 var 	$RTN_CODE;//支付状态编码
	 var  	$TRX_SERNO;//支付流水号
	 var  	$RDO_TIME;//支付时间
	
	public function index() 
	{
            
            $json='{"CommitTime":"20150612020241","MerchantOrderID":"201506090442468","Message":null,"ShipTypeID":"2","Status":"1","TrackingNumber":"111111111111111111111111111"}';


$submit_url="method=Order.SOOutputCustoms&data=".$json."&format=json&version=1.0&nonce=0.77025906855494&appid=".appid."&timestamp=20150612100735";        
      $aasdf=new sign();          
$tst=$aasdf->create($submit_url,  secretkey);


//echo $tst["url"]."&sign=".$tst["sign"];

	$ch = curl_init ('http://www.shcoyee.com/index.php?route=checkout/SOOutputCustoms');
curl_setopt ( $ch, CURLOPT_CUSTOMREQUEST, "POST" );
curl_setopt ( $ch, CURLOPT_RETURNTRANSFER, true );
curl_setopt ( $ch, CURLOPT_POSTFIELDS, $tst["url"]."sign=".$tst["sign"] );
curl_setopt ( $ch, CURLOPT_SSL_VERIFYPEER, false );
curl_setopt ( $ch, CURLOPT_SSL_VERIFYHOST, false );
curl_setopt ( $ch, CURLOPT_HTTPHEADER, array (
		'Content-Type:application/x-www-form-urlencoded',
		'Content-Length: ' . strlen ( $tst["url"]."sign=".$tst["sign"] ),
		'Connection: Keep-Alive'
) );
$result = curl_exec ( $ch );
$errorNo = curl_errno ( $ch );
curl_close ( $ch );


		echo $result;
		echo '<br/>提交成功';
            exit;
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
		$this->load->model('checkout/order');
		
		//东方支付支付成功状态
		$esaipay_status= $this->config->get('easipay_order_status_id');
		
		/* 平台商密钥 */
		$key = $this->config->get('easipay_key');

		/* 平台商帐号 */
		$chnid = $this->config->get('easipay_bargainor_id');

		
		$prifix=substr($key,0,64);
		$suffix=substr($key,64,128);
	

		
		$t_content='';
		$t_key='';
		
		if (isset($this->request->post['SIGNATURE']))
		{
			$t_key= $this->request->post['SIGNATURE'];
			if (isset($this->request->post['TRX_CONTENT']))
			{
				$t_content=$this->request->post['TRX_CONTENT'];
				
				
				
				
				$qmkey = md5($prifix.'^'.$t_content.'^'.$suffix);
			
				
				if($qmkey==$t_key)//验证key
				{
					$xml = new SimpleXMLElement(base64_decode($t_content));
					foreach($xml->ResData as $item)
					{
					  $this->RTN_INFO=$item->RTN_INFO;
					  $this->BILL_NO=$item->BILL_NO;
					  $this->RTN_CODE=$item->RTN_CODE;
					  $this->TRX_SERNO=$item->TRX_SERNO;
					  $this->RDO_TIME=$item->RDO_TIME;
					}
		
					if(strpos($this->RTN_INFO,'成功')>0 || $this->RTN_CODE=='000000')
					{
						echo 'SUCCESS';
						
/*					  echo 'RTN_INFO:'.$this->RTN_INFO.'<br/>';
					  echo 'BILL_NO:'.$this->BILL_NO.'<br/>';
					  echo 'RTN_CODE:'.$this->RTN_CODE.'<br/>';
					  echo 'TRX_SERNO:'.$this->TRX_SERNO.'<br/>';
					  echo 'RDO_TIME:'.$this->RDO_TIME.'<br/>';*/
						//更改订单状态为已付款
						$this->model_checkout_order->updateOrderStatus($this->BILL_NO,$esaipay_status);
						
						$this->creareorder($this->BILL_NO,$this->TRX_SERNO);
						
						
					}else
					{
						echo 'FAILURE';
					}
				}else
				{
					echo 'FAILURE';
				}
			}else
			{
				echo 'FAILURE';
			}
		}else
		{
			echo 'FAILURE';
		}
		
		
	}
        
        //渠道商提交订单
	public function creareorder($order_id,$paynumbr)
        {
            $this->load->model('checkout/order');
            
            $order_info = $this->model_checkout_order->getOrder($order_id);
            $order_totals=$this->model_checkout_order->Gettotals($order_id);
            $products=$this->model_checkout_order->getproducts($order_id);
           //zhangbo
                        $cardifo_query=  $this->db->query("SELECT * FROM " . DB_PREFIX . "card where customer_id='".$$order_info['customer_id']."'");
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
            
            $PayInfo= array  //订单支付信息
                   (
                        "ProductAmount"=>$order_totals["total"],            //必须   商品总金额，保留 2位小数（如 120.50 或 100.00，无费用时为 0）
                        "ShippingAmount"=>$order_totals["shipping"],           //必须   运费总金额，保留 2位小数
                        "TaxAmount"=>$order_totals["tax"],                 //必须   商品行邮税总金额
                        "CommissionAmount"=>"0",         //必须   下单支付产生的手续费
                        "PayTypeSysNo"=>"114",              //必须   支付方式编号 111: 东方支付 114:  财付通 117: 银联支付
                        "PaySerialNumber"=>$paynumbr           //必须   支付流水号
                   );
              $ShippingInfo=array //订单配送信息
                  (
                        "ReceiveName"=>$order_info["shipping_firstname"],              //必须   收件人姓名
                        "ReceivePhone"=>$order_info["shipping_mobile"],             //必须   收件人电话
                        "ReceiveAddress"=>$order_info["shipping_address_1"],           //必须   收件人收货地址不包含省市区名称
                        "ReceiveAreaCode"=>$order_info["100010"],          //必须   收货地区编号，至少需要到市级别
                        "ReceiveZip"=>$order_info["shipping_firstname"],               //收件地邮政编码
                        "SenderName"=>"",               //发件人姓名
                        "SenderTel "=>"",               //发件人电话
                        "SenderCompanyName "=>"",       //发件人公司
                        "SenderAddr "=>"",              //发件人地址
                        "SenderZip"=>"",                //发件地邮编
                        "SenderCity "=>"",              //发件地城市SenderProvince
                        "SenderProvince "=>"",          //发件地省
                        "SenderCountry  "=>"",          //发件地国家
                        "ReceiveAreaName "=>""          //收件省市区名称
              );

              $AuthenticationInfo=array//下单用户实名认证信息 
                  (
                        "Name"=>$cardinfo["card_name"],                 //必须   下单用户真实姓名  
                        "IDCardType "=>"0",          //必须   （0 – 身份证）
                        "IDCardNumber"=>$cardinfo["card_code"],         //必须   用户户证件编号
                        "PhoneNumber "=>$cardinfo["card_phone"],         //必须   用户联系电话
                        "Email "=>$cardinfo["card_email"],               //必须   用户电子邮件
                        "Address "=>""            //用户联系地址 
                  );
                $ItemList=array();//订单中购买商品列表
              foreach($products as $prd)
              {
                 $ItemList[]=array
                        (
                            "ProductID "=>$prd["sku"],                 //必须   商品 ID  
                            "Quantity"=>$prd["quantity"],                 //必须   购买数量  
                            "SalePrice"=>$prd["price"],                 //必须   单品价格  
                            "TaxPrice"=>$prd["tax"]                 //必须   单品关税  
                        );
              }
              
      

            $submit_url='method=Order.SOCreate&version=1.0&appid='.appid.'&format=json&timestamp=20150524123300&nonce=321435333&data=';



            //$kjt_order=new kjt_order('渠道编号','商户订单编号','S02','51',$PayInfo,$ShippingInfo,$AuthenticationInfo,$ItemList);
            $kjt_order=new kjt_order(SaleChannelSysNo,'111111111','S02','51',$PayInfo,$ShippingInfo,$AuthenticationInfo,$ItemList);
            $submit_url.=json_encode($kjt_order);


            $sign=new sign();
            $sign_url=$sign->create($submit_url, secretkey);

            $url='http://preapi.kjt.com/open.api?'.$sign_url["url"].'sign='.$sign_url["sign"];
            $html = file_get_contents($url); 
            $json=json_decode($html, true); 	
            if($json["code"]=="0")
            {
                $this->model_checkout_order->updateOrderStatus($order_id,'2');
            }
        }
        
	//发送订单通关申请
	public function tax_send($order_id)
	{		 
		$this->load->model('checkout/order');
		$this->load->model('account/order');
		$this->load->model('catalog/product');

		$order_info = $this->model_checkout_order->getOrder($order_id);
		$order_products = $this->model_account_order->getOrderProducts($order_id);
		$order_total=$this->get_order_total($order_id);

		$json='{';
		$json.='"version":"v1.2",';
		$json.='"commitTime":"'.date('Ymdhis',time()).'",';
		$json.='"coName":"上海可益生物技术有限公司",';
		$json.='"coCode":"SHKY001",';
		$json.='"serialNumber":"SHKY'.date('Ymdhis',time()).'",';
		
		$json.='"merchantOrderId":"'.$order_id.'",';
		$json.='"assBillNo":"",';
		$json.='"orderCommitTime":"'.date('Ymdhis',strtotime($order_info['date_modified'])).'",';
		$json.='"senderName":"沈向群",';
		$json.='"senderTel":"0085-21113020",';
		$json.='"senderCompanyName":"香港可益应用科技有限公司",';
		$json.='"senderAddr":"香港中环德辅道中141号，中保集团大厦705室",';
		$json.='"senderZip":"999077",';
		$json.='"senderCity":"香港",';
		$json.='"senderProvince":"香港特别行政区",';
		$json.='"senderCountry":"HKG",';
		$json.='"cargoDescript":"食品/药品相关",';
		$json.='"allCargoTotalPrice":'.number_format($order_total['sub_total'],2,'.','').',';
		
		if($order_total['tax']<=50)
			$json.='"allCargoTotalTax":0,';
		else
			$json.='"allCargoTotalTax":'.number_format($order_total['tax'],2,'.','').',';
			
		$json.='"expressPrice":'.number_format($order_total['shipping'],2,'.','').',';
		$json.='"otherPrice":0,';
		$json.='"recPerson":"张三",';
		$json.='"recPhone":"010-8763837",';
		$json.='"recCountry":"中国",';
		$json.='"recProvince":"上海",';
		$json.='"recCity":"上海",';
		$json.='"recAddress":"浦东张江88号",';
		$json.='"recZip":"430000",';
		$json.='"serverType":"S02",';
		$json.='"custCode":"2216",';
		$json.='"operationCode":"1",';
		$json.='"spt":"",';
		$json.='"cargoes":[';
		if(isset($order_products) || count($order_products)>0)
		{
			foreach($order_products as $product)
			{
				
				$tax_total=0;
				if($order_total['tax']>50)
					$tax_total=$product['tax'];
					
					
				$json.='{';
				$json.='"cargoName":"'.$product['name'].'",';
				$json.='"cargoCode":"'.$product['sku'].'",';
				$json.='"cargoNum":'.$product['quantity'].',';
				$json.='"cargoUnitPrice":'.number_format($product['price'],2,'.','').',';
				$json.='"cargoTotalPrice":'.number_format($product['total'],2,'.','').',';
				$json.='"cargoTotalTax":'.number_format($tax_total,2,'.','');
				$json.='},';
			}
			$json=substr($json,0,(strlen($json)-1));
		}
		
		$json.='],';
		$json.='"payMethod":"EASIPAY",';
		$json.='"payMerchantName":"香港可益应用科技有限公司",';
		$json.='"payMerchantCode":"SHKY001",';
		$json.='"payAmount":'.number_format($order_info['total'],2,'.','').',';
		$json.='"payCUR":"CNY",';
		$json.='"payID":"'.$this->TRX_SERNO.'",';
		$json.='"payTime":"'.$this->RDO_TIME.'"';
		$json.='}';
		
	
		$sigkey=strtoupper(md5($json.TAX_key));	
		$data='EData='.urlencode($json).'&SignMsg='.$sigkey;

		$ch = curl_init (TAX_SERVER.'cboi/order/orderlist.htm');
		curl_setopt ( $ch, CURLOPT_CUSTOMREQUEST, "POST" );
		curl_setopt ( $ch, CURLOPT_RETURNTRANSFER, true );
		curl_setopt ( $ch, CURLOPT_POSTFIELDS, $data );
		curl_setopt ( $ch, CURLOPT_SSL_VERIFYPEER, false );
		curl_setopt ( $ch, CURLOPT_SSL_VERIFYHOST, false );
		curl_setopt ( $ch, CURLOPT_HTTPHEADER, array(
														'Content-Type:application/x-www-form-urlencoded',
														'Content-Length: ' . strlen ( $data ),
														'Connection: Keep-Alive'
													)
					);
					
		$result = curl_exec ( $ch );
		$errorNo = curl_errno ( $ch );
		curl_close ( $ch );
		
		$jsond=json_decode(urldecode($result), true); 
		
		/*			$file = fopen("log.txt",'a');
				fwrite($file,"\r\n\r\n\r\n\r\n tax：");
  				fwrite($file,"send_json:".$json."\r\n\r\n");
  				fwrite($file,"result_json:".urldecode($result)."\r\n\r\n");
  				fwrite($file,"statis:".$jsond['status']."\r\n\r\n");
  				fclose($file);*/
		
		if($jsond['status']=='SUCCESS')
		{
			//更改订单状态为正在处理
			$this->model_checkout_order->updateOrderStatus($order_id,2);
		}
		else
		{
			//更改订单状态为退款
			$this->model_checkout_order->updateOrderStatus($order_id,11);
			//退款申请
			$this->refund($order_id);
		}		
	}
	
	//退款
	private function refund($order_id)
	{
		
		$order_total=$this->get_order_total($order_id);
		
			/* 平台商密钥 */
		$key = $this->config->get('easipay_key');

		/* 平台商帐号 */
		$chnid = $this->config->get('easipay_bargainor_id');
		
		
		$xml  = '<?xml version="1.0" encoding="UTF-8"?>';
		$xml .= '<EasipayB2CRequest>';
		$xml .= '	<ReqData>';
		$xml .= '		<SRC_NCODE>'.$chnid.'</SRC_NCODE>';					//一级商户代码
		$xml .= '		<BILL_NO>'.$order_id.'</BILL_NO>';						//原交易订单号
		$xml .= '		<REFUND_AMOUNT>'.$order_total['total'].'</REFUND_AMOUNT>';			//退款总金额
		$xml .= '		<CARGO_AMOUNT>'.$order_total['sub_total'].'</CARGO_AMOUNT>';				//退货款金额
		
		$xml .= '		<TRANSPORT_AMOUNT>'.$order_total['shipping'].'</TRANSPORT_AMOUNT>';		//退运费金额
		$xml .= '		<TAX_AMOUNT>'.$order_total['tax'].'</TAX_AMOUNT>';					//退税金额
		$xml .= '		<RDO_TIME></RDO_TIME>';						//原交易记账时间
		$xml .= '		<BGURL>'.HTTP_SERVER.'index.php?route=checkout/returnrefundback</BGURL>';							//后台通知商户地址
		$xml .= '	</ReqData>';			
		$xml .= '</EasipayB2CRequest>';
		
		
		
		$prifix=substr($key,0,64);
		$suffix=substr($key,64,128);
		
		
		$b6xml=base64_encode($xml);
		$qmkey = md5($prifix.'^'.$chnid.'^'.base64_encode($xml).'^'.$suffix);
		
		$data='SENDER_CODE='.$chnid.'&TRX_CONTENT='.$b6xml.'&SIGNATURE='.$qmkey;
		
		
		
		
		$ch = curl_init (EASIPAY_SERVER.'ord/ordinary/refund.do');
		curl_setopt ( $ch, CURLOPT_CUSTOMREQUEST, "POST" );
		curl_setopt ( $ch, CURLOPT_RETURNTRANSFER, true );
		curl_setopt ( $ch, CURLOPT_POSTFIELDS, $data );
		curl_setopt ( $ch, CURLOPT_SSL_VERIFYPEER, false );
		curl_setopt ( $ch, CURLOPT_SSL_VERIFYHOST, false );
		curl_setopt ( $ch, CURLOPT_HTTPHEADER, array (
				'Content-Type:application/x-www-form-urlencoded',
				'Content-Length: ' . strlen ( $data ),
				'Connection: Keep-Alive'
		) );
		$result = curl_exec ( $ch );
		$errorNo = curl_errno ( $ch );
		curl_close ( $ch );
		
		
		
	}
	
		
	public function get_order_total($order_id)
	{
		$order_total_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_total WHERE order_id = '" . $order_id . "' ORDER BY sort_order ASC");

		$yf=0;$hk=0;$gs=0;$zje=0;
			foreach($order_total_query->rows as $ot)
			{
				if($ot['code']=='shipping')
					$yf=$ot['value'];
					
				if($ot['code']=='sub_total')
					$hk=$ot['value'];
					
				if($ot['code']=='tax')
				{
					if($ot['value']<=50)
						$gs=0;
					else
						$gs=$ot['value'];
					
				}
					
				if($ot['code']=='total')
					$zje=$ot['value'];
			}
			
			$zfje=array
			(
				'shipping'       => $yf,
				'sub_total'       => $hk,
				'tax'       => $gs,
				'total'       => $zje
			);
			
		return $zfje;
	}
}
?>