<?php
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of sign
 *
 * @author zhangbo
 */
class sign
{
    public function create($submit_url,$appSecret) 
    {
        $tempurl="";
        $prams=explode("&",$submit_url);//使用&切割字符串为数组
        sort($prams);//参数排序
        foreach ($prams as $ttt)
        {
            $pvs=  explode("=", $ttt);
            $tempurl.=$pvs[0]."=".urlencode($pvs[1]).'&';//重组url 并且urlencode参数值
        }
        return array("sign"=>md5($tempurl.$appSecret),"url"=>$tempurl); //返回签名 和 重组url
    }
}
?>
