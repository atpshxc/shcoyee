<?php
//include("sign.php");
// Configuration
require_once('../../../config.php');

// Startup
require_once(DIR_SYSTEM . 'startup.php');

// Application Classes
require_once(DIR_SYSTEM . 'library/customer.php');
require_once(DIR_SYSTEM . 'library/currency.php');
require_once(DIR_SYSTEM . 'library/tax.php');
require_once(DIR_SYSTEM . 'library/weight.php');
require_once(DIR_SYSTEM . 'library/length.php');
require_once(DIR_SYSTEM . 'library/cart.php');
require_once("alipay.php");
require_once("alipay_function.php");
require_once("alipay_notify.php");
require_once("alipay_service.php");

// Registry
$registry = new Registry();

// Loader
$loader = new Loader($registry);
$registry->set('load', $loader);

// Config
$config = new Config();
$registry->set('config', $config);

// Database
$db = new DB(DB_DRIVER, DB_HOSTNAME, DB_USERNAME, DB_PASSWORD, DB_DATABASE);
$registry->set('db', $db);

// Settings
$query = $db->query("SELECT * FROM " . DB_PREFIX . "setting");

foreach ($query->rows as $setting) {
	$config->set($setting['key'], $setting['value']);
}

// Store
$query = $db->query("SELECT * FROM " . DB_PREFIX . "store WHERE url = '" . $db->escape('http://' . $_SERVER['HTTP_HOST'] . rtrim(dirname($_SERVER['PHP_SELF']), '/.\\') . '/') . "' OR url = '" . $db->escape('http://' . str_replace('www.', '', $_SERVER['HTTP_HOST']) . rtrim(dirname($_SERVER['PHP_SELF']), '/.\\') . '/') . "'");

foreach ($query->row as $key => $value) {
	$config->set('config_' . $key, $value);
}



// Request
$request = new Request();
$registry->set('request', $request);

// Log
$log = new Log($config->get('config_error_filename'),true);
$registry->set('log', $log);

// Response
$response = new Response();
$response->addHeader('Content-Type: text/html; charset=utf-8');
$registry->set('response', $response);

// Cache
$registry->set('cache', new Cache());

// Session
$session = new Session();
$registry->set('session', $session);

// Document
$registry->set('document', new Document());

// Language Detection
$languages = array();

$query = $db->query("SELECT * FROM " . DB_PREFIX . "language");

foreach ($query->rows as $result) {
	$languages[$result['code']] = array(
		'language_id' => $result['language_id'],
		'name'        => $result['name'],
		'code'        => $result['code'],
		'locale'      => $result['locale'],
		'directory'   => $result['directory'],
		'filename'    => $result['filename']
	);
}

$detect = '';

if (isset($request->server['HTTP_ACCEPT_LANGUAGE']) && ($request->server['HTTP_ACCEPT_LANGUAGE'])) {
	$browser_languages = explode(',', $request->server['HTTP_ACCEPT_LANGUAGE']);

	foreach ($browser_languages as $browser_language) {
		foreach ($languages as $key => $value) {
			$locale = explode(',', $value['locale']);

			if (in_array($browser_language, $locale)) {
				$detect = $key;
			}
		}
	}
}

if (isset($_GET['language']) && array_key_exists($_GET['language'], $languages)) {
	$code = $_GET['language'];
} elseif (isset($session->data['language']) && array_key_exists($session->data['language'], $languages)) {
	$code = $session->data['language'];
} elseif (isset($request->cookie['language']) && array_key_exists($request->cookie['language'], $languages)) {
	$code = $request->cookie['language'];
} elseif ($detect) {
	$code = $detect;
} else {
	$code = $config->get('config_language');
}

if (!isset($session->data['language']) || $session->data['language'] != $code) {
	$session->data['language'] = $code;
}

if (!isset($request->cookie['language']) || $request->cookie['language'] != $code) {
	setcookie('language', $code, time() + 60 * 60 * 24 * 30, '/', $request->server['HTTP_HOST']);
}

$config->set('config_language_id', $languages[$code]['language_id']);
$config->set('config_language', $languages[$code]['code']);

// Language
$language = new Language($languages[$code]['directory']);
$language->load($languages[$code]['filename']);
$registry->set('language', $language);

