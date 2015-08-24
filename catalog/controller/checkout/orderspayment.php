<?php
class ControllerCheckoutOrderspayment extends Controller {
	private $direct_payments= array('cod','cheque','free_checkout','bank_transfer');

	public function index() {
		if (!$this->customer->isLogged()) { 
			$this->session->data['redirect'] = $this->url->link('checkout/orderspayment', '', 'SSL');
			 
			$this->redirect($this->url->link('account/login', '', 'SSL'));
		}
                $this->document->setTitle("订单支付");
                $this->load->model('account/order');
                if(isset($this->session->data['zb_orders']))
                {
                        foreach($this->session->data['zb_orders'] as $delorderid)
                        {
                            $this->UpdateOrderStatus($delorderid);//代付款状态
                            $order_info = $this->model_account_order->getOrder($delorderid);
                            $this->session->data['zb_cart_orderid']=$delorderid;
                            $this->data['paymentorders'][] = array(
                                "button"=>$this->getChild('payment/' . $order_info['payment_code'].'/reorder/'),
                                "order_id"=>$order_info['order_id'],
                                "total"=>$order_info['total']
                            );
                        }
                }
                ///清空数据
                //unset( $this->session->data['zb_cart_orderid']);
                //unset($this->session->data['zb_orders']);
                //unset($this->session->data['orders']);
                $this->cart->clear();
                   
                
                if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/checkout/orderspayment.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/checkout/orderspayment.tpl';
		} else {
			$this->template = 'default/template/checkout/orderspayment.tpl';
		}
                
		$this->children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'common/footer',
			'common/checkout_header'
		);
		$this->response->setOutput($this->render());
        }
        
        public function UpdateOrderStatus($order_id)
        {
            		$this->db->query("UPDATE `" . DB_PREFIX . "order` SET order_status_id = '16',  date_modified = NOW() WHERE  order_id ='".$order_id."'");
        }
}
?>
