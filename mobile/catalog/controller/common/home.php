<?php  
class ControllerCommonHome extends Controller {
	public function index() {

		
		$this->document->setTitle($this->config->get('config_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));

		$this->data['heading_title'] = $this->config->get('config_title');

		if (file_exists(DIR_MOBILE_TEMPLATE . $this->config->get('config_template') . '/template/common/home.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/home.tpl';
		} else {
			$this->template = 'default/template/common/home.tpl';
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

	protected function getChild($child, $args = array()) {
           
		$action = new MobileAction($child, $args);
		$file = $action->getFile();
		$class = $action->getClass();
		$method = $action->getMethod();
//echo $file.'<br/>';
		if (file_exists($file)) {
			require_once($file);

			$controller = new $class($this->registry);
			
			$controller->$method($args);
			
			return $controller->output;
		} else {
			exit('Error: Could not load controller ' . $child . '!');
		}		
	}

	protected function render() {
		if ($this->layout) { 
    		return $this->render_with_layout();
		}else{
			return $this->render_old();
		}
	}
	
	// we keeep this method just make all old opencart part work with shopilex as well
	private function render_old() {
		/*foreach ($this->children as $child) {
			echo $this->getChild($child);
			$this->data[basename($child)] = $this->getChild($child);
		}*/
	
		if (file_exists(DIR_MOBILE_TEMPLATE . $this->template)) {
			extract($this->data);
				
			ob_start();
	
			require(DIR_MOBILE_TEMPLATE . $this->template);
	
			$this->output = ob_get_contents();
	
			ob_end_clean();
	
			return $this->output;
		} else {
			exit('Error: Could not load template ' . DIR_MOBILE_TEMPLATE . $this->template . '!');
		}
	}

	private function render_with_layout() {
		$file = DIR_MOBILE_TEMPLATE.$this->template;
		
		if (file_exists($file)) {
			extract($this->data);
				
			ob_start();
	
			require($file);
	
			$this->output = ob_get_contents();
	
			ob_end_clean();

		} else {
			exit('Error: Could not load template 11 ' . DIR_MOBILE_TEMPLATE . $this->template . '!');
		}
		 
		if ($this->layout) {
			$file  = DIR_APPLICATION . 'controller/' . $this->layout . '.php';
			$class = 'Controller' . preg_replace('/[^a-zA-Z0-9]/', '', $this->layout);
				
			if (file_exists($file)) {
				require_once($file);
	
				$controller = new $class($this->registry);
	
	
				$controller->data[$this->id] = $this->output;
	
				$controller->init();
				
				foreach ($controller->getChildren() as $child) {
					$controller->data[basename($child)] = $this->getChild($child);
				}
				
				$controller->before($this->data);
				 
				$controller->excute();
	
				$this->output = $controller->output;
	
				$controller->after($this->data);
			} else {
				exit('Error: Could not load controller ' . $this->layout . '!');
			}
		}
	
		$this->response->setOutput($this->output);
	}
	
}
?>