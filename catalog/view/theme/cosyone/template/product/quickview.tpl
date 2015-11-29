<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/cosyone/stylesheet/stylesheet.css" />
<link href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />
<script type="text/javascript" src="catalog/view/theme/cosyone/js/cloud-zoom.1.0.2.min.js"></script>
<script type="text/javascript" src="catalog/view/theme/cosyone/js/owl.carousel.min.js"></script>
<!-- Custom css -->
<?php if($this->config->get('cosyone_use_custom_css') == 'enabled'){ ?>
      <style>
            <?php echo html_entity_decode($this->config->get('cosyone_custom_css_content'), ENT_QUOTES, 'UTF-8'); ?>
      </style>
<?php } ?>

<!-- Custom styling -->
<?php if($this->config->get('cosyone_use_custom') == 'enabled'){ ?>
      <?php require( 'catalog/view/theme/cosyone/template/common/custom_style.tpl' ); ?>
<?php } ?>

<!-- Custom fonts -->
<?php if($this->config->get('cosyone_use_custom_font') == 'enabled'){ ?>
      <?php require( 'catalog/view/theme/cosyone/template/common/custom_fonts.tpl' ); ?>
<?php } else { ?>
      <link href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,600' rel='stylesheet' type='text/css'>
      <link href='http://fonts.googleapis.com/css?family=Roboto+Slab:300,400,500,600,700' rel='stylesheet' type='text/css'>  
<?php } ?>

