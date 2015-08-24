<?php 
header("content-type:text/html; charset=utf-8");
class ControllerCheckoutReturnrefundback extends Controller 
{
	//订单支付状态
	 var 	$RTN_INFO;//支付详细说明
	 var  	$BILL_NO;//订单编号
	 var 	$RTN_CODE;//支付状态编码
	 var  	$REFTRX_SERNO;//支付流水号
	 var  	$RDO_TIME;//支付时间
	public function index() 
	{
		
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
					  $this->REFTRX_SERNO=$item->REFTRX_SERNO;
					  $this->RDO_TIME=$item->RDO_TIME;
					}
		
					if(strpos($this->RTN_INFO,'成功')>0 || $this->RTN_CODE=='000000')
					{
						echo 'SUCCESS';

						//更改订单状态为订单取消
						$this->model_checkout_order->updateOrderStatus($this->BILL_NO,7);
						
						
					}else
					{
						echo 'FAILURE';
						//更改订单状态为失败
						$this->model_checkout_order->updateOrderStatus($this->BILL_NO,10);
					}
				}else
				{
					echo 'FAILURE';
						//更改订单状态为失败
						$this->model_checkout_order->updateOrderStatus($this->BILL_NO,10);
				}
			}else
			{
				echo 'FAILURE';
						//更改订单状态为失败
						$this->model_checkout_order->updateOrderStatus($this->BILL_NO,10);
			}
		}else
		{
			echo 'FAILURE';
						//更改订单状态为失败
						$this->model_checkout_order->updateOrderStatus($this->BILL_NO,10);
		}
	}
}