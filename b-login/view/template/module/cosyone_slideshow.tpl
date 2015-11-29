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
      
      <a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        
         <table class="form">
      
       <tr>
        <td><?php echo $transition_effect; ?></td>
        <td><select name="chosen_transition_effect">
        	<?php foreach($transition_effect_option as $key=>$selected_transition_effect) { ?>
            <option value="<?php echo $key;?>" <?php if($chosen_transition_effect==$key) { echo " selected"; }?> ><?php echo $selected_transition_effect;?></option>
            <?php } ?>
          </select></td>
      </tr>
      
      <tr>
        <td><?php echo $easing_effect; ?></td>
        <td><select name="chosen_easing_effect">
        	<?php foreach($easing_effect_option as $key=>$selected_easing_effect) { ?>
            <option value="<?php echo $key;?>" <?php if($chosen_easing_effect==$key) { echo " selected"; }?> ><?php echo $selected_easing_effect;?></option>
            <?php } ?>
          </select></td>
      </tr>
      
      <tr>
        <td><?php echo $sync; ?><span class="help"><?php echo $sync_help; ?></span></td>
        <td><select name="chosen_sync_effect">
        	<?php foreach($sync_effect_option as $key=>$selected_sync_effect) { ?>
            <option value="<?php echo $key;?>" <?php if($chosen_sync_effect==$key) { echo " selected"; }?> ><?php echo $selected_sync_effect;?></option>
            <?php } ?>
          </select></td>
      </tr>
      
      <tr>
        <td><?php echo $delay; ?><span class="help"><?php echo $delay_help; ?></span></td>
        <td>
            <input type="text" value="<?php echo $slider_delaytime?>" name="slider_delaytime" size="40" />
		</td>
      </tr>
      
	  <tr>
        <td><?php echo $transition_speed; ?><span class="help"><?php echo $transition_speed_help; ?></span></td>
        <td>
            <input type="text" value="<?php echo $slider_transition_speed?>" name="slider_transition_speed" size="40" />
		</td>
      </tr>
	  
	  <tr>
        <td><?php echo $pausetime; ?><span class="help"><?php echo $pausetime_help; ?></span></td>
        <td>
            <input type="text" value="<?php echo $slider_pausetime?>" name="slider_pausetime" size="40" />
		</td>
      </tr>
	  
	  
</table>
        
        <table id="module" class="list">
          <thead>
            <tr>
              <td class="left"><?php echo $entry_banner; ?></td>
              <td class="left"><?php echo $entry_dimension; ?></td>
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
              <td class="left"><select name="cosyone_slideshow_module[<?php echo $module_row; ?>][banner_id]">
                  <?php foreach ($banners as $banner) { ?>
                  <?php if ($banner['banner_id'] == $module['banner_id']) { ?>
                  <option value="<?php echo $banner['banner_id']; ?>" selected="selected"><?php echo $banner['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $banner['banner_id']; ?>"><?php echo $banner['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
              <td class="left"><input type="text" name="cosyone_slideshow_module[<?php echo $module_row; ?>][width]" value="<?php echo $module['width']; ?>" size="3" />
                <input type="text" name="cosyone_slideshow_module[<?php echo $module_row; ?>][height]" value="<?php echo $module['height']; ?>" size="3"/>
                <?php if (isset($error_dimension[$module_row])) { ?>
                <span class="error"><?php echo $error_dimension[$module_row]; ?></span>
                <?php } ?></td>
              <td class="left"><select name="cosyone_slideshow_module[<?php echo $module_row; ?>][layout_id]">
                  <?php foreach ($layouts as $layout) { ?>
                  <?php if ($layout['layout_id'] == $module['layout_id']) { ?>
                  <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
              <td class="left"><select name="cosyone_slideshow_module[<?php echo $module_row; ?>][position]">
                   <?php if ($module['position'] == 'home_top_top') { ?>
                <option value="home_top_top" selected="selected">Home top (top)</option>
                <?php } else { ?>
                <option value="home_top_top">Home top (top)</option>
                <?php } ?>
                
                <?php if ($module['position'] == 'home_top_left') { ?>
                <option value="home_top_left" selected="selected">Home top (left)</option>
                <?php } else { ?>
                <option value="home_top_left">Home top (left)</option>
                <?php } ?>
                
                <?php if ($module['position'] == 'home_top_center') { ?>
                <option value="home_top_center" selected="selected">Home top (center)</option>
                <?php } else { ?>
                <option value="home_top_center">Home top (center)</option>
                <?php } ?>
                
                <?php if ($module['position'] == 'home_top_right') { ?>
                <option value="home_top_right" selected="selected">Home top (right)</option>
                <?php } else { ?>
                <option value="home_top_right">Home top (right)</option>
                <?php } ?>
                
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
              <td class="left"><select name="cosyone_slideshow_module[<?php echo $module_row; ?>][status]">
                  <?php if ($module['status']) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
              <td class="right"><input type="text" name="cosyone_slideshow_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>" size="3" /></td>
              <td class="left"><a onclick="$('#module-row<?php echo $module_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td>
            </tr>
          </tbody>
          <?php $module_row++; ?>
          <?php } ?>
          <tfoot>
            <tr>
              <td colspan="6"></td>
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
	html += '    <td class="left"><select name="cosyone_slideshow_module[' + module_row + '][banner_id]">';
	<?php foreach ($banners as $banner) { ?>
	html += '      <option value="<?php echo $banner['banner_id']; ?>"><?php echo addslashes($banner['name']); ?></option>';
	<?php } ?>
	html += '    </select></td>';
	html += '    <td class="left"><input type="text" name="cosyone_slideshow_module[' + module_row + '][width]" value="" size="3" /> <input type="text" name="cosyone_slideshow_module[' + module_row + '][height]" value="" size="3" /></td>';	
	html += '    <td class="left"><select name="cosyone_slideshow_module[' + module_row + '][layout_id]">';
	<?php foreach ($layouts as $layout) { ?>
	html += '      <option value="<?php echo $layout['layout_id']; ?>"><?php echo addslashes($layout['name']); ?></option>';
	<?php } ?>
	html += '    </select></td>';
	html += '    <td class="left"><select name="cosyone_slideshow_module[' + module_row + '][position]">';
	html += '        <option value="home_top_top">Home top (top)</option>';
	html += '        <option value="home_top_left">Home top (left)</option>';
	html += '        <option value="home_top_center">Home top (center)</option>';
	html += '        <option value="home_top_right">Home top (right)</option>';
	html += '      <option value="content_top"><?php echo $text_content_top; ?></option>';
	html += '		<option value="content_bottom_half">Home content middle (50% width)</option>';
	html += '      <option value="content_bottom"><?php echo $text_content_bottom; ?></option>';
	html += '      <option value="column_left"><?php echo $text_column_left; ?></option>';
	html += '      <option value="column_right"><?php echo $text_column_right; ?></option>';
	html += '    </select></td>';
	html += '    <td class="left"><select name="cosyone_slideshow_module[' + module_row + '][status]">';
    html += '      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
    html += '      <option value="0"><?php echo $text_disabled; ?></option>';
    html += '    </select></td>';
	html += '    <td class="right"><input type="text" name="cosyone_slideshow_module[' + module_row + '][sort_order]" value="" size="3" /></td>';
	html += '    <td class="left"><a onclick="$(\'#module-row' + module_row + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
	html += '  </tr>';
	html += '</tbody>';
	
	$('#module tfoot').before(html);
	
	module_row++;
}
//--></script> 
<?php echo $footer; ?>