 <?php if ($error_warning) { ?>
  <div class="alert alert-error"><?php echo $error_warning; ?><a class="close" data-dismiss="alert">×</a></div>
  <?php } ?>

  <div class="box">
    <div class="heading">
      <h2><?php echo $heading_title; ?></h2>
      <div class="buttons"><button onclick="$('#form').submit();" class="btn btn-primary"><?php echo $button_save; ?></button> <button onclick="location = '<?php echo $cancel; ?>';" class="btn"><?php echo $button_cancel; ?></button></div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="form">
          <tr>
            <td><span class="required">*</span> <?php echo $entry_name; ?></td>
            <td><input type="text" name="name" value="<?php echo $name; ?>" />
              <?php if ($error_name) { ?>
              <span class="error"><?php echo $error_name; ?></span>
              <?php } ?></td>
          </tr>
        </table>
        <br />
        <table id="route" class="list">
          <thead>
            <tr>
              <td class="left"><?php echo $entry_store; ?></td>
              <td class="left"><?php echo $entry_route; ?></td>
              <td></td>
            </tr>
          </thead>
          <?php $route_row = 0; ?>
          <?php foreach ($layout_routes as $layout_route) { ?>
          <tbody id="route-row<?php echo $route_row; ?>">
            <tr>
              <td class="left"><select name="layout_route[<?php echo $route_row; ?>][store_id]">
                  <option value="0"><?php echo $text_default; ?></option>
                  <?php foreach ($stores as $store) { ?>
                  <?php if ($store['store_id'] == $layout_route['store_id']) { ?>
                  <option value="<?php echo $store['store_id']; ?>" selected="selected"><?php echo $store['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $store['store_id']; ?>"><?php echo $store['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
              <td class="left"><input type="text" name="layout_route[<?php echo $route_row; ?>][route]" value="<?php echo $layout_route['route']; ?>" /></td>
              <td class="left"><a onclick="$('#route-row<?php echo $route_row; ?>').remove();" class="button"><span><?php echo $button_remove; ?></span></a></td>
            </tr>
          </tbody>
          <?php $route_row++; ?>
          <?php } ?>
          <tfoot>
            <tr>
              <td colspan="2"></td>
              <td class="left"><a onclick="addRoute();" class="button"><span><?php echo $button_add_route; ?></span></a></td>
            </tr>
          </tfoot>
        </table>
      </form>
    </div>
  </div>

<script type="text/javascript"><!--
var route_row = <?php echo $route_row; ?>;

function addRoute() {
	html  = '<tbody id="route-row' + route_row + '">';
	html += '  <tr>';
	html += '    <td class="left"><select name="layout_route[' + route_row + '][store_id]">';
	html += '    <option value="0"><?php echo $text_default; ?></option>';
	<?php foreach ($stores as $store) { ?>
	html += '<option value="<?php echo $store['store_id']; ?>"><?php echo addslashes($store['name']); ?></option>';
	<?php } ?>   
	html += '    </select></td>';
	html += '    <td class="left"><input type="text" name="layout_route[' + route_row + '][route]" value="" /></td>';
	html += '    <td class="left"><a onclick="$(\'#route-row' + route_row + '\').remove();" class="button"><span><?php echo $button_remove; ?></span></a></td>';
	html += '  </tr>';
	html += '</tbody>';
	
	$('#route > tfoot').before(html);
	
	route_row++;
}
//--></script> 