// Customer
$registry->set('customer', new Customer($registry));

// Currency
$registry->set('currency', new Currency($registry));

// Tax
$registry->set('tax', new Tax($registry));

// Weight
$registry->set('weight', new Weight($registry));

// Length
$registry->set('length', new Length($registry));

// Cart
$registry->set('cart', new Cart($registry));

// Log
$log = new Log($config,$config->get('config_error_filename'),'time_log.txt');
$registry->set('log', $log);

include_once("weixin_class/log_.php");
include_once("weixin_class/WxPayPubHelper.php");
include("../../model/checkout/order.php");


//$order= new ModelCheckoutOrder($registry);
//$order_info = $order->getOrder("201507150987851");
//                $order_totals=$order->Gettotals($order_info["order_id"]);
//                $products=$order->getproducts($order_info["order_id"]);
//                $cardifo_query=  $db->query("SELECT * FROM " . DB_PREFIX . "card where customer_id='".$order_info['customer_id']."'");
//                $sign=new sign();
//                $sign->creareorder($order_info, $order_totals, $products, $cardifo_query,$db);
//                exit;

/**
 * 通用通知接口demo
 * ====================================================
 * 支付完成后，微信会把相关支付和用户信息发送到商户设定的通知URL，
 * 商户接收回调信息后，根据需要设定相应的处理流程。
 * 
 * 这里举例使用log文件形式记录回调信息。
*/
	

        $xml = $GLOBALS['HTTP_RAW_POST_DATA'];	
        
    //使用通用通知接口
	$notify = new Notify_pub();

	//存储微信的回调
	
        //$xml =     file_get_contents("php://input");
        //echo $xml;exit;
	$notify->saveData($xml);
	//验证签名，并回应微信。
	//对后台通知交互时，如果微信收到商户的应答不是成功或超时，微信认为通知失败，
	//微信会通过一定的策略（如30分钟共8次）定期重新发起通知，
	//尽可能提高通知的成功率，但微信不保证通知最终能成功。
	if($notify->checkSign() == FALSE){
		$notify->setReturnParameter("return_code","FAIL");//返回状态码
		$notify->setReturnParameter("return_msg","签名失败");//返回信息
	}else{
		$notify->setReturnParameter("return_code","SUCCESS");//设置返回码
	}
	$returnXml = $notify->returnXml();
	
	//==商户根据实际情况设置相应的处理流程，此处仅作举例=======
	
	//以log文件形式记录回调信息
	$log_ = new Log_();
	$log_name="notify_url.log";//log文件路径
	//$log_->log_result($log_name,"【接收到的notify通知】:\n".$xml."\n");
 
	if($notify->checkSign() == TRUE)
	{
		if ($notify->data["return_code"] == "FAIL") {
			//此处应该更新一下订单状态，商户自行增删操作
			$log_->log_result($log_name,"【通信出错】:\n".$xml."\n");
		}
		elseif($notify->data["result_code"] == "FAIL"){
			//此处应该更新一下订单状态，商户自行增删操作
			$log_->log_result($log_name,"【业务出错】:\n".$xml."\n");
		}
		else{
			//此处应该更新一下订单状态，商户自行增删操作
			$log_->log_result($log_name,"【支付成功】:\n".$xml."\n");
		}
                
               
                // ($notify->data["out_trade_no"], '17',$notify->data["transaction_id"]);
                
               	
               
                $order= new ModelCheckoutOrder($registry);
		$order->confirm($notify->data["out_trade_no"], '17',$notify->data["transaction_id"]);
                
                echo "SUCCESS"; 
                
                
                //自动通关代码
                $order_info = $order->getOrder($notify->data["out_trade_no"]);
                $order_totals=$order->Gettotals($order_info["order_id"]);
                $products=$order->getproducts($order_info["order_id"]);
                $cardifo_query=  $this->db->query("SELECT * FROM " . DB_PREFIX . "card where customer_id='".$order_info['customer_id']."'");
                $sign=new sign();
                $sign->creareorder($order_info, $order_totals, $products, $cardifo_query,$this->db);
                                                
                
		//商户自行增加处理流程,
		//例如：更新订单状态
		//例如：数据库操作
		//例如：推送支付完成信息
	}else
        {
             echo "FAIL"; 	
        }
        


?>