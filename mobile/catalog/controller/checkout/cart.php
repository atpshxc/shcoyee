<?php 
class ControllerCheckoutCart extends Controller {
	public function index() {
		
		$this->load_language('checkout/cart');
		
		//print $this->session->data['ischeckedclassid'];exit;
//		if (isset($this->request->get['classid'])) 
//		{
//			if(isset($this->session->data['ischeckedclassid']))
//			{
//			
//				if(!is_int(strpos($this->session->data['ischeckedclassid'],$this->request->get['classid'])))
//				{
//					$this->session->data['ischeckedclassid'].=$this->request->get['classid'];	
//				}
//			}else
//			{
//				$this->session->data['ischeckedclassid']=$this->request->get['classid'];	
//			}
//      	}
//		
//		if (isset($this->request->get['unclassid'])) 
//		{
//			if(isset($this->session->data['ischeckedclassid']))
//			{
//			
//				if(is_int(strpos($this->session->data['ischeckedclassid'],$this->request->get['unclassid'])))
//				{
//					
//					$this->session->data['ischeckedclassid']=str_replace($this->request->get['unclassid'],"",$this->session->data['ischeckedclassid']);	
//				}
//			}
//      	}
		
		
		unset($this->session->data['orders']);//清空所有拆单信息
                  unset( $this->session->data['zb_cart_orderid']);
		
		if ($this->request->server['REQUEST_METHOD'] == 'POST') 
		{
		
      		if (isset($this->request->post['quantity'])) {
				if (!is_array($this->request->post['quantity'])) {
					if (isset($this->request->post['option'])) {
						$option = $this->request->post['option'];
					} else {
						$option = array();	
					}
			
      				$this->cart->add($this->request->post['product_id'],$this->request->post['classid'], $this->request->post['quantity'], $option);
				} else {
				
					foreach ($this->request->post['quantity'] as $key => $value) {
	      				$this->cart->update($key, $value,$this->request->get['classid']);
					}
				}
      		}

			
			
      		if (isset($this->request->post['remove'])) {
	    		foreach ($this->request->post['remove'] as $key) {
          			$this->cart->remove($key,$this->request->get['classid']);
				}
      		}
			
      		if (isset($this->request->post['voucher']) && $this->request->post['voucher']) {
	    		foreach ($this->request->post['voucher'] as $key) {
          			if (isset($this->session->data['vouchers'][$key])) {
						unset($this->session->data['vouchers'][$key]);
					}
				}
      		}
									
			if (isset($this->request->post['redirect'])) {
				$this->session->data['redirect'] = $this->request->post['redirect'];
			}	
			
			if (isset($this->request->post['quantity']) || isset($this->request->post['remove']) || isset($this->request->post['voucher'])) {
				unset($this->session->data['shipping_methods']);
				unset($this->session->data['shipping_method']);
				unset($this->session->data['payment_methods']);
				unset($this->session->data['payment_method']);	
				unset($this->session->data['reward']);	
			
				$this->redirect($this->url->link('checkout/cart'));
			}
    	}
		
	
    	
		if (isset($this->request->get['remove'])) {
    		$this->cart->remove($this->request->get['remove'],$this->request->get['classid']);
    			
    		$this->redirect($this->url->link('checkout/cart'));
      	}

    	$this->document->setTitle($this->language->get('heading_title'));

      	$this->data['breadcrumbs'] = array();

      	$this->data['breadcrumbs'][] = array(
        	'href'      => $this->url->link('common/home'),
        	'text'      => $this->language->get('text_home'),
        	'separator' => false
      	); 
	
      	$this->data['breadcrumbs'][] = array(
        	'href'      => $this->url->link('checkout/cart'),
        	'text'      => $this->language->get('heading_title'),
        	'separator' => $this->language->get('text_separator')
      	);
			
    	if ($this->cart->hasProducts() || (isset($this->session->data['vouchers']) && $this->session->data['vouchers'])) {
      		$this->data['heading_title'] = $this->language->get('heading_title');
			
			$this->data['text_select'] = $this->language->get('text_select');
			$this->data['text_weight'] = $this->language->get('text_weight');
		
     		$this->data['column_remove'] = $this->language->get('column_remove');
      		$this->data['column_image'] = $this->language->get('column_image');
      		$this->data['column_name'] = $this->language->get('column_name');
      		$this->data['column_model'] = $this->language->get('column_model');
      		$this->data['column_quantity'] = $this->language->get('column_quantity');
			$this->data['column_price'] = $this->language->get('column_price');
      		$this->data['column_total'] = $this->language->get('column_total');
      		$this->data['column_tax'] = $this->language->get('column_tax');
			
      		$this->data['button_update'] = $this->language->get('button_update');
      		$this->data['button_shopping'] = $this->language->get('button_shopping');
      		$this->data['button_checkout'] = $this->language->get('button_checkout');
			
			if ($this->config->get('config_customer_price') && !$this->customer->isLogged()) {
				$this->data['attention'] = sprintf($this->language->get('text_login'), $this->url->link('account/login'), $this->url->link('account/register'));
			} else {
				$this->data['attention'] = '';
			}
			
			
			
			
			
			$this->data['action'] = $this->url->link('checkout/cart');
						
			if ($this->config->get('config_cart_weight')) {
				$this->data['weight'] = $this->weight->format($this->cart->getWeight(), $this->config->get('config_weight_class_id'), $this->language->get('decimal_point'), $this->language->get('thousand_point'));
			} else {
				$this->data['weight'] = false;
			}
						 
			$this->load->model('tool/image');
			
      		$this->data['products'] = array();

      		foreach ($this->cart->getProducts() as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_cart_width'), $this->config->get('config_image_cart_height'));
				} else {
					$image = '';
				}

				$option_data = array();

				if ($result['minimum'] > $result['quantity']) {
					$this->session->data['error'] = sprintf($this->language->get('error_minimum'), $result['name'], $result['minimum']);
				}

        		foreach ($result['option'] as $option) {
					if ($option['type'] != 'file') {
						$option_data[] = array(
							'name'  => $option['name'],
							'value' => (strlen($option['option_value']) > 20 ? substr($option['option_value'], 0, 20) . '..' : $option['option_value'])
						);
					} else {
						$this->load->library('encryption');
						
						$encryption = new Encryption($this->config->get('config_encryption'));
						
						$file = substr($encryption->decrypt($option['option_value']), 0, strrpos($encryption->decrypt($option['option_value']), '.'));
						
						$option_data[] = array(
							'name'  => $option['name'],
							'value' => (strlen($file) > 20 ? substr($file, 0, 20) . '..' : $file)
						);						
					}
        		}
				
				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$total = $this->currency->format($this->tax->calculate($result['total'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$total = false;
				}
				$tax=$this->tax->getRate($result['tax_class_id'])*$result['price']/100;
        		$this->data['products'][] = array(
          			'key'      => $result['key'],
          			'product_id'      => $result['product_id'],
				'classid'      => $result['classid'],////zhangbo ecit 
				'ischecked'      => $result['ischecked'],////zhangbo ecit ���ӷ���
          			'thumb'    => $image,
					'name'     => $result['name'],
          			'model'    => $result['model'],
          			'option'   => $option_data,
          			'quantity' => $result['quantity'],
          			'stock'    => $result['stock'],
					'points'   => ($result['points'] ? sprintf($this->language->get('text_points'), $result['points']) : ''),
					'price'    => $price,
					'tax_money'    => $tax,
					'tax_money_count'    => $tax*$result['quantity'],
					'total'    => $total,
        			'remove'   => $this->url->link('checkout/cart', 'remove=' . $result['key']),
					'href'     => $this->url->link('product/product', 'product_id=' . $result['product_id'])
        		);
      		}
			
			// Gift Voucher
			$this->data['vouchers'] = array();
			
			if (isset($this->session->data['vouchers']) && $this->session->data['vouchers']) {
				foreach ($this->session->data['vouchers'] as $key => $voucher) {
					$this->data['vouchers'][] = array(
						'key'         => $key,
						'description' => $voucher['description'],
						'amount'      => $this->currency->format($voucher['amount'])
					);
				}
			} 
			
			
			
			
			
						
			$total_data = array();
			$total = 0;
			$taxes = $this->cart->getTaxes();
		
		
			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {						 
				$this->load->model('setting/extension');
				
				$sort_order = array(); 
				
				$results = $this->model_setting_extension->getExtensions('total');
				foreach ($results as $key => $value) {
					$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
				}
				
				array_multisort($sort_order, SORT_ASC, $results);
				
				foreach ($results as $result) {
					if ($this->config->get($result['code'] . '_status')) {
						$this->load->model('total/' . $result['code']);
		
						$this->{'model_total_' . $result['code']}->getTotal($total_data, $total, $taxes);
					}
				}
			
				$sort_order = array(); 
			  
				foreach ($total_data as $key => $value) {
					$sort_order[$key] = $value['sort_order'];
				}
	
				array_multisort($sort_order, SORT_ASC, $total_data);
			}
			
			$this->data['totals'] = $total_data;
				
			// Modules
			$this->data['modules'] = array();
			
			if (isset($results)) {
				foreach ($results as $result) {
					if ($this->config->get($result['code'] . '_status') && file_exists(DIR_APPLICATION . 'controller/total/' . $result['code'] . '.php')) {
						$this->data['modules'][] = $this->getChild('total/' . $result['code']);
					}
				}
			}
			
			if (isset($this->session->data['redirect'])) {
      			$this->data['continue'] = $this->session->data['redirect'];
				
				unset($this->session->data['redirect']);
			} else {
				$this->data['continue'] = $this->url->link('common/home');
			}
			
			
			
			
    		if (!$this->cart->hasStock() && (!$this->config->get('config_stock_checkout') || $this->config->get('config_stock_warning'))) 
			{
				
      			$this->data['error_warning'] = $this->language->get('error_stock');
			} 
			elseif (isset($this->session->data['error']))
			 {
				$this->data['error_warning'] = $this->session->data['error'];
			
				unset($this->session->data['error']);			
			} else {
				$this->data['error_warning'] = '';
			}
			
//			/*zhangbo endit*/
//			$productss=$this->cart->getProducts();
//			$ze_total=0;
//			$sp_total=0;
//		foreach ($total_data as $total) 
//   		{ 
//			if($this->language->get('text_sub_total')==$total['title'])
//				$ze_total=$total['value'];
//   		}
//		foreach($productss as $product)
//		{
//			$sp_total+=$product['quantity'];
//		}
//		if($ze_total>1000 && $sp_total>1)
//			{
//			if(isset($this->data['error_warning']))
//			{
//				if($this->data['error_warning']=='')
//					$this->data['error_warning'] = $this->language->get('error_total');
//				else
//					$this->data['error_warning'] = $this->data['error_warning'].'<br/>'.$this->language->get('error_total');
//				}
//			else
//				$this->data['error_warning'] = $this->language->get('error_total');
//				
//		}
//		
//
//		
//		
//		
//		
//		$ischeckedclassid=0;
//		if(isset($this->session->data['ischeckedclassid']))
//		{
//			$ischeckedclassid=(int)$this->session->data['ischeckedclassid'];
//		}
//		//print $ischeckedclassid;exit;
//		if($ischeckedclassid==0 || $ischeckedclassid>3)
//		{
//			if(isset($this->data['error_warning']))
//			{
//				if($this->data['error_warning']=='')
//					$this->data['error_warning'] = $this->language->get('error_order');
//				else
//					$this->data['error_warning'] = $this->data['error_warning'].'<br/>'.$this->language->get('error_order');
//				}
//			else
//				$this->data['error_warning'] = $this->language->get('error_order');
//		}
		
	
		
		
		/*zhangbo endit*/
			
    		if (isset($this->session->data['success'])) {
				$this->data['success'] = $this->session->data['success'];
			
				unset($this->session->data['success']);
			} else {
				$this->data['success'] = '';
			}
						
			$this->data['checkout'] = $this->url->link('checkout/checkout', '', 'SSL');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/checkout/cart.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/checkout/cart.tpl';
			} else {
				$this->template = 'default/template/checkout/cart.tpl';
			}
			
			$this->children = array(
				'common/column_left',
				'common/column_right',
				'common/content_top',
				'common/content_bottom',
				'common/footer',
				'common/header',
				'common/checkout_header'	
			);
					
			$this->response->setOutput($this->render());					
    	} else {
                $this->data['products']=array();
      		$this->data['heading_title'] = $this->language->get('heading_title');

      		$this->data['text_error'] = $this->language->get('text_empty');

      		$this->data['button_continue'] = $this->language->get('button_continue');

      		$this->data['continue'] = $this->url->link('common/home');

//			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) {
//				$this->template = $this->config->get('config_template') . '/template/error/not_found.tpl';
//			} else {
//				$this->template = 'default/template/error/not_found.tpl';
//			}
			
                $this->data['checkout'] = $this->url->link('checkout/checkout', '', 'SSL');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/checkout/cart.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/checkout/cart.tpl';
			} else {
				$this->template = 'default/template/checkout/cart.tpl';
			}
                
                
			$this->children = array(
				'common/column_left',
				'common/column_right',
				'common/content_top',
				'common/content_bottom',
				'common/footer',
				'common/header',
				'common/checkout_header'
			);
				
			$this->response->setOutput($this->render());			
    	}
  	}
	
  	public function getTotal() {
  		$json = array();
  		$json['total'] = $this->cart->countProducts();
  		$this->load->library('json');
  		
  		$this->response->setOutput(Json::encode($json));
  	}
  	
	public function update() {	
		$this->language->load('checkout/cart');
		
		$json = array();
		
		if (isset($this->request->post['product_id'])) {
			$this->load->model('catalog/product');
			
			$product_info = $this->model_catalog_product->getProduct($this->request->post['product_id']);
			
			if ($product_info) {						
				// Minimum quantity validation
				if (isset($this->request->post['quantity'])) {
					$quantity = $this->request->post['quantity'];
				} else {
					$quantity = 1;
				}
				
				$product_total = 0;
				
				foreach ($this->session->data['cart'] as $key => $value) {
					$product = explode(':', $key);
					
					if ($product[0] == $this->request->post['product_id']) {
						$product_total += $value;
					}
				}
				
				if ($product_info['minimum'] > ($product_total + $quantity)) {
					$json['error']['warning'] = sprintf($this->language->get('error_minimum'), $product_info['name'], $product_info['minimum']);
				}
				
				// Option validation
				if (isset($this->request->post['option'])) {
					$option = array_filter($this->request->post['option']);
				} else {
					$option = array();	
				}				
	
				$product_options = $this->model_catalog_product->getProductOptions($this->request->post['product_id']);
				
				foreach ($product_options as $product_option) {
					if ($product_option['required'] && (!isset($this->request->post['option'][$product_option['product_option_id']]) || !$this->request->post['option'][$product_option['product_option_id']])) {
						$json['error'][$product_option['product_option_id']] = sprintf($this->language->get('error_required'), $product_option['name']);
					}
				}
			}
			
			if (!isset($json['error'])) {
				$this->cart->add($this->request->post['product_id'],$this->request->get['classid'], $quantity, $option);
			
				$json['success'] = sprintf($this->language->get('text_success'), $this->url->link('product/product', 'product_id=' . $this->request->post['product_id']), $product_info['name'], $this->url->link('checkout/cart'));
			
				unset($this->session->data['shipping_methods']);
				unset($this->session->data['shipping_method']);
				unset($this->session->data['payment_methods']);
				unset($this->session->data['payment_method']);			
			} else {
				$json['redirect'] = str_replace('&amp;', '&', $this->url->link('product/product', 'product_id=' . $this->request->post['product_id']));
			}
		}	
		
      	if (isset($this->request->post['remove'])) 
        {
            $this->cart->remove($this->request->post['remove'],$this->request->get['classid']);
      	}

      	if (isset($this->request->post['voucher'])) {
			if ($this->session->data['vouchers'][$this->request->post['voucher']]) {
				unset($this->session->data['vouchers'][$this->request->post['voucher']]);
			}
		}
					
		$this->load->model('tool/image');
		
		$this->data['text_empty'] = $this->language->get('text_empty');
		
		$this->data['button_checkout'] = $this->language->get('button_checkout');
		$this->data['button_remove'] = $this->language->get('button_remove');

		$this->data['products'] = array();

		foreach ($this->cart->getProducts() as $result) {
			if ($result['image']) {
				$image = $this->model_tool_image->resize($result['image'], 40, 40);
			} else {
				$image = '';
			}			
			
			$option_data = array();

			foreach ($result['option'] as $option) {
				if ($option['type'] != 'file') {
					$option_data[] = array(
						'name'  => $option['name'],
						'value' => (strlen($option['option_value']) > 20 ? substr($option['option_value'], 0, 20) . '..' : $option['option_value'])
					);
				} else {
					$this->load->library('encryption');
					
					$encryption = new Encryption($this->config->get('config_encryption'));
					
					$file = substr($encryption->decrypt($option['option_value']), 0, strrpos($encryption->decrypt($option['option_value']), '.'));
					
					$option_data[] = array(
						'name'  => $option['name'],
						'value' => (strlen($file) > 20 ? substr($file, 0, 20) . '..' : $file)
					);					
				}
			}
				
			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$price = false;
			}

			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$total = $this->currency->format($this->tax->calculate($result['total'], $result['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$total = false;
			}
				
			$tax=$this->tax->getRate($result['tax_class_id'])*$result['price']/100;
			$this->data['products'][] = array(
				'key'      => $result['key'],
				'classid'      => $result['classid'],////zhangbo ecit ���ӷ���
				'ischecked'      => $result['ischecked'],////zhangbo ecit ���ӷ���
				'thumb'    => $image,
				'name'     => $result['name'],
				'model'    => $result['model'],
				'option'   => $option_data,
				'quantity' => $result['quantity'],
				'stock'    => $result['stock'],
				'price'    => $price,
					'tax_money'    => $tax,
					'tax_money_count'    => $tax*$result['quantity'],
				'total'    =>  $total,
				'href'     => $this->url->link('product/product', 'product_id=' . $result['product_id'])
			);
		}
		
		// Gift Voucher
		$this->data['vouchers'] = array();
		
		if (isset($this->session->data['vouchers']) && $this->session->data['vouchers']) {
			foreach ($this->session->data['vouchers'] as $key => $voucher) {
				$this->data['vouchers'][] = array(
					'key'         => $key,
					'description' => $voucher['description'],
					'amount'      => $this->currency->format($voucher['amount'])
				);
			}
		} 
		
		// Calculate Totals
		$total_data = array();					
		$total = 0;
		$taxes = $this->cart->getTaxes();
		
		if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {						 
			$this->load->model('setting/extension');
			
			$sort_order = array(); 
			
			$results = $this->model_setting_extension->getExtensions('total');
		
			foreach ($results as $key => $value) {
				$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');

			}
			array_multisort($sort_order, SORT_ASC, $results);
			
			foreach ($results as $result) {
				if ($this->config->get($result['code'] . '_status')) {
					$this->load->model('total/' . $result['code']);
		
					$this->{'model_total_' . $result['code']}->getTotal($total_data, $total, $taxes);
				}
			}
			
			$sort_order = array(); 
		  
			foreach ($total_data as $key => $value) {
				$sort_order[$key] = $value['sort_order'];
			}
	
			array_multisort($sort_order, SORT_ASC, $total_data);
		}
					
		$json['total'] = sprintf($this->language->get('text_items'), $this->cart->countProducts() + (isset($this->session->data['vouchers']) ? count($this->session->data['vouchers']) : 0), $this->currency->format($total));
		$this->data['totals'] = $total_data;
		
		$this->data['checkout'] = $this->url->link('checkout/checkout', '', 'SSL');
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/cart.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/cart.tpl';
		} else {
			$this->template = 'default/template/common/cart.tpl';
		}
		
		$json['output'] = $this->render();
		
		$this->load->library('json');
		
		$this->response->setOutput(Json::encode($json));
	}
}
?>