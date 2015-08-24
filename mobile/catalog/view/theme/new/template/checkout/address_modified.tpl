<form class="form_newaddr" name="form_newaddr" >
          <ul>
            <li>
              <label><?php echo $entry_firstname; ?></label>
              <input style="width: 210px;" type="text" class="intxt" name="firstname" value="">
              <span class="need">*</span> <span class="Validform_checktip"></span> </li>
            <li>
              <label><?php echo $entry_zone; ?></label>
              <select name="zone_id" class="sys_select"  onchange="$('.form_newaddr select[name=\'city_id\']').load('index.php?route=common/localisation/city&zone_id=' + this.value);$('#city_id').show();$('input[name=\'city\']').val('');"></select>
              <select id="city_id" name="city_id" style=" display: none;" class="sys_select" onchange="$('input[name=\'city\']').val($(this).find('option:selected').text())">
              <input type="text" name="city" value="" style=" display: none;" />
              <span class="need">*</span> <span class="Validform_checktip"></span> </li>
            <li>
              <label><?php echo $entry_address_1; ?></label>
              <input style="width: 430px;" name="address_1" type="text" class="intxt">
              <span class="need">*</span> </li>
            <li>
              <label><?php echo $entry_postcode; ?></label>
              <input style="width: 210px;" type="text" class="intxt" name="postcode" value="">
              <span class="need">*</span> <span class="Validform_checktip"></span> </li>
            <li>
              <label><?php echo $entry_mobile; ?></label>
              <input style="width: 210px;" type="text" class="intxt" name="mobile" value="">
              <span class="need">*</span> <span class="Validform_checktip"></span> 
            </li>
          </ul>
          <p class="action"> <a href="javascript:addadd();" class="btn"><span>保存地址</span></a> </p>
</form>
