<?php
$tax_key='467567s2ff05435311967978978979798923gsdgsgsggd';


$xml='{';
$xml.='"version":"v1.2",';
$xml.='"commitTime":"'.date('Ymdhis',time()).'",';
$xml.='"coName":"上海可益生物技术有限公司",';
$xml.='"coCode":"SHKY001",';
$xml.='"serialNumber":"SHKY'.date('Ymdhis',time()).'",';
$xml.='"cargoes":[';
			$xml.='{';
						$xml.='"cargoCode":"551778",';
						$xml.='"cargoBrand":"MACA",';
						$xml.='"cargoNameCh":"拉摩力拉玛卡",';
						$xml.='"cargoNameEh":"LaMolina Maca",';
						$xml.='"cargoModel":"马卡系列",';
						$xml.='"cargoSpec":"30k/瓶",';
						$xml.='"cargoPlace":"日本",';
						$xml.='"cargoFunction":"直接咽服",';
						$xml.='"cargoPurpose":"增强体质",';
						$xml.='"cargoIngredient":"玛卡根粉末、微晶纤维素",';
						$xml.='"cargoFactoryDate":"",';
						$xml.='"cargoUnit":"克",';
						$xml.='"cargoUnitNum":3.37,';
						$xml.='"cargoPrice":318,';
						$xml.='"cargoGrossWT":50,';
						$xml.='"cargoNetWT":30,';
						$xml.='"serverType":"S02",';
						$xml.='"customsCode":"2244",';
						$xml.='"copGNo":"LaMolina",';
						$xml.='"materialID":"312264002S4000000076",';
						$xml.='"beianUnit":"瓶",';
						$xml.='"beianQty":1000';
			$xml.='}';
		$xml.='],';
$xml.='"operationCode":"1",';
$xml.='"spt":""
}';



$sigkey=strtoupper(md5($xml.$tax_key));	
		$data='EData='.urlencode($xml).'&SignMsg='.$sigkey;

		$ch = curl_init ('http://61.152.165.77:8081/cboi/cargo/cargolist.htm');
		curl_setopt ( $ch, CURLOPT_CUSTOMREQUEST, "POST" );
		curl_setopt ( $ch, CURLOPT_RETURNTRANSFER, true );
		curl_setopt ( $ch, CURLOPT_POSTFIELDS, $data );
		curl_setopt ( $ch, CURLOPT_SSL_VERIFYPEER, false );
		curl_setopt ( $ch, CURLOPT_SSL_VERIFYHOST, false );
		curl_setopt ( $ch, CURLOPT_HTTPHEADER, array(
														'Content-Type:application/x-www-form-urlencoded',
														'Content-Length: ' . strlen ( $data ),
														'Connection: Keep-Alive'
													)
					);
					
		$result = curl_exec ( $ch );
		$errorNo = curl_errno ( $ch );
		curl_close ( $ch );
		
		$jsond=json_decode(urldecode($result), true); 
		
		$djson=json_decode($xml);
		$file = fopen("log.txt",'a');
		fwrite($file,"\r\n\r\n\r\ntax_product：\r\n ");
		fwrite($file,"result_json:".urldecode($result)."\r\n\r\n");
		
		fwrite($file,"-------------------------------------------------------------------------");
		fclose($file);
		
		
		if($jsond['status']=='SUCCESS')
		{
			echo 'SUCCESS';
		}else
		{
			echo 'FAILURE';
			}
?>