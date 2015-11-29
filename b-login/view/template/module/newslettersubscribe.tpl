<?php 
/******************************************************

Extension : LB Newsletter
Author : Bhavin Lashkari a.k.a JackLB
Version : 1.0.0

******************************************************/
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
    	<a onclick="$('#form').submit();" class="button"><span><?php echo $button_save; ?></span></a>
        <a onclick="$('#form').submit();" class="button"><span><?php echo $button_delete; ?></span></a>
        <a id="button-send" onclick="send('index.php?route=module/newslettersubscribe/send&token=<?php echo $token; ?>');" class="button"><?php echo $button_send; ?></a>
        <a onclick="location = '<?php echo $cancel; ?>';" class="button"><span><?php echo $button_cancel; ?></span></a>
    </div>
  </div>
  <div class="content">
 	 <div id="tabs" class="htabs">
     	<a href="#tab-general"><?php echo $tab_general; ?></a>
        <a href="#tab-list"><?php echo $tab_list; ?></a>
        <a href="#tab-mail"><?php echo $tab_mail; ?></a>
        <a href="#tab-statistic"><?php echo $tab_statistic; ?></a>
	 </div>
    <form action="<?php echo $delete; ?><?php //echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
     <div id="tab-general">
     	<table class="form">
            <tr>
              <td><?php echo $entry_unsubscribe; ?></td>
              <td><select name="option_unsubscribe">
                  <?php if ($option_unsubscribe) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
            </tr>
            <tr>
              <td><?php echo $entry_mail; ?> </td>
              <td><select name="newslettersubscribe_mail_status">
                  <?php if ($newslettersubscribe_mail_status) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select> </td>
            </tr>
            <tr>
              <td><?php echo $entry_thickbox; ?> <span class="help">Not available for Style = Contrast box</span></td>
              <td><select name="newslettersubscribe_thickbox">
                  <?php if ($newslettersubscribe_thickbox) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select> </td>
            </tr>
            <tr>
              <td><?php echo $entry_registered; ?>
              <span class="help"> When you enable this option open cart registered users also can subscribe or un subscribe using this.
              
              </span>
              </td>
              <td><select name="newslettersubscribe_registered">
                  <?php if ($newslettersubscribe_registered) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
            </tr>
            
           </table>
           <h2>Settings for newsletter popup </h2>
          <table class="form">
            <?php foreach ($languages as $language) { ?>
            <tr>
            <td><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>"  /> Custom content:
              <span class="help">Put your own content above the signup fields.</span></td>
            <td>
            <textarea name="popup_custom_block_<?php echo $language['language_id']; ?>" id="popup_custom_block_<?php echo $language['language_id']; ?>"><?php echo isset(${'popup_custom_block_' . $language['language_id']}) ? ${'popup_custom_block_' . $language['language_id']} : ''; ?></textarea>
            </td>
            </tr>
            <?php } ?>
            
            <tr>
              <td>Delay until execute:
              <span class="help">Time in milleseconds until the popup activates. For example, if you wish to view the popup after 6 seconds, enter 6000. For popup immediately on page load, use 0</span> </td>
              <td>
               <input type="text" value="<?php echo $popup_delay_time?>" name="popup_delay_time" size="6" />
               </td>
            </tr>
            
            <tr>
              <td>Only show once:
              <span class="help">If this is enabled, a cookie will stop the newsletter from showing up again during a period of two weeks</span> </td>
              <td>
               
               <select name="popup_only_show_once">
                  <?php if ($popup_only_show_once) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select>
               </td>
            </tr>
            
            
            
            
          </table>
          <table id="module" class="list">
            <thead>
              <tr>
                <td class="left">Style:</td>
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
              <td class="left"><select name="newslettersubscribe_module[<?php echo $module_row; ?>][style]">
                   
                <?php if ($module['style'] == 'default') { ?>
                <option value="default" selected="selected">Default</option>
                <?php } else { ?>
                <option value="default">Default</option>
                <?php } ?>
                <?php if ($module['style'] == 'box') { ?>
                <option value="box" selected="selected">Contrast box</option>
                <?php } else { ?>
                <option value="box">Contrast box</option>
                <?php } ?>
                <?php if ($module['style'] == 'popup') { ?>
                <option value="popup" selected="selected">Popup</option>
                <?php } else { ?>
                <option value="popup">Popup</option>
                <?php } ?>
                  </select></td>
                  
                <td class="left"><select name="newslettersubscribe_module[<?php echo $module_row; ?>][layout_id]">
                    <?php foreach ($layouts as $layout) { ?>
                    <?php if($layout['layout_id'] == $module['layout_id']){ ?>
                    <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select></td>
                <td class="left"><select name="newslettersubscribe_module[<?php echo $module_row; ?>][position]">
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
                    <option value="footer_modules" selected="selected">Footer modules</option>
                    <?php } else { ?>
                    <option value="footer_modules">Footer modules</option>
                    <?php } ?>
                  </select></td>
                <td class="left"><select name="newslettersubscribe_module[<?php echo $module_row; ?>][status]">
                    <?php if ($module['status']) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select></td>
                <td class="right"><input type="text" name="newslettersubscribe_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order'];  ?>" size="3" /></td>
                <td class="left"><a onclick="$('#module-row<?php echo $module_row; ?>').remove();" class="button"><span><?php echo $button_remove; ?></span></a></td>
              </tr>
            </tbody>
            <?php $module_row++; ?>
            <?php } ?>
            <tfoot>
              <tr>
                <td colspan="5"></td>
                <td class="left"><a onclick="addModule();" class="button"><span><?php echo $button_add_module; ?></span></a></td>
              </tr>
            </tfoot>
          </table>
     </div>
     <div id="tab-list">
     	<table class="list">
        	<thead>
            	<thead>
                  	<tr>
                        <td class="left"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
                        <td class="left">No</td>
                        <td class="left">Email</td>
                        <td class="left">Name</td>
                        <td class="right">Action</td>
                    </tr>
                </thead>
                <tbody>
                	<?php if($users) { ?>
                	<?php foreach ($users as $key => $user) { ?>
                	<tr>
                    	<td class="left">
                        	<?php if ($user['selected']) { ?>
                            <input type="checkbox" name="selected[]" value="<?php echo $user['id']; ?>" checked="checked" />
                            <?php } else { ?>
                            <input type="checkbox" name="selected[]" value="<?php echo $user['id']; ?>" />
                            <?php } ?>
                        </td>
                    	<td class="left"><?php echo $page_nav+$key+1; ?></td>
                        <td class="left"><?php echo $user['email_id']; ?></td>
                        <td class="left"><?php echo $user['name']; ?></td>
                        <td class="right">
                        <?php foreach ($user['action'] as $action) { ?>
                		[ <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> ]
                		<?php } ?>
                        </td>
                    </tr>
                    <?php } ?>
                    <?php } else { ?>
                    <tr>
                      <td class="center" colspan="8"><?php echo $text_no_results; ?></td>
                    </tr>
                    <?php } ?>
                </tbody>
        </table>
        <div class="pagination"><?php echo $pagination; ?></div>
     </div>
     <div id="tab-mail">
     	<table id="mail" class="form">
          <tr>
            <td><?php echo $entry_store; ?></td>
            <td><select name="store_id">
                <option value="0"><?php echo $text_default; ?></option>
                <?php foreach ($stores as $store) { ?>
                <option value="<?php echo $store['store_id']; ?>"><?php echo $store['name']; ?></option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_to; ?></td>
            <td><select name="to">
                <option value="sendall"><?php echo $text_sendall; ?></option>
                <option value="newsletter"><?php echo $text_newsletter; ?></option>
                <option value="lbnewsletter"><?php echo $text_lbnewsletter; ?></option>
                <option value="customer_all"><?php echo $text_customer_all; ?></option>
                <option value="customer_group"><?php echo $text_customer_group; ?></option>
                <option value="customer"><?php echo $text_customer; ?></option>
                <option value="affiliate_all"><?php echo $text_affiliate_all; ?></option>
                <option value="affiliate"><?php echo $text_affiliate; ?></option>
                <option value="product"><?php echo $text_product; ?></option>
              </select></td>
          </tr>
          <tbody id="to-customer-group" class="to">
            <tr>
              <td><?php echo $entry_customer_group; ?></td>
              <td><select name="customer_group_id">
                  <?php foreach ($customer_groups as $customer_group) { ?>
                  <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                  <?php } ?>
                </select></td>
            </tr>
          </tbody>
          <tbody id="to-customer" class="to">
            <tr>
              <td><?php echo $entry_customer; ?></td>
              <td><input type="text" name="customers" value="" /></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td><div id="customer" class="scrollbox"></div></td>
            </tr>
          </tbody>
          <tbody id="to-affiliate" class="to">
            <tr>
              <td><?php echo $entry_affiliate; ?></td>
              <td><input type="text" name="affiliates" value="" /></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td><div id="affiliate" class="scrollbox"></div></td>
            </tr>
          </tbody>
          <tbody id="to-product" class="to">
            <tr>
              <td><?php echo $entry_product; ?></td>
              <td><input type="text" name="products" value="" /></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td><div id="product" class="scrollbox"></div></td>
            </tr>
          </tbody>
          <tr>
            <td><span class="required">*</span> <?php echo $entry_subject; ?></td>
            <td><input type="text" name="subject" value="" /></td>
          </tr>
          <tr>
            <td><span class="required">*</span> <?php echo $entry_message; ?></td>
            <td><textarea name="message"></textarea></td>
          </tr>
        </table>
     </div>
     <div id="tab-statistic">
    	
     
     	<script type="text/javascript" src="https://www.google.com/jsapi"></script>
		<script type="text/javascript">
          google.load("visualization", "1", {packages:["corechart"]});
          google.setOnLoadCallback(drawChart);
          function drawChart() {
            var data = google.visualization.arrayToDataTable([
              ['Date', 'Users'],
			  <?php foreach($jack as $key => $j) { ?> 
			  ['<?php echo date("d M",strtotime($key)); ?>',  <?php echo $j; ?>],
			  <?php } ?>
            ]);
    
            var options = {
              	title: 'Last 15 Days Newsletter Report',
			   	width: 1800, 
			   	height: 500,
				vAxis: {title: 'Users Per Day', titleTextStyle: {color: '#000'}},
				hAxis: {title: 'Date', titleTextStyle: {color: '#000'}},
				
			};
    		

       	 	var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
        	chart.draw(data, options);

          }
        </script>
        <div id="chart_div" style="width: 100%; height: 500px;"></div>

     </div>
     
    </form>
  </div>
  <br />
  
  <div style="text-align:center"><?php echo $text_info; ?></div>
  
  <br />
  
</div>
<script type="text/javascript"><!--
$('#tabs a').tabs(); 
$('#languages a').tabs(); 
//--><!--</script>
<script type="text/javascript"><!--
var module_row = <?php echo $module_row; ?>;

function addModule() {	
	html  = '<tbody id="module-row' + module_row + '">';
	
	html += '  <tr>';
	html += '    <td class="left"><select name="newslettersubscribe_module[' + module_row + '][style]">';
	html += '        <option value="default">Default</option>';
	html += '        <option value="box">Contrast box</option>';
	html += '        <option value="popup">Popup</option>';
	html += '    </select></td>';		  
				  
	html += '    <td class="left"><select name="newslettersubscribe_module[' + module_row + '][layout_id]">';
	<?php foreach ($layouts as $layout) { ?>
	html += '      <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>';
	<?php } ?>
	html += '    </select></td>';
	html += '    <td class="left"><select name="newslettersubscribe_module[' + module_row + '][position]">';
	html += '        <option value="home_top_top">Home top (top)</option>';
	html += '        <option value="home_top_left">Home top (left)</option>';
	html += '        <option value="home_top_center">Home top (center)</option>';
	html += '        <option value="home_top_right">Home top (right)</option>';
	html += '      <option value="content_top"><?php echo $text_content_top; ?></option>';
	html += '      <option value="content_bottom"><?php echo $text_content_bottom; ?></option>';
	html += '      <option value="column_left"><?php echo $text_column_left; ?></option>';
	html += '      <option value="column_right"><?php echo $text_column_right; ?></option>';
	html += '    </select></td>';
	html += '    <td class="left"><select name="newslettersubscribe_module[' + module_row + '][status]">';
    html += '      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
    html += '      <option value="0"><?php echo $text_disabled; ?></option>';
    html += '    </select></td>';
	html += '    <td class="right"><input type="text" name="newslettersubscribe_module[' + module_row + '][sort_order]" value="" size="3" /></td>';
	html += '    <td class="left"><a onclick="$(\'#module-row' + module_row + '\').remove();" class="button"><span><?php echo $button_remove; ?></span></a></td>';
	html += '  </tr>';
	html += '</tbody>';
	
	$('#module tfoot').before(html);
	
	module_row++;
}

$('#form').bind('submit', function() {
	var module = new Array(); 

	$('#module tbody').each(function(index, element) {
		module[index] = $(element).attr('id').substr(10);
	});
	
	$('input[name=\'newslettersubscribe_module\']').attr('value', module.join(','));
});
//--></script>
<!-- Start : NewsLetter -->
<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script>
<script type="text/javascript"><!--
CKEDITOR.replace('message', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
//--></script> 
<script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
CKEDITOR.replace('popup_custom_block_<?php echo $language['language_id']; ?>', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
<?php } ?>
//--></script> 

<script type="text/javascript"><!--	
$('select[name=\'to\']').bind('change', function() {
	$('#mail .to').hide();
	
	$('#mail #to-' + $(this).attr('value').replace('_', '-')).show();
});

$('select[name=\'to\']').trigger('change');
//--></script> 
<script type="text/javascript"><!--
$.widget('custom.catcomplete', $.ui.autocomplete, {
	_renderMenu: function(ul, items) {
		var self = this, currentCategory = '';
		
		$.each(items, function(index, item) {
			if (item.category != currentCategory) {
				ul.append('<li class="ui-autocomplete-category">' + item.category + '</li>');
				
				currentCategory = item.category;
			}
			
			self._renderItem(ul, item);
		});
	}
});

$('input[name=\'customers\']').catcomplete({
	delay: 500,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=sale/customer/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {	
				response($.map(json, function(item) {
					return {
						category: item.customer_group,
						label: item.name,
						value: item.customer_id
					}
				}));
			}
		});
		
	}, 
	select: function(event, ui) {
		$('#customer' + ui.item.value).remove();
		
		$('#customer').append('<div id="customer' + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" alt="" /><input type="hidden" name="customer[]" value="' + ui.item.value + '" /></div>');

		$('#customer div:odd').attr('class', 'odd');
		$('#customer div:even').attr('class', 'even');
				
		return false;
	},
	focus: function(event, ui) {
      	return false;
   	}
});

