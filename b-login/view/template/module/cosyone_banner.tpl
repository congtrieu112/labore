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
            <td><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $question_title; ?>
            </td>
<td><input type="text" name="cosyone_banner_module[<?php echo $module_row; ?>][module_title][<?php echo $language['language_id']; ?>]" value="<?php echo isset($module['module_title'][$language['language_id']]) ? $module['module_title'][$language['language_id']] : ''; ?>" size="40" /></td>
		</tr>
        <?php } ?>

          <tr>
            <td><?php echo $entry_columns; ?></td>
            <td><select style="width:50px" name="cosyone_banner_module[<?php echo $module_row; ?>][columns]">
               <?php if ($module['columns'] == '4') { ?>
                <option value="4" selected="selected">4</option>
                <?php } else { ?>
                <option value="4">4</option>
                <?php } ?>
                <?php if ($module['columns'] == '3') { ?>
                <option value="3" selected="selected">3</option>
                <?php } else { ?>
                <option value="3">3</option>
                <?php } ?>
                <?php if ($module['columns'] == '2') { ?>
                <option value="2" selected="selected">2</option>
                <?php } else { ?>
                <option value="2">2</option>
                <?php } ?>
                <?php if ($module['columns'] == '1') { ?>
                <option value="1" selected="selected">1</option>
                <?php } else { ?>
                <option value="1">1</option>
                <?php } ?>
              </select></td>
          </tr>
          
          <tr>
            <td><?php echo $entry_layout; ?></td>
            <td><select name="cosyone_banner_module[<?php echo $module_row; ?>][layout_id]">
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
            <td><select name="cosyone_banner_module[<?php echo $module_row; ?>][position]">
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
              </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_status; ?></td>
            <td><select name="cosyone_banner_module[<?php echo $module_row; ?>][status]">
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
            <td><input type="text" name="cosyone_banner_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>" size="3" /></td>
          </tr>
        </table>
        <table id="section_<?php echo $module_row; ?>" class="list">
          <thead>
            <tr>
              <td class="left">&nbsp;</td>
              <td class="left"></td>
            </tr>
          </thead>
          <?php $section_row = 0; ?>
          <?php foreach($module['sections'] as $section){ ?>
          <tbody id="section-row-<?php echo $module_row; ?>-<?php echo $section_row; ?>" class="section">
            <tr>
              
              <td class="left">
                <div id="language-<?php echo $module_row; ?>-<?php echo $section_row; ?>" class="htabs"> 
                  <?php foreach ($languages as $language) { ?>
                  <a href="#tab-language-<?php echo $module_row; ?>-<?php echo $section_row; ?>-<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
                  <?php } ?>
                </div>
                <?php foreach ($languages as $language) { ?>
                <div id="tab-language-<?php echo $module_row; ?>-<?php echo $section_row; ?>-<?php echo $language['language_id']; ?>"> 
                
                <?php echo $entry_image_text; ?><br />
                <div class="image">
         <img src="<?php echo ($this->model_tool_image->resize($module['sections'][$section_row]['image'][$language['language_id']], 100, 100)); ?>" alt="" id="thumb<?php echo $section_row; ?><?php echo $language['language_id'] . $module_row; ?>" /><br />
        <input type="hidden" name="cosyone_banner_module[<?php echo $module_row; ?>][sections][<?php echo $section_row; ?>][image][<?php echo $language['language_id']; ?>]" value="<?php echo isset($module['sections'][$section_row]['image'][$language['language_id']]) ? $module['sections'][$section_row]['image'][$language['language_id']] : ''; ?>" id="image-<?php echo $module_row; ?><?php echo $section_row; ?><?php echo $language['language_id']; ?>" />
		<a onclick="image_upload('image-<?php echo $module_row; ?><?php echo $section_row; ?><?php echo $language['language_id']; ?>', 'thumb<?php echo $section_row; ?><?php echo $language['language_id'] . $module_row; ?>');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;
		<a onclick="$('#thumb<?php echo $section_row; ?><?php echo $language['language_id'] . $module_row; ?>').attr('src', '<?php echo $no_image; ?>'); $('#image-<?php echo $module_row; ?><?php echo $section_row; ?><?php echo $language['language_id']; ?>').attr('value', '');"><?php echo $text_clear; ?></a>
				</div>
                <br />
                <br />
                <?php echo $entry_html_text; ?>
                <br />
                <textarea rows="8" cols="80" name="cosyone_banner_module[<?php echo $module_row; ?>][sections][<?php echo $section_row; ?>][description][<?php echo $language['language_id']; ?>]"><?php echo isset($module['sections'][$section_row]['description'][$language['language_id']]) ? $module['sections'][$section_row]['description'][$language['language_id']] : ''; ?></textarea>
                
                  
                </div>
                <?php } ?></td>
              <td><a class="button" onclick="removeSection(<?php echo $module_row; ?>, <?php echo $section_row; ?>);"><?php echo $button_remove; ?></a></td>
            </tr>
          </tbody>
          <?php $section_row++; ?>
          <?php } ?>
          <tfoot>
            <tr>
              <td></td>
              <td class="left"><a class="button" onclick="addSection(<?php echo $module_row; ?>);"><?php echo $button_add_section; ?></a></td>
            </tr>
          </tfoot>
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
	
	html += '  <table class="form">';
    <?php foreach ($languages as $language) { ?>
	

    html += '    <tr>';
    html += '    <td><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $question_title; ?></td>';
    html += '    <td><input type="text" name="cosyone_banner_module[' + module_row + '][module_title][<?php echo $language['language_id']; ?>]" size="40" /></td>';
    html += '    </tr>';


    <?php } ?>
	
	html += '    <tr>';
	html += '      <td><?php echo $entry_columns; ?></td>';
	html += '      <td><select name="cosyone_banner_module[' + module_row + '][columns]">';
	html += '        <option value="4">4</option>';
	html += '        <option value="3">3</option>';
	html += '        <option value="2">2</option>';
	html += '        <option value="1">1</option>';
	html += '      </select></td>';
	html += '    </tr>';
	
	html += '    <tr>';
	html += '      <td><?php echo $entry_layout; ?></td>';
	html += '      <td><select name="cosyone_banner_module[' + module_row + '][layout_id]">';
	<?php foreach ($layouts as $layout) { ?>
	html += '           <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>';
	<?php } ?>
	html += '      </select></td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <td><?php echo $entry_position; ?></td>';
	html += '      <td><select name="cosyone_banner_module[' + module_row + '][position]">';
	html += '        <option value="home_top_top">Home top (top)</option>';
	html += '        <option value="home_top_left">Home top (left)</option>';
	html += '        <option value="home_top_center">Home top (center)</option>';
	html += '        <option value="home_top_right">Home top (right)</option>';
	html += '        <option value="content_top">Content top</option>';
	html += '		<option value="content_bottom_half">Home content middle (50% width)</option>';
	html += '        <option value="content_bottom">Content bottom</option>';
	html += '        <option value="column_left">Column left</option>';
	html += '        <option value="column_right">Column right</option>';
	html += '      </select></td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <td><?php echo $entry_status; ?></td>';
	html += '      <td><select name="cosyone_banner_module[' + module_row + '][status]">';
	html += '        <option value="1"><?php echo $text_enabled; ?></option>';
	html += '        <option value="0"><?php echo $text_disabled; ?></option>';
	html += '      </select></td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <td><?php echo $entry_sort_order; ?></td>';
	html += '      <td><input type="text" name="cosyone_banner_module[' + module_row + '][sort_order]" value="" size="3" /></td>';
	html += '    </tr>';
	html += '  </table>'; 
	
    html += '  <table id="section_' + module_row + '" class="list">';
	html += '	 <thead>';
	html += '	    <tr>';
	html += '	       <td class="left">&nbsp;</td>';
	html += '	       <td class="left"></td>';
	html += '	       <td class="left"></td>';
	html += '	    </tr>';
	html += '    </thead>';
	html += '    <tfoot>';
    html += '     <tr>';
	html += '         <td colspan="2"></td>';
    html += '         <td class="left"><a onclick="addSection(' + module_row + ');" class="button"><?php echo $button_add_section; ?></a></td>';
    html += '     </tr>';
    html += '    </tfoot>';
    html += '  </table>';
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
function addSection( module_number) {
	section_row = $('#tab-module-' + module_number + ' .section').length;
	html  = '<tbody id="section-row-' + module_number + '-' + section_row + '" class="section">';
	html += '  <tr>';
	html += '    <td class="left">';
	html += '  		<div id="language-' + module_row + '-' + section_row + '" class="htabs">';
					<?php foreach ($languages as $language) { ?>
    html += '    		<a href="#tab-language-'+ module_number  + '-' + section_row + '-<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>';
					<?php } ?>
	html += '       </div>';
     
					<?php foreach ($languages as $language) { ?>
	html += '    	<div id="tab-language-'+ module_number + '-' + section_row + '-<?php echo $language['language_id']; ?>">';
	
	html += '		<?php echo $entry_image_text; ?><br />';
	html += '    	<div class="image">';
	html += '<img src="<?php echo $no_image; ?>" alt="" id="thumb' + module_number + section_row + '<?php echo $language['language_id']; ?>' + '" /></br>';
	html += '<input type="hidden" name="cosyone_banner_module[' + module_number + '][sections][' + section_row + '][image][<?php echo $language['language_id']; ?>]" value="" id="image-' + module_number + section_row + '<?php echo $language['language_id']; ?>' + '" />';
	html += '<a onclick="image_upload(\'image-' + module_number + section_row + '<?php echo $language['language_id']; ?>' + '\', \'thumb' + module_number + section_row + '<?php echo $language['language_id']; ?>' + '\');">Browse</a>&nbsp;&nbsp;|&nbsp;&nbsp;';
	html += '<a onclick="$(\'#thumb' + module_number + section_row + '<?php echo $language['language_id']; ?>' + '\').attr(\'src\', \'<?php echo $no_image; ?>\'); $(\'#image-' + module_number + section_row + '<?php echo $language['language_id']; ?>' + '\').attr(\'value\', \'\');"><?php echo $text_clear; ?></a>';
	html += '    	</div>';
	
	html += '		<br /><br /><?php echo $entry_html_text; ?><br />';
	html += '       <textarea rows="8" cols="80" name="cosyone_banner_module[' + module_number + '][sections][' + section_row + '][description][<?php echo $language['language_id']; ?>]"></textarea>';
	
	html += '    	</div>';
					<?php } ?>
	html += '    </td>';
	html += '    <td><a class="button" onclick="removeSection('+ module_number +',' + section_row +');"><?php echo $button_remove; ?></a></td>';
	html += '  </tr>';
	html += '</tbody>';
	
	$('#section_' + module_number + ' tfoot').before(html);
	
	$('#language-' + module_row + '-' + section_row + ' a').tabs();
	
	
	<?php foreach ($languages as $language) { ?>
	CKEDITOR.replace('description-' + module_number + '-' + section_row + '-<?php echo $language['language_id']; ?>', {
		filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
	});  

	<?php } ?>
	
	section_row++;
}

