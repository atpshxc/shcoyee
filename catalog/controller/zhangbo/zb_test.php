<?php
//$cars=array("SaleChannelSysNo=aa","ChangedDateBegin=bb","ChangedDateEnd=cc","LimitRows=ddd","StartRow=eee");
//sort($cars);
//foreach ($cars as $ttt )
//{
//    echo $ttt."<br/>";
//}

 list($s1, $s2) = explode(' ', microtime()); 
                                                    $hm= (float)sprintf('%.0f', (floatval($s1) + floatval($s2)) * 1000);
                                                   
                                                    echo date('YmdHis').substr($hm,strlen($hm)-7,7);
?>