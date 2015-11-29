<?php echo $header; ?>
<?php 
(!isset($cosyone_menu_mega_second_image_w)) ? $cosyone_menu_mega_second_image_w = 165 : '';
(!isset($cosyone_menu_mega_second_image_h)) ? $cosyone_menu_mega_second_image_h = 100 : '';
(!isset($cosyone_refine_image_w)) ? $cosyone_refine_image_w = 190 : '';
(!isset($cosyone_refine_image_h)) ? $cosyone_refine_image_h = 190 : '';
?>
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
       <a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
   <div class="content">
      <div id="tabs" class="htabs">
      <a href="#tab-general"><?php echo $text_tab_general;?></a>
      <a href="#tab-design"><?php echo $text_tab_design;?></a>
      <a href="#tab-custom-css"><?php echo $text_tab_custom_css;?></a>
      </div>
       <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
    <div id="tab-general">
    
    <div class="vtabs">
    <a href="#tab-layout">Layout</a>
    <a href="#tab-header">Header</a>
    <a href="#tab-menu">Menu</a>
    <a href="#tab-product-page">Product page</a>
    <a href="#tab-category-page">Category page</a>
    <a href="#tab-contact-page">Contact page</a>
    <a href="#tab-product-listings">Product listings</a>
    <a href="#tab-footer">Footer</a>
    <a href="#tab-cookie">Cookie bar</a>
    <a href="#tab-explorer">Internet Explorer warning</a>
    </div> <!-- vtabs ends -->
    
    <div id="tab-layout" class="vtabs-content"> <!-- Tab layout start -->
    <h2><?php echo $text_heading_layout;?></h2>
    <table class="form">
    <tr>
      <td><?php echo $text_max_width;?></td>
      <td>
      <select name="cosyone_max_width">
      <?php foreach($cosyone_max_width_list as $key=>$cosyone_max_width_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_max_width==$key) { echo " selected"; }?> ><?php echo $cosyone_max_width_list;?></option>
      <?php } ?>
      </select>
	  </td>
      </tr>
      
      
      
      <tr>
      <td><?php echo $text_use_responsive_layout;?></td>
      <td>
      <select name="cosyone_use_responsive">
      <?php foreach($cosyone_use_responsive_list as $key=>$cosyone_use_responsive_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_use_responsive==$key) { echo " selected"; }?> ><?php echo $cosyone_use_responsive_list;?></option>
      <?php } ?>
      </select>
	  </td>
      </tr>  
      
      <tr>
      <td>Show breadcrumb</td>
      <td>
      <select name="cosyone_use_breadcrumb">
      <?php foreach($cosyone_use_breadcrumb_list as $key=>$cosyone_use_breadcrumb_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_use_breadcrumb==$key) { echo " selected"; }?> ><?php echo $cosyone_use_breadcrumb_list;?></option>
      <?php } ?>
      </select>
	  </td>
      </tr> 
      
      <tr>
      <td>Embed retina support
      <span class="help">Retina support will look for retina versions of images for visitors using a high resolution screen. To upload an extra image for retina users, upload the image twice as big, and add "@2x" to the image name. For example, if your logo is logo.png, you should upload the retina version in the same folder, named as logo@2x.png. Please note that when opencart resizes images, it wont create double sets for retina, so you need to upload these manually.</span></td>
      <td>
      <select name="cosyone_use_retina">
      <?php foreach($cosyone_use_retina_list as $key=>$cosyone_use_retina_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_use_retina==$key) { echo " selected"; }?> ><?php echo $cosyone_use_retina_list;?></option>
      <?php } ?>
      </select>
	  </td>
      </tr>  
          
    </table>
    </div> <!-- Tab layout ends -->
    
    
    
    <div id="tab-header" class="vtabs-content"> <!-- Tab header start -->
    <h2>Header settings</h2>
    <table class="form">
    
    <tr>
      <td>Header style</td>
      <td>
      <select name="cosyone_header_style">
      <?php foreach($cosyone_header_style_list as $key=>$cosyone_header_style_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_header_style==$key) { echo " selected"; }?> ><?php echo $cosyone_header_style_list;?></option>
      <?php } ?>
      </select>
	  </td>
      </tr>
      
      <tr>
      <td>Show header login</td>
      <td>
      <select name="cosyone_header_login">
      <?php foreach($cosyone_header_login_list as $key=>$cosyone_header_login_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_header_login==$key) { echo " selected"; }?> ><?php echo $cosyone_header_login_list;?></option>
      <?php } ?>
      </select>
	  </td>
      </tr>
      
       <tr>
      <td>Show header wishlist</td>
      <td>
      <select name="cosyone_header_wishlist">
      <?php foreach($cosyone_header_wishlist_list as $key=>$cosyone_header_wishlist_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_header_wishlist==$key) { echo " selected"; }?> ><?php echo $cosyone_header_wishlist_list;?></option>
      <?php } ?>
      </select>
	  </td>
      </tr>
      
       <tr>
      <td>Show header compare</td>
      <td>
      <select name="cosyone_header_compare">
      <?php foreach($cosyone_header_compare_list as $key=>$cosyone_header_compare_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_header_compare==$key) { echo " selected"; }?> ><?php echo $cosyone_header_compare_list;?></option>
      <?php } ?>
      </select>
	  </td>
      </tr>
      
      <tr>
      <td>Show header search</td>
      <td>
      <select name="cosyone_header_search">
      <?php foreach($cosyone_header_search_list as $key=>$cosyone_header_search_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_header_search==$key) { echo " selected"; }?> ><?php echo $cosyone_header_search_list;?></option>
      <?php } ?>
      </select>
	  </td>
      </tr>
      
      <tr>
      <td>Show header cart</td>
      <td>
      <select name="cosyone_header_cart">
      <?php foreach($cosyone_header_cart_list as $key=>$cosyone_header_cart_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_header_cart==$key) { echo " selected"; }?> ><?php echo $cosyone_header_cart_list;?></option>
      <?php } ?>
      </select>
	  </td>
      </tr>
      
      <?php foreach ($languages as $language) { ?>
    <tr>
      <td valign="top"> <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>"  /> <?php echo $text_custom_top_promo_message;?><span class="help"><?php echo $text_custom_top_promo_message_help;?></span></td>
      <td>
      <input name="cosyone_top_promo_message_<?php echo $language['language_id']; ?>" value="<?php echo isset(${'cosyone_top_promo_message_' . $language['language_id']}) ? ${'cosyone_top_promo_message_' . $language['language_id']} : ''; ?>" size="100"> 
	  </td>
      </tr>
    <?php } ?>
    
    </table>
    
    
    </div> <!-- tab header ends -->
    
    <div id="tab-menu" class="vtabs-content"> <!-- Tab menu start -->
    <h2><?php echo $text_heading_main_menu_general;?></h2>
    <table class="form">
      
      <tr>
      <td>Use sticky menu<span class="help">Menu stays on top of screen when scrolling down</span></td>
      <td>
      <select name="cosyone_menu_sticky">
      <?php foreach($cosyone_menu_sticky_list as $key=>$cosyone_menu_sticky_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_menu_sticky==$key) { echo " selected"; }?> ><?php echo $cosyone_menu_sticky_list;?></option>
      <?php } ?>
      </select>
	  </td>
      </tr>
      <tr>
      
      <tr>
      <td><?php echo $text_use_home_icon;?></td>
      <td>
      <select name="cosyone_show_home_icon">
      <?php foreach($cosyone_show_home_icon_list as $key=>$cosyone_show_home_icon_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_show_home_icon==$key) { echo " selected"; }?> ><?php echo $cosyone_show_home_icon_list;?></option>
      <?php } ?>
      </select>
	  </td>
      </tr>
      <tr>
      
      <tr>
      <td>Show border above menu</td>
      <td>
      <select name="cosyone_menu_border">
      <?php foreach($cosyone_menu_border_list as $key=>$cosyone_menu_border_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_menu_border==$key) { echo " selected"; }?> ><?php echo $cosyone_menu_border_list;?></option>
      <?php } ?>
      </select>
	  </td>
      </tr>
      <tr>
      
      </table>
      <h2><?php echo $text_heading_mega_menu_settings;?></h2>
      <table class="form">
      </tr>
      
     
      
      </tr>
      <tr>
      <td><?php echo $text_menu_mega_second_thumb;?>
      <span class="help"><?php echo $text_menu_mega_second_thumb_help;?></span></td>
      <td valign="top">
      <select name="cosyone_menu_mega_second_thumb">
      <?php foreach($cosyone_menu_mega_second_thumb_list as $key=>$cosyone_menu_mega_second_thumb_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_menu_mega_second_thumb==$key) { echo " selected"; }?> ><?php echo $cosyone_menu_mega_second_thumb_list;?></option>
      <?php } ?>
      </select>
	  </td>
      </tr>
      <tr>
      <td><?php echo $text_menu_mega_second_image_w;?></td>
      <td>
      <input type="text" value="<?php echo $cosyone_menu_mega_second_image_w?>" name="cosyone_menu_mega_second_image_w" size="5" /> px
      </td>
      </tr>
      <tr>
      <td><?php echo $text_menu_mega_second_image_h;?></td>
      <td>
      <input type="text" value="<?php echo $cosyone_menu_mega_second_image_h?>" name="cosyone_menu_mega_second_image_h" size="5" /> px
      </td>
      </tr>
      <tr>
      
      </table>
      
      <h2><?php echo $text_use_custom_menu_link1;?></h2>
      <table class="form">
      <td><?php echo $text_use_custom_menu_link1;?></td>
      <td>
      <select name="cosyone_custom_menu_link1">
      <?php foreach($cosyone_custom_menu_link1_list as $key=>$cosyone_custom_menu_link1_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_custom_menu_link1==$key) { echo " selected"; }?> ><?php echo $cosyone_custom_menu_link1_list;?></option>
      <?php } ?>
      </select>
	  </td>
      </tr>
    <?php foreach ($languages as $language) { ?>
    <tr>
      <td> <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>"  /> <?php echo $text_use_custom_menu_title1;?></td>
      <td>
      <input name="cosyone_custom_menu_title1_<?php echo $language['language_id']; ?>" value="<?php echo isset(${'cosyone_custom_menu_title1_' . $language['language_id']}) ? ${'cosyone_custom_menu_title1_' . $language['language_id']} : ''; ?>" size="40"> 
	  </td>
      </tr>
    <?php } ?>
    <tr>
    <td><?php echo $text_use_custom_menu_url1;?></td>
    <td>
    <input type="text" value="<?php echo $cosyone_custom_menu_url1?>" name="cosyone_custom_menu_url1" size="40" />
	</td>
    </tr>
    <tr>
    </table>
      <h2><?php echo $text_use_custom_menu_link2;?></h2>
      <table class="form">
      <td><?php echo $text_use_custom_menu_link2;?></td>
      <td>
      <select name="cosyone_custom_menu_link2">
      <?php foreach($cosyone_custom_menu_link2_list as $key=>$cosyone_custom_menu_link2_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_custom_menu_link2==$key) { echo " selected"; }?> ><?php echo $cosyone_custom_menu_link2_list;?></option>
      <?php } ?>
      </select>
	  </td>
      </tr>
    <?php foreach ($languages as $language) { ?>
    <tr>
      <td> <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>"  /> <?php echo $text_use_custom_menu_title2;?></td>
      <td>
      <input name="cosyone_custom_menu_title2_<?php echo $language['language_id']; ?>" value="<?php echo isset(${'cosyone_custom_menu_title2_' . $language['language_id']}) ? ${'cosyone_custom_menu_title2_' . $language['language_id']} : ''; ?>" size="40"> 
	  </td>
      </tr>
    <?php } ?>
    <tr>
    <td><?php echo $text_use_custom_menu_url2;?></td>
    <td>
    <input type="text" value="<?php echo $cosyone_custom_menu_url2?>" name="cosyone_custom_menu_url2" size="40" />
	</td>
    </tr>
    <tr>
     </table>
      <h2><?php echo $text_use_custom_menu_block;?></h2>
      <table class="form">
      <tr>
      <td><?php echo $text_use_custom_menu_block;?></td>
      <td>
      <select name="cosyone_custom_menu_block">
      <?php foreach($cosyone_custom_menu_block_list as $key=>$cosyone_custom_menu_block_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_custom_menu_block==$key) { echo " selected"; }?> ><?php echo $cosyone_custom_menu_block_list;?></option>
      <?php } ?>
      </select>
	  </td>
      </tr>
      
      <tr>
      <td>Custom block width</td>
      <td>
      <input type="text" value="<?php echo $cosyone_menu_block_width?>" name="cosyone_menu_block_width" size="40" /> px
	  </td>
      </tr>
      
    <?php foreach ($languages as $language) { ?>
    <tr>
      <td> <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>"  /> <?php echo $text_use_custom_menu_block_title;?></td>
      <td>
      <input name="cosyone_custom_menu_block_title_<?php echo $language['language_id']; ?>" value="<?php echo isset(${'cosyone_custom_menu_block_title_' . $language['language_id']}) ? ${'cosyone_custom_menu_block_title_' . $language['language_id']} : ''; ?>" size="40"> 
	  </td>
      </tr>
    <?php } ?>
    <?php foreach ($languages as $language) { ?>
    <tr>
      <td> <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>"  /> <?php echo $text_menu_custom_block_content;?><span class="help"><?php echo $text_menu_custom_block_content_help;?></span></td>
      <td>
      <textarea name="cosyone_menu_custom_block_<?php echo $language['language_id']; ?>" id="cosyone_menu_custom_block_<?php echo $language['language_id']; ?>"><?php echo isset(${'cosyone_menu_custom_block_' . $language['language_id']}) ? ${'cosyone_menu_custom_block_' . $language['language_id']} : ''; ?></textarea>
	  </td>
      </tr>
    <?php } ?>
    </table>
    </div> <!-- tab menu ends -->
    
    <div id="tab-product-page" class="vtabs-content"> <!-- Tab product page start -->
    <h2><?php echo $text_heading_product_page;?></h2>
    <table class="form">
 
      <tr>
      <td>addThis share buttons</td>
      <td>
      <select name="cosyone_product_share">
      <?php foreach($cosyone_product_share_list as $key=>$cosyone_product_share_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_product_share==$key) { echo " selected"; }?> ><?php echo $cosyone_product_share_list;?></option>
      <?php } ?>
      </select>
	  </td>
      </tr>
      
      <tr>
      <td>Show "You save" amount on specials<span class="help">Extended price information with old price, special price and discount amount.</span></td>
      <td>
      <select name="cosyone_product_yousave">
      <?php foreach($cosyone_product_yousave_list as $key=>$cosyone_product_yousave_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_product_yousave==$key) { echo " selected"; }?> ><?php echo $cosyone_product_yousave_list;?></option>
      <?php } ?>
      </select>
	  </td>
      </tr>
      
      <tr>
      <td>Show Timer countdown on specials<span class="help">Note that you need to set an end date on the special price to enable countdown</span></td>
      <td>
      <select name="cosyone_product_countdown">
      <?php foreach($cosyone_product_countdown_list as $key=>$cosyone_product_countdown_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_product_countdown==$key) { echo " selected"; }?> ><?php echo $cosyone_product_countdown_list;?></option>
      <?php } ?>
      </select>
	  </td>
      </tr>
      
      <tr>
      <td>Show items sold/items left below countdown</td>
      <td>
      <select name="cosyone_product_hurry">
      <?php foreach($cosyone_product_hurry_list as $key=>$cosyone_product_hurry_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_product_hurry==$key) { echo " selected"; }?> ><?php echo $cosyone_product_hurry_list;?></option>
      <?php } ?>
      </select>
	  </td>
      </tr>
      
      <tr>
      <td>Image zoom alternative on product page</td>
      <td>
      <select name="cosyone_product_zoom">
      <?php foreach($cosyone_product_zoom_list as $key=>$cosyone_product_zoom_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_product_zoom==$key) { echo " selected"; }?> ><?php echo $cosyone_product_zoom_list;?></option>
      <?php } ?>
      </select>
	  </td>
      </tr>
      
      <tr>
      <td>Image options style
      <span class="help">If product has options with the type <i>Image</i>. Clean thumbs shows only the image, while Opencart default style shows radio button + image thumb + option name. If Clean thumb is used, the image thumbs will be 20px high.</span></td>
      <td>
      <select name="cosyone_image_options">
      <?php foreach($cosyone_image_options_list as $key=>$cosyone_image_options_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_image_options==$key) { echo " selected"; }?> ><?php echo $cosyone_image_options_list;?></option>
      <?php } ?>
      </select>
	  </td>
      </tr>
      
      <tr>
      <td>Content bottom layout<span class="help">When full width layout is enabled, the right/left columns will break, and related products + content bottom area will use the content full width (below columns)</span></td>
      <td>
      <select name="cosyone_product_break">
      <?php foreach($cosyone_product_break_list as $key=>$cosyone_product_break_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_product_break==$key) { echo " selected"; }?> ><?php echo $cosyone_product_break_list;?></option>
      <?php } ?>
      </select>
	  </td>
      </tr>
      
      
      
    </table>
    </div> <!-- Tab product page ends -->
    
    <div id="tab-category-page" class="vtabs-content"> <!-- Tab product page start -->
    <h2>Category page</h2>
    <table class="form">
 	<tr>
      <td><?php echo $text_menu_mega_show_thumb;?>
      <span class="help"><?php echo $text_menu_mega_show_thumb_help;?></span></td>
      <td valign="top">
      <select name="cosyone_category_thumb">
      <?php foreach($cosyone_category_thumb_list as $key=>$cosyone_category_thumb_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_category_thumb==$key) { echo " selected"; }?> ><?php echo $cosyone_category_thumb_list;?></option>
      <?php } ?>
      </select>
	  </td>
      </tr>
      <tr>
      <td>Show sub-categories on category pages</td>
      <td>
      <select name="cosyone_category_refine">
      <?php foreach($cosyone_category_refine_list as $key=>$cosyone_category_refine_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_category_refine==$key) { echo " selected"; }?> ><?php echo $cosyone_category_refine_list;?></option>
      <?php } ?>
      </select>
	  </td>
      </tr>
      
      <tr>
      <td>Sub-categories per row</td>
      <td valign="top">
      <select name="cosyone_category_per_row">
      <?php foreach($cosyone_category_per_row_list as $key=>$cosyone_category_per_row_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_category_per_row==$key) { echo " selected"; }?> ><?php echo $cosyone_category_per_row_list;?></option>
      <?php } ?>
      </select>
	  </td>
      </tr>
      
      <tr>
      <td>Sub-categories thumb size (width)</td>
      <td>
      <input type="text" value="<?php echo $cosyone_refine_image_w?>" name="cosyone_refine_image_w" /> px
	  </td>
      </tr>
      
      <tr>
      <td>Sub-categories thumb size (height)</td>
      <td>
      <input type="text" value="<?php echo $cosyone_refine_image_h?>" name="cosyone_refine_image_h" /> px
	  </td>
      </tr>
      
      
      
      
    </table>
    </div> <!-- Tab category page ends -->
    
    
    <div id="tab-contact-page" class="vtabs-content"> <!-- Tab contact page start -->
    <h2>Contact page</h2>
    <table class="form">
 	
      <tr>
      <td>Google maps iframe</td>
      <td>
      <textarea cols="120" rows="15" name="cosyone_google_map"><?php echo $cosyone_google_map?></textarea>
	  </td>
      </tr>
      
    </table>
    </div> <!-- Tab contact page ends -->
    
    
    
    <div id="tab-product-listings" class="vtabs-content"> <!-- Tab product listings start -->
    <h2><?php echo $text_heading_product_listings;?></h2>
    <table class="form">
    
    <tr>
      <td>Product listing style</td>
      <td>
      <select name="cosyone_default_product_style">
      <?php foreach($cosyone_default_product_style_list as $key=>$cosyone_default_product_style_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_default_product_style==$key) { echo " selected"; }?> ><?php echo $cosyone_default_product_style_list;?></option>
      <?php } ?>
      </select>
	  </td>
      </tr>
      
      
      
     <tr>
      <td><?php echo $text_default_product_listing;?></td>
      <td>
      <select name="cosyone_default_view">
      <?php foreach($cosyone_default_view_list as $key=>$cosyone_default_view_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_default_view==$key) { echo " selected"; }?> ><?php echo $cosyone_default_view_list;?></option>
      <?php } ?>
      </select>
	  </td>
      </tr>
      
    
    <tr>
      <td><?php echo $text_grid_category;?></td>
      <td>
      <select name="cosyone_grid_category">
      <?php foreach($cosyone_grid_category_list as $key=>$cosyone_grid_category_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_grid_category==$key) { echo " selected"; }?> ><?php echo $cosyone_grid_category_list;?></option>
      <?php } ?>
      </select>
	  </td>
    </tr>
    
    <tr>
      <td><?php echo $text_grid_related;?></td>
      <td>
      <select name="cosyone_grid_related">
      <?php foreach($cosyone_grid_related_list as $key=>$cosyone_grid_related_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_grid_related==$key) { echo " selected"; }?> ><?php echo $cosyone_grid_related_list;?></option>
      <?php } ?>
      </select>
	  </td>
    </tr>
      
      <tr>
      <td><?php echo $text_rollover_effect;?></td>
      <td>
      <select name="cosyone_rollover_effect">
      <?php foreach($cosyone_rollover_effect_list as $key=>$cosyone_rollover_effect_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_rollover_effect==$key) { echo " selected"; }?> ><?php echo $cosyone_rollover_effect_list;?></option>
      <?php } ?>
      </select>
	  </td>
      </tr>
      
      <tr>
      <td><?php echo $text_percentage_sale_badge;?></td>
      <td>
      <select name="cosyone_percentage_sale_badge">
      <?php foreach($cosyone_percentage_sale_badge_list as $key=>$cosyone_percentage_sale_badge_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_percentage_sale_badge==$key) { echo " selected"; }?> ><?php echo $cosyone_percentage_sale_badge_list;?></option>
      <?php } ?>
      </select>
	  </td>
      </tr>
      
      <tr>
      <td>Show brand name</td>
      <td>
      <select name="cosyone_brand">
      <?php foreach($cosyone_brand_list as $key=>$cosyone_brand_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_brand==$key) { echo " selected"; }?> ><?php echo $cosyone_brand_list;?></option>
      <?php } ?>
      </select>
	  </td>
      </tr>
      
      
      
      <?php foreach ($languages as $language) { ?>
    <tr>
      <td> <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>"  /> Quicklook translation<span class="help">Leave blank to disable quicklook</span></td>
      <td>
      <input name="cosyone_text_ql_<?php echo $language['language_id']; ?>" value="<?php echo isset(${'cosyone_text_ql_' . $language['language_id']}) ? ${'cosyone_text_ql_' . $language['language_id']} : ''; ?>" size="40"> 
	  </td>
      </tr>
    <?php } ?>
    
      
    </table>
    
    </div> <!-- Tab product listings ends -->
    
    <div id="tab-footer" class="vtabs-content"> <!-- Tab footer start -->
    <h2>Footer modules</h2>
    <table class="form">
    
    <tr>
      <td>Modules per row</td>
      <td>
      <select name="cosyone_footer_columns">
      <?php foreach($cosyone_footer_columns_list as $key=>$cosyone_footer_columns_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_footer_columns==$key) { echo " selected"; }?> ><?php echo $cosyone_footer_columns_list;?></option>
      <?php } ?>
      </select>
	  </td>
      </tr>
      
    </table>
    
    <h2>Footer static block</h2>
    <table class="form">
    
    <?php foreach ($languages as $language) { ?>
    <tr>
      <td> <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>"  /> Title</td>
      <td>
      <input name="cosyone_footer_custom_block_title_<?php echo $language['language_id']; ?>" value="<?php echo isset(${'cosyone_footer_custom_block_title_' . $language['language_id']}) ? ${'cosyone_footer_custom_block_title_' . $language['language_id']} : ''; ?>" size="40"> 
	  </td>
      </tr>
    <?php } ?>
    <?php foreach ($languages as $language) { ?>
    <tr>
      <td> <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>"  />Custom content</td>
      <td>
      <textarea name="cosyone_footer_custom_block_<?php echo $language['language_id']; ?>" id="cosyone_footer_custom_block_<?php echo $language['language_id']; ?>"><?php echo isset(${'cosyone_footer_custom_block_' . $language['language_id']}) ? ${'cosyone_footer_custom_block_' . $language['language_id']} : ''; ?></textarea>
	  </td>
      </tr>
    <?php } ?>
    </table>
    
    <h2><?php echo $text_upload_payment_icon;?></h2>
    <table class="form">
    <tr>
      <td><?php echo $text_upload_payment_icon;?></td>
      <td>
      <div class="image">
      <img src="<?php echo $cosyone_footer_payment_thumb; ?>" alt="" id="thumb-cosyone_footer_payment_icon" />
      <input type="hidden" name="cosyone_footer_payment_icon" value="<?php echo $cosyone_footer_payment_icon; ?>" id="cosyone_footer_payment_icon" /><br />
      <a onclick="image_upload('cosyone_footer_payment_icon', 'thumb-cosyone_footer_payment_icon');"><?php echo $text_browse;?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb-cosyone_footer_payment_icon').attr('src', 'No image'); $('#cosyone_footer_payment_icon').attr('value', '');"><?php echo $text_clear;?></a>
      </div>
	  </td>
      </tr>
    </table>
    </div> <!-- Tab footer ends -->
    
    <div id="tab-cookie" class="vtabs-content"> <!-- Tab cookie control start -->
    <h2>Cookie notification</h2>
    <table class="form">
 	
      <tr>
      <td>Show cookie notification</td>
      <td>
      <select name="cosyone_use_cookie">
      <?php foreach($cosyone_use_cookie_list as $key=>$cosyone_use_cookie_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_use_cookie==$key) { echo " selected"; }?> ><?php echo $cosyone_use_cookie_list;?></option>
      <?php } ?>
      </select>
	  </td>
      </tr>
      
      <?php foreach ($languages as $language) { ?>
    <tr>
      <td> <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>"  /> Cookie information text</td>
      <td>
      <input name="cosyone_cookie_text_<?php echo $language['language_id']; ?>" value="<?php echo isset(${'cosyone_cookie_text_' . $language['language_id']}) ? ${'cosyone_cookie_text_' . $language['language_id']} : ''; ?>" size="80"> 
	  </td>
      </tr>
    <?php } ?>
    
     <tr>
      <td> Read more link<span class="help">Leave empty to disable the Read more-button</span></td>
      <td>
      <input type="text" value="<?php echo $cosyone_readmore_url?>" name="cosyone_readmore_url" size="40" />
	  </td>
      </tr>
    
    <?php foreach ($languages as $language) { ?>
    <tr>
      <td> <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>"  /> Button text "Read more"</td>
      <td>
      <input name="cosyone_cookie_button_readmore_<?php echo $language['language_id']; ?>" value="<?php echo isset(${'cosyone_cookie_button_readmore_' . $language['language_id']}) ? ${'cosyone_cookie_button_readmore_' . $language['language_id']} : ''; ?>" size="40"> 
	  </td>
      </tr>
    <?php } ?>
    
    <?php foreach ($languages as $language) { ?>
    <tr>
      <td> <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>"  /> Button text "Accept cookies"</td>
      <td>
      <input name="cosyone_cookie_button_accept_<?php echo $language['language_id']; ?>" value="<?php echo isset(${'cosyone_cookie_button_accept_' . $language['language_id']}) ? ${'cosyone_cookie_button_accept_' . $language['language_id']} : ''; ?>" size="40"> 
	  </td>
      </tr>
    <?php } ?>
      
    </table>
    </div> <!-- Tab cookie control ends -->
    
    <div id="tab-explorer" class="vtabs-content"> <!-- Tab internet explorer start -->
    <h2>Warning for old Internet Explorer users</h2>
    <table class="form">
 	
      <tr>
      <td>Show message to IE users</td>
      <td>
      <select name="cosyone_use_ie">
      <?php foreach($cosyone_use_ie_list as $key=>$cosyone_use_ie_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_use_ie==$key) { echo " selected"; }?> ><?php echo $cosyone_use_ie_list;?></option>
      <?php } ?>
      </select>
	  </td>
      </tr>
      
      <?php foreach ($languages as $language) { ?>
    <tr>
      <td> <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>"  /> Information text</td>
      <td>
      <input name="cosyone_ie_text_<?php echo $language['language_id']; ?>" value="<?php echo isset(${'cosyone_ie_text_' . $language['language_id']}) ? ${'cosyone_ie_text_' . $language['language_id']} : ''; ?>" size="80"> 
	  </td>
      </tr>
    <?php } ?>
    
     <tr>
      <td> Update now link<span class="help">Leave empty to disable the Update now button</span></td>
      <td>
      <input type="text" value="<?php echo $cosyone_ie_url?>" name="cosyone_ie_url" size="40" />
	  </td>
      </tr>
      
      <?php foreach ($languages as $language) { ?>
    <tr>
      <td> <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>"  /> "Update now" button text</td>
      <td>
      <input name="cosyone_ie_update_text_<?php echo $language['language_id']; ?>" value="<?php echo isset(${'cosyone_ie_update_text_' . $language['language_id']}) ? ${'cosyone_ie_update_text_' . $language['language_id']} : ''; ?>" size="80"> 
	  </td>
      </tr>
    <?php } ?>
    
      
    </table>
    </div> <!-- Tab internet explorer ends -->
    
    <div style="clear:both"></div>
    

    </div> <!-- #tab-general ends -->
    
    <div id="tab-design">
    
    <div class="vtabs">
    <a href="#tab-custom-design">Custom design</a>
    <a href="#tab-font">Custom fonts</a>
    </div> <!-- vtabs ends -->
    
    <div id="tab-custom-design" class="vtabs-content"> <!-- Tab design start -->
      <table class="form">
      <tr>
      <td><?php echo $text_use_custom_design;?> </td>
      <td>
      <select name="cosyone_use_custom">
      <?php foreach($cosyone_use_custom_list as $key=>$cosyone_use_custom_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_use_custom==$key) { echo " selected"; }?> ><?php echo $cosyone_use_custom_list;?></option>
      <?php } ?>
      </select>
	  </td>
      </tr>
      <tr>
      <td><a id="reset_design"><?php echo $text_reset_design;?></a></td>
      <td><?php echo $text_reset_design_info;?>
	  </td>
      </tr>
      </table>
      <table class="form">
      <h2>Container</h2>
      
      <tr>
      <td>Container layout</td>
      <td>
      <select name="cosyone_container_layout">
      <?php foreach($cosyone_container_layout_list as $key=>$cosyone_container_layout_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_container_layout==$key) { echo " selected"; }?> ><?php echo $cosyone_container_layout_list;?></option>
      <?php } ?>
      </select>
	  </td>
      </tr>
      
      <tr>
      <td>Body background color<span class="help">If Container layout is boxed</span></td>
      <td>
      <input type="text" value="<?php echo $cosyone_body_background?>" name="cosyone_body_background" id="cosyone_body_background" />
	  </td>
      </tr>
      <tr>
      <td>Body background image<span class="help">If Container layout is boxed</span></td>
      <td>
      <select name="cosyone_body_image" id="cosyone_body_image">
      <?php foreach($cosyone_body_image_list as $key=>$cosyone_body_image_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_body_image==$key) { echo " selected"; }?> ><?php echo $cosyone_body_image_list;?></option>
      <?php } ?>
      </select>
	  </td>
      </tr>
     
      </table>
      <table class="form">
      <span class="help">&nbsp;&nbsp;&nbsp;Preview of body background:</span>
      <div id="body_preview" style="width:500px;height:250px;background-color:#<?php echo $cosyone_body_background?>;background-image: url('../catalog/view/theme/cosyone/image/patterns/<?php echo $cosyone_body_image?>');margin-left:10px;">
      
      </div>
      
      <tr>
      <td>Custom background image<span class="help">An uploaded background image will override the chosen image above. Note that the body preview feature will not show custom images.</span></td>
      <td>
      <div class="image">
      <img src="<?php echo $cosyone_custom_bg_thumb; ?>" alt="" id="thumb-cosyone_custom_bg_icon" />
      <input type="hidden" name="cosyone_custom_bg_icon" value="<?php echo $cosyone_custom_bg_icon; ?>" id="cosyone_custom_bg_icon" /><br />
      <a onclick="image_upload('cosyone_custom_bg_icon', 'thumb-cosyone_custom_bg_icon');"><?php echo $text_browse;?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb-cosyone_custom_bg_icon').attr('src', 'No image'); $('#cosyone_custom_bg_icon').attr('value', '');"><?php echo $text_clear;?></a>
      </div>
	  </td>
      </tr>
      
      </table>
      <h2>Top line</h2>
      <table class="form">
      <tr>
      <td>Top line background</td>
      <td>
      <input type="text" value="<?php echo $cosyone_top_border_background?>" name="cosyone_top_border_background" id="cosyone_top_border_background" />
	  </td>
      </tr>
      <tr>
      <td>Top line border color</td>
      <td>
      <input type="text" value="<?php echo $cosyone_top_border_border?>" name="cosyone_top_border_border" id="cosyone_top_border_border" />
	  </td>
      </tr>
      
      <tr>
      <td>Top line default text color</td>
      <td>
      <input type="text" value="<?php echo $cosyone_top_border_text?>" name="cosyone_top_border_text" id="cosyone_top_border_text" />
	  </td>
      </tr>
      
      <tr>
      <td>Top line links</td>
      <td>
      <input type="text" value="<?php echo $cosyone_top_border_link?>" name="cosyone_top_border_link" id="cosyone_top_border_link" />
	  </td>
      </tr>
      
      <tr>
      <td>Top line links (hover)</td>
      <td>
      <input type="text" value="<?php echo $cosyone_top_border_link_hover?>" name="cosyone_top_border_link_hover" id="cosyone_top_border_link_hover" />
	  </td>
      </tr>
      
      </table>
      
      
       <h2><?php echo $text_heading_design_main_menu;?></h2>
       <table class="form">
      <tr>
      <td><?php echo $text_main_menu_background;?></td>
      <td>
      <input type="text" value="<?php echo $cosyone_menu_background?>" name="cosyone_menu_background" id="cosyone_menu_background" />
	  </td>
      </tr>
      
      <tr>
      <td><?php echo $text_main_menu_link_color;?></td>
      <td>
      <input type="text" value="<?php echo $cosyone_menu_link_color?>" name="cosyone_menu_link_color" id="cosyone_menu_link_color" />
	  </td>
      </tr>
      
      <tr>
      <td>Menu link color (hover/active)</td>
      <td>
      <input type="text" value="<?php echo $cosyone_menu_link_color_hover?>" name="cosyone_menu_link_color_hover" id="cosyone_menu_link_color_hover" />
	  </td>
      </tr>
      
      <tr>
      <td>Menu link background (hover/active)</td>
      <td>
      <input type="text" value="<?php echo $cosyone_menu_link_background_hover?>" name="cosyone_menu_link_background_hover" id="cosyone_menu_link_background_hover" />
	  </td>
      </tr>
      
      <tr>
      <td>Shortcut separator color
      <span class="help">Separator between cart, compare &amp; wishlist if Header 1 is enabled</span></td>
      <td>
      <input type="text" value="<?php echo $cosyone_shortcut_separator?>" name="cosyone_shortcut_separator" id="cosyone_shortcut_separator" />
	  </td>
      </tr>
      
      </table>
       <h2>General color</h2>
       <table class="form">
       <tr>
      <td>Default link hover color</td>
      <td>
      <input type="text" value="<?php echo $cosyone_link_hover_color?>" name="cosyone_link_hover_color" id="cosyone_link_hover_color" />
	  </td>
      </tr>
      <tr>
      <td>Primary color</td>
      <td>
      <input type="text" value="<?php echo $cosyone_primary_color?>" name="cosyone_primary_color" id="cosyone_primary_color" />
	  </td>
      </tr>
      <tr>
      <td><?php echo $text_secondary_color;?></td>
      <td>
      <input type="text" value="<?php echo $cosyone_secondary_color?>" name="cosyone_secondary_color" id="cosyone_secondary_color" />
	  </td>
      </tr>
      <tr>
      <td>Offer color</td>
      <td>
      <input type="text" value="<?php echo $cosyone_offer_color?>" name="cosyone_offer_color" id="cosyone_offer_color" />
	  </td>
      </tr>
      
      <tr>
      <td><?php echo $text_salebadge_background;?></td>
      <td>
      <input type="text" value="<?php echo $cosyone_salebadge_background?>" name="cosyone_salebadge_background" id="cosyone_salebadge_background" />
	  </td>
      </tr>
      
      <tr>
      <td><?php echo $text_price_color;?></td>
      <td>
      <input type="text" value="<?php echo $cosyone_price_color?>" name="cosyone_price_color" id="cosyone_price_color" />
	  </td>
      </tr>
      
      <tr>
      <td><?php echo $text_icons_background_hover;?><span class="help">Such as slider arrows and header drop down headings</span></td>
      <td>
      <input type="text" value="<?php echo $cosyone_icons_background_hover?>" name="cosyone_icons_background_hover" id="cosyone_icons_background_hover" />
	  </td>
      </tr>
      
      </table>
     
       <h2><?php echo $text_heading_buttons;?></h2>
       <table class="form">
      
      <tr>
      <td><b>Default button</b></td>
      <td>
      Color: <input type="text" value="<?php echo $cosyone_button_color?>" name="cosyone_button_color" id="cosyone_button_color" />&nbsp;
      Border color: <input type="text" value="<?php echo $cosyone_button_border?>" name="cosyone_button_border" id="cosyone_button_border" />&nbsp;
      Background: <input type="text" value="<?php echo $cosyone_button_background?>" name="cosyone_button_background" id="cosyone_button_background" />
	  </td>
      </tr>
      
      
      <tr>
      <td><b>Default button hover:</b></td>
      <td>
      Color: <input type="text" value="<?php echo $cosyone_button_hover_color?>" name="cosyone_button_hover_color" id="cosyone_button_hover_color" />&nbsp;
	  Border color: <input type="text" value="<?php echo $cosyone_button_hover_border?>" name="cosyone_button_hover_border" id="cosyone_button_hover_border" />&nbsp;
      Background:  <input type="text" value="<?php echo $cosyone_button_hover_background?>" name="cosyone_button_hover_background" id="cosyone_button_hover_background" />
      </td>
      </tr>
     
      
      <tr>
      <td><br /><b>Contrast button:</b> </td>
      <td>
      <br />Color: <input type="text" value="<?php echo $cosyone_button2_color?>" name="cosyone_button2_color" id="cosyone_button2_color" />&nbsp;
      Border color: <input type="text" value="<?php echo $cosyone_button2_border?>" name="cosyone_button2_border" id="cosyone_button2_border" />&nbsp;
      Background: <input type="text" value="<?php echo $cosyone_button2_background?>" name="cosyone_button2_background" id="cosyone_button2_background" />
	  </td>
      </tr>
      
      <tr>
      <td><b>Contrast button hover:</b></td>
      <td>
      Color: <input type="text" value="<?php echo $cosyone_button2_hover_color?>" name="cosyone_button2_hover_color" id="cosyone_button2_hover_color" />&nbsp;
      Border color: <input type="text" value="<?php echo $cosyone_button2_hover_border?>" name="cosyone_button2_hover_border" id="cosyone_button2_hover_border" />&nbsp;
      Background: <input type="text" value="<?php echo $cosyone_button2_hover_background?>" name="cosyone_button2_hover_background" id="cosyone_button2_hover_background" />
      
	  </td>
      </tr>
      
      
    
      
     
       
      </table>
       
      </div> <!-- Tab design end -->
      
       <div id="tab-font" class="vtabs-content"> <!-- Tab font start -->
       <table class="form">
      
      <tr>
      <td>Use custom fonts<span class="help">If set as Disabled, the default font Roboto will be used</span></td>
      <td>
      <select name="cosyone_use_custom_font">
      <?php foreach($cosyone_use_custom_font_list as $key=>$cosyone_use_custom_font_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_use_custom_font==$key) { echo " selected"; }?> ><?php echo $cosyone_use_custom_font_list;?></option>
      <?php } ?>
      </select>
	  </td>
      </tr>
      
       <tr>
      <td><i>All available fonts can be found <a href="http://www.google.com/fonts/" target="_blank">here</a></i></td>
      <td>
      
	  </td>
      </tr>
      
      
      <tr>
      <td>Main font import<span class="help">This font will be used as the default font, such as product descriptions, paragraphs etc.</span></td>
      <td>
      <input type="text" size="100" value="<?php echo $cosyone_font1_import?>" name="cosyone_font1_import" id="cosyone_font1_import" />
      <span class="help">Example:<br />&lt;link href='http://fonts.googleapis.com/css?family=Exo:300,400,700' rel='stylesheet' type='text/css'&gt;</span>
	  </td>
      </tr>
      
      <tr>
      <td>Main font name</td>
      <td>
      <input type="text" size="50" value="<?php echo $cosyone_font1_name?>" name="cosyone_font1_name" id="cosyone_font1_name" />
	  <span class="help">Example:<br />font-family: 'Exo', sans-serif;</span>
      </td>
      </tr>
      
      <tr>
      <td>Contrast font import<span class="help">This font will be used as headings, menu links etc.</span></td>
      <td>
      <input type="text" size="100" value="<?php echo $cosyone_font2_import?>" name="cosyone_font2_import" id="cosyone_font2_import" />
      <span class="help">Example:<br />&lt;link href='http://fonts.googleapis.com/css?family=Alegreya+Sans+SC:300,400,700' rel='stylesheet' type='text/css'&gt;</span>
	  </td>
      </tr>
      
      <tr>
      <td>Main font name</td>
      <td>
      <input type="text" size="50" value="<?php echo $cosyone_font2_name?>" name="cosyone_font2_name" id="cosyone_font2_name" />
	  <span class="help">Example:<br />font-family: 'Alegreya Sans SC', sans-serif;</span>
      </td>
      </tr>
      
      
      <tr>
      <td>Font weight: Light</td>
      <td>
      <select name="cosyone_use_font_light">
      <?php foreach($cosyone_use_font_light_list as $key=>$cosyone_use_font_light_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_use_font_light==$key) { echo " selected"; }?> ><?php echo $cosyone_use_font_light_list;?></option>
      <?php } ?>
      </select>
	  </td>
      </tr>
      
      <tr>
      <td>Font weight: Regular</td>
      <td>
      <select name="cosyone_use_font_regular">
      <?php foreach($cosyone_use_font_regular_list as $key=>$cosyone_use_font_regular_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_use_font_regular==$key) { echo " selected"; }?> ><?php echo $cosyone_use_font_regular_list;?></option>
      <?php } ?>
      </select>
	  </td>
      </tr>
      
      <tr>
      <td>Font weight: Medium</td>
      <td>
      <select name="cosyone_use_font_semibold">
      <?php foreach($cosyone_use_font_semibold_list as $key=>$cosyone_use_font_semibold_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_use_font_semibold==$key) { echo " selected"; }?> ><?php echo $cosyone_use_font_semibold_list;?></option>
      <?php } ?>
      </select>
	  </td>
      </tr>
      
      <tr>
      <td>Font weight: Bold</td>
      <td>
      <select name="cosyone_use_font_bold">
      <?php foreach($cosyone_use_font_bold_list as $key=>$cosyone_use_font_bold_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_use_font_bold==$key) { echo " selected"; }?> ><?php echo $cosyone_use_font_bold_list;?></option>
      <?php } ?>
      </select>
	  </td>
      </tr>
      
      
      </table>
       
       
       
       </div> <!-- Tab font end -->
      
      </div> <!-- #tab-design ends -->
      
      <div id="tab-custom-css">
      <table class="form">
      
      <tr>
      <td><?php echo $text_use_custom_css;?></td>
      <td>
      <select name="cosyone_use_custom_css">
      <?php foreach($cosyone_use_custom_css_list as $key=>$cosyone_use_custom_css_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_use_custom_css==$key) { echo " selected"; }?> ><?php echo $cosyone_use_custom_css_list;?></option>
      <?php } ?>
      </select>
	  </td>
      </tr>
      
      <tr>
      <td><?php echo $text_custom_css;?><span class="help"><?php echo $text_custom_css_help;?></span></td>
      <td>
      <textarea cols="100" rows="20" name="cosyone_custom_css_content"><?php echo $cosyone_custom_css_content?></textarea>
	  </td>
      </tr>
      
       <tr>
      <td>Enable custom Javascript</td>
      <td>
      <select name="cosyone_use_custom_javascript">
      <?php foreach($cosyone_use_custom_javascript_list as $key=>$cosyone_use_custom_javascript_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_use_custom_javascript==$key) { echo " selected"; }?> ><?php echo $cosyone_use_custom_javascript_list;?></option>
      <?php } ?>
      </select>
	  </td>
      </tr>
      
      <tr>
      <td>Javascript content<span class="help">Use plain scripts without tags</span></td>
      <td>
      <textarea cols="100" rows="20" name="cosyone_custom_javascript_content"><?php echo $cosyone_custom_javascript_content?></textarea>
	  </td>
      </tr>
      

      </table>
      </div> <!-- #tab-custom-css ends -->
      
      
      <input type="hidden" name="continue" id="applystay" value="0">
      
     </form><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
    </div> <!-- content ends -->
  </div>
  </div>
