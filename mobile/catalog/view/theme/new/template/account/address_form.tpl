<?php echo $header; ?><?php echo $column_right; ?>
<?php echo $content_top; ?>
<style>
    .table03 tr td{ padding: 6px 0;}
    .input01{ border: 1px solid #e0e0e0; height: 30px; line-height: 30px; margin-left: 5px; text-indent: 5px;}
    .xgxx{ background: #c40001; padding:0 12px; height: 28px; line-height: 28px; color: #fff; display: block; text-align: center; cursor: pointer; margin-left: 5px; }
    .xgxx:hover{ background: #ff3048;}
</style>

  <!--帮助中心-->
<div class="bg">
  <div class="w1200 pt15">
    <div class="left w150">
       <?php echo $column_left; ?>
    </div>
    <div class="right w1028">
      <p class="w1028_bt bold"><?php echo $heading_title; ?></p>
      
      
<div id="content"><?php echo $content_top; ?>

   
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="address" class=" mt15">
        <h2 class="f14w red"><?php echo $text_edit_address; ?></h2>
    <div class="content mt15">
      <table class="form table03">
        <tr>
          <td><span class="required hs">*</span> <?php echo $entry_firstname; ?></td>
          <td><input type="text" name="firstname" value="<?php echo $firstname; ?>"  class=" input01"/>
            <?php if ($error_firstname) { ?>
            <span class="error"><?php echo $error_firstname; ?></span>
            <?php } ?></td>
        </tr>
     <tr>
          <td><span class="required hs">*</span> <?php echo $entry_zone; ?></td>
          <td><select name="zone_id"  onchange="$('select[name=\'city_id\']').load('index.php?route=common/localisation/city&zone_id=' + this.value);" class=" input01">
            </select>
            <?php if ($error_zone) { ?>
            <span class="error"><?php echo $error_zone; ?></span>
            <?php } ?></td>
        </tr>
         <tr>
	      <td><span class="required hs">*</span> <?php echo $entry_city; ?></td>
	      <td><select name="city_id" class="middle-field input01"> </select>
		      <?php if ($error_city) { ?>
	            <span class="error"><?php echo $error_city; ?></span>
	          <?php } ?>
	       </td>
	    </tr>
       <tr>
          <td><span class="required hs">*</span> <?php echo $entry_address_1; ?></td>
          <td><input type="text" name="address_1" value="<?php echo $address_1; ?>" class=" input01" />
            <?php if ($error_address_1) { ?>
            <span class="error"><?php echo $error_address_1; ?></span>
            <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_address_2; ?></td>
          <td><input type="text" name="address_2" value="<?php echo $address_2; ?>" class=" input01" /></td>
        </tr>
        <tr>
          <td><span class="required hs">*</span> <?php echo $entry_postcode; ?></td>
          <td><input type="text" name="postcode" value="<?php echo $postcode; ?>"  class=" input01"/>
            <?php if ($error_postcode) { ?>
            <span class="error"><?php echo $error_postcode; ?></span>
            <?php } ?></td>
        </tr>
        <tr>
          <td><span class="required hs">*</span> <?php echo $entry_mobile; ?></td>
          <td><input type="text" name="mobile" value="<?php echo $mobile; ?>"  class=" input01"/>
            <?php if ($error_mobile) { ?>
            <span class="error"><?php echo $error_mobile; ?></span>
            <?php } ?></td>
        </tr>
        <tr>
          <td> <?php echo $entry_phone; ?></td>
          <td><input type="text" name="phone" value="<?php echo $phone; ?>"  class=" input01"/>
           </td>
        </tr>
        <tr>
          <td><?php echo $entry_default; ?></td>
          <td><?php if ($default) { ?>
            <input type="radio" name="default" value="1" checked="checked" />
            <?php echo $text_yes; ?>
            <input type="radio" name="default" value="0" />
            <?php echo $text_no; ?>
            <?php } else { ?>
            <input type="radio" name="default" value="1" />
            <?php echo $text_yes; ?>
            <input type="radio" name="default" value="0" checked="checked" />
            <?php echo $text_no; ?>
            <?php } ?></td>
        </tr>
        <tr><td>&nbsp;</td>
        <td><div class="left"><a onclick="$('#address').submit();" class="button xgxx"><span><?php echo $button_confirm; ?></span></a></div></td>
        </tr>
      </table>
    </div>
  </form>
  <?php echo $content_bottom; ?></div>
<script type="text/javascript"><!--
	$('select[name=\'zone_id\']').load('index.php?route=common/localisation/zone&country_id=<?php echo $country_id; ?>&zone_id=<?php echo $zone_id; ?>');
	$('select[name=\'city_id\']').load('index.php?route=common/localisation/city&zone_id=<?php echo $zone_id; ?>&city_id=<?php echo $city_id; ?>');
//--></script> 
  
  
  
    </div>
  </div>
</div>
  
  
  
<?php echo $footer; ?>