<?php 
class ControllerPaymentordercallbacktax extends Controller 
{
	public function index() 
	{
		$this->load->model('checkout/order');
		$content = urldecode(file_get_contents("php://input")); 
		$content=str_replace('EData=','',$content);
		$json=json_decode($content, true); 
		
	
		
/*				$file = fopen("log.txt",'a');
				fwrite($file,"\r\n\r\nordertax_back：");
  				fwrite($file,"json:".$content."\r\n");
  				fclose($file);*/
				
				
				
		if($json['status']==1)
		{
			echo 'SUCCESS';
			//更改订单状态为正在处理
			$this->model_checkout_order->updateOrderStatus($json['merchantOrderId'],2);
		}else
		{
			echo 'FAILURE';
			//更改订单状态为退款
			$this->model_checkout_order->updateOrderStatus($json['merchantOrderId'],11);
			//退款申请
			$this->refund($json['merchantOrderId']);
			
		}
	
	}
	
	
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