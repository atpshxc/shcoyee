<?php 
class ModelPaymentweixinpay extends Model {
  	public function getMethod($address) {
		$this->load->language('payment/weixinpay');
		
		if ($this->config->get('weixinpay_status')) {
      		$status = TRUE;
      	} else {
			$status = FALSE;
		}
		
		$method_data = array();
	
		if ($status) {  
      		$method_data = array( 
        		'code'         => 'weixinpay',
        		'title'      => $this->language->get('text_title'),
				'sort_order' => $this->config->get('weixinpay_sort_order')
      		);
    	}
	
    	return $method_data;
  	}
}
?>