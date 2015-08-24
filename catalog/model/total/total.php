<?php
class ModelTotalTotal extends Model {
	public function getTotal(&$total_data, &$total, &$taxes) {
		$this->load->language('total/total');
	 	
	 	/** zhangbo tax begin **/
	 	$discount_tax = 0;
		foreach ($this->cart->getProducts() as $product) 
		{
			if($product['ischecked'])
			{
				$tax=$this->tax->getRate($product['tax_class_id'])*$product['price']/100;
				$discount_tax += $tax*$product['quantity'];	
			}
		}
	
	
		if ($discount_tax <= 50) 
		{
 			$total= $total-$discount_tax;
		}
		$total_data[] = array(
			'code'       => 'total',
			'title'      => $this->language->get('text_total'),
			'text'       =>'<span class="red"><strong class="f20">'.$this->currency->format(max(0, $total)).'</strong></span>',
			'value'      => max(0, $total),
			'sort_order' => $this->config->get('total_sort_order')
			);
		/** zhangbo tax end **/
		
	}
}
?>