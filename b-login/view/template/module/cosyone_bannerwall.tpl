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
      
      <a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a>

      <a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>

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

          <div id="language-<?php echo $module_row; ?>" class="htabs">

            <?php foreach ($languages as $language) { ?>

            <a href="#tab-language-<?php echo $module_row; ?>-<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>

            <?php } ?>

          </div>

          

          <?php foreach ($languages as $language) { ?>

          <div id="tab-language-<?php echo $module_row; ?>-<?php echo $language['language_id']; ?>">         

            <table width="100%" border="1" cellpadding="10px" cellspacing="0">

                <tr>

                    <td class="center">

			<?php echo $entry_image1; ?><br />

                    	<div class="image">

                            <img src="<?php echo $module['thumb1'][$language['language_id']]; ?>" alt="" id="thumb1<?php echo $language['language_id'] . $module_row; ?>" /><br />

                            <input type="hidden" name="cosyone_bannerwall_module[<?php echo $module_row; ?>][image1][<?php echo $language['language_id']; ?>]" value="<?php echo $module['image1'][$language['language_id']]; ?>" id="image1<?php echo $language['language_id'] . $module_row; ?>" />

                            <a onclick="image_upload('image1<?php echo $language['language_id']; ?><?php echo $module_row; ?>', 'thumb1<?php echo $language['language_id']; ?><?php echo $module_row; ?>');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;

                            <a onclick="$('#thumb1<?php echo $language['language_id']; ?><?php echo $module_row; ?>').attr('src', '<?php echo $no_image; ?>'); $('#image1<?php echo $language['language_id']; ?><?php echo $module_row; ?>').attr('value', '');">

                                <?php echo $text_clear; ?>

                            </a>
                            
                           

                        </div>
                          <br /><br /><?php echo $entry_html; ?><br />
                            <textarea rows="6" cols="40" name="cosyone_bannerwall_module[<?php echo $module_row; ?>][html1][<?php echo $language['language_id']; ?>]"><?php echo $module['html1'][$language['language_id']]; ?></textarea>

                           
                    </td>

                    <td class="center" rowspan="2">

			<?php echo $entry_image2; ?><br />

                    	<div class="image">

                        	<img src="<?php echo $module['thumb2'][$language['language_id']]; ?>" alt="" id="thumb2<?php echo $language['language_id'] . $module_row; ?>" /><br />

                  			<input type="hidden" name="cosyone_bannerwall_module[<?php echo $module_row; ?>][image2][<?php echo $language['language_id']; ?>]" value="<?php echo $module['image2'][$language['language_id']]; ?>" id="image2<?php echo $language['language_id'] . $module_row; ?>" />

                  			<a onclick="image_upload('image2<?php echo $language['language_id']; ?><?php echo $module_row; ?>', 'thumb2<?php echo $language['language_id']; ?><?php echo $module_row; ?>');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;

                            <a onclick="$('#thumb2<?php echo $language['language_id']; ?><?php echo $module_row; ?>').attr('src', '<?php echo $no_image; ?>'); $('#image2<?php echo $language['language_id']; ?><?php echo $module_row; ?>').attr('value', '');"><?php echo $text_clear; ?></a>

                        </div>
                         <br /><br /><?php echo $entry_html; ?><br />
                            <textarea rows="6" cols="40" name="cosyone_bannerwall_module[<?php echo $module_row; ?>][html2][<?php echo $language['language_id']; ?>]"><?php echo $module['html2'][$language['language_id']]; ?></textarea>

                    </td>

                    <td class="center">

			<?php echo $entry_image3; ?><br />

                    	<div class="image">

                        	<img src="<?php echo $module['thumb3'][$language['language_id']]; ?>" alt="" id="thumb3<?php echo $language['language_id'] . $module_row; ?>" /><br />

                  			<input type="hidden" name="cosyone_bannerwall_module[<?php echo $module_row; ?>][image3][<?php echo $language['language_id']; ?>]" value="<?php echo $module['image3'][$language['language_id']]; ?>" id="image3<?php echo $language['language_id'] . $module_row; ?>" />

                  			<a onclick="image_upload('image3<?php echo $language['language_id']; ?><?php echo $module_row; ?>', 'thumb3<?php echo $language['language_id']; ?><?php echo $module_row; ?>');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;

                            <a onclick="$('#thumb3<?php echo $language['language_id']; ?><?php echo $module_row; ?>').attr('src', '<?php echo $no_image; ?>'); $('#image3<?php echo $language['language_id']; ?><?php echo $module_row; ?>').attr('value', '');"><?php echo $text_clear; ?></a>

                        </div>
                          <br /><br /><?php echo $entry_html; ?><br />
                            <textarea rows="6" cols="40" name="cosyone_bannerwall_module[<?php echo $module_row; ?>][html3][<?php echo $language['language_id']; ?>]"><?php echo $module['html3'][$language['language_id']]; ?></textarea>

                    </td>

                </tr>

                <tr>

                    <td class="center">

			<?php echo $entry_image4; ?><br />

                    	<div class="image">

                        	<img src="<?php echo $module['thumb4'][$language['language_id']]; ?>" alt="" id="thumb4<?php echo $language['language_id'] . $module_row; ?>" /><br />

                  			<input type="hidden" name="cosyone_bannerwall_module[<?php echo $module_row; ?>][image4][<?php echo $language['language_id']; ?>]" value="<?php echo $module['image4'][$language['language_id']]; ?>" id="image4<?php echo $language['language_id'] . $module_row; ?>" />

                  			<a onclick="image_upload('image4<?php echo $language['language_id']; ?><?php echo $module_row; ?>', 'thumb4<?php echo $language['language_id']; ?><?php echo $module_row; ?>');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;

                            <a onclick="$('#thumb4<?php echo $language['language_id']; ?><?php echo $module_row; ?>').attr('src', '<?php echo $no_image; ?>'); $('#image4<?php echo $language['language_id']; ?><?php echo $module_row; ?>').attr('value', '');"><?php echo $text_clear; ?></a>

                        </div>
                          <br /><br /><?php echo $entry_html; ?><br />
                            <textarea rows="6" cols="40" name="cosyone_bannerwall_module[<?php echo $module_row; ?>][html4][<?php echo $language['language_id']; ?>]"><?php echo $module['html4'][$language['language_id']]; ?></textarea>
                            </td>

                    <td class="center">

			<?php echo $entry_image5; ?><br />

                    	<div class="image">

                        	<img src="<?php echo $module['thumb5'][$language['language_id']]; ?>" alt="" id="thumb5<?php echo $language['language_id'] . $module_row; ?>" /><br />

                  			<input type="hidden" name="cosyone_bannerwall_module[<?php echo $module_row; ?>][image5][<?php echo $language['language_id']; ?>]" value="<?php echo $module['image5'][$language['language_id']]; ?>" id="image5<?php echo $language['language_id'] . $module_row; ?>" />

                  			<a onclick="image_upload('image5<?php echo $language['language_id']; ?><?php echo $module_row; ?>', 'thumb5<?php echo $language['language_id']; ?><?php echo $module_row; ?>');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;

                            <a onclick="$('#thumb5<?php echo $language['language_id']; ?><?php echo $module_row; ?>').attr('src', '<?php echo $no_image; ?>'); $('#image5<?php echo $language['language_id']; ?><?php echo $module_row; ?>').attr('value', '');"><?php echo $text_clear; ?></a>

                        </div>
                         <br /><br /><?php echo $entry_html; ?><br />
                            <textarea rows="6" cols="40" name="cosyone_bannerwall_module[<?php echo $module_row; ?>][html5][<?php echo $language['language_id']; ?>]"><?php echo $module['html5'][$language['language_id']]; ?></textarea>

                    </td>

                </tr>

            </table>

          </div>

          <?php } ?>

          <table class="form">

            <tr>

              <td><?php echo $entry_layout; ?></td>

              <td><select name="cosyone_bannerwall_module[<?php echo $module_row; ?>][layout_id]">

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

              <td><select name="cosyone_bannerwall_module[<?php echo $module_row; ?>][position]">

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

                </select></td>

            </tr>

            <tr>

              <td><?php echo $entry_status; ?></td>

              <td><select name="cosyone_bannerwall_module[<?php echo $module_row; ?>][status]">

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

              <td><input type="text" name="cosyone_bannerwall_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>" size="3" /></td>

            </tr>

          </table>

        </div>

        <?php $module_row++; ?>

        <?php } ?>

      
      <input type="hidden" name="continue" id="applystay" value="0">
      
      </form>

    </div>

  </div>

