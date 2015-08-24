<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of kjt_order
 *
 * @author zhangbo
 */

class kjt_order {
   public $SaleChannelSysNo;    //渠道编号
   public $MerchantOrderID;     //订单在商家销售平台上的唯一编号
   public $ServerType;          //S01：一般进口 S02：保税区进口 为空默认 S02 
   public $WarehouseID;         //订单出库仓库在 Kjt平台的编号 
   public $PayInfo;             //订单支付信息
   public $ShippingInfo;        //订单配送信息
   public $AuthenticationInfo;  //下单用户实名认证信息 
   public $ItemList;            //订单中购买商品列表
   function __construct($scsn,$moi,$sy,$wi,$pi,$si,$ai,$il) 
    {
       $this->SaleChannelSysNo=$scsn;
       $this->MerchantOrderID=$moi;
       $this->ServerType=$sy;
       $this->WarehouseID=$wi;
       $this->PayInfo=$pi;
       $this->ShippingInfo=$si;
       $this->AuthenticationInfo=$ai;
       $this->ItemList=$il;
    }
    
    
    
   

}


?>