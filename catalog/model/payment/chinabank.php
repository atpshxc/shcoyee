<?php 
class ModelPaymentChinabank extends Model {
  	public function getMethod($address) {
		$this->load->language('payment/chinabank');
		
		if ($this->config->get('chinabank_status')) {
      		$status = TRUE;
      	} else {
			$status = FALSE;
		}
		
		$method_data = array();
	
		if ($status) {  
      		$method_data = array( 
        		'code'         => 'chinabank',
        		'title'      => $this->language->get('text_title'),
				'sort_order' => $this->config->get('chinabank_sort_order')
      		);
    	}
	
    	return $method_data;
  	}
}
?>