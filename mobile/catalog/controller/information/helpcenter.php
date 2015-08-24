<?php 
class ControllerInformationHelpcenter extends Controller {
	private $error = array(); 
	    
  	public function index() {
		$this->load_language('information/helpcenter');

    	$this->document->setTitle($this->language->get('heading_title'));  
	 
      	$this->data['breadcrumbs'] = array();

      	$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),        	
        	'separator' => false
      	);

      	$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('information/helpcenter'),
        	'separator' => $this->language->get('text_separator')
      	);	
			
    	$this->data['heading_title'] = $this->language->get('heading_title');
    	$this->data['sub_title_keyi'] = $this->language->get('text_keyi');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/helpcenter.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/information/helpcenter.tpl';
		} else {
			$this->template = 'default/template/information/helpcenter.tpl';
		}

		//load initial info
		$this->load->model('catalog/information');
		
		if (isset($this->request->get['information_id'])) {
			$information_id = $this->request->get['information_id'];
		} else {
			$information_id = 18; //商品验货与签收
		}
		$this->data['information_id'] = $information_id;
		$information_info = $this->model_catalog_information->getInformation($information_id);
		if ($information_info) {

      		$this->data['heading_title'] = $information_info['title'];
      		
      		$this->data['button_continue'] = $this->language->get('button_continue');
			
			$this->data['description'] = html_entity_decode($information_info['description'], ENT_QUOTES, 'UTF-8');
      		
			$this->data['continue'] = $this->url->link('common/home');

    	} else {
      		$this->data['breadcrumbs'][] = array(
        		'text'      => $this->language->get('text_error'),
				'href'      => $this->url->link('information/information', 'information_id=' . $information_id),
        		'separator' => $this->language->get('text_separator')
      		);
				
      		$this->data['heading_title'] = $this->language->get('text_error');

      		$this->data['text_error'] = $this->language->get('text_error');

      		$this->data['button_continue'] = $this->language->get('button_continue');

      		$this->data['continue'] = $this->url->link('common/home');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/error/not_found.tpl';
			} else {
				$this->template = 'default/template/error/not_found.tpl';
			}
			
    	}
		
		$this->children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'common/footer',
			'common/header'
		);
				
 		$this->response->setOutput($this->render());		
  	}

}
?>
