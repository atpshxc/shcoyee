<?php
class ControllerAccountShouhuo extends Controller {
	public function index() 
        { 
            $this->template = 'default/template/account/shouhuo.tpl';
            $this->data["order_id"]=$this->session->data['shuohuo_order_id'];
            $this->render();
	}
        public function ajxsh()
        {
            $order_id=$this->session->data['shuohuo_order_id'];
            try{
               $this->load->model('account/order');
            $this->model_account_order->updateOrder($order_id,5);
            echo '{"status":"ok"}';
            }catch(Exception $ss)
            {
                echo '{"status":"false"}';
            }
            
        }
}
?>