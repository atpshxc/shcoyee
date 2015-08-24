<?php 
class ModelPaymentEasipay extends Model {
  	public function getMethod($address) {
		$this->load->language('payment/easipay');
		
		if ($this->config->get('easipay_status')) {
      		$status = TRUE;
      	} else {
			$status = FALSE;
		}
		
		$method_data = array();
	
		if ($status) {  
      		$method_data = array( 
        		'code'         => 'easipay',
        		'title'      => $this->language->get('text_title'),
				'sort_order' => $this->config->get('easipay_sort_order')
      		);
    	}
	
    	return $method_data;
  	}
}
?>