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
            <td><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $question_title; ?></td>
<td><input type="text" name="cosyone_socials_module[<?php echo $module_row; ?>][module_title][<?php echo $language['language_id']; ?>]" value="<?php echo isset($module['module_title'][$language['language_id']]) ? $module['module_title'][$language['language_id']] : ''; ?>" size="40" /></td>
</tr>
<?php } ?>
     
          <tr>
          
          <tr>
            <td><?php echo $entry_layout; ?></td>
            <td><select name="cosyone_socials_module[<?php echo $module_row; ?>][layout_id]">
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
            <td><select name="cosyone_socials_module[<?php echo $module_row; ?>][position]">
                
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
            <td><select name="cosyone_socials_module[<?php echo $module_row; ?>][status]">
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
            <td><input type="text" name="cosyone_socials_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>" size="3" /></td>
          </tr>
        </table>
        <table id="section_<?php echo $module_row; ?>" class="list">
          <thead>
            <tr>
              <td colspan="5" class="left">Social icons</td>
              
            </tr>
          </thead>
          <?php $section_row = 0; ?>
          <?php foreach($module['sections'] as $section){ ?>
          <tbody id="section-row-<?php echo $module_row; ?>-<?php echo $section_row; ?>" class="section">
            <tr>
              
              
              <td class="left">
                  <select name="cosyone_socials_module[<?php echo $module_row; ?>][sections][<?php echo $section_row; ?>][social_type]">
                    <?php if ($section['social_type'] != '') {
              					$chosen_social_type = 'selected="selected"';
              					?>
                    <option value="fa-facebook" <?php if($section['social_type']=='fa-facebook'){echo $chosen_social_type;} ?>>Facebook</option>
                    <option value="fa-twitter" <?php if($section['social_type']=='fa-twitter'){echo $chosen_social_type;} ?>>Twitter</option>
                    <option value="fa-google-plus" <?php if($section['social_type']=='fa-google-plus'){echo $chosen_social_type;} ?>>Google+</option>
                    <option value="fa-rss" <?php if($section['social_type']=='fa-rss'){echo $chosen_social_type;} ?>>RSS</option>
                    <option value="fa-pinterest" <?php if($section['social_type']=='fa-pinterest'){echo $chosen_social_type;} ?>>Pinterest</option>
                    <option value="fa-instagram" <?php if($section['social_type']=='fa-instagram'){echo $chosen_social_type;} ?>>Instagram</option>
                    <option value="fa-linkedin" <?php if($section['social_type']=='fa-linkedin'){echo $chosen_social_type;} ?>>Linkedin</option>
                    <option value="fa-vimeo-square" <?php if($section['social_type']=='fa-vimeo-square'){echo $chosen_social_type;} ?>>Vimeo</option>
                    <option value="fa-youtube" <?php if($section['social_type']=='fa-youtube'){echo $chosen_social_type;} ?>>Youtube</option>
                    <option value="fa-flickr" <?php if($section['social_type']=='fa-flickr'){echo $chosen_social_type;} ?>>Flickr</option>
                    <option value="fa-vk" <?php if($section['social_type']=='fa-vk'){echo $chosen_social_type;} ?>>VK</option>
                    <option value="fa-dribbble" <?php if($section['social_type']=='fa-dribbble'){echo $chosen_social_type;} ?>>Dribbble</option>
                    <option value="fa-spotify" <?php if($section['social_type']=='fa-spotify'){echo $chosen_social_type;} ?>>Spotify</option>
                    <option value="fa-tumblr" <?php if($section['social_type']=='fa-tumblr'){echo $chosen_social_type;} ?>>Tumblr</option>
                    <option value="fa-xing" <?php if($section['social_type']=='fa-xing'){echo $chosen_social_type;} ?>>Xing</option>
                    <option value="fa-wordpress" <?php if($section['social_type']=='fa-wordpress'){echo $chosen_social_type;} ?>>Wordpress</option>
                    <?php } else { ?>                    
                    <option value="fa-facebook">Facebook</option>
                    <option value="fa-twitter">Twitter</option>
                    <option value="fa-google-plus">Google+</option>
                    <option value="fa-rss">RSS</option>
                    <option value="fa-pinterest">Pinterest</option>
                    <option value="fa-instagram">Instagram</option>
                    <option value="fa-linkedin">Linkedin</option>
                    <option value="fa-vimeo-square">Vimeo</option>
                    <option value="fa-youtube">Youtube</option>
                    <option value="fa-flickr">Flickr</option>
                    <option value="fa-vk">VK</option>
                    <option value="fa-dribbble">Dribbble</option>
                    <option value="fa-spotify">Spotify</option>
                    <option value="fa-tumblr">Tumblr</option>
                    <option value="fa-xing">Xing</option>
                    <option value="fa-wordpress">Wordpress</option>
                    <?php } ?>
                  </select>
                </td>
                
                
                
              
              <td>
                 URL (inclide http://):
                  <input name="cosyone_socials_module[<?php echo $module_row; ?>][sections][<?php echo $section_row; ?>][link]" id="link-<?php echo $module_row; ?>-<?php echo $section_row; ?>" value="<?php echo isset($module['sections'][$section_row]['link']) ? $module['sections'][$section_row]['link'] : ''; ?>" size="50" />
                  
                  </td>
                  
                  
                
                <td>
                  Open link in new tab:
                 <select name="cosyone_socials_module[<?php echo $module_row; ?>][sections][<?php echo $section_row; ?>][link_type]">
                    <?php if ($section['link_type'] != '') {
              					$chosen_link_type = 'selected="selected"';
              					?>
                    <option value="internal" <?php if($section['link_type']=='internal'){echo $chosen_link_type;} ?>>No</option>
                    <option value="external" <?php if($section['link_type']=='external'){echo $chosen_link_type;} ?>>Yes</option>
                    <?php } else { ?>
                    <option value="internal" selected="selected">No</option>
                    <option value="external">Yes</option>
                    <?php } ?>
                  </select>
                </td>
                
                <td>
                 Tooltip title:
                  <input name="cosyone_socials_module[<?php echo $module_row; ?>][sections][<?php echo $section_row; ?>][tooltip]" id="title-<?php echo $module_row; ?>-<?php echo $section_row; ?>" value="<?php echo isset($module['sections'][$section_row]['tooltip']) ? $module['sections'][$section_row]['tooltip'] : ''; ?>" size="50" />
                  
                  </td>
                
              <td><a class="button" onclick="removeSection(<?php echo $module_row; ?>, <?php echo $section_row; ?>);"><?php echo $button_remove; ?></a></td>
            </tr>
          </tbody>
          <?php $section_row++; ?>
          <?php } ?>
          <tfoot>
            <tr>
              <td colspan="4"></td>
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
	html += '<table class="form">';
    <?php foreach ($languages as $language) { ?>
	html += '    <tr>';
	html += '<td><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> Module title:</td>'
	 html += '<td><input type="text" name="cosyone_socials_module[' + module_row + '][module_title][<?php echo $language['language_id']; ?>]" size="40" /></td>';
	html += '    </tr>';
	<?php } ?>
	html += '    <tr>';
	html += '      <td><?php echo $entry_layout; ?></td>';
	html += '      <td><select name="cosyone_socials_module[' + module_row + '][layout_id]">';
	<?php foreach ($layouts as $layout) { ?>
	html += '           <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>';
	<?php } ?>
	html += '      </select></td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <td><?php echo $entry_position; ?></td>';
	html += '      <td><select name="cosyone_socials_module[' + module_row + '][position]">';
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
	html += '      <td><select name="cosyone_socials_module[' + module_row + '][status]">';
	html += '        <option value="1"><?php echo $text_enabled; ?></option>';
	html += '        <option value="0"><?php echo $text_disabled; ?></option>';
	html += '      </select></td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <td><?php echo $entry_sort_order; ?></td>';
	html += '      <td><input type="text" name="cosyone_socials_module[' + module_row + '][sort_order]" value="" size="3" /></td>';
	html += '    </tr>';
	html += '  </table>'; 
	
    html += '  <table id="section_' + module_row + '" class="list">';
	html += '	 <thead>';
	html += '	    <tr>';
	html += '	       <td colspan="5" class="left">Social icons</td>';
	html += '	    </tr>';
	html += '</thead>';
	html += '<tfoot>';
    html += '<tr>';
	html += '<td colspan="4"></td>';
    html += '<td class="left"><a onclick="addSection(' + module_row + ');" class="button"><?php echo $button_add_section; ?></a></td>';
    html += '</tr>';
    html += '</tfoot>';
    html += '</table>';
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
	html += '<tr>';
	html += '<td class="left">';
	html += '<select name="cosyone_socials_module[' + module_number + '][sections][' + section_row + '][social_type]">';	
	html += '<option value="fa-facebook">Facebook</option>';
    html += '<option value="fa-twitter">Twitter</option>';
    html += '<option value="fa-google-plus">Google+</option>';
    html += '<option value="fa-rss">RSS</option>';
    html += '<option value="fa-pinterest">Pinterest</option>';
    html += '<option value="fa-instagram">Instagram</option>';
    html += '<option value="fa-linkedin">Linkedin</option>';
    html += '<option value="fa-vimeo-square">Vimeo</option>';
    html += '<option value="fa-youtube">Youtube</option>';
    html += '<option value="fa-flickr">Flickr</option>';
    html += '<option value="fa-vk">VK</option>';
    html += '<option value="fa-dribbble">Dribbble</option>';
    html += '<option value="fa-spotify">Spotify</option>';
    html += '<option value="fa-tumblr">Tumblr</option>';
	html += '<option value="fa-xing">Xing</option>';
    html += '<option value="fa-wordpress">Wordpress</option>';
	html += '</select>';
	html += '</td>';
	
	html += '<td>URL (inclide http://): ';
	html += '<input name="cosyone_socials_module[' + module_number + '][sections][' + section_row + '][link]" id="link-' + module_number + '-' + section_row +'" size="50" />';
	html += '</td>';
	
	html += '<td>Open link in new tab: ';
	html += '<select name="cosyone_socials_module[' + module_number + '][sections][' + section_row + '][link_type]">';	
	html += '<option value="internal">No</option>';
    html += '<option value="external">Yes</option>';
	html += '</select>';
	html += '</td>';
	
	html += '<td>Tooltip title: ';
	html += '<input name="cosyone_socials_module[' + module_number + '][sections][' + section_row + '][tooltip]" id="tooltip-' + module_number + '-' + section_row +'" size="50" />';
	html += '</td>';
	
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
$('.htabs1-0 a').tabs();
$('.htabs1-1 a').tabs();
$('.htabs1-2 a').tabs();
$('.htabs1-3 a').tabs();
$('.htabs1-4 a').tabs();
$('.htabs1-5 a').tabs();
$('.htabs1-6 a').tabs();
$('.htabs1-7 a').tabs();
$('.htabs1-8 a').tabs();
$('.htabs1-9 a').tabs();
$('.htabs1-10 a').tabs();
$('.htabs1-11 a').tabs();
$('.htabs1-12 a').tabs();
$('.htabs1-13 a').tabs();
$('.htabs1-14 a').tabs();
$('.htabs1-15 a').tabs();
$('.htabs1-16 a').tabs();
$('.htabs1-17 a').tabs();
$('.htabs1-18 a').tabs();
$('.htabs1-19 a').tabs();
$('.htabs1-20 a').tabs();
$('.htabs1-21 a').tabs();
$('.htabs1-22 a').tabs();
$('.htabs1-23 a').tabs();
$('.htabs1-24 a').tabs();
$('.htabs1-25 a').tabs();
$('.htabs1-26 a').tabs();
$('.htabs1-27 a').tabs();
$('.htabs1-28 a').tabs();
$('.htabs1-29 a').tabs();
$('.htabs1-30 a').tabs();
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
 
<?php echo $footer; ?>