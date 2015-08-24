<?php
header("content-type:text/html; charset=utf-8");
include("sign.php");
class ControllerSaleGouhui extends Controller {
	private $error = array();

  	public function index() {
		$this->load_language('sale/order');

		$this->document->setTitle("订单购汇");

		$this->load->model('sale/order');

    	$this->getList();
  	}


  	private function getList() {
		if (isset($this->request->get['filter_order_id'])) {
			$filter_order_id = $this->request->get['filter_order_id'];
		} else {
			$filter_order_id = null;
		}

		if (isset($this->request->get['filter_customer'])) {
			$filter_customer = $this->request->get['filter_customer'];
		} else {
			$filter_customer = null;
		}

		if (isset($this->request->get['filter_order_status_id'])) {
			$filter_order_status_id = $this->request->get['filter_order_status_id'];
		} else {
			$filter_order_status_id = 5;
		}
		
		if (isset($this->request->get['filter_total'])) {
			$filter_total = $this->request->get['filter_total'];
		} else {
			$filter_total = null;
		}
		
		if (isset($this->request->get['filter_date_added'])) {
			$filter_date_added = $this->request->get['filter_date_added'];
		} else {
			$filter_date_added = null;
		}
		
		if (isset($this->request->get['filter_date_modified'])) {
			$filter_date_modified = $this->request->get['filter_date_modified'];
		} else {
			$filter_date_modified = null;
		}

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'o.order_id';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'DESC';
		}
		
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}
				
		
 
  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => "订单购汇",
			'href'      => $this->url->link('sale/gouhui', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => $this->language->get('text_breadcrumb_separator')
   		);

		$this->data['invoice'] = $this->url->link('sale/gouhui/invoice', 'token=' . $this->session->data['token'], 'SSL');
		//$this->data['delete'] = $this->url->link('sale/order/delete', 'token=' . $this->session->data['token'], 'SSL');

		$this->data['orders'] = array();
		
		
		$data = array(
			'filter_order_id'        => $filter_order_id,
			'filter_customer'	     => $filter_customer,
			'filter_order_status_id' => $filter_order_status_id,
			'filter_total'           => $filter_total,
			'filter_isgouhui'           => 0,
			'filter_date_added'      => $filter_date_added,
			'filter_date_modified'   => $filter_date_modified,
			'sort'                   => $sort,
			'order'                  => $order,
			'start'                  => ($page - 1) * $this->config->get('config_admin_limit'),
			'limit'                  => $this->config->get('config_admin_limit')
		);

		$order_total = $this->model_sale_order->getTotalOrders($data);

		$results = $this->model_sale_order->getOrders($data);
		
    	foreach ($results as $result) {
			$action = array();
			
			$action[] = array(
				'text' => $this->language->get('text_view'),
				'href' => $this->url->link('sale/order/info', 'token=' . $this->session->data['token'] . '&order_id=' . $result['order_id'], 'SSL')
			);
			$common = new Common($this->registry);

			$this->data['orders'][] = array(
				'order_id'      => $result['order_id'],
				'kjtorderid'      => $result['kjtorderid'],
				'customer'      => $result['email'],
				'status'        => $result['status'],
				'total'         => $this->currency->format($result['total'], $result['currency_code'], $result['currency_value']),
				'date_added'    => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
				'date_modified' => date($this->language->get('date_format_short'), strtotime($result['date_modified'])),
				'selected'      => isset($this->request->post['selected']) && in_array($result['order_id'], $this->request->post['selected']),
				'action'        => $action
			);
		}
                
		$this->data['token'] = $this->session->data['token'];

		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}


		$this->data['sort_order'] = $this->url->link('sale/order', 'token=' . $this->session->data['token'] . '&sort=o.order_id', 'SSL');
		$this->data['sort_customer'] = $this->url->link('sale/order', 'token=' . $this->session->data['token'] . '&sort=customer', 'SSL');
		$this->data['sort_status'] = $this->url->link('sale/order', 'token=' . $this->session->data['token'] . '&sort=status', 'SSL');
		$this->data['sort_total'] = $this->url->link('sale/order', 'token=' . $this->session->data['token'] . '&sort=o.total', 'SSL');
		$this->data['sort_date_added'] = $this->url->link('sale/order', 'token=' . $this->session->data['token'] . '&sort=o.date_added', 'SSL');
		$this->data['sort_date_modified'] = $this->url->link('sale/order', 'token=' . $this->session->data['token'] . '&sort=o.date_modified', 'SSL');

		

		$pagination = new Pagination();
		$pagination->total = $order_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('sale/order', 'token=' . $this->session->data['token'] . '&page={page}', 'SSL');

		$this->data['pagination'] = $pagination->render();

		$this->data['filter_order_id'] = $filter_order_id;
		$this->data['filter_customer'] = $filter_customer;
		$this->data['filter_order_status_id'] = $filter_order_status_id;
		$this->data['filter_total'] = $filter_total;
		$this->data['filter_date_added'] = $filter_date_added;
		$this->data['filter_date_modified'] = $filter_date_modified;

		$this->load->model('localisation/order_status');

    	$this->data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();

		$this->data['sort'] = $sort;
		$this->data['order'] = $order;

		$this->template = 'sale/gouhui_list.tpl';
		$this->id = 'content';
		$this->layout = 'layout/default';
		$this->render();
  	}
        
        
       public function invoice() {
		$this->load_language('sale/order');

		$this->data['title'] = $this->language->get('heading_title');

		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$this->data['base'] = HTTPS_SERVER;
		} else {
			$this->data['base'] = HTTP_SERVER;
		}

		$this->data['direction'] = $this->language->get('direction');
		$this->data['language'] = $this->language->get('code');

		$this->load->model('sale/order');

		$this->load->model('setting/setting');

		$this->data['orders'] = array();

		$orders = array();

		if (isset($this->request->post['selected'])) {
			$orders = $this->request->post['selected'];
		} elseif (isset($this->request->get['order_id'])) {
			$orders[] = $this->request->get['order_id'];
		}

                $param=array();
		foreach ($orders as $kjtorder_id) {
                    $param[]=$kjtorder_id;
		}
                
                
                $submit_url='method=Invoice.FEPBillPost&version=1.0&appid='.appid.'&format=json&timestamp=20150524123300&nonce=321435333&data={"OrderIds":'.json_encode($param).',"SalesChannelCode":"22"}';
                $sign=new sign();
                $sign_url=$sign->create($submit_url, secretkey);
                
                $url='http://api.kjt.com/open.api?'.$sign_url["url"].'sign='.$sign_url["sign"];
                $html = file_get_contents($url); 
                
            //$file = fopen("submitgouhui_log.txt",'a'); fwrite($file,$html."\n");   fclose($file);
            //$html='{"Code":"0","Desc":"操作成功!","Data":{"FEPBillId":100834,"PurchasingTotalAmount":58.000000}}';
             $json=json_decode($html, true);
             if($json["Code"]==0)
             {
                 foreach ($orders as $kjtorder_id) 
                {
                    $this->model_sale_order->updateOrder($kjtorder_id,$json["Data"]["FEPBillId"],$json["Data"]["PurchasingTotalAmount"]);
		}
                 
                echo '<script>alert("提交成功");window.close(); </script>';
             }else
             {
                 echo '<script>alert("提交失败:'.$json["Desc"].'");window.close(); </script>';
             }
	}
	

}
?>