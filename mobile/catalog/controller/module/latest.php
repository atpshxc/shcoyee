<?php
class ControllerModuleLatest extends Controller {
	protected function index($setting) {
		$this->language->load('module/latest');
		
      	$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['button_cart'] = $this->language->get('button_cart');
				
		$this->load->model('catalog/product');
		
		$this->load->model('tool/image');
                
		//zhangbo 
		$this->data['products1'] = array();
		$this->data['products2'] = array();
		
		$data1 = array(
			'sort'  => 'p.date_added',
			'order' => 'DESC',
			'start' => 0,
			'columnsid' => 1,
			//'limit' => $setting['limit'] 张博 最新产品
			'limit' => 8
		);
                
                //zhangbo 
		$data2 = array(
			'sort'  => 'p.date_added',
			'order' => 'DESC',
			'start' => 0,
			'columnsid' => 2,
			//'limit' => $setting['limit'] 张博 最新产品
			'limit' => 8
		);

		$results1 = $this->model_catalog_product->getProducts($data1);
                
		$results2 = $this->model_catalog_product->getProducts($data2);

		foreach ($results1 as $result) {
			if ($result['image']) {
				$image = $this->model_tool_image->resize($result['image'], $setting['image_width'], $setting['image_height']);
			} else {
				$image = false;
			}
					
					
			if ($result['image']) {
				$popup =$this->model_tool_image->resize($result['image'] ,$this->config->get('config_image_thumb_width'), $this->config->get('config_image_thumb_height'));
			} else {
				$popup = false;
			}
				
			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$price = false;
			}
					
			if ((float)$result['special']) {
				$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$special = false;
			}
			
			if ($this->config->get('config_review_status')) {
				$rating = $result['rating'];
			} else {
				$rating = false;
			}
			$tax=$this->tax->getRate($result['tax_class_id'])*$result['price']/100;
			$this->data['products1'][] = array(
				'product_id' => $result['product_id'],
				'classid' => $result['classid'],//zhangbo edit 增加分类
				'thumb'   	 => $image,
				'popup'   	 => $popup,
				'name'    	 => $result['name'],
				'price'   	 => $price,
				'tax_money'  => $tax, //zhangbo edit
				'text_tax_money' => $this->language->get('text_tax_money'),//zhangbo edit 
				'special' 	 => $special,
				'rating'     => $rating,
				'reviews'    => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
				'href'    	 => $this->url->link('product/product', 'product_id=' . $result['product_id']),
			);
		}
                
                foreach ($results2 as $result) {
			if ($result['image']) {
				$image = $this->model_tool_image->resize($result['image'], $setting['image_width'], $setting['image_height']);
			} else {
				$image = false;
			}
					
					
			if ($result['image']) {
				$popup =$this->model_tool_image->resize($result['image'] ,$this->config->get('config_image_thumb_width'), $this->config->get('config_image_thumb_height'));
			} else {
				$popup = false;
			}
				
			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$price = false;
			}
					
			if ((float)$result['special']) {
				$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$special = false;
			}
			
			if ($this->config->get('config_review_status')) {
				$rating = $result['rating'];
			} else {
				$rating = false;
			}
			$tax=$this->tax->getRate($result['tax_class_id'])*$result['price']/100;
			$this->data['products2'][] = array(
				'product_id' => $result['product_id'],
				'classid' => $result['classid'],//zhangbo edit 增加分类
				'thumb'   	 => $image,
				'popup'   	 => $popup,
				'name'    	 => $result['name'],
				'price'   	 => $price,
				'tax_money'  => $tax, //zhangbo edit
				'text_tax_money' => $this->language->get('text_tax_money'),//zhangbo edit 
				'special' 	 => $special,
				'rating'     => $rating,
				'reviews'    => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
				'href'    	 => $this->url->link('product/product', 'product_id=' . $result['product_id']),
			);
		}
                
                
                
                
                //zhangbo 2015-07-27   品牌
                $sort = 'sort_order';
                $data3 = array(
			'sort'  => "sort_order",
			'columnsid'  => "1",//益健康    2益生活
			'order' => "asc",
			'start' => 0,
			'limit' => 10
		);
                $results = $this->model_catalog_product->getManufacturers($data3);
 
                foreach ($results as $result) 
                {
                    if (isset($result) && $result['image'] && file_exists(DIR_IMAGE . $result['image'])) {
			$image = $this->model_tool_image->resize($result['image'], 100, 40);
                    } else {
                            $image = FALSE;
                    }
                    
                    $this->data['manufacturers1'][] = array(
                                        'manufacturer_id' => $result['manufacturer_id'],//zhangbo edit 增加栏目
                                        'columnsid' => $result['columnsid'],
                                        'image' => $image,
                                        'name'            => $result['name'],
                                        'sort_order'      => $result['sort_order'],
                                        'selected'        => isset($this->request->post['selected']) && in_array($result['manufacturer_id'], $this->request->post['selected']),
                                        'action'          => ""
                                );
                }
                
                
                //zhangbo 2015-07-27 品牌
                $sort = 'sort_order';
                $data4 = array(
			'sort'  => "sort_order",
			'columnsid'  => "2",//益健康    2益生活
			'order' => "asc",
			'start' => 0,
			'limit' => 10
		);
                $results = $this->model_catalog_product->getManufacturers($data4);
 
                foreach ($results as $result) 
                {
                    if (isset($result) && $result['image'] && file_exists(DIR_IMAGE . $result['image'])) {
			$image = $this->model_tool_image->resize($result['image'], 100, 40);
		} else {
			$image = FALSE;
		}
                    
                    $this->data['manufacturers2'][] = array(
                                        'manufacturer_id' => $result['manufacturer_id'],//zhangbo edit 增加栏目
                                        'columnsid' => $result['columnsid'],
                                        'image' => $image,
                                        'name'            => $result['name'],
                                        'sort_order'      => $result['sort_order'],
                                        'selected'        => isset($this->request->post['selected']) && in_array($result['manufacturer_id'], $this->request->post['selected']),
                                        'action'          => ""
                                );
                }
                

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/latest.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/latest.tpl';
		} else {
			$this->template = 'default/template/module/latest.tpl';
		}

		$this->render();
	}
}
?>