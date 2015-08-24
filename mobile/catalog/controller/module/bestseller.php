<?php
class ControllerModuleBestSeller extends Controller {
	protected function index($setting) {
		$this->language->load('module/bestseller');
 
      	$this->data['heading_title'] = $this->language->get('heading_title');
				
		$this->data['button_cart'] = $this->language->get('button_cart');
		
		$this->load->model('catalog/product');
		
		$this->load->model('tool/image');

		$this->data['products'] = array();
		//张博热门
                //$results = $this->model_catalog_product->getBestSellerProducts($setting['limit']); 
		$results = $this->model_catalog_product->getBestSellerProducts(6);
                
                
                //print_r($results);
		foreach ($results as $result) {
			if ($result['image']) {
				$image = $this->model_tool_image->resize($result['image'], $setting['image_width'], $setting['image_height']);
			} else {
				$image = false;
			}
                        //zhangbo edit 产品大图 2015-07-28
                        if ($result['image1']) {
				$image1 = $this->model_tool_image->resize($result['image1'], 588, 319);
			} else {
				$image1 = false;
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
					
                         //
                        $tagarray="";
                        $tagsql="select * from " . DB_PREFIX . "product_tag where product_id=". $result['product_id'];
                        $tagquery = $this->db->query($tagsql);
                        if($tagquery ->num_rows)
                        {
                           $tagarray= $tagquery->rows[0]["tag"];
                        }
                        
			$this->data['products'][] = array(
				'product_id' => $result['product_id'],
				'viewed' => $result['viewed'],
				'tags' => $tagarray,
				'classid' => $result['classid'],//zhangbo edit 增加分类
				'thumb'   	 => $image,
				'thumb1'   	 => $image1,
				'name'    	 => $result['name'],
				'meta_description'    	 => $result['meta_description'],
				'price'   	 => $price,
				'tax_money'  => $tax,//zhangbo edit 
				'text_tax_money' => $this->language->get('text_tax_money'),//zhangbo edit 
				'special' 	 => $special,
				'rating'     => $rating,
				'reviews'    => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
				'href'    	 => $this->url->link('product/product', 'product_id=' . $result['product_id']),
			);
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/bestseller.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/bestseller.tpl';
		} else {
			$this->template = 'default/template/module/bestseller.tpl';
		}

		$this->render();
	}
}
?>