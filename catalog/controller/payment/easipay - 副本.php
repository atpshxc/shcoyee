<?php
class ControllerPaymentEasipay extends Controller {
	protected function index() {
    	$this->data['button_confirm'] = $this->language->get('button_confirm');
		$this->data['button_back'] = $this->language->get('button_back');

		$this->data['return'] = HTTPS_SERVER . 'index.php?route=checkout/success';

		if ($this->request->get['route'] != 'checkout/guest_step_3') {
			$this->data['cancel_return'] = HTTPS_SERVER . 'index.php?route=checkout/payment';
		} else {
			$this->data['cancel_return'] = HTTPS_SERVER . 'index.php?route=checkout/guest_step_2';
		}

		$this->load->library('encryption');

		$encryption = new Encryption($this->config->get('config_encryption'));

		$this->data['custom'] = $encryption->encrypt($this->session->data['zb_cart_orderid']);

		if ($this->request->get['route'] != 'checkout/guest_step_3') {
			$this->data['back'] = HTTPS_SERVER . 'index.php?route=checkout/payment';
		} else {
			$this->data['back'] = HTTPS_SERVER . 'index.php?route=checkout/guest_step_2';
		}

		$this->load->model('checkout/order');

		$order_id = $this->session->data['zb_cart_orderid'];

		$order_info = $this->model_checkout_order->getOrder($order_id);
                
                $this->model_checkout_order->Gettotals($order_id);
                exit;
                
		$currency_code ='CNY';
		$item_name = $this->config->get('config_title');
		$first_name = $order_info['payment_firstname'];
		$last_name = $order_info['payment_lastname'];
		$cmdno = $this->config->get('easipay_cmdno');      // 接口类型
		$mch_type=$this->config->get('easipay_mch_type');  // 虚拟物品还是实际物品
		
		/* 平台商密钥 */
		$key = $this->config->get('easipay_key');

		/* 平台商帐号 */
		$chnid = $this->config->get('easipay_bargainor_id');

		$total = $order_info['total'];  

		$currency_value = $this->currency->getValue($currency_code);
		$amount = $total * $currency_value;
		$amount = number_format($amount,2,'.','');

		$notify_url     = HTTPS_SERVER . 'index.php?route=checkout/returnorderviewresult';
		$return_url		= HTTPS_SERVER . 'index.php?route=checkout/success';
		
		$data=array(
			'bargainor_id' => $chnid,
			'chnid'        => $chnid,
			'key'           => $key,
			'order_id'       => $order_id,
			'total_fee'       => $amount*100, // 单位为分
			'store'         => $item_name,  
			'callback'		=> $notify_url, 
			'return'		=> $return_url
		);
		
		

		if(isset($this->session->data['checkout_token']))
			$this->data['token'] =$this->session->data['checkout_token'];
			
		$products=$this->model_checkout_order->getproducts($order_id);
		
		
		
		
		$order_detile=$this->model_checkout_order->Gettotals($order_id);
	
		
		$order_date=date('Y-m-d h:i:s',time());
		$order_date=str_replace(' ','T',$order_date);
		
		$product_date=date('Y-m-d h:i:s',strtotime($order_info['date_modified']));
		$product_date=str_replace(' ','T',$product_date);

		
		$xml  = '<?xml version="1.0" encoding="UTF-8"?>';
		$xml .= '<EasipayB2CRequest>';
		$xml .= '	<CnyPayRequest>';
		$xml .= '		<BILLNO>'.$order_info["order_id"].'</BILLNO>';
		$xml .= '		<CALLBACKURL>'.$return_url.'</CALLBACKURL>';
		$xml .= '		<BGURL>'.$notify_url.'</BGURL>';
		$xml .= '		<REQ_TIME>' .$order_date.'</REQ_TIME>';
		$xml .= '		<SRC_NCODE>' .$chnid.'</SRC_NCODE>';
		$xml .= '		<REC_NCODE>' .$chnid.'</REC_NCODE>';
		$xml .= '		<PAY_BIZ>30</PAY_BIZ>';
		$xml .= '		<PAY_AMOUNT>'.$order_detile["total"].'</PAY_AMOUNT>';
		$xml .= '		<PAY_CURRENCY>'.$order_info["currency_code"].'</PAY_CURRENCY>';
		$xml .= '		<TRADE_TYPE>010102</TRADE_TYPE>';
		$xml .= '		<CARGO_SUM>'.count($products).'</CARGO_SUM>';
		$xml .= '		<TXUSE>18</TXUSE>';
		$xml .= '		<TRX_DESC>iphone6s</TRX_DESC>';
		$xml .= '		<BILL_LINK></BILL_LINK>';
		$xml .= '		<SPT1></SPT1>';
		
		
		//商品总详情
		$xml .= '<PayDetail>';
		$xml .= '		<BILL_TYPE>10</BILL_TYPE>';
		$xml .= '		<BILL_DATE>'.$product_date.'</BILL_DATE>';
		$xml .= '		<PAY_AMOUNT>'.$order_detile["sub_total"].'</PAY_AMOUNT>';
		$xml .= '		<PAY_CURRENCY>CNY</PAY_CURRENCY>';
		$xml .= '		<CRT_CURRENCY>HKD</CRT_CURRENCY>';
		$xml .= '		<BORDER_MARK>00</BORDER_MARK>';
		$xml .= '		<CRT_CODE_TYPE>10</CRT_CODE_TYPE>';
		$xml .= '		<CRT_CODE>'.$chnid.'</CRT_CODE>';
		$xml .= '		<SSPT1>huokuan</SSPT1>';
		$xml .= '</PayDetail>';
		
		
		
		/*运费详情*/
		$xml .= '<PayDetail>';
		$xml .= '		<BILL_TYPE>20</BILL_TYPE>';
		$xml .= '		<BILL_DATE>'.$product_date.'</BILL_DATE>';
		$xml .= '		<PAY_AMOUNT>'.$order_detile["shipping"].'</PAY_AMOUNT>';
		$xml .= '		<PAY_CURRENCY>CNY</PAY_CURRENCY>';
		$xml .= '		<CRT_CURRENCY>CNY</CRT_CURRENCY>';
		$xml .= '		<BORDER_MARK>00</BORDER_MARK>';
		$xml .= '		<CRT_CODE_TYPE>10</CRT_CODE_TYPE>';
		$xml .= '		<CRT_CODE>'.$chnid.'</CRT_CODE>';
		$xml .= '		<SSPT1>yunfei</SSPT1>';
		$xml .= '</PayDetail>';
		
		
		/*关税详情*/
		$xml .= '<PayDetail>';
		$xml .= '		<BILL_TYPE>30</BILL_TYPE>';
		$xml .= '		<BILL_DATE>'.$product_date.'</BILL_DATE>';
		$xml .= '		<PAY_AMOUNT>'.$order_detile["tax"].'</PAY_AMOUNT>';
		$xml .= '		<PAY_CURRENCY>CNY</PAY_CURRENCY>';
		$xml .= '		<CRT_CURRENCY>CNY</CRT_CURRENCY>';
		$xml .= '		<BORDER_MARK>00</BORDER_MARK>';
		$xml .= '		<CRT_CODE_TYPE>20</CRT_CODE_TYPE>';
		$xml .= '		<CRT_CODE>2200</CRT_CODE>';
		$xml .= '		<SSPT1>guanshui</SSPT1>';
		$xml .= '</PayDetail>';
		
		
		$xml .= '	</CnyPayRequest>';
		$xml .= '</EasipayB2CRequest>';
	
		
		$prifix=substr($key,0,64);
		$suffix=substr($key,64,128);
		
		$this->data['xml'] =base64_encode($xml);
		$this->data['key'] = md5($prifix.'^'.$chnid.'^'.base64_encode($xml).'^'.$suffix);
		$this->data['chnid'] = $chnid;

		$this->data['action'] = EASIPAY_SERVER.'ord/ordinary/payment.do';
		$this->id = 'payment';

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/easipay.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/payment/easipay.tpl';
		} else {
			$this->template = 'default/template/payment/easipay.tpl';
		}