function removeSection(module_number, section_number){
	$('#section-row-' + module_number + '-' + section_number).remove();
}

function image_upload(field, thumb) {
	$('#dialog').remove();
	
	$('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');
	
	$('#dialog').dialog({
		title: '<?php echo $text_image_manager; ?>',
		close: function (event, ui) {
			if ($('#' + field).attr('value')) {
				$.ajax({
					url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).attr('value')),
					dataType: 'text',
					success: function(text) {
						$('#' + thumb).replaceWith('<img src="' + text + '" alt="" id="' + thumb + '" />');
					}
				});
			}
		},	
		bgiframe: false,
		width: 800,
		height: 400,
		resizable: false,
		modal: false
	});
};

//--></script> 
<script type="text/javascript"><!--
$('.vtabs a').tabs();
$('#language-1-0 a').tabs();
$('#language-1-1 a').tabs();
$('#language-1-2 a').tabs();
$('#language-1-3 a').tabs();
$('#language-1-4 a').tabs();
$('#language-1-5 a').tabs();
$('#language-1-6 a').tabs();
$('#language-1-7 a').tabs();
$('#language-1-8 a').tabs();
$('#language-1-9 a').tabs();
$('#language-1-10 a').tabs();
$('#language-2-0 a').tabs();
$('#language-2-1 a').tabs();
$('#language-2-2 a').tabs();
$('#language-2-3 a').tabs();
$('#language-2-4 a').tabs();
$('#language-2-5 a').tabs();
$('#language-2-6 a').tabs();
$('#language-2-7 a').tabs();
$('#language-2-8 a').tabs();
$('#language-2-9 a').tabs();
$('#language-2-10 a').tabs();
$('#language-3-0 a').tabs();
$('#language-3-1 a').tabs();
$('#language-3-2 a').tabs();
$('#language-3-3 a').tabs();
$('#language-3-4 a').tabs();
$('#language-3-5 a').tabs();
$('#language-3-6 a').tabs();
$('#language-3-7 a').tabs();
$('#language-3-8 a').tabs();
$('#language-3-9 a').tabs();
$('#language-3-10 a').tabs();
$('#language-4-0 a').tabs();
$('#language-4-1 a').tabs();
$('#language-4-2 a').tabs();
$('#language-4-3 a').tabs();
$('#language-4-4 a').tabs();
$('#language-4-5 a').tabs();
$('#language-4-6 a').tabs();
$('#language-4-7 a').tabs();
$('#language-4-8 a').tabs();
$('#language-4-9 a').tabs();
$('#language-4-10 a').tabs();
$('#language-5-0 a').tabs();
$('#language-5-1 a').tabs();
$('#language-5-2 a').tabs();
$('#language-5-3 a').tabs();
$('#language-5-4 a').tabs();
$('#language-5-5 a').tabs();
$('#language-5-6 a').tabs();
$('#language-5-7 a').tabs();
$('#language-5-8 a').tabs();
$('#language-5-9 a').tabs();
$('#language-5-10 a').tabs();
$('#language-6-0 a').tabs();
$('#language-6-1 a').tabs();
$('#language-6-2 a').tabs();
$('#language-6-3 a').tabs();
$('#language-6-4 a').tabs();
$('#language-6-5 a').tabs();
$('#language-6-6 a').tabs();
$('#language-6-7 a').tabs();
$('#language-6-8 a').tabs();
$('#language-6-9 a').tabs();
$('#language-6-10 a').tabs();
$('#language-7-0 a').tabs();
$('#language-7-1 a').tabs();
$('#language-7-2 a').tabs();
$('#language-7-3 a').tabs();
$('#language-7-4 a').tabs();
$('#language-7-5 a').tabs();
$('#language-7-6 a').tabs();
$('#language-7-7 a').tabs();
$('#language-7-8 a').tabs();
$('#language-7-9 a').tabs();
$('#language-7-10 a').tabs();
$('#language-8-0 a').tabs();
$('#language-8-1 a').tabs();
$('#language-8-2 a').tabs();
$('#language-8-3 a').tabs();
$('#language-8-4 a').tabs();
$('#language-8-5 a').tabs();
$('#language-8-6 a').tabs();
$('#language-8-7 a').tabs();
$('#language-8-8 a').tabs();
$('#language-8-9 a').tabs();
$('#language-8-10 a').tabs();
//--></script> 
<script type="text/javascript"><!--
<?php $module_row = 1; ?>
<?php foreach ($modules as $module) { ?>

$('#language-<?php echo $module_row; ?> a').tabs();
<?php $module_row++; ?>
<?php } ?> 
//--></script> 
<style>
.list tbody tr:hover td {
    background-color: #ffffff;
}
</style>
<?php echo $footer; ?>