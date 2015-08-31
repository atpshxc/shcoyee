<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<?php if ($payment_methods) { ?>
<div class="zffs_zfpt">
            <ul>
               <?php foreach ($payment_methods as $payment_method) { ?>
              <li style="height:80px;width:25%;">
                  <label style="height:30px;">
                      <?php
                        if ($payment_method['code'] == $payment_code &&  $payment_code!='') { ?>
                           <input type="radio" name="payment_method" onclick="selectpaymentmethod();" value="<?php echo $payment_method['code']; ?>" id="<?php echo $payment_method['code']; ?>" checked="checked" />
                          <?php } else { ?>
                          <input type="radio" name="payment_method" onclick="selectpaymentmethod();" value="<?php echo $payment_method['code']; ?>" id="<?php echo $payment_method['code']; ?>"   />
                          <?php } ?>
                  </label>
                  <label for="<?php echo $payment_method['code']; ?>"><img class="responsive" src="<?php echo HTTP_SERVER?>/catalog/view/theme/new/images/<?php echo $payment_method['code']; ?>.gif" width="127" height="40" /></label>
              </li>
               <?php } ?>
            </ul>
          </div>
<?php } ?>

