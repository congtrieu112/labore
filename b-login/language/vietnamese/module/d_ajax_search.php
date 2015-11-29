<?php
// Heading
$_['heading_title']             = ' <span style="color:#449DD0; font-weight:bold">Live Ajax Search</span><span style="font-size:12px; color:#999"> by <a href="http://www.opencart.com/index.php?route=extension/extension&filter_username=Dreamvention" style="font-size:1em; color:#999" target="_blank">Dreamvention</a></span>';
$_['heading_title_main']		= 'Live Ajax Search';

// Text
$_['text_on']         				= 'On';
$_['text_off']						= 'Off';
$_['text_settings']        			= 'Settings';
$_['text_instructions']   		    = 'Instructions';
$_['text_product']   				= 'Product';
$_['text_category'] 				= 'Category';
$_['text_information'] 				= 'Information';
$_['text_manufacturer'] 			= 'Manufacture';
$_['text_blog_article'] 			= 'Blog Article';
$_['text_blog_category'] 			= 'Blog Category';
$_['text_success']					= 'Success: You have modified module Live Ajax Search!';
$_['text_module']         			= 'Module';
$_['text_version_check'] 	        = 'You have version %s';
$_['text_no_update'] 	            = 'Super! You have the latest version.';
$_['text_new_update'] 	            = 'Wow! There is a new version avalible for download.';
$_['text_error_update']             = 'Sorry! Something went wrong. If this repeats, contact the support please.';
$_['text_error_failed'] 	        = 'Oops! We could not connect to the server. Please try again later.';
// Entry
$_['entry_search_on_off']			= 'Enable:';
$_['entry_search_width']			= 'Width of dropdown:';
$_['entry_search_max_symbols'] 		= 'Max Symbols:';
$_['entry_search_max_results'] 		= 'Max Number';
$_['entry_search_first_sybmols'] 	= 'Search only first symbols in the title:';
$_['entry_search_priority'] 		= 'Priority search:';
$_['entry_search_class'] 			= 'Set selector of the search feild';
$_['entry_search_price'] 			= 'Display product price:';
$_['entry_search_special'] 			= 'Display product special:';
$_['entry_search_tax'] 				= 'Display product price and special with tax:';
$_['button_save_and_stay']          = 'Save and Stay';
$_['button_version_check'] 	        = 'Check for update';
//Tooltips		
$_['tooltip_search_width'] 			= 'Set the width of the result dropdown form. i.e. 100px or 100%';
$_['tooltip_search_max_symbols'] 	= 'Max symbols in the title (if 0 - cut disabled)';
$_['tooltip_search_max_results'] 	= 'Max number items in the result list (if 0 - unlimited)';
$_['tooltip_search_on_off']			= 'Turn Ajax Search on/off';
$_['tooltip_search_class']			= 'Use in case you have a custom theme. Some themes create their own class for the input field which breaks the ajax search. You can learn your input selector by looking at the source code of the search field for class=search (write .search) or name=search (write [name=search]) or id=search (write #search), separate by comma ';
$_['tooltip_search_first_symbols']	= 'This will force the search to look only from the begining of the product name (or category). i.e. writing letter c will show CD player, but will not show iMac';

// Error
$_['error_permission']				= 'Warning: You do not have permission to modify module Live Ajax Search!';

$_['tooltip_general_version'] 	= 'When there is a new version available, you can download it from the location you have purchased the module.';

$_['text_instructions_full'] 	= '<div class="col-md-6"><h2>How to use Ajax Menu?</h2>
<p>Turn on module. </p>
 <p>Set the sizes of the drop down in pixels or as a percentage.</p>
 <h3>Set search results</h3>
 <p>You can mark "Max Simbols" and set the max quantity symbols in the title (if 0 - cut disabled) and</br>
 mark "Max Numbers" and set the max number items that user could see in the result list.</p>
 <img src="view/image/d_ajax_search/d_ajax_search_result_dropdown.png" width="100%"/>
<p>Once the customer enters the search field, the system will autocomplete his entry and offer</br>
 a number of products with their name, image and price. Also, you could set this additional<br/>
 options: Search only first symbols in the title, Priority search, Display product price or special or both of them with tax.</p>
 </div>
 <div class="col-md-6">
 <h3>Set selector (class, name or id) of search input field</h3>
 <p>If you are using a custom theme, and the Live Ajax search is not working, most likly you have another class selected for the search input field. just look into the code and set the correct class like - .oc_search, or #search_field etc.</p>
 <img src="view/image/d_ajax_search/d_ajax_search_code_source.png" width="100%"/></div>
';
?>