</div>

<script type="text/javascript"><!--

var module_row = <?php echo $module_row; ?>;



function addModule() {	

	html  = '<div id="tab-module-' + module_row + '" class="vtabs-content">';

	html += '  <div id="language-' + module_row + '" class="htabs">';

    <?php foreach ($languages as $language) { ?>

    html += '    <a href="#tab-language-'+ module_row + '-<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>';

    <?php } ?>

	html += '  </div>';



	<?php foreach ($languages as $language) { ?>

	html += '    <div id="tab-language-'+ module_row + '-<?php echo $language['language_id']; ?>">';

        html += '    <table width="100%" border="1" cellpadding="10px" cellspacing="0">';

        html += '        <tr>';

        html += '            <td class="center">';

	html += '		<?php echo $entry_image1; ?><br />';

        html += '            	<div class="image">';

        html += '                    <img src="<?php echo $no_image; ?>" alt="" id="thumb1<?php echo $language['language_id']; ?>' + module_row + '" /><br />';

        html += '          			<input type="hidden" name="cosyone_bannerwall_module['+ module_row + '][image1][<?php echo $language['language_id']; ?>]" value="" id="image1<?php echo $language['language_id']; ?>'+ module_row + '" />';

        html += '                    <a onclick="image_upload(\'image1<?php echo $language['language_id']; ?>'  + module_row + '\', \'thumb1<?php echo $language['language_id']; ?>'  + module_row + '\');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;';

        html += '                    <a onclick="$(\'#thumb1<?php echo $language['language_id']; ?>'  + module_row + '\').attr(\'src\', \'<?php echo $no_image; ?>\'); $(\'#image1<?php echo $language['language_id']; ?>'  + module_row + '\').attr(\'value\', \'\');">';

        html += '                        <?php echo $text_clear; ?>';

        html += '                    </a>';

        html += '                </div>';
		
		html += '                <br /><br /><?php echo $entry_html; ?><br />';
		html += '          <textarea rows="6" cols="40" name="cosyone_bannerwall_module[' + module_row + '][html1][<?php echo $language['language_id']; ?>]"></textarea>';
		
        html += '            </td>';

        html += '            <td class="center" rowspan="2">';

	html += '		<?php echo $entry_image2; ?><br />';

        html += '            	<div class="image">';

        html += '                	<img src="<?php echo $no_image; ?>" alt="" id="thumb2<?php echo $language['language_id']; ?>' + module_row + '" /><br />';

        html += '          			<input type="hidden" name="cosyone_bannerwall_module['+ module_row + '][image2][<?php echo $language['language_id']; ?>]" value="" id="image2<?php echo $language['language_id']; ?>'+ module_row + '" />';

        html += '          			<a onclick="image_upload(\'image2<?php echo $language['language_id']; ?>'  + module_row + '\', \'thumb2<?php echo $language['language_id']; ?>'  + module_row + '\');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;';

        html += '                    <a onclick="$(\'#thumb2<?php echo $language['language_id']; ?>'  + module_row + '\').attr(\'src\', \'<?php echo $no_image; ?>\'); $(\'#image2<?php echo $language['language_id']; ?>'  + module_row + '\').attr(\'value\', \'\');"><?php echo $text_clear; ?></a>';

        html += '                </div>';
		html += '                <br /><br /><?php echo $entry_html; ?><br />';
		html += '          <textarea rows="6" cols="40" name="cosyone_bannerwall_module[' + module_row + '][html2][<?php echo $language['language_id']; ?>]"></textarea>';
        html += '            </td>';

        html += '            <td class="center">';

	html += '		<?php echo $entry_image3; ?><br />';

        html += '            	<div class="image">';

        html += '                	<img src="<?php echo $no_image; ?>" alt="" id="thumb3<?php echo $language['language_id']; ?>' + module_row + '" /><br />';

        html += '          			<input type="hidden" name="cosyone_bannerwall_module['+ module_row + '][image3][<?php echo $language['language_id']; ?>]" value="" id="image3<?php echo $language['language_id']; ?>'+ module_row + '" />';

        html += '          			<a onclick="image_upload(\'image3<?php echo $language['language_id']; ?>'  + module_row + '\', \'thumb3<?php echo $language['language_id']; ?>'  + module_row + '\');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;';

        html += '                    <a onclick="$(\'#thumb3<?php echo $language['language_id']; ?>'  + module_row + '\').attr(\'src\', \'<?php echo $no_image; ?>\'); $(\'#image3<?php echo $language['language_id']; ?>'  + module_row + '\').attr(\'value\', \'\');"><?php echo $text_clear; ?></a>';

        html += '                </div>';
		html += '                <br /><br /><?php echo $entry_html; ?><br />';
		html += '          <textarea rows="6" cols="40" name="cosyone_bannerwall_module[' + module_row + '][html3][<?php echo $language['language_id']; ?>]"></textarea>';
        html += '            </td>';

        html += '        </tr>';

        html += '        <tr>';

        html += '            <td class="center">';

	html += '		<?php echo $entry_image4; ?><br />';

        html += '            	<div class="image">';

        html += '                	<img src="<?php echo $no_image; ?>" alt="" id="thumb4<?php echo $language['language_id']; ?>' + module_row + '" /><br />';

        html += '          			<input type="hidden" name="cosyone_bannerwall_module['+ module_row + '][image4][<?php echo $language['language_id']; ?>]" value="" id="image4<?php echo $language['language_id']; ?>'+ module_row + '" />';

        html += '          			<a onclick="image_upload(\'image4<?php echo $language['language_id']; ?>'  + module_row + '\', \'thumb4<?php echo $language['language_id']; ?>'  + module_row + '\');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;';

        html += '                    <a onclick="$(\'#thumb4<?php echo $language['language_id']; ?>'  + module_row + '\').attr(\'src\', \'<?php echo $no_image; ?>\'); $(\'#image4<?php echo $language['language_id']; ?>'  + module_row + '\').attr(\'value\', \'\');"><?php echo $text_clear; ?></a>';

        html += '                </div>';
		html += '                <br /><br /><?php echo $entry_html; ?><br />';
		html += '          <textarea rows="6" cols="40" name="cosyone_bannerwall_module[' + module_row + '][html4][<?php echo $language['language_id']; ?>]"></textarea>';
        html += '            </td>';

        html += '            <td class="center">';

	html += '		<?php echo $entry_image5; ?><br />';

        html += '            	<div class="image">';

        html += '                	<img src="<?php echo $no_image; ?>" alt="" id="thumb5<?php echo $language['language_id']; ?>' + module_row + '" /><br />';

        html += '          			<input type="hidden" name="cosyone_bannerwall_module['+ module_row + '][image5][<?php echo $language['language_id']; ?>]" value="" id="image5<?php echo $language['language_id']; ?>'+ module_row + '" />';

        html += '          			<a onclick="image_upload(\'image5<?php echo $language['language_id']; ?>'  + module_row + '\', \'thumb5<?php echo $language['language_id']; ?>'  + module_row + '\');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;';

        html += '                    <a onclick="$(\'#thumb5<?php echo $language['language_id']; ?>'  + module_row + '\').attr(\'src\', \'<?php echo $no_image; ?>\'); $(\'#image5<?php echo $language['language_id']; ?>'  + module_row + '\').attr(\'value\', \'\');"><?php echo $text_clear; ?></a>';

        html += '                </div>';
		html += '                <br /><br /><?php echo $entry_html; ?><br />';
		html += '          <textarea rows="6" cols="40" name="cosyone_bannerwall_module[' + module_row + '][html5][<?php echo $language['language_id']; ?>]"></textarea>';
        html += '            </td>';

        html += '        </tr>';

        html += '    </table>';

	html += '    </div>';

	<?php } ?>

	

	html += '  <table class="form">';

	html += '    <tr>';

	html += '      <td><?php echo $entry_layout; ?></td>';

	html += '      <td><select name="cosyone_bannerwall_module[' + module_row + '][layout_id]">';

	<?php foreach ($layouts as $layout) { ?>

	html += '           <option value="<?php echo $layout['layout_id']; ?>"><?php echo addslashes($layout['name']); ?></option>';

	<?php } ?>

	html += '      </select></td>';

	html += '    </tr>';

	html += '    <tr>';

	html += '      <td><?php echo $entry_position; ?></td>';

	html += '      <td><select name="cosyone_bannerwall_module[' + module_row + '][position]">';

	html += '        <option value="content_top"><?php echo $text_content_top; ?></option>';

	html += '        <option value="content_bottom"><?php echo $text_content_bottom; ?></option>';

	html += '        <option value="column_left"><?php echo $text_column_left; ?></option>';

	html += '        <option value="column_right"><?php echo $text_column_right; ?></option>';

	html += '      </select></td>';

	html += '    </tr>';

	html += '    <tr>';

	html += '      <td><?php echo $entry_status; ?></td>';

	html += '      <td><select name="cosyone_bannerwall_module[' + module_row + '][status]">';

	html += '        <option value="1"><?php echo $text_enabled; ?></option>';

	html += '        <option value="0"><?php echo $text_disabled; ?></option>';

	html += '      </select></td>';

	html += '    </tr>';

	html += '    <tr>';

	html += '      <td><?php echo $entry_sort_order; ?></td>';

	html += '      <td><input type="text" name="cosyone_bannerwall_module[' + module_row + '][sort_order]" value="" size="3" /></td>';

	html += '    </tr>';

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

//--></script> 

<script type="text/javascript"><!--

<?php $module_row = 1; ?>

<?php foreach ($modules as $module) { ?>

$('#language-<?php echo $module_row; ?> a').tabs();

<?php $module_row++; ?>

<?php } ?> 

//--></script>

<style>

.center { text-align:center;}

table {border-collapse: collapse;table-layout: fixed;}


td {border: 1px solid #cccccc;}

</style>

<?php echo $footer; ?>