<?php
class ModelTotalTax extends Model {
	public function getTotal(&$total_data, &$total, &$taxes) {
		$this->load->language('total/tax_total');
		foreach ($taxes as $key => $value) 
		{
			if ($value > 0) 
			{
				$tax_classes = $this->tax->getDescription($key);
			
				foreach ($tax_classes as $tax_class) 
				{
					
					$rate = $this->tax->getRate($key);
					
					$tax = $value * ($tax_class['rate'] / $rate);

					$mtax=$this->currency->format($tax);
					if($tax<=50)
						$mtax=$mtax.'<strong class="red">（免税）</strong>';
					$total_data[] = array(
						'code'       => 'tax',
						'title'      => $this->language->get('text_tax'), 
						'text'       => $mtax,
						'value'      => $tax,
						'sort_order' => $this->config->get('tax_sort_order')
					);
		
					$total += $tax;

				}
			}
		}
		
	}
}
?>