<!-- Import requred files -->
<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script> 
<script type="text/javascript" src="view/javascript/colorpicker/js/colorpicker.js"></script>
<link rel="stylesheet" type="text/css" href="view/javascript/colorpicker/css/colorpicker.css" />
<!-- Import requred files -->
<script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
CKEDITOR.replace('cosyone_menu_custom_block_<?php echo $language['language_id']; ?>', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
<?php } ?>
<?php foreach ($languages as $language) { ?>
CKEDITOR.replace('cosyone_footer_custom_block_<?php echo $language['language_id']; ?>', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
<?php } ?>
<?php foreach ($languages as $language) { ?>
CKEDITOR.replace('cosyone_product_block_<?php echo $language['language_id']; ?>', {
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
function image_upload(field, thumb) {
	$('#dialog').remove();
	$('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');
	
	$('#dialog').dialog({
		title: 'image manager',
		close: function (event, ui) {
			if ($('#' + field).attr('value')) {
				$.ajax({
					url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).val()),
					dataType: 'text',
					success: function(data) {
						$('#' + thumb).replaceWith('<img src="' + data + '" alt="" id="' + thumb + '" />');
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
$('#cosyone_header_text, #cosyone_user_menu_text, #cosyone_user_menu_text_hover, #cosyone_menu_link_color, #cosyone_menu_link_color_hover, #cosyone_menu_link_background_hover, #cosyone_shortcut_separator, #cosyone_primary_color, #cosyone_link_hover_color, #cosyone_secondary_color, #cosyone_offer_color, #cosyone_h1_color, #cosyone_heading_color, #cosyone_footer_heading, #cosyone_footer_links, #cosyone_footer_links_hover, #cosyone_user_menu_background, #cosyone_search_field_text, #cosyone_search_field_background, #cosyone_search_field_background_hover, #cosyone_top_border_background, #cosyone_top_border_border, #cosyone_top_border_text, #cosyone_top_border_link_hover, #cosyone_top_border_link, #cosyone_highlight_background, #cosyone_salebadge_background, #cosyone_price_color, #cosyone_module_heading_background, #cosyone_module_heading_color, #cosyone_product_tabs_heading, #cosyone_product_tabs_content, #cosyone_button_color, #cosyone_button_background, #cosyone_button_border, #cosyone_button_hover_color, #cosyone_button_hover_background, #cosyone_button_hover_border, #cosyone_button2_color, #cosyone_button2_background, #cosyone_button2_border, #cosyone_button2_hover_color, #cosyone_button2_hover_background, #cosyone_button2_hover_border, #cosyone_button3_color, #cosyone_button3_background, #cosyone_button3_border, #cosyone_button3_hover_color, #cosyone_button3_hover_background, #cosyone_button3_hover_border, #cosyone_icons_background, #cosyone_icons_background_hover, #cosyone_footer_social_icons_background, #cosyone_footer_social_icons_hover').ColorPicker({
	onSubmit: function(hsb, hex, rgb, el) {
		$(el).val(hex);
		$(el).ColorPickerHide();
	},
	onBeforeShow: function () {
		$(this).ColorPickerSetColor(this.value);
	}
})
.bind('keyup', function(){
	$(this).ColorPickerSetColor(this.value);
	
});
// Header background also change header preview
$('#cosyone_body_background').ColorPicker({
	onSubmit: function(hsb, hex, rgb, el) {
		$(el).val(hex);
		$(el).ColorPickerHide();
	},
	onBeforeShow: function () {
		$(this).ColorPickerSetColor(this.value);
	},
	onChange: function (hsb, hex, rgb) {
		$('#body_preview').css('backgroundColor', '#' + hex);
	}
})
.bind('keyup', function(){
	$(this).ColorPickerSetColor(this.value);
});
// Menu background also change menu preview
$('#cosyone_menu_background').ColorPicker({
	onSubmit: function(hsb, hex, rgb, el) {
		$(el).val(hex);
		$(el).ColorPickerHide();
	},
	onBeforeShow: function () {
		$(this).ColorPickerSetColor(this.value);
	},
	onChange: function (hsb, hex, rgb) {
		$('#menu_preview').css('backgroundColor', '#' + hex);
	}
})
.bind('keyup', function(){
	$(this).ColorPickerSetColor(this.value);
});
// Footer background also change header preview
$('#cosyone_footer_background').ColorPicker({
	onSubmit: function(hsb, hex, rgb, el) {
		$(el).val(hex);
		$(el).ColorPickerHide();
	},
	onBeforeShow: function () {
		$(this).ColorPickerSetColor(this.value);
	},
	onChange: function (hsb, hex, rgb) {
		$('#footer_preview').css('backgroundColor', '#' + hex);
	}
})
.bind('keyup', function(){
	$(this).ColorPickerSetColor(this.value);
});
//--></script> 
<script type="text/javascript"><!--
// Update background images in header preview 
$("#cosyone_body_image").change(function () {
	$('#body_preview').css('background-image', 'url("../catalog/view/theme/cosyone/image/patterns/' + $(this).val() +'")');
});
//--></script>
<script type="text/javascript"><!--
// Update background images in menu preview 
$("#cosyone_menu_pattern1").change(function () {
	$('#menu_preview').css('background-image', 'url("../catalog/view/theme/cosyone/image/patterns/' + $(this).val() +'.png")');
});
$("#cosyone_menu_pattern2").change(function () {
	$('#menu_preview2').css('background-image', 'url("../catalog/view/theme/cosyone/image/patterns/' + $(this).val() +'.png")');
});
//--></script>
<script type="text/javascript"><!--
// Update background images in header preview 
$("#cosyone_footer_pattern1").change(function () {
	$('#footer_preview').css('background-image', 'url("../catalog/view/theme/cosyone/image/patterns/' + $(this).val() +'.png")');
});
$("#cosyone_footer_pattern2").change(function () {
	$('#footer_preview2').css('background-image', 'url("../catalog/view/theme/cosyone/image/patterns/' + $(this).val() +'.png")');
});
//--></script> 
<script type="text/javascript"><!--
$('#tabs a').tabs();
//--></script> 
<script type="text/javascript"><!--
$('select').css('width', '120px');
//--></script>
<script type="text/javascript"><!-- 
$('#reset_design').click(function() {    
$('#cosyone_container_layout').val("boxed").attr("selected", "selected");
$('#cosyone_body_background').val("ffffff");
$('#cosyone_body_image').val("1.jpg").attr("selected", "selected");
$('#cosyone_top_border_background').val("f9f9fa");
$('#cosyone_top_border_border').val("e5e5e5");
$('#cosyone_top_border_text').val("8c8c8c");
$('#cosyone_top_border_link').val("222226");
$('#cosyone_top_border_link_hover').val("276658");
$('#cosyone_menu_background').val("222226");
$('#cosyone_menu_link_color').val("bdbebf");
$('#cosyone_menu_link_color_hover').val("ffffff");
$('#cosyone_menu_link_background_hover').val("d6a916");
$('#cosyone_link_hover_color').val("276658");
$('#cosyone_primary_color').val("d6a916");
$('#cosyone_secondary_color').val("276658");
$('#cosyone_offer_color').val("2c6095");
$('#cosyone_salebadge_background').val("d6a916");
$('#cosyone_price_color').val("276658");
$('#cosyone_icons_background_hover').val("222222");

$('#cosyone_button_color').val("222222");
$('#cosyone_button_border').val("222222");
$('#cosyone_button_background').val("ffffff");
$('#cosyone_button_hover_color').val("ffffff");
$('#cosyone_button_hover_border').val("222222");
$('#cosyone_button_hover_background').val("222222");

$('#cosyone_button2_color').val("d6a916");
$('#cosyone_button2_border').val("d6a916");
$('#cosyone_button2_background').val("ffffff");
$('#cosyone_button2_hover_color').val("ffffff");
$('#cosyone_button2_hover_border').val("d6a916");
$('#cosyone_button2_hover_background').val("d6a916");
});
//--></script>
<script type="text/javascript"><!--
$('.vtabs a').tabs();
//--></script>
<?php echo $footer; ?>