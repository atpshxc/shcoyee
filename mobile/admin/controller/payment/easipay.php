<?php 
class ControllerPaymentEasipay extends Controller {
	private $error = array(); 

	public function index() {
		$this->load_language('payment/easipay');

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
       		'href'      => HTTPS_SERVER . 'index.php?route=payment/easipay&token=' . $this->session->data['token'],
       		'text'      => $this->language->get('heading_title'),
      		'separator' => $this->language->get('text_breadcrumb_separator')
   		);
   		
		$this->load->model('setting/setting');
			
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
			$this->load->model('setting/setting');
			
			$this->model_setting_setting->editSetting('easipay', $this->request->post);				
			
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


		$this->data['action'] = HTTPS_SERVER . 'index.php?route=payment/easipay&token=' . $this->session->data['token'];
		
		$this->data['cancel'] =  HTTPS_SERVER . 'index.php?route=extension/payment&token=' . $this->session->data['token'];
		
		
		if (isset($this->request->post['easipay_bargainor_id'])) {
			$this->data['easipay_bargainor_id'] = $this->request->post['easipay_bargainor_id'];
		} else {
			$this->data['easipay_bargainor_id'] = $this->config->get('easipay_bargainor_id');
		}

		if (isset($this->request->post['easipay_seller'])) {
			$this->data['easipay_seller'] = $this->request->post['easipay_seller'];
		} else {
			$this->data['easipay_seller'] = $this->config->get('easipay_seller');
		}		

		if (isset($this->request->post['easipay_key'])) {
			$this->data['easipay_key'] = $this->request->post['easipay_key'];
		} else {
			$this->data['easipay_key'] = $this->config->get('easipay_key');
		}
		
		if (isset($this->request->post['easipay_mch_type'])) {
			$this->data['easipay_mch_type'] = $this->request->post['easipay_mch_type'];
		} else {
			$this->data['easipay_mch_type'] = $this->config->get('easipay_mch_type');
		}
		

		if (isset($this->request->post['easipay_cmdno'])) {
			$this->data['easipay_cmdno'] = $this->request->post['easipay_cmdno'];
		} else {
			$this->data['easipay_cmdno'] = $this->config->get('easipay_cmdno');
		}
		
	/*	if (isset($this->request->post['easipay_anti_phishing'])) {
			$this->data['easipay_anti_phishing'] = $this->request->post['easipay_anti_phishing'];
		} else {
			$this->data['easipay_anti_phishing'] = $this->config->get('easipay_anti_phishing');
		}
		*/
		if (isset($this->request->post['easipay_order_status_id'])) {
			$this->data['easipay_order_status_id'] = $this->request->post['easipay_order_status_id'];
		} else {
			$this->data['easipay_order_status_id'] = $this->config->get('easipay_order_status_id'); 
		} 

		$this->load->model('localisation/order_status');
		
		$this->data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();
			
		$this->load->model('localisation/geo_zone');
										
		$this->data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();
		
		if (isset($this->request->post['easipay_status'])) {
			$this->data['easipay_status'] = $this->request->post['easipay_status'];
		} else {
			$this->data['easipay_status'] = $this->config->get('easipay_status');
		}
		
		if (isset($this->request->post['easipay_sort_order'])) {
			$this->data['easipay_sort_order'] = $this->request->post['easipay_sort_order'];
		} else {
			$this->data['easipay_sort_order'] = $this->config->get('easipay_sort_order');
		}
		
		$this->template = 'payment/easipay.tpl';
		$this->id = 'content';
		$this->layout = 'layout/default';
		$this->render();	
	}


	private function validate() {
		if (!$this->user->hasPermission('modify', 'payment/easipay')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
	
		if (!$this->request->post['easipay_bargainor_id']) {
			$this->error['bargainor_id'] = $this->language->get('error_bargainor_id');
		}

		if (!$this->request->post['easipay_key']) {
			$this->error['key'] = $this->language->get('easipay_key');
		}

		if (!$this->error) {
			return TRUE;
		} else {
			return FALSE;
		}	
	}
}
?>