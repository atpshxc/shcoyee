<?php
class ControllerPaymentChinabank extends Controller 
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
		$key = $this->config->get('chinabank_key');
	
		/* 平台商帐号 */
		$chnid = $this->config->get('chinabank_bargainor_id');
	
		$products=$this->model_checkout_order->getproducts($order_id);
		
		$order_date=date('Y-m-d h:i:s',time());
		//$order_date=str_replace(' ','T',$order_date);
		
		$product_date=date('Y-m-d h:i:s',strtotime($order_info['date_modified']));
		$product_date=str_replace(' ','T',$product_date);

                $notify_url     = HTTPS_SERVER . 'index.php?route=checkout/returnorderviewresult';
		$return_url		= HTTPS_SERVER . 'index.php?route=checkout/success';
                
                
                $this->data['version']="1.1";           //
                $this->data['token']="";                //  no
                $this->data['merchantSign']="";         //  签名
                $this->data['merchantNum']=$chnid;          //平台商帐号
                $this->data['merchantRemark']="test";       //商户备注 no
                $this->data['tradeNum']=$order_id;             //交易流水号
                $this->data['tradeName']=$order_info["store_name"];            //交易名称
                $this->data['tradeTime']=$order_date;            //时间201405051300
                $this->data['tradeAmount']=  floatval($order_totals["total"])*100;          //
                $this->data['currency']="CNY";             //
                $this->data['notifyUrl']=$notify_url;            //
                $this->data['successCallbackUrl']=$return_url;   //
                $this->data['forPayLayerUrl']="http://www.shcoyee.com/forPayLayer.html";       //
                $this->data['ip']=$order_info["ip"];                   //
		$this->template = 'default/template/payment/chinabank.tpl';
	
		$this->render();
	}
	
}

?>