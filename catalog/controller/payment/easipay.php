<?php
class ControllerPaymentEasipay extends Controller 
{
        protected function reorder()
        {
		if(isset($this->request->get['order_id']))
                {
                    $order_id= $this->request->get['order_id'];
                }else
                {
                    $order_id= $this->session->data['zb_cart_orderid'];
                }
               	
		$this->load->model('checkout/order');
		$order_info = $this->model_checkout_order->getOrder($order_id);
                $this->data['order_info']=$order_info;
                
                $order_totals=$this->model_checkout_order->Gettotals($order_id);
         
		/* 平台商密钥 */
		$key = $this->config->get('easipay_key');
	
		/* 平台商帐号 */
		$chnid = $this->config->get('easipay_bargainor_id');
	
		$products=$this->model_checkout_order->getproducts($order_id);
		
		$order_date=date('Y-m-d h:i:s',time());
		$order_date=str_replace(' ','T',$order_date);
		
		$product_date=date('Y-m-d h:i:s',strtotime($order_info['date_modified']));
		$product_date=str_replace(' ','T',$product_date);

                $notify_url     = HTTPS_SERVER . 'index.php?route=checkout/returnorderviewresult';
		$return_url		= HTTPS_SERVER . 'index.php?route=checkout/success';
                
                
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
		$xml .= '		<PAY_AMOUNT>'.$order_totals["total"].'</PAY_AMOUNT>';
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
		$xml .= '		<PAY_AMOUNT>'.$order_totals["shipping"].'</PAY_AMOUNT>';
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
		$xml .= '		<PAY_AMOUNT>'.$order_totals["tax"].'</PAY_AMOUNT>';
		$xml .= '		<PAY_CURRENCY>CNY</PAY_CURRENCY>';
		$xml .= '		<CRT_CURRENCY>CNY</CRT_CURRENCY>';
		$xml .= '		<BORDER_MARK>00</BORDER_MARK>';
		$xml .= '		<CRT_CODE_TYPE>20</CRT_CODE_TYPE>';
		$xml .= '		<CRT_CODE>2200</CRT_CODE>';
		$xml .= '		<SSPT1>guanshui</SSPT1>';
		$xml .= '</PayDetail>';
		
		
		$xml .= '	</CnyPayRequest>';
		$xml .= '</EasipayB2CRequest>';
		
                $this->data['xml1'] = $xml;
		
		$prifix=substr($key,0,64);
		$suffix=substr($key,64,128);
		$this->data['xml'] =base64_encode($xml);
		$this->data['key'] = md5($prifix.$chnid.base64_encode($xml).$suffix);
		$this->data['chnid'] = $chnid;
		$this->data['action'] = EASIPAY_SERVER.'ord/ordinary/payment.do';
	
                if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/easipay.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/payment/easipay.tpl';
		} else {
			$this->template = 'default/template/payment/easipay.tpl';
		}
	
		$this->render();
	}
	
}

?>