<?php
//-----------------------------------------------------
// TagCloud for Opencart v1.5.6    						
// Adapted by villagedefrance                          		
// contact@villagedefrance.net                       		
//-----------------------------------------------------
?>

<?php echo $header; ?>
<div id="content">
	<div class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
		<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
		<?php } ?>
	</div>
	<?php if ($error_warning) { ?>
		<div class="warning"><?php echo $error_warning; ?></div>
	<?php } ?>

	<div class="box">
		<div class="heading">
			<h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
			<div class="buttons">
				<a onclick="buttonSave();" class="button"><?php echo $button_save; ?></a>
				<a onclick="buttonApply();" class="button"><?php echo $button_apply; ?></a>
				<a onclick="location = '<?php echo $cancel; ?>';" class="button"><span><?php echo $button_cancel; ?></span></a>
			</div>
		</div>
		<div class="content">
		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" name="tagcloud">
			<table class="form">
				<?php foreach ($languages as $language) { ?>
				<tr> 
					<td><?php echo $entry_title; ?></td> 
					<td> 
						<input type="text" name="tagcloud_title<?php echo $language['language_id']; ?>" id="tagcloud_title<?php echo $language['language_id']; ?>" size="30" value="<?php echo ${'tagcloud_title' . $language['language_id']}; ?>" />
						<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" style="vertical-align: top;" /><br />
					</td>
				</tr>
				<?php } ?> 
				<tr> 
					<td><?php echo $entry_header; ?></td> 
					<td>
						<?php if ($tagcloud_header) { ?>
							<?php echo $text_yes; ?><input type="radio" name="tagcloud_header" value="1" checked="checked" />
							<?php echo $text_no; ?><input type="radio" name="tagcloud_header" value="0" />
						<?php } else { ?>
							<?php echo $text_yes; ?><input type="radio" name="tagcloud_header" value="1" />
							<?php echo $text_no; ?><input type="radio" name="tagcloud_header" value="0" checked="checked" />
						<?php } ?>
					</td>
				</tr>
				
				
				<tr style="background:#FCFCFC;">
					<td><?php echo $entry_generate; ?></td>
					<td><a href="#" class="button" id="generate-tags"><span><?php echo $button_generate; ?></span></td>
				</tr>
				
			</table>
		
			<div class="versioncheck">
			<table class="form">
				<tr>
					<td></td>
					<td colspan="2"><?php echo $module_name; ?><b><?php echo $module_current_name; ?></b></td>
				</tr>
				<tr>
					<td></td>
					<td colspan="2"><?php echo $module_list; ?>
					<?php foreach ($compatibles as $compatible) { ?>
						<?php if($store_base_version == $compatible['opencart']) { ?>
							<b><?php echo $compatible['title']; ?></b>
						<?php } else { ?>
							<?php echo $compatible['title']; ?>
						<?php } ?>
					<?php } ?>
					</td>
				</tr>
				<tr>
					<td></td>
					<td colspan="2"><?php echo $store_version; ?>
					&nbsp;&nbsp;&nbsp;
					<?php foreach ($compatibles as $compatible) { ?>
						<?php if($store_base_version == $compatible['opencart']) { ?>
							<img src="view/image/success.png" alt="" />
						<?php } ?>
					<?php } ?>
					</td>
				</tr>
				<tr>
					<td></td>
					<td colspan="2"><?php echo $text_template; ?>
						<?php foreach ($templates as $template) { ?>
							<?php if ($template == $config_template) { ?>
								<b><?php echo $template; ?></b>
							<?php } ?>
						<?php } ?>
					</td>
				</tr>
				<tr>
					<td></td>
					<td colspan="2"><span style='color: #FF8800;'><b><?php echo $text_status; ?></b></span></td>
				</tr>
			<?php if($version && $revision) { ?>
				<tr>
					<td></td>
					<td><?php echo $module_current_version; ?></td>
					<td><?php echo $version; ?></td>
				</tr>
				<tr>
					<td></td>
					<td><?php echo $module_current_revision; ?></td>
					<td><?php echo $revision; ?></td>
				</tr>
			<?php } else { ?>
				<tr>
					<td></td>
					<td colspan="2"><?php echo $text_no_file; ?></td>
				</tr>
			<?php } ?>
			<?php if($ver_update || $rev_update) { ?>
				<tr>
					<td></td>
					<td colspan="2"><span style='color: #FF8800;'><b><?php echo $text_update; ?></b></span></td>
				</tr>
				<tr>
					<td></td>
					<td colspan="2">
					<?php echo $text_getupdate; ?>
					<br /><br />
					<a onclick="window.open('https://villagedefrance.net/index.php?route=account/login');" title="Villagedefrance"><img src="view/image/villagedefrance-30.png" alt="Villagedefrance" /></a>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a onclick="window.open('http://opencart-france.fr/index.php?route=account/login');" title="Opencart France"><img src="view/image/opencart-france-30.png" alt="Opencart France" /></a>
					<br />
					</td>
				</tr>
			<?php } ?>
				<tr>
					<td></td>
					<td colspan="2">
						<a onclick="window.open('http://villagedefrance.net/index.php?route=information/contact');" title="Contact Support" class="button"><?php echo $button_support; ?></a>
					</td>
				</tr>
			</table>
			</div>
		
			<table class="form">
				<tr>
					<td><a onclick="window.open('http://www.villagedefrance.net');" title="villagedefrance"><img src="view/image/villagedefrance.png" alt="" /></a></td>
					<td><b><?php echo $text_module_settings; ?></b></td>
				</tr>
			</table>
    
			<table id="module" class="list">
				<thead>
					<tr>
						<td class="left"><?php echo $entry_limit; ?></td>
						
						<td class="left"><?php echo $entry_random; ?></td>
						<td class="left"><?php echo $entry_layout; ?></td>
						<td class="left"><?php echo $entry_position; ?></td>
						<td class="left"><?php echo $entry_status; ?></td>
						<td class="left"><?php echo $entry_sort_order; ?></td>
						<td></td>
					</tr>
				</thead>
				<?php $module_row = 0; ?>
				<?php foreach ($modules as $module) { ?>
				<tbody id="module-row<?php echo $module_row; ?>">
					<tr>
						<td class="left"><input type="text" name="tagcloud_module[<?php echo $module_row; ?>][limit]" value="<?php echo $module['limit']; ?>" size="1" /></td>
						
						<td class="center">
							<input type="checkbox" name="tagcloud_module[<?php echo $module_row; ?>][random]" value="1" <?php if (isset($module['random'])) { echo 'checked="checked"'; } ?> />
						</td>
						<td class="left"><select name="tagcloud_module[<?php echo $module_row; ?>][layout_id]">
						<?php foreach ($layouts as $layout) { ?>
							<?php if ($layout['layout_id'] == $module['layout_id']) { ?>
								<option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
							<?php } else { ?>
								<option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
							<?php } ?>
						<?php } ?>
						</select>
						</td>
						<td class="left"><select name="tagcloud_module[<?php echo $module_row; ?>][position]">
							<?php if ($module['position'] == 'content_top') { ?>
							<option value="content_top" selected="selected"><?php echo $text_content_top; ?></option>
							<?php } else { ?>
							<option value="content_top"><?php echo $text_content_top; ?></option>
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
                             <?php if ($module['position'] == 'footer_modules') { ?>
                			<option value="footer_modules" selected="selected">Footer</option>
                			<?php } else { ?>
                			<option value="footer_modules">Footer</option>
                			<?php } ?>
							</select>
						</td>
						<td class="left"><select name="tagcloud_module[<?php echo $module_row; ?>][status]">
							<?php if ($module['status']) { ?>
							<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
							<option value="0"><?php echo $text_disabled; ?></option>
							<?php } else { ?>
							<option value="1"><?php echo $text_enabled; ?></option>
							<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
							<?php } ?>
							</select>
						</td>
						<td class="center">
							<input type="text" name="tagcloud_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>" size="3" />
						</td>
						<td class="center">
							<a onclick="$('#module-row<?php echo $module_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a>
						</td>
					</tr>
				</tbody>
				<?php $module_row++; ?>
				<?php } ?>
				<tfoot>
					<tr>
						<td colspan="6"></td>
						<td class="center"><a onclick="addModule();" class="button"><?php echo $button_add_module; ?></a></td>
					</tr>
				</tfoot>
			</table>
			<input type="hidden" name="buttonForm" value="">
		</form>
	</div>
</div>

<div id="dialog" style="display:none;" title="Generate Product Tags"></div>

<script type="text/javascript"><!--
var module_row = <?php echo $module_row; ?>;

function addModule() {  
	html  = '<tbody id="module-row' + module_row + '">';
	html += '  <tr>';
	html += '    <td class="left"><input type="text" name="tagcloud_module[' + module_row + '][limit]" value="25" size="1" /></td>';
	html += '    <td class="center">';
	html += '      <input type="checkbox" name="tagcloud_module[' + module_row + '][random]" value="1" />';
	html += '    </td>';
	html += '    <td class="left"><select name="tagcloud_module[' + module_row + '][layout_id]">';
	<?php foreach ($layouts as $layout) { ?>
	html += '      <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>';
	<?php } ?>
	html += '    </select></td>';
	html += '    <td class="left"><select name="tagcloud_module[' + module_row + '][position]">';
	html += '      <option value="content_top"><?php echo $text_content_top; ?></option>';
	html += '      <option value="content_bottom"><?php echo $text_content_bottom; ?></option>';
	html += '      <option value="column_left"><?php echo $text_column_left; ?></option>';
	html += '      <option value="column_right"><?php echo $text_column_right; ?></option>';
	html += '        <option value="footer_modules">Footer</option>';
	html += '    </select></td>';
	html += '    <td class="left"><select name="tagcloud_module[' + module_row + '][status]">';
	html += '      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
	html += '      <option value="0"><?php echo $text_disabled; ?></option>';
	html += '    </select></td>';
	html += '    <td class="center"><input type="text" name="tagcloud_module[' + module_row + '][sort_order]" value="" size="3" /></td>';
	html += '    <td class="center"><a onclick="$(\'#module-row' + module_row + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
	html += '  </tr>';
	html += '</tbody>';
  
	$('#module tfoot').before(html);
  
	module_row++;
}
//--></script>

<script type="text/javascript"><!--
$('#generate-tags').click(function(e) {
	e.preventDefault();
	$('#dialog').html('<img src="view/image/loading-bar.gif" alt="" />');
	$('#dialog').dialog();
	$.get('<?php echo html_entity_decode($generate_url); ?>', function(data){
		dialogHtml = '<div style="text-align:center; font-size:18px; font-weight:bold; margin:10px 0px;">'+data['status']+'</div><div style="text-align:center; margin:10px 0px;">'+data['message']+'</div>';
		$('#dialog').html(dialogHtml);
	}, "json");
});
//--></script>

<script type="text/javascript"><!--
function buttonSave() {document.tagcloud.buttonForm.value='save';$('#form').submit();}
function buttonApply() {document.tagcloud.buttonForm.value='apply';$('#form').submit();}
//--></script>

<script type="text/javascript"><!--
$(document).ready(function(){	
	$('.versioncheck').hide().before('<a href="#" id="<?php echo 'versioncheck'; ?>" class="button" style="margin-bottom:10px;"><span><?php echo $button_showhide; ?></span></a>');
	$('a#<?php echo 'versioncheck'; ?>').click(function() {
		$('.versioncheck').slideToggle(1000);
		return false;
	});
});
//--></script>

<?php echo $footer; ?>