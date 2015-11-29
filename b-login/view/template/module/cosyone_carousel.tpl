<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  
  <?php } if ($success) { echo '<div class="success">' . $success . '</div>'; ?>
  
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons">
      
      <a class="button" onclick="$('#applystay').val('1');$('#form').submit();">Save and stay</a>
      
      <a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <table id="module" class="list">
          <thead>
            <tr>
              <td class="left"><?php echo $entry_name; ?></td>
              <td class="left"><?php echo $entry_banner; ?></td>
              <td class="left"><?php echo $entry_columns; ?></td>
              <td class="left"><?php echo $entry_image; ?></td>
              <td class="left"><?php echo $entry_layout; ?></td>
              <td class="left"><?php echo $entry_position; ?></td>
              <td class="left"><?php echo $entry_status; ?></td>
              <td class="right"><?php echo $entry_sort_order; ?></td>
              <td></td>
            </tr>
          </thead>
          <?php $module_row = 0; ?>
          <?php foreach ($modules as $module) { ?>
          <tbody id="module-row<?php echo $module_row; ?>">
            <tr>
            <td class="left">
            
            <?php foreach ($languages as $language) { ?>
            <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
            <input type="text" name="cosyone_carousel_module[<?php echo $module_row; ?>][name][<?php echo $language['language_id']; ?>]" value ="<?php echo isset($module['name'][$language['language_id']]) ? $module['name'][$language['language_id']] : ''; ?>" size="30"><br />
            <?php } ?>
            
            </td>
              <td class="left"><select name="cosyone_carousel_module[<?php echo $module_row; ?>][banner_id]">
                  <?php foreach ($banners as $banner) { ?>
                  <?php if ($banner['banner_id'] == $module['banner_id']) { ?>
                  <option value="<?php echo $banner['banner_id']; ?>" selected="selected"><?php echo $banner['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $banner['banner_id']; ?>"><?php echo $banner['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
              <td class="left">
              <select name="cosyone_carousel_module[<?php echo $module_row; ?>][columns]">
                  <?php if ($module['columns'] == '[[0, 2], [320, 3], [550, 4], [999, 5], [1200, 6]]') { ?>
                  <option value="[[0, 2], [320, 3], [550, 4], [999, 5], [1200, 6]]" selected="selected">6</option>
                  <?php } else { ?>
                  <option value="[[0, 2], [320, 3], [550, 4], [999, 5], [1200, 6]]">6</option>
                  <?php } ?>
                  <?php if ($module['columns'] == '[[0, 2], [550, 3], [999, 5]]') { ?>
                  <option value="[[0, 2], [550, 3], [999, 5]]" selected="selected">5</option>
                  <?php } else { ?>
                  <option value="[[0, 2], [550, 3], [999, 5]]">5</option>
                  <?php } ?>
                  <?php if ($module['columns'] == '[[0, 2], [550, 3], [999, 4]]') { ?>
                  <option value="[[0, 2], [550, 3], [999, 4]]" selected="selected">4</option>
                  <?php } else { ?>
                  <option value="[[0, 2], [550, 3], [999, 4]]">4</option>
                  <?php } ?>
                  <?php if ($module['columns'] == '[[0, 2], [550, 3]]') { ?>
                  <option value="[[0, 2], [550, 3]]" selected="selected">3</option>
                  <?php } else { ?>
                  <option value="[[0, 2], [550, 3]]">3</option>
                  <?php } ?>
                  <?php if ($module['columns'] == '[[0, 1], [400, 2]]') { ?>
                  <option value="[[0, 1], [400, 2]]" selected="selected">2</option>
                  <?php } else { ?>
                  <option value="[[0, 1], [400, 2]]">2</option>
                  <?php } ?>
                  <?php if ($module['columns'] == '[[0, 1]]') { ?>
                  <option value="[[0, 1]]" selected="selected">1</option>
                  <?php } else { ?>
                  <option value="[[0, 1]]">1</option>
                  <?php } ?>
                </select>
              </td>
              <td class="left"><input type="text" name="cosyone_carousel_module[<?php echo $module_row; ?>][width]" value="<?php echo $module['width']; ?>" size="3" />
                <input type="text" name="cosyone_carousel_module[<?php echo $module_row; ?>][height]" value="<?php echo $module['height']; ?>" size="3" />
                <?php if (isset($error_image[$module_row])) { ?>
                <span class="error"><?php echo $error_image[$module_row]; ?></span>
                <?php } ?></td>
              <td class="left"><select name="cosyone_carousel_module[<?php echo $module_row; ?>][layout_id]">
                  <?php foreach ($layouts as $layout) { ?>
                  <?php if ($layout['layout_id'] == $module['layout_id']) { ?>
                  <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
              <td class="left"><select name="cosyone_carousel_module[<?php echo $module_row; ?>][position]">
                  <?php if ($module['position'] == 'content_top') { ?>
                  <option value="content_top" selected="selected"><?php echo $text_content_top; ?></option>
                  <?php } else { ?>
                  <option value="content_top"><?php echo $text_content_top; ?></option>
                  <?php } ?>
                  <?php if ($module['position'] == 'content_bottom_half') { ?>
                <option value="content_bottom_half" selected="selected">Home content middle (50% width)</option>
                <?php } else { ?>
                <option value="content_bottom_half">Home content middle (50% width)</option>
                <?php } ?>
                <?php if ($module['position'] == 'content_bottom') { ?>
                  <option value="content_bottom" selected="selected"><?php echo $text_content_bottom; ?></option>
                  <?php } else { ?>
                  <option value="content_bottom"><?php echo $text_content_bottom; ?></option>
                  <?php } ?>
                  <?php if ($module['position'] == 'column_left') { ?>
                  <option value="column_left" selected="selected"><?php echo $text_column_left; ?></option>
                  <?php } else { ?>
                  <option value="column_left"><?php echo $text_column_left; ?></option>
                  <?php } ?>
                  <?php if ($module['position'] == 'column_right') { ?>
                  <option value="column_right" selected="selected"><?php echo $text_column_right; ?></option>
                  <?php } else { ?>
                  <option value="column_right"><?php echo $text_column_right; ?></option>
                  <?php } ?>
                </select></td>
              <td class="left"><select name="cosyone_carousel_module[<?php echo $module_row; ?>][status]">
                  <?php if ($module['status']) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
              <td class="right"><input type="text" name="cosyone_carousel_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>" size="3" /></td>
              <td class="left"><a onclick="$('#module-row<?php echo $module_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td>
            </tr>
          </tbody>
          <?php $module_row++; ?>
          <?php } ?>
          <tfoot>
            <tr>
              <td colspan="8"></td>
              <td class="left"><a onclick="addModule();" class="button"><?php echo $button_add_module; ?></a></td>
            </tr>
          </tfoot>
        </table>
      
      <input type="hidden" name="continue" id="applystay" value="0">
      
      </form>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
var module_row = <?php echo $module_row; ?>;

function addModule() {	
	html  = '<tbody id="module-row' + module_row + '">';
	html += '  <tr>';
	
	html += '  <tr>';
	html += '  <td class="left">';
	<?php foreach ($languages as $language) { ?>
	html += '    <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <input type="text" name="cosyone_carousel_module[' + module_row + '][name][<?php echo $language['language_id']; ?>]" value="" size="30" /></br>';
	<?php } ?>
	html += '  </td>';
	
	html += '    <td class="left"><select name="cosyone_carousel_module[' + module_row + '][banner_id]">';
	<?php foreach ($banners as $banner) { ?>
	html += '      <option value="<?php echo $banner['banner_id']; ?>"><?php echo addslashes($banner['name']); ?></option>';
	<?php } ?>
	html += '    </select></td>';
	html += '    <td class="left"><select name="cosyone_carousel_module[' + module_row + '][columns]">';
	html += '    <option value="[[0, 2], [320, 3], [550, 4], [999, 5], [1200, 6]]">6</option>';
	html += '    <option value="[[0, 2], [550, 3], [999, 5]]">5</option>';
	html += '    <option value="[[0, 2], [550, 3], [999, 4]]">4</option>';
	html += '    <option value="[[0, 2], [550, 3]]">3</option>';
	html += '    <option value="[[0, 1], [400, 2]]">2</option>';
	html += '    <option value="[[0, 1]]">1</option>';
	html += '    </select></td>';
	html += '    <td class="left"><input type="text" name="cosyone_carousel_module[' + module_row + '][width]" value="80" size="3" /> <input type="text" name="cosyone_carousel_module[' + module_row + '][height]" value="80" size="3" /></td>'; 
	html += '    <td class="left"><select name="cosyone_carousel_module[' + module_row + '][layout_id]">';
	<?php foreach ($layouts as $layout) { ?>
	html += '      <option value="<?php echo $layout['layout_id']; ?>"><?php echo addslashes($layout['name']); ?></option>';
	<?php } ?>
	html += '    </select></td>';	
	html += '    <td class="left"><select name="cosyone_carousel_module[' + module_row + '][position]">';
	html += '      <option value="content_top"><?php echo $text_content_top; ?></option>';
	html += '		<option value="content_bottom_half">Home content middle (50% width)</option>';
	html += '      <option value="content_bottom"><?php echo $text_content_bottom; ?></option>';
	html += '      <option value="column_left"><?php echo $text_column_left; ?></option>';
	html += '      <option value="column_right"><?php echo $text_column_right; ?></option>';
	html += '    </select></td>';
	html += '    <td class="left"><select name="cosyone_carousel_module[' + module_row + '][status]">';
    html += '      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
    html += '      <option value="0"><?php echo $text_disabled; ?></option>';
    html += '    </select></td>';
	html += '    <td class="right"><input type="text" name="cosyone_carousel_module[' + module_row + '][sort_order]" value="" size="3" /></td>';
	html += '    <td class="left"><a onclick="$(\'#module-row' + module_row + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
	html += '  </tr>';
	html += '</tbody>';
	
	$('#module tfoot').before(html);
	
	module_row++;
}
//--></script> 
<?php echo $footer; ?>