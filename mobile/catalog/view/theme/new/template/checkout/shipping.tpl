<?php
if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<?php if ($shipping_methods) { ?>
  <?php foreach ($shipping_methods as $shipping_method) { ?>
  <?php if (!$shipping_method['error']) { ?>
  <?php foreach ($shipping_method['quote'] as $quote) { ?>
  <li class="curr" sysno="13718160" aid="2046">
          <label for="<?php echo $quote['code']; ?>">
              <?php if ($quote['code'] == $shipping_code && $shipping_code!='')
              { ?>
              <input type="radio" name="shipping_method" onclick="selectshppingmethod();" value="<?php echo $quote['code']; ?>" id="<?php echo $quote['code']; ?>" checked="checked" />
        <?php } else { ?>
                <input type="radio" name="shipping_method"  onclick="selectshppingmethod();" value="<?php echo $quote['code']; ?>" id="<?php echo $quote['code']; ?>" />
        <?php } ?>
            <span class="addrinfo" style="width:200px;"> &nbsp;<label for="<?php echo $quote['code']; ?>"><?php echo $quote['title']; ?></label></span></label><label for="<?php echo $quote['code']; ?>"><?php echo $quote['text']; ?><span class="help"><?php echo $shipping_method['description']; ?></span></label>
        </li>
  <?php } ?>
  <?php } else { ?>
  <li class="curr" sysno="13718160" aid="2046">
          <label>
            <span class="addrinfo"><?php echo $shipping_method['error']; ?></span></label>
  </li>
  <?php } ?>
  <?php } ?>
<?php } ?>