$('#customer div img').live('click', function() {
	$(this).parent().remove();
	
	$('#customer div:odd').attr('class', 'odd');
	$('#customer div:even').attr('class', 'even');	
});
//--></script> 
<script type="text/javascript"><!--	
$('input[name=\'affiliates\']').autocomplete({
	delay: 500,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=sale/affiliate/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.name,
						value: item.affiliate_id
					}
				}));
			}
		});
		
	}, 
	select: function(event, ui) {
		$('#affiliate' + ui.item.value).remove();
		
		$('#affiliate').append('<div id="affiliate' + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" alt="" /><input type="hidden" name="affiliate[]" value="' + ui.item.value + '" /></div>');

		$('#affiliate div:odd').attr('class', 'odd');
		$('#affiliate div:even').attr('class', 'even');
				
		return false;
	},
	focus: function(event, ui) {
      	return false;
   	}
});

$('#affiliate div img').live('click', function() {
	$(this).parent().remove();
	
	$('#affiliate div:odd').attr('class', 'odd');
	$('#affiliate div:even').attr('class', 'even');	
});

$('input[name=\'products\']').autocomplete({
	delay: 500,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.name,
						value: item.product_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('#product' + ui.item.value).remove();
		
		$('#product').append('<div id="product' + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" alt="" /><input type="hidden" name="product[]" value="' + ui.item.value + '" /></div>');

		$('#product div:odd').attr('class', 'odd');
		$('#product div:even').attr('class', 'even');
				
		return false;
	},
	focus: function(event, ui) {
      	return false;
   	}
});

