<?php 
header("content-type:text/html; charset=utf-8");
class ControllerPaymentProductcallbacktax extends Controller{

	public function index(){
			$content = urldecode(file_get_contents("php://input")); 
			$content=str_replace('EData=','',$content);

		$istrue=false;
		try{
				$json=json_decode($content, true); 

				
		/*		foreach($json['cargoes'] as $ces)
				{
					if($ces['status']=='1')
						$istrue=true;
				}*/	
				
				foreach($json['cargoes'] as $ces)
				{
					if($ces['status']=='1')
						$istrue=true;
				}
				
		}catch (Exception $e)
		 { $istrue=false;}
		
		$file = fopen("log.txt",'a');fwrite($file,"\r\n\r\ntax_product_back:".$content."\r\n---------");fclose($file);
		
		if($istrue)
		{
			echo 'SUCCESS';
		}else
		{
			echo 'FAILURE';
			
		}
}}

 ?>