		$this->render();
	}

	protected function reorder() {
		$this->data['button_confirm'] = $this->language->get('button_reoder_confirm');
		$this->data['button_back'] = $this->language->get('button_back');
	
		$this->data['return'] = HTTPS_SERVER . 'index.php?route=account/paysuccess';
	
		$this->load->library('encryption');
	
		$encryption = new Encryption($this->config->get('config_encryption'));
	
		//$order_id=$this->request->get['order_id'];
		if(isset($this->request->get['order_id']))
                {
                    $order_id= $this->request->get['order_id'];
                }else
                {
                    $order_id= $this->session->data['zb_cart_orderid'];
                }
                
		$this->data['custom'] = $encryption->encrypt($order_id);
	
		$this->load->model('checkout/order');
		$order_info = $this->model_checkout_order->getOrder($order_id);
                $this->data['order_info']=$order_info;
                $order_detile=$this->model_checkout_order->Gettotals($order_id);
         
                
                
		$currency_code ='CNY';
		$item_name = $this->config->get('config_title');
		$first_name = $order_info['payment_firstname'];
		$last_name = $order_info['payment_lastname'];
		$cmdno = $this->config->get('easipay_cmdno');      // 接口类型
		$mch_type=$this->config->get('easipay_mch_type');  // 虚拟物品还是实际物品
	
		/* 平台商密钥 */
		$key = $this->config->get('easipay_key');
	
		/* 平台商帐号 */
		$chnid = $this->config->get('easipay_bargainor_id');
	
	
		$total = $order_info['total'];
	
		$currency_value = $this->currency->getValue($currency_code);
		$amount = $total * $currency_value;
		$amount = number_format($amount,2,'.','');
	
		$charset =2;  //编码类型 1:gbk 2:utf-8
	
		$notify_url     = HTTPS_SERVER . 'catalog/controller/payment/easipay_callback.php';
		$return_url		= HTTPS_SERVER . 'index.php?route=account/paysuccess';
	
		$data=array(
				'bargainor_id' => $chnid,
				'chnid'        => $chnid,
				'key'           => $key,
				'order_id'       => $order_id,
				'total_fee'       => $amount*100, // 单位为分
				'store'         => $item_name,  
				'callback'		=> $notify_url, 
				'return'		=> $return_url
		);
	
		
		$this->data['reorder'] = true;
		$products=$this->model_checkout_order->getproducts($order_id);
		
		$order_date=date('Y-m-d h:i:s',time());
		$order_date=str_replace(' ','T',$order_date);
		
		$product_date=date('Y-m-d h:i:s',strtotime($order_info['date_modified']));
		$product_date=str_replace(' ','T',$product_date);

		/*$order_date=date('Y-m-d h:i:s',time());
		$order_date=str_replace(' ','T',$order_date);*/
		
		
		$xml  = '<?xml version="1.0" encoding="UTF-8"?>';
		$xml .= '<EasipayB2CRequest>';
		$xml .= '	<CnyPayRequest>';
		$xml .= '		<BILLNO>'.$order_info["order_id"].'</BILLNO>';
		$xml .= '		<CALLBACKURL>'.$return_url.'</CALLBACKURL>';
		$xml .= '		<BGURL>'.$notify_url.'</BGURL>';
		$xml .= '		<REQ_TIME>' .$order_date.'</REQ_TIME>';
		$xml .= '		<SRC_NCODE>' .$chnid.'</SRC_NCODE>';
		$xml .= '		<REC_NCODE>' .$chnid.'</REC_NCODE>';
		$xml .= '		<PAY_BIZ>30</PAY_BIZ>';
		$xml .= '		<PAY_AMOUNT>'.$order_detile["total"].'</PAY_AMOUNT>';
		$xml .= '		<PAY_CURRENCY>'.$order_info["currency_code"].'</PAY_CURRENCY>';
		$xml .= '		<TRADE_TYPE>010102</TRADE_TYPE>';
		$xml .= '		<CARGO_SUM>'.count($products).'</CARGO_SUM>';
		$xml .= '		<TXUSE>18</TXUSE>';
		$xml .= '		<TRX_DESC>iphone6s</TRX_DESC>';
		$xml .= '		<BILL_LINK>' . $this->url->link('payment/liqpay/callback', '', 'SSL') . '</BILL_LINK>';
		$xml .= '		<SPT1></SPT1>';
		
		/*商品详情*/
		foreach ($products as $product) {
				$xml .= '<PayDetail>';
				$xml .= '		<BILL_TYPE>10</BILL_TYPE>';
				$xml .= '		<BILL_DATE>'.$product_date.'</BILL_DATE>';
				$xml .= '		<PAY_AMOUNT>'.$product["price"].'</PAY_AMOUNT>';
				$xml .= '		<PAY_CURRENCY>CNY</PAY_CURRENCY>';
				$xml .= '		<CRT_CURRENCY>CNY</CRT_CURRENCY>';
				$xml .= '		<BORDER_MARK>00</BORDER_MARK>';
				$xml .= '		<CRT_CODE_TYPE>10</CRT_CODE_TYPE>';
				$xml .= '		<CRT_CODE>'.$chnid.'</CRT_CODE>';
				$xml .= '		<SSPT1>huokuan</SSPT1>';
				$xml .= '</PayDetail>';
		}
		
		
		/*运费详情*/
		$xml .= '<PayDetail>';
		$xml .= '		<BILL_TYPE>20</BILL_TYPE>';
		$xml .= '		<BILL_DATE>'.$product_date.'</BILL_DATE>';
		$xml .= '		<PAY_AMOUNT>'.$order_detile["shipping"].'</PAY_AMOUNT>';
		$xml .= '		<PAY_CURRENCY>CNY</PAY_CURRENCY>';
		$xml .= '		<CRT_CURRENCY>CNY</CRT_CURRENCY>';
		$xml .= '		<BORDER_MARK>00</BORDER_MARK>';
		$xml .= '		<CRT_CODE_TYPE>10</CRT_CODE_TYPE>';
		$xml .= '		<CRT_CODE>'.$chnid.'</CRT_CODE>';
		$xml .= '		<SSPT1>yunfei</SSPT1>';
		$xml .= '</PayDetail>';
		
		
		/*关税详情*/
		$xml .= '<PayDetail>';
		$xml .= '		<BILL_TYPE>30</BILL_TYPE>';
		$xml .= '		<BILL_DATE>'.$product_date.'</BILL_DATE>';
		$xml .= '		<PAY_AMOUNT>'.$order_detile["tax"].'</PAY_AMOUNT>';
		$xml .= '		<PAY_CURRENCY>CNY</PAY_CURRENCY>';
		$xml .= '		<CRT_CURRENCY>CNY</CRT_CURRENCY>';
		$xml .= '		<BORDER_MARK>00</BORDER_MARK>';
		$xml .= '		<CRT_CODE_TYPE>20</CRT_CODE_TYPE>';
		$xml .= '		<CRT_CODE>2200</CRT_CODE>';
		$xml .= '		<SSPT1>guanshui</SSPT1>';
		$xml .= '</PayDetail>';
		
		
		$xml .= '	</CnyPayRequest>';
		$xml .= '</EasipayB2CRequest>';
		
		
		
		
		$prifix=substr($key,0,64);
		$suffix=substr($key,64,128);
		$this->data['xml'] =base64_encode($xml);
		$this->data['key'] = md5($prifix.$chnid.base64_encode($xml).$suffix);
		$this->data['chnid'] = $chnid;
		$this->data['action'] = EASIPAY_SERVER.'ord/ordinary/payment.do';
		$this->data["trxcode"] =$this->getxmlencode($order_info);
		$this->id = 'payment';
	
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/easipay.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/payment/easipay.tpl';
		} else {
			$this->template = 'default/template/payment/easipay.tpl';
		}
	
		$this->render();
	}
	
	private function getxmlencode($order_info)
	{
		/* 平台商密钥 */
		$key = $this->config->get('easipay_key');
	
		/* 平台商帐号 */
		$chnid = $this->config->get('easipay_bargainor_id');
		
		$products=$this->model_checkout_order->getproducts($order_info["order_id"]);
		
		$order_detile=$this->model_checkout_order->Gettotals($order_info["order_id"]);
		
		$order_date=date('Y-m-d h:i:s',time());
		$order_date=str_replace(' ','T',$order_date);
		
		$product_date=date('Y-m-d h:i:s',strtotime($order_info['date_modified']));
		$product_date=str_replace(' ','T',$product_date);

		/*$order_date=date('Y-m-d h:i:s',time());
		$order_date=str_replace(' ','T',$order_date);*/
		
		
		$xml  = '<?xml version="1.0" encoding="UTF-8"?>';
		$xml .= '<EasipayB2CRequest>';
		$xml .= '	<CnyPayRequest>';
		$xml .= '		<BILLNO>'.$order_info["order_id"].'</BILLNO>';
		$xml .= '		<CALLBACKURL>' . $this->url->link('index.php?route=checkout/success', '', 'SSL') . '</CALLBACKURL>';
		$xml .= '		<BGURL>' . $this->url->link('index.php?route=checkout/returnorderviewresult', '', 'SSL') . '</BGURL>';
		$xml .= '		<REQ_TIME>' .$order_date.'</REQ_TIME>';
		$xml .= '		<SRC_NCODE>' .$chnid.'</SRC_NCODE>';
		$xml .= '		<REC_NCODE>' .$chnid.'</REC_NCODE>';
		$xml .= '		<PAY_BIZ>30</PAY_BIZ>';
		$xml .= '		<PAY_AMOUNT>'.$order_detile["total"].'</PAY_AMOUNT>';
		$xml .= '		<PAY_CURRENCY>'.$order_info["currency_code"].'</PAY_CURRENCY>';
		$xml .= '		<TRADE_TYPE>010102</TRADE_TYPE>';
		$xml .= '		<CARGO_SUM>'.count($products).'</CARGO_SUM>';
		$xml .= '		<TXUSE>18</TXUSE>';
		$xml .= '		<TRX_DESC>iphone6s</TRX_DESC>';
		$xml .= '		<BILL_LINK>' . $this->url->link('payment/liqpay/callback', '', 'SSL') . '</BILL_LINK>';
		$xml .= '		<SPT1></SPT1>';
		
		/*商品详情*/
		foreach ($products as $product) {
				$xml .= '<PayDetail>';
				$xml .= '		<BILL_TYPE>10</BILL_TYPE>';
				$xml .= '		<BILL_DATE>'.$product_date.'</BILL_DATE>';
				$xml .= '		<PAY_AMOUNT>'.$product["price"].'</PAY_AMOUNT>';
				$xml .= '		<PAY_CURRENCY>CNY</PAY_CURRENCY>';
				$xml .= '		<CRT_CURRENCY>CNY</CRT_CURRENCY>';
				$xml .= '		<BORDER_MARK>00</BORDER_MARK>';
				$xml .= '		<CRT_CODE_TYPE>10</CRT_CODE_TYPE>';
				$xml .= '		<CRT_CODE>'.$chnid.'</CRT_CODE>';
				$xml .= '		<SSPT1>huokuan</SSPT1>';
				$xml .= '</PayDetail>';
		}
		
		
		/*运费详情*/
		$xml .= '<PayDetail>';
		$xml .= '		<BILL_TYPE>20</BILL_TYPE>';
		$xml .= '		<BILL_DATE>'.$product_date.'</BILL_DATE>';
		$xml .= '		<PAY_AMOUNT>'.$order_detile["shipping"].'</PAY_AMOUNT>';
		$xml .= '		<PAY_CURRENCY>CNY</PAY_CURRENCY>';
		$xml .= '		<CRT_CURRENCY>CNY</CRT_CURRENCY>';
		$xml .= '		<BORDER_MARK>00</BORDER_MARK>';
		$xml .= '		<CRT_CODE_TYPE>10</CRT_CODE_TYPE>';
		$xml .= '		<CRT_CODE>'.$chnid.'</CRT_CODE>';
		$xml .= '		<SSPT1>yunfei</SSPT1>';
		$xml .= '</PayDetail>';
		
		
		/*关税详情*/
		$xml .= '<PayDetail>';
		$xml .= '		<BILL_TYPE>30</BILL_TYPE>';
		$xml .= '		<BILL_DATE>'.$product_date.'</BILL_DATE>';
		$xml .= '		<PAY_AMOUNT>'.$order_detile["tax"].'</PAY_AMOUNT>';
		$xml .= '		<PAY_CURRENCY>CNY</PAY_CURRENCY>';
		$xml .= '		<CRT_CURRENCY>CNY</CRT_CURRENCY>';
		$xml .= '		<BORDER_MARK>00</BORDER_MARK>';
		$xml .= '		<CRT_CODE_TYPE>20</CRT_CODE_TYPE>';
		$xml .= '		<CRT_CODE>2200</CRT_CODE>';
		$xml .= '		<SSPT1>guanshui</SSPT1>';
		$xml .= '</PayDetail>';
		
		
		$xml .= '	</CnyPayRequest>';
		$xml .= '</EasipayB2CRequest>';
		
		$prifix=substr($key,0,64);
		$suffix=substr($key,64,128);
		$this->data['xml'] =base64_encode($xml);
		$this->data['key'] = md5($prifix.$chnid.base64_encode($xml).$suffix);
	}
	
	public function callback() {
		// Order status for Opencart
		$order_status = array(
			"Canceled"        => 7,
			"Canceled_Reversal"   => 9,
			"Chargeback"     	=> 13,
			"Complete"     		=> 5,
			"Denied" 			=> 8,
			"Failed"        	=> 10 ,
			"Pending"           => 1,
			"Processing"  		 => 2,
			"Refunded"        	  => 11,
			"Reversed"  		 => 12,
			"Shipped"     	  => 3
		);
		$this->log->debug("easipay :: exciting callback function.");
		$cmdno = $this->config->get('easipay_cmdno');  
		if($cmdno==1){
			$this->log->debug("easipay :: exciting callback function pay.");
			$this->func_pay($order_status);
		}
	}
}

?>