$('#product div img').live('click', function() {
	$(this).parent().remove();
	
	$('#product div:odd').attr('class', 'odd');
	$('#product div:even').attr('class', 'even');	
});

function send(url) { 
	$('textarea[name="message"]').val(CKEDITOR.instances.message.getData());
	
	$.ajax({
		url: url,
		type: 'post',
		data: $('select, input, textarea'),		
		dataType: 'json',
		beforeSend: function() {
			$('#button-send').attr('disabled', true);
			$('#button-send').before('<span class="wait"><img src="view/image/loading.gif" alt="" />&nbsp;</span>');
		},
		complete: function() {
			$('#button-send').attr('disabled', false);
			$('.wait').remove();
		},				
		success: function(json) {
			$('.success, .warning, .error').remove();
			
			if (json['error']) {
				if (json['error']['warning']) {
					$('.box').before('<div class="warning" style="display: none;">' + json['error']['warning'] + '</div>');
			
					$('.warning').fadeIn('slow');
				}
				
				if (json['error']['subject']) {
					$('input[name=\'subject\']').after('<span class="error">' + json['error']['subject'] + '</span>');
				}	
				
				if (json['error']['message']) {
					$('textarea[name=\'message\']').parent().append('<span class="error">' + json['error']['message'] + '</span>');
				}									
			}			
			
			if (json['next']) {
				if (json['success']) {
					$('.box').before('<div class="success">' + json['success'] + '</div>');
					
					send(json['next']);
				}		
			} else {
				if (json['success']) {
					$('.box').before('<div class="success" style="display: none;">' + json['success'] + '</div>');
			
					$('.success').fadeIn('slow');
				}					
			}				
		}
	});
}
//--></script>
<!-- End : NewsLetter -->
<?php echo $footer; ?>