<?php echo $checkout_header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
    <div >
        <?php 
        foreach ($paymentorders as $order) 
        { 
            
            echo '<div style=" width: 100%; height:100px; margin-top: 20px;">'.$order['button']."</div>"; 
            echo '<hr style="margin-top: 20px;" />'; 
         }
         ?>
         
    </div>

 <?php echo $content_bottom; ?>
</div>
<?php echo $footer; ?>