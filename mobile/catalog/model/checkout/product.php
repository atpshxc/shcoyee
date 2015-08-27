<?php
class ModelCheckoutProduct extends Model {
	
       
        public function update($pid,$qt) 
        {
            if(floatval($qt)==0)
            {
                $sql="UPDATE " . DB_PREFIX . "product SET quantity =".$qt."  WHERE  sku ='".$pid."'";
            }
            else if(floatval($qt)>0)
            {
                $sql="UPDATE " . DB_PREFIX . "product SET quantity =quantity+".$qt."  WHERE  sku ='".$pid."'";
            }else
            {
                $sql="UPDATE " . DB_PREFIX . "product SET quantity =quantity-".$qt."  WHERE  sku ='".$pid."'";
            }
            $this->db->query($sql);
        }
}
?>