<!-- Custom script -->
<?php if($this->config->get('cosyone_use_custom_javascript') == 'enabled'){ ?>
      <script type="text/javascript">
            $(document).ready(function() {
                  <?php echo html_entity_decode($this->config->get('cosyone_custom_javascript_content'), ENT_QUOTES, 'UTF-8'); ?>
            });
      </script>
<?php } ?>
</head>
<body style="background:#ffffff !important;">
      <div id="content" style="margin-bottom:0;">
            <div class="product-info quickview">
                 <div id="notification"></div>
                <?php if ($thumb || $images) { ?>
                      <div class="left">
                            <?php if ($thumb) { ?>
                                <div class="image">
                                      <a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="cloud-zoom" style="cursor:move" rel="position:'inside', showTitle: false" id='zoom1'>
                                            <img itemprop="image" src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
                                      </a>

                                      <?php if ($this->config->get('cosyone_percentage_sale_badge') == 'enabled') { ?>
                                            <?php if (!$special) { ?>
                                            <?php } else { ?>
                                                  <div class="sale_badge">-<?php echo $sales_percantage_main; ?>%</div>
                                            <?php } ?>
                                      <?php } ?>
                                </div>
                           <?php } ?>
                           <?php if ($images) { ?>
                                <div class="image-additional" style="height:<?php echo $this->config->get('config_image_additional_height') ?>px;">      
                                      <ul class="image_carousel">
                                            <!-- Additional images -->
                                            <?php foreach ($images as $image) { ?>
                                                  <li>
                                                      <a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="cloud-zoom-gallery colorbox" rel="useZoom: 'zoom1', smallImage: '<?php echo $image['thumb']; ?>'">
                                                            <img src="<?php echo $image['small']; ?>" title="<?php echo $heading_title; ?>" width="<?php echo $this->config->get('config_image_additional_width') ?>" height="<?php echo $this->config->get('config_image_additional_height') ?>" alt="<?php echo $heading_title; ?>" />
                                                      </a>
                                                </li>
                                            <?php } ?>
                                            <!-- Show even the main image among the additional -->
                                            <li>
                                                <a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="cloud-zoom-gallery colorbox" rel="useZoom: 'zoom1', smallImage: '<?php echo $thumb; ?>'">
                                                      <img src="<?php echo $small; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" width="<?php echo $this->config->get('config_image_additional_width') ?>" height="<?php echo $this->config->get('config_image_additional_height') ?>"/>
                                                  </a>
                                            </li>
                                        </ul>
                                </div>
                           <?php } ?>

                            <!-- AddThis Button START -->
                           <div class="addthis_toolbox addthis_default_style addthis_32x32_style">
                      	     <a class="addthis_button_preferred_1"></a>
                      		<a class="addthis_button_preferred_2"></a>
                      		<a class="addthis_button_preferred_3"></a>
                      		<a class="addthis_button_preferred_4"></a>
                      		<a class="addthis_button_compact"></a>
                                <a class="addthis_counter addthis_bubble_style"></a>
                      	</div>
                          <script type="text/javascript" src="http://s7.addthis.com/js/300/addthis_widget.js"></script>
                          <!-- AddThis Button END -->
                      </div>
                <?php } ?>
                <div class="right" style="margin-left:360px">
                      <h1 itemprop="name"><?php echo $heading_title; ?></h1>
                      <?php if ($review_status) { ?>
                            <div class="review">
                                  <span class="rating r<?php echo $rating; ?>">
                                        <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
                                </span>
                                <a href="<?php echo $product_href; ?>" target="_top"><?php echo $reviews; ?></a>
                                <a href="<?php echo $product_href; ?>" target="_top"><?php echo $text_write; ?></a>
                            </div>
                        
                          <?php if ($count_reviews > 0) { ?><!-- Rich snippet start -->
                                <div itemprop="review" itemscope itemtype="http://data-vocabulary.org/Review-aggregate"> 
                       	          <span itemprop="rating" content="<?php echo $rating; ?>"></span>
                                      <span itemprop="count" content="<?php echo $reviews; ?>"></span>
                      	     </div> 
                          <?php } ?><!-- Rich snippet end -->
                      <?php } ?>

                      <div class="description">
                            <?php if ($manufacturer) { ?>
                                  <span class="contrast_font"><?php echo $text_manufacturer; ?></span> <a href="<?php echo $manufacturers; ?>" target="_top"><?php echo $manufacturer; ?></a><br />
                            <?php } ?>    
                            <span class="contrast_font"><?php echo $text_model; ?></span> <?php echo $model; ?><br />                           
                            <?php if ($reward) { ?>
                                  <span class="contrast_font"><?php echo $text_reward; ?></span> <?php echo $reward; ?><br />
                            <?php } ?>                            
                            <span class="contrast_font"><?php echo $text_stock; ?></span> <?php echo $stock; ?>                            
                      </div> <!-- .description ends -->
  
  
                      <?php if ($price) { ?> 
                            <?php if ($special) { ?>
                                  <span itemprop="offerDetails" itemscope itemtype="http://data-vocabulary.org/Offer"> <!-- Rich snippets start -->
                                      <meta itemprop="currency" content="<?php echo $this->currency->getCode(); ?>" />
                                      <div class="extended_offer">
                                
                                          <div class="price-new">
                                                <?php echo $text_special_price; ?>
                                                <span class="amount contrast_font" itemprop="price"><?php echo $special; ?></span>
                                          </div>
                                          <div class="price-old"><?php echo $text_old_price; ?><span class="amount contrast_font"><?php echo $price; ?></span></div>
                                          <div class="price-save"><?php echo $text_you_save; ?><span class="amount contrast_font"><?php echo $yousave; ?></span> </div>
                                    </div>
                                </span>
                            <?php } ?>
                            <?php if ($special_date_end) { ?>
                                  <div class="contrast_font"><div class="offer"></div></div> 
                  		<?php } ?>
                      <?php } ?>
  
                      <div class="hurry">
                           <span class="items_left contrast_color"><?php echo $text_stock_quantity; ?></span>
                          <span class="items_sold"><?php echo $text_items_sold; ?></span>
                      </div>
  
                      <?php if ($options) { ?>
                            <div class="options contrast_font">
                                <h2><?php echo $text_option; ?></h2>
                                <?php foreach ($options as $option) { ?>
                                      <?php if ($option['type'] == 'select') { ?>
                                            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                                                  <b><?php echo $option['name']; ?>:</b>
                                                  <?php if ($option['required']) { ?>
                                                      <span class="required">*</span>
                                                  <?php } ?>
                                                  <br />
                                                  <select class="small" name="option[<?php echo $option['product_option_id']; ?>]">
                                                      <option value=""><?php echo $text_select; ?></option>
                                                      <?php foreach ($option['option_value'] as $option_value) { ?>
                                                            <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                                                                  <?php if ($option_value['price']) { ?>
                                                                        (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                                  <?php } ?>
                                                            </option>
                                                      <?php } ?>
                                                  </select>
                                            </div>
                                            <br />
                                      <?php } ?>
                                      <?php if ($option['type'] == 'radio') { ?>
                                            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                                                  <b><?php echo $option['name']; ?>:</b>
                                                  <?php if ($option['required']) { ?>
                                                      <span class="required">*</span>
                                                  <?php } ?>
                                                  <br />
                                                  <?php foreach ($option['option_value'] as $option_value) { ?>
                                                      <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
                                                      <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                                                            <?php if ($option_value['price']) { ?>
                                                                  (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                            <?php } ?>
                                                      </label>
                                                      <br />
                                                 <?php } ?>
                                            </div>
                                            <br />
                                      <?php } ?>
                                      <?php if ($option['type'] == 'checkbox') { ?>
                                            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                                                  <b><?php echo $option['name']; ?>:</b>
                                                  <?php if ($option['required']) { ?>
                                                        <span class="required">*</span>
                                                  <?php } ?>
                                                  <br />
                                                  <?php foreach ($option['option_value'] as $option_value) { ?>
                                                        <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
                                                      <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                                                            <?php if ($option_value['price']) { ?>
                                                                  (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                            <?php } ?>
                                                        </label>
                                                        <br />
                                                  <?php } ?>
                                            </div>
                                            <br />
                                      <?php } ?>
                                      <?php if ($option['type'] == 'image') { ?>
                                            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                                                  <b><?php echo $option['name']; ?>:</b>
                                                  <?php if ($option['required']) { ?>
                                                        <span class="required">*</span>
                                                  <?php } ?>
                                                  <br />
                                                  <?php if($this->config->get('cosyone_image_options') == 'thumbs'){ ?>
                                                      <div class="clean-option-image">
                                                          <?php foreach ($option['option_value'] as $option_value) { ?>
                                                                <div class="single-option main_font" <?php if ($option_value['price']) { ?>data-tooltip="<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>"<?php } ?>>
                                                                      <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" /><label  for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name']; ?>" /></label>
                                                                </div>
                                                          <?php } ?>
                                                      </div>
                                                <?php } else { ?>
                                                      <table class="option-image">
                                                        <?php foreach ($option['option_value'] as $option_value) { ?>
                                                        <tr>
                                                              <td style="width: 1px;"><input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" /></td>
                                                              <td><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" /></label></td>
                                                            <td><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                                                              <?php if ($option_value['price']) { ?>
                                                              (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                              <?php } ?>
                                                            </label></td>
                                                        </tr>
                                                        <?php } ?>
                                                      </table>
                                                <?php } ?>
                                            </div>
                                            <br />
                                      <?php } ?>
                                      <?php if ($option['type'] == 'text') { ?>
                                            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                                                  <b><?php echo $option['name']; ?>:</b>
                                                  <?php if ($option['required']) { ?>
                                                        <span class="required">*</span>
                                                  <?php } ?>
                                                  <br />
                                                  <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" />
                                            </div>
                                            <br />
                                      <?php } ?>
                                      <?php if ($option['type'] == 'textarea') { ?>
                                            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                                                  <b><?php echo $option['name']; ?>:</b>
                                                  <?php if ($option['required']) { ?>
                                                        <span class="required">*</span>
                                                  <?php } ?>
                                                  <br />
                                                  <textarea name="option[<?php echo $option['product_option_id']; ?>]" cols="40" rows="5"><?php echo $option['option_value']; ?></textarea>
                                            </div>
                                            <br />
                                      <?php } ?>
                                      <?php if ($option['type'] == 'file') { ?>
                                            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                                                  <b><?php echo $option['name']; ?>:</b>
                                                  <?php if ($option['required']) { ?>
                                                      <span class="required">*</span>
                                                  <?php } ?>
                                                  <br />
                                                  <input type="button" value="<?php echo $button_upload; ?>" id="button-option-<?php echo $option['product_option_id']; ?>" class="button">
                                                  <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" />
                                            </div>
                                            <br />
                                      <?php } ?>
                                      <?php if ($option['type'] == 'date') { ?>
                                            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                                                  <b><?php echo $option['name']; ?>:</b>
                                                  <?php if ($option['required']) { ?>
                                                        <span class="required">*</span>
                                                  <?php } ?>
                                                  <br />
                                                  <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="date" />
                                            </div>
                                            <br />
                                      <?php } ?>
                                      <?php if ($option['type'] == 'datetime') { ?>
                                            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                                                  <b><?php echo $option['name']; ?>:</b>
                                                  <?php if ($option['required']) { ?>
                                                        <span class="required">*</span>
                                                  <?php } ?>
                                                  <br />
                                                  <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="datetime" />
                                            </div>
                                            <br />
                                      <?php } ?>
                                      <?php if ($option['type'] == 'time') { ?>
                                            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                                                 <b><?php echo $option['name']; ?>:</b>
                                                 <?php if ($option['required']) { ?>
                                                        <span class="required">*</span>
                                                 <?php } ?>
                                                 <br />
                                                  <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="time" />
                                            </div>
                                            <br />
                                      <?php } ?>
                                <?php } ?>
                          </div> <!-- .options ends -->
                      <?php } ?> <!-- profiles start -->
                      <?php if ($profiles): ?>
                            <div class="options" style="padding-top:0px;">
                                <b><span class="required">*</span><?php echo $text_payment_profile ?></b>
                                <select name="profile_id">
                                      <option value=""><?php echo $text_select; ?></option>
                                      <?php foreach ($profiles as $profile): ?>
                                            <option value="<?php echo $profile['profile_id'] ?>"><?php echo $profile['name'] ?></option>
                                      <?php endforeach; ?>
                                </select>
                                
                                <span id="profile-description"></span>
                                <br />
                            </div>
                      <?php endif; ?> <!-- profiles ends -->
                      <div class="cart">
                            <?php if ($price) { ?> 
                                <div class="price">
                                       <span itemprop="offerDetails" itemscope itemtype="http://data-vocabulary.org/Offer"> 
                                            <meta itemprop="currency" content="<?php echo $this->currency->getCode(); ?>" />
                                            <?php if (!$special) { ?>
                                                  <span itemprop="price"><?php echo $price; ?></span>
                                            <?php } else { ?>
                                                  <span class="price-old"><?php echo $price; ?></span> <span class="price-new" itemprop="price"><?php echo $special; ?></span>
                                            <?php } ?>
                                      </span> 
                                </div> 
                           
                            <?php } ?>
                           <a class="quantity_button minus icon">-</a><input type="text" class="quantity" name="quantity" size="1" value="<?php echo $minimum; ?>" /><a class="quantity_button plus icon">+</a>
                           
                            <input type="hidden" name="product_id" size="2" value="<?php echo $product_id; ?>" />

                            <button type="submit" id="button-cart" class="button contrast"><i class="fa fa-shopping-cart"></i> <?php echo $button_cart; ?></button>
                            
                            <div class="icons_wrapper">
                                  <a class="sq_icon" onclick="addToWishList('<?php echo $product_id; ?>');" data-tooltip="<?php echo $button_wishlist; ?>"><i class="fa fa-heart"></i></a>
                                <a class="sq_icon compare" onclick="addToCompare('<?php echo $product_id; ?>');" data-tooltip="<?php echo $button_compare; ?>"><i class="fa fa-arrow-right"></i><i class="fa fa-arrow-left"></i></a>
                            </div>
                      </div> <!-- Cart ends -->
                      <?php if ($minimum > 1) { ?>
                            <div class="minimum"><?php echo $text_minimum; ?></div>
                      <?php } ?>
                      <?php if ($price) { ?>
                        	<?php if ($points) { ?>
                                <div class="reward"><?php echo $text_points; ?> <?php echo $points; ?></div>
                          <?php } ?>
                          <?php if ($discounts) { ?>
                                <div class="discount">
                                      <?php foreach ($discounts as $discount) { ?>
                                            <span><?php echo sprintf($text_discount, $discount['quantity'], $discount['price']); ?></span>
                                      <?php } ?>
                                </div>
                          <?php } ?>
                      <?php } ?>
                      <div class="share">
                            <!-- If addthis is positioned right -->
                            <?php if ($price) { ?>
                                 <?php if ($tax) { ?>
                                      <span class="price-tax"><?php echo $text_tax; ?> <?php echo $tax; ?></span><br />
                                <?php } ?>
                            <?php } ?>
                      </div> <!-- .share ends -->    
                </div> <!-- product-info-right END -->
           </div> <!-- product-info END -->

            <script type="text/javascript"><!--
                  $('select[name="profile_id"], input[name="quantity"]').change(function(){
                      $.ajax({
                  		url: 'index.php?route=product/product/getRecurringDescription',
                  		type: 'post',
                  		data: $('input[name="product_id"], input[name="quantity"], select[name="profile_id"]'),
                  		dataType: 'json',
                          beforeSend: function() {
                              $('#profile-description').html('');
                          },
                  		success: function(json) {
                  			$('.success, .warning, .attention, information, .error').remove();
                              
                  			if (json['success']) {
                                  $('#profile-description').html(json['success']);
                  			}	
                  		}
                  	});
                  });
                      
                  $('#button-cart').bind('click', function() {  
                  	$.ajax({
                  		url: 'index.php?route=checkout/cart/add',
                  		type: 'post',
                  		data: $('.product-info input[type=\'text\'], .product-info input[type=\'hidden\'], .product-info input[type=\'radio\']:checked, .product-info input[type=\'checkbox\']:checked, .product-info select, .product-info textarea'),
                  		dataType: 'json',
                  		success: function(json) {
                  			$('.success, .warning, .attention, information, .error').remove();
                  			
                  			if (json['error']) {
                  				if (json['error']['option']) {
                  					for (i in json['error']['option']) {
                  						$('#option-' + i).after('<span class="error">' + json['error']['option'][i] + '</span>');
                  					}
                  				}
                                  
                                  if (json['error']['profile']) {
                                      $('select[name="profile_id"]').after('<span class="error">' + json['error']['profile'] + '</span>');
                                  }
                  			} 
                  			
                  			if (json['success']) {
                  				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<i class="fa fa-times"></i></div>');
                  				$('#notification a').attr('target','_top');
                  				$('.success').fadeIn('slow');
                  					
                  				$('#cart-total').html(json['total']);
                  				
                  				$('html, body').animate({ scrollTop: 0 }, 'slow'); 
                  			}	
                  		}
                  	});
                  });

                  $('.success .fa, .warning .fa, .attention .fa, .information .fa').live('click', function() {
                  	$(this).parent().fadeOut('slow', function() {
                  		$(this).remove();
                  	});
                  });

                  //--></script>
                  <?php if ($options) { ?>
                  <script type="text/javascript" src="catalog/view/javascript/jquery/ajaxupload.js"></script>
                  <?php foreach ($options as $option) { ?>
                  <?php if ($option['type'] == 'file') { ?>
                  <script type="text/javascript"><!--
                  new AjaxUpload('#button-option-<?php echo $option['product_option_id']; ?>', {
                  	action: 'index.php?route=product/product/upload',
                  	name: 'file',
                  	autoSubmit: true,
                  	responseType: 'json',
                  	onSubmit: function(file, extension) {
                  		$('#button-option-<?php echo $option['product_option_id']; ?>').after('<img src="catalog/view/theme/default/image/loading.gif" class="loading" style="padding-left: 5px;" />');
                  		$('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', true);
                  	},
                  	onComplete: function(file, json) {
                  		$('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', false);
                  		
                  		$('.error').remove();
                  		
                  		if (json['success']) {
                  			alert(json['success']);
                  			
                  			$('input[name=\'option[<?php echo $option['product_option_id']; ?>]\']').attr('value', json['file']);
                  		}
                  		
                  		if (json['error']) {
                  			$('#option-<?php echo $option['product_option_id']; ?>').after('<span class="error">' + json['error'] + '</span>');
                  		}
                  		
                  		$('.loading').remove();	
                  	}
                });
            //--></script>
            <?php } ?>
            <?php } ?>
            <?php } ?>



            <script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script> 
            <script type="text/javascript"><!--
                  $(document).ready(function() {
                  	if ($.browser.msie && $.browser.version == 6) {
                  		$('.date, .datetime, .time').bgIframe();
                  	}

                  	$('.date').datepicker({dateFormat: 'yy-mm-dd'});
                  	$('.datetime').datetimepicker({
                  		dateFormat: 'yy-mm-dd',
                  		timeFormat: 'h:m'
                  	});
                  	$('.time').timepicker({timeFormat: 'h:m'});
                  });
            //--></script> 

            <script type="text/javascript">
                $(document).ready(function() {
                      var owlAdditionals = $('.image_carousel');
                      var itemWidth = (<?php echo $this->config->get('config_image_additional_width') ?> + 10);
                      var itemcalc = Math.round(300 / itemWidth);
                      owlAdditionals.owlCarousel({
                            items : itemcalc,
                            mouseDrag: true,
                            responsive:false,
                            pagination: false,
                            navigation:true,
                            slideSpeed:200,
                            navigationText: [
                            "<div class='slide_arrow_prev add_img'><i class='fa fa-angle-left'></i></div>",
                            "<div class='slide_arrow_next add_img'><i class='fa fa-angle-right'></i></div>"
                            ]
                      });
                });
            </script>
            <script type="text/javascript">
                $('.quantity_button.plus').on('click', function(){
                      var oldVal = $('input.quantity').val();
                      var newVal = (parseInt($('input.quantity').val(),10) +1);
                      $('input.quantity').val(newVal);
                });

                $('.quantity_button.minus').on('click', function(){
                      var oldVal = $('input.quantity').val();
                      if (oldVal > 1)
                      {
                          var newVal = (parseInt($('input.quantity').val(),10) -1);
                      }
                      else
                      {
                          newVal = 1;
                      }
                      $('input.quantity').val(newVal);
                });
            </script>
            <script type="text/javascript" src="catalog/view/theme/cosyone/js/cosyone_common.js"></script>
            <?php if ($special_date_end > 0) { ?>
            <script type="text/javascript" src="catalog/view/theme/cosyone/js/countdown/jquery.countdown.min.js"></script>
            <script type="text/javascript">
            	$('.offer').countdown({
            		until: <?php echo $special_date_end ?>, 
            		layout: '{desc}<i>{dn}</i> {dl} <i>{hn}</i> {hl} <i>{mn}</i> {ml} <i>{sn}</i> {sl}',
            		description: '<span class="main_font"><?php echo $text_expire ?></span>&nbsp;'
            	});
            </script>
            <?php } ?>
</body></html>