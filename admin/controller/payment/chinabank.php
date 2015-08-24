<?php 
class ControllerPaymentChinabank extends Controller {
	private $error = array(); 

	public function index() {
		$this->load_language('payment/chinabank');

		$this->document->settitle($this->language->get('heading_title'));
		
		if (isset($this->error['bargainor_id'])) {
			$this->data['error_bargainor_id'] = $this->error['bargainor_id'];
		} else {
			$this->data['error_bargainor_id'] = '';
		}

		if (isset($this->error['key'])) {
			$this->data['error_key'] = $this->error['key'];
		} else {
			$this->data['error_key'] = '';
		}
		
		if (isset($this->error['seller'])) {
			$this->data['error_seller'] = $this->error['seller'];
		} else {
			$this->data['error_seller'] = '';
		}
		
   		$this->data['breadcrumbs']  = array();

   		$this->data['breadcrumbs'][] = array(
       		'href'      => HTTPS_SERVER . 'index.php?route=common/home&token=' . $this->session->data['token'],
       		'text'      => $this->language->get('text_home'),
      		'separator' => FALSE
   		);

   		$this->data['breadcrumbs'][] = array(
       		'href'      => HTTPS_SERVER . 'index.php?route=extension/payment&token=' . $this->session->data['token'],
       		'text'      => $this->language->get('text_payment'),
      		'separator' => $this->language->get('text_breadcrumb_separator')
   		);

   		$this->data['breadcrumbs'][] = array(
       		'href'      => HTTPS_SERVER . 'index.php?route=payment/chinabank&token=' . $this->session->data['token'],
       		'text'      => $this->language->get('heading_title'),
      		'separator' => $this->language->get('text_breadcrumb_separator')
   		);
   		
		$this->load->model('setting/setting');
			
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
			$this->load->model('setting/setting');
			
			$this->model_setting_setting->editSetting('chinabank', $this->request->post);				
			
			$this->session->data['success'] = $this->language->get('text_success');

			$this->redirect( HTTPS_SERVER . 'index.php?route=extension/payment&token=' . $this->session->data['token']);
		}

		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		
 		if (isset($this->error['email'])) {
			$this->data['error_email'] = $this->error['email'];
		} else {
			$this->data['error_email'] = '';
		}


		$this->data['action'] = HTTPS_SERVER . 'index.php?route=payment/chinabank&token=' . $this->session->data['token'];
		
		$this->data['cancel'] =  HTTPS_SERVER . 'index.php?route=extension/payment&token=' . $this->session->data['token'];
		
		
		if (isset($this->request->post['chinabank_bargainor_id'])) {
			$this->data['chinabank_bargainor_id'] = $this->request->post['chinabank_bargainor_id'];
		} else {
			$this->data['chinabank_bargainor_id'] = $this->config->get('chinabank_bargainor_id');
		}

//		if (isset($this->request->post['chinabank_seller'])) {
//			$this->data['chinabank_seller'] = $this->request->post['chinabank_seller'];
//		} else {
//			$this->data['chinabank_seller'] = $this->config->get('chinabank_seller');
//		}		

		if (isset($this->request->post['chinabank_key'])) {
			$this->data['chinabank_key'] = $this->request->post['chinabank_key'];
		} else {
			$this->data['chinabank_key'] = $this->config->get('chinabank_key');
		}
		
		if (isset($this->request->post['chinabank_mch_type'])) {
			$this->data['chinabank_mch_type'] = $this->request->post['chinabank_mch_type'];
		} else {
			$this->data['chinabank_mch_type'] = $this->config->get('chinabank_mch_type');
		}
		

		if (isset($this->request->post['chinabank_cmdno'])) {
			$this->data['chinabank_cmdno'] = $this->request->post['chinabank_cmdno'];
		} else {
			$this->data['chinabank_cmdno'] = $this->config->get('chinabank_cmdno');
		}
		
	/*	if (isset($this->request->post['chinabank_anti_phishing'])) {
			$this->data['chinabank_anti_phishing'] = $this->request->post['chinabank_anti_phishing'];
		} else {
			$this->data['chinabank_anti_phishing'] = $this->config->get('chinabank_anti_phishing');
		}
		*/
		if (isset($this->request->post['chinabank_order_status_id'])) {
			$this->data['chinabank_order_status_id'] = $this->request->post['chinabank_order_status_id'];
		} else {
			$this->data['chinabank_order_status_id'] = $this->config->get('chinabank_order_status_id'); 
		} 

		$this->load->model('localisation/order_status');
		
		$this->data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();
			
		$this->load->model('localisation/geo_zone');
										
		$this->data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();
		
		if (isset($this->request->post['chinabank_status'])) {
			$this->data['chinabank_status'] = $this->request->post['chinabank_status'];
		} else {
			$this->data['chinabank_status'] = $this->config->get('chinabank_status');
		}
		
		if (isset($this->request->post['chinabank_sort_order'])) {
			$this->data['chinabank_sort_order'] = $this->request->post['chinabank_sort_order'];
		} else {
			$this->data['chinabank_sort_order'] = $this->config->get('chinabank_sort_order');
		}
		
		$this->template = 'payment/chinabank.tpl';
		$this->id = 'content';
		$this->layout = 'layout/default';
		$this->render();	
	}


	private function validate() {
		if (!$this->user->hasPermission('modify', 'payment/chinabank')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
	
		if (!$this->request->post['chinabank_bargainor_id']) {
			$this->error['bargainor_id'] = $this->language->get('error_bargainor_id');
		}

//		if (!$this->request->post['chinabank_seller']) {
//			$this->error['seller'] = $this->language->get('error_seller');
//		}

		if (!$this->request->post['chinabank_key']) {
			$this->error['key'] = $this->language->get('chinabank_key');
		}

		if (!$this->error) {
			return TRUE;
		} else {
			return FALSE;
		}	
	}
}
?>