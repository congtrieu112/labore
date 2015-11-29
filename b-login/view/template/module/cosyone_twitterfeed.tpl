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
    <h1><?php echo $heading_title; ?></h1>
    <div class="buttons">
    
      <a class="button" onclick="$('#applystay').val('1');$('#form').submit();">Save and stay</a>
      <a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a></div>
  </div>
  <div class="content">
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
      <div class="vtabs">
        <?php $module_row = 1; ?>
        <?php foreach ($modules as $module) { ?>
        <a href="#tab-module-<?php echo $module_row; ?>" id="module-<?php echo $module_row; ?>"><?php echo $tab_module . ' ' . $module_row; ?>&nbsp;<img src="view/image/delete.png" alt="" onclick="$('.vtabs a:first').trigger('click'); $('#module-<?php echo $module_row; ?>').remove(); $('#tab-module-<?php echo $module_row; ?>').remove(); return false;" /></a>
        <?php $module_row++; ?>
        <?php } ?>
        <span id="module-add"><?php echo $button_add_module; ?>&nbsp;<img src="view/image/add.png" alt="" onclick="addModule();" /></span> </div>
      <?php $module_row = 1; ?>
      <?php foreach ($modules as $module) { ?>
      <div id="tab-module-<?php echo $module_row; ?>" class="vtabs-content">
      
      
<table class="form">
<?php foreach ($languages as $language) { ?>
          <tr>
            <td><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> Module title</td>
<td><input type="text" name="cosyone_twitterfeed_module[<?php echo $module_row; ?>][module_title][<?php echo $language['language_id']; ?>]" value="<?php echo isset($module['module_title'][$language['language_id']]) ? $module['module_title'][$language['language_id']] : ''; ?>" size="40" /></td>
</tr>
<?php } ?>
     
         
          <tr>
            <td>Widget ID</td>
<td><input type="text" name="cosyone_twitterfeed_module[<?php echo $module_row; ?>][widget_id]" value="<?php echo isset($module['widget_id']) ? $module['widget_id'] : ''; ?>" size="40" /></td>
</tr>

<tr>
            <td>Tweets limit</td>
<td><input type="text" name="cosyone_twitterfeed_module[<?php echo $module_row; ?>][limit]" value="<?php echo isset($module['limit']) ? $module['limit'] : ''; ?>" size="40" /></td>
</tr>

          
          <tr>
            <td><?php echo $entry_layout; ?></td>
            <td><select name="cosyone_twitterfeed_module[<?php echo $module_row; ?>][layout_id]">
                <?php foreach ($layouts as $layout) { ?>
                <?php if ($layout['layout_id'] == $module['layout_id']) { ?>
                <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_position; ?></td>
            <td><select name="cosyone_twitterfeed_module[<?php echo $module_row; ?>][position]">
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
                <option value="content_top" selected="selected">Content top</option>
                <?php } else { ?>
                <option value="content_top">Content top</option>
                <?php } ?>
                <?php if ($module['position'] == 'content_bottom_half') { ?>
                <option value="content_bottom_half" selected="selected">Home content middle (50% width)</option>
                <?php } else { ?>
                <option value="content_bottom_half">Home content middle (50% width)</option>
                <?php } ?>
                <?php if ($module['position'] == 'content_bottom') { ?>
                <option value="content_bottom" selected="selected">Content bottom</option>
                <?php } else { ?>
                <option value="content_bottom">Content bottom</option>
                <?php } ?>
                
                <?php if ($module['position'] == 'column_left') { ?>
                <option value="column_left" selected="selected">Column left</option>
                <?php } else { ?>
                <option value="column_left">Column left</option>
                <?php } ?>
                
                <?php if ($module['position'] == 'column_right') { ?>
                <option value="column_right" selected="selected">Column right</option>
                <?php } else { ?>
                <option value="column_right">Column right</option>
                <?php } ?>
                
                <?php if ($module['position'] == 'footer_modules') { ?>
                <option value="footer_modules" selected="selected">Footer</option>
                <?php } else { ?>
                <option value="footer_modules">Footer</option>
                <?php } ?>
                
              </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_status; ?></td>
            <td><select name="cosyone_twitterfeed_module[<?php echo $module_row; ?>][status]">
                <?php if ($module['status']) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_sort_order; ?></td>
            <td><input type="text" name="cosyone_twitterfeed_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>" size="3" /></td>
          </tr>
        </table>
        
      </div>
      <?php $module_row++; ?>
     
      <?php } ?>
    
      <input type="hidden" name="continue" id="applystay" value="0">
      
      </form>
  </div>
</div>
<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script> 
<script type="text/javascript"><!--
<?php $module_row = 1; ?>
<?php foreach ($modules as $module) { ?>
<?php $section_row = 0; ?>
<?php   foreach($module['sections'] as $section) { ?>
<?php      foreach ($languages as $language) { ?>
				CKEDITOR.replace('description-<?php echo $module_row; ?>-<?php echo $section_row;?>-<?php echo $language['language_id']; ?>', {
					filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
				});
				
				$('#language-<?php echo $module_row; ?>-<?php echo $section_row; ?> a').tabs();
<?php      } ?>
<?php   $section_row++; ?>
<?php   } ?>
<?php $module_row++; ?>
<?php } ?>
//--></script> 
<script type="text/javascript"><!--
var module_row = <?php echo $module_row; ?>;
var section_row;

function addModule() {	
	section_row = 0;
	html  = '<div id="tab-module-' + module_row + '" class="vtabs-content">';
	html += '<table class="form">';
    <?php foreach ($languages as $language) { ?>
	html += '    <tr>';
	html += '<td><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> Module title:</td>'
	 html += '<td><input type="text" name="cosyone_twitterfeed_module[' + module_row + '][module_title][<?php echo $language['language_id']; ?>]" size="40" /></td>';
	html += '    </tr>';
	<?php } ?>
	 html += '<tr>';
	html += '<td>Widget ID:</td>'
	 html += '<td><input type="text" name="cosyone_twitterfeed_module[' + module_row + '][widget_id]" size="40" /></td>';
	html += '</tr>';
	
	html += ' <tr>';
	html += '<td>Tweets limit:</td>'
	 html += '<td><input type="text" name="cosyone_twitterfeed_module[' + module_row + '][limit]" size="10" /></td>';
	html += '</tr>';
	html += '    <tr>';
	html += '      <td><?php echo $entry_layout; ?></td>';
	html += '      <td><select name="cosyone_twitterfeed_module[' + module_row + '][layout_id]">';
	<?php foreach ($layouts as $layout) { ?>
	html += '           <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>';
	<?php } ?>
	html += '      </select></td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <td><?php echo $entry_position; ?></td>';
	html += '      <td><select name="cosyone_twitterfeed_module[' + module_row + '][position]">';
	html += '        <option value="home_top_top">Home top (top)</option>';
	html += '        <option value="home_top_left">Home top (left)</option>';
	html += '        <option value="home_top_center">Home top (center)</option>';
	html += '        <option value="home_top_right">Home top (right)</option>';
	html += '        <option value="content_top">Content top</option>';
	html += '		<option value="content_bottom_half">Home content middle (50% width)</option>';
	html += '        <option value="content_bottom">Content bottom</option>';
	html += '        <option value="column_left">Column left</option>';
	html += '        <option value="column_right">Column right</option>';
	html += '        <option value="footer_modules">Footer</option>';
	html += '      </select></td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <td><?php echo $entry_status; ?></td>';
	html += '      <td><select name="cosyone_twitterfeed_module[' + module_row + '][status]">';
	html += '        <option value="1"><?php echo $text_enabled; ?></option>';
	html += '        <option value="0"><?php echo $text_disabled; ?></option>';
	html += '      </select></td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <td><?php echo $entry_sort_order; ?></td>';
	html += '      <td><input type="text" name="cosyone_twitterfeed_module[' + module_row + '][sort_order]" value="" size="3" /></td>';
	html += '    </tr>';
	html += '  </table>'; 
	
   ;
	html += '</div>';
	
	$('#form').append(html);
	
	$('#language-' + module_row + ' a').tabs();
	
	$('#module-add').before('<a href="#tab-module-' + module_row + '" id="module-' + module_row + '"><?php echo $tab_module; ?> ' + module_row + '&nbsp;<img src="view/image/delete.png" alt="" onclick="$(\'.vtabs a:first\').trigger(\'click\'); $(\'#module-' + module_row + '\').remove(); $(\'#tab-module-' + module_row + '\').remove(); return false;" /></a>');
	
	$('.vtabs a').tabs();
	
	$('#module-' + module_row).trigger('click');
	
	module_row++;
}
//--></script> 


<script type="text/javascript"><!--
<?php $module_row = 1; ?>
<?php foreach ($modules as $module) { ?>
$('#language-<?php echo $module_row; ?> a').tabs();
<?php $module_row++; ?>
<?php } ?> 
//--></script> 
 
<?php echo $footer; ?>