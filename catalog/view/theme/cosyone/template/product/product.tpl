<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content" class="product" itemscope itemtype="http://data-vocabulary.org/Product"><?php echo $content_top; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
      <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  
  <div class="product-info">
    <?php if ($thumb || $images) { ?>
      <div class="left">
        <?php if ($thumb) { ?>
          <div class="image">
            <?php if ($this->config->get('cosyone_product_zoom')) { ?>
              <a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="cloud-zoom" style="cursor:move" rel="position:'inside', showTitle: false" id='zoom1'>
                <img itemprop="image" src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
              </a>
              <!-- zoom link-->
              <a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" id="zoom-btn" class="colorbox" rel="colorbox">
                <i class="fa fa-search-plus"></i>
              </a>
            <?php } else { ?>
              <a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="colorbox">
                <img itemprop="image" src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
              </a>
            <?php } ?>
            <?php if ($this->config->get('cosyone_percentage_sale_badge') == 'enabled') { ?>
              <?php if (!$special) { ?>
              <?php } else { ?>
                <div class="sale_badge">-<?php echo $sales_percantage_main; ?>%</div>
              <?php } ?>
            <?php } ?>
          </div>
        <?php } ?>
      
        <?php if ($images) { ?>
          <div class="image-additional" style="width:<?php echo $this->config->get('config_image_thumb_width') ?>px;height:<?php echo $this->config->get('config_image_additional_height') ?>px;">      
              <ul class="image_carousel">
                <!-- Additional images -->
                <?php foreach ($images as $image) { ?>
                  <li>
                    <?php if ($this->config->get('cosyone_product_zoom')) { ?>
                      <a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="cloud-zoom-gallery colorbox" rel="useZoom: 'zoom1', smallImage: '<?php echo $image['thumb']; ?>'">
                    <?php } else { ?>
                      <a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="colorbox" rel="useZoom: 'zoom1', smallImage: '<?php echo $image['thumb']; ?>'">
                    <?php } ?>
                    <img src="<?php echo $image['small']; ?>" title="<?php echo $heading_title; ?>" width="<?php echo $this->config->get('config_image_additional_width') ?>" height="<?php echo $this->config->get('config_image_additional_height') ?>" alt="<?php echo $heading_title; ?>" /></a>
                  </li>
                <?php } ?>
                <!-- Show even the main image among the additional if  -->
                <?php if ($this->config->get('cosyone_product_zoom')) { ?>
                  <li>
                    <a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="cloud-zoom-gallery colorbox" rel="useZoom: 'zoom1', smallImage: '<?php echo $thumb; ?>'">
                      <img src="<?php echo $small; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" width="<?php echo $this->config->get('config_image_additional_width') ?>" height="<?php echo $this->config->get('config_image_additional_height') ?>"/>
                    </a>
                  </li>
                <?php } ?>
            </ul>
          </div>
        <?php } ?>
        <?php if($this->config->get('cosyone_product_share') == 'image'){ ?>
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
        <?php } ?>
      </div>
    <?php } ?>
    <div class="right" style="margin-left:<?php echo $this->config->get('config_image_thumb_width') ?>px">
      <!-- NextPrevLinks -->
      <?php if ($this->config->get('nextprevlinks_status')) { ?>
        <div class="next_prev_links">
          <?php if ($prev_text) { ?>
            <a class="icon" data-tooltip="<?php echo $prev_text; ?>" href="<?php echo $prev_url; ?>"><i class="fa fa-angle-left"></i></a>
          <?php } else { ?><?php } ?>
          <?php if ($next_text) { ?>
            <a class="icon" data-tooltip="<?php echo $next_text; ?>" href="<?php echo $next_url; ?>"><i class="fa fa-angle-right"></i></a>
          <?php } else { ?><?php } ?>  
        </div>          
      <?php } ?>
      
      <h1 itemprop="name"><?php echo $heading_title; ?></h1>
      
      <?php if ($review_status) { ?>
        <div class="review">
          <span class="rating r<?php echo $rating; ?>">
            <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
          </span>
          <a class="to_review" onclick="$('a[href=\'#tab-review\']').trigger('click');"><?php echo $reviews; ?></a>
          <a class="to_review" onclick="$('a[href=\'#tab-review\']').trigger('click');"><?php echo $text_write; ?></a>
        </div>
          
        <?php if ($count_reviews > 0) { ?><!-- Rich snippet start -->
          <div itemprop="review" itemscope itemtype="http://data-vocabulary.org/Review-aggregate"> 
         	  <span itemprop="rating" content="<?php echo $rating; ?>"></span>
            <span itemprop="count" content="<?php echo $reviews; ?>"></span>
        	</div> 
        <?php } ?><!-- Rich snippet end -->
      <?php } ?>
      <div class="description">
        <?php if ($sku) { ?>
          <?php echo $sku; ?><br /><br />
        <?php } ?>
        <?php if ($manufacturer) { ?>
          <span class="contrast_font"><?php echo $text_manufacturer; ?></span> 
          <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a><br />
        <?php } ?>    
        <span class="contrast_font"><?php echo $text_model; ?></span> <?php echo $model; ?><br />
        <?php if ($upc) { ?>
          <span class="contrast_font"><?php echo $text_upc; ?></span> <?php echo $upc; ?><br />
        <?php } ?>
         <?php if ($ean) { ?>
          <span class="contrast_font"><?php echo $text_ean; ?></span> <?php echo $ean; ?><br />
        <?php } ?>
        <?php if ($jan) { ?>
          <span class="contrast_font"><?php echo $text_jan; ?></span> <?php echo $jan; ?><br />
        <?php } ?>
        <?php if ($isbn) { ?>
          <span class="contrast_font"><?php echo $text_isbn; ?></span> <?php echo $isbn; ?><br />
        <?php } ?>
        <?php if ($reward) { ?>
          <span class="contrast_font"><?php echo $text_reward; ?></span> <?php echo $reward; ?><br />
        <?php } ?>
        <span class="contrast_font" itemprop="availability" content="<?php if ($data_qty > 0) {echo "in_stock"; } else {echo "out_of_stock"; } ?>"><?php echo $text_stock; ?></span> <?php echo $stock; ?>
      </div> <!-- .description ends -->
        
        
      <?php if ($price) { ?> 
        <meta itemprop="currency" content="<?php echo $this->currency->getCode(); ?>" />
        <span itemprop="offerDetails" itemscope itemtype="http://data-vocabulary.org/Offer"><!-- Rich snippets start -->
        <?php if (($special) && ($this->config->get('cosyone_product_yousave'))) { ?>
          <div class="extended_offer">
            <div class="price-new"><?php echo $text_special_price; ?><span class="amount contrast_font" itemprop="price"><?php echo $special; ?></span></div>
            <div class="price-old"><?php echo $text_old_price; ?><span class="amount contrast_font"><?php echo $price; ?></span></div>
            <div class="price-save"><?php echo $text_you_save; ?><span class="amount contrast_font"><?php echo $yousave; ?></span> </div>
          </div>
        <?php } ?>

        <?php if (($special_date_end > 0) && ($this->config->get('cosyone_product_countdown'))) { ?>
          <div class="contrast_font"><div class="offer"></div></div> 
          <?php if ($this->config->get('cosyone_product_hurry')) { ?>
            <div class="hurry">
              <span class="items_left contrast_color"><?php echo $text_stock_quantity; ?></span>
              <span class="items_sold"><?php echo $text_items_sold; ?></span>
            </div>
          <?php } ?>
        <?php } ?>
      <?php } ?>
        
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
                        <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
                        <label  for="option-value-<?php echo $option_value['product_option_value_id']; ?>">
                          <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name']; ?>" />
                        </label>
                      </div>
                    <?php } ?>
                  </div>
                <?php } else { ?>
                  <table class="option-image">
                    <?php foreach ($option['option_value'] as $option_value) { ?>
                      <tr>
                        <td style="width: 1px;">
                          <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
                        </td>
                        <td>
                          <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>">
                            <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" />
                          </label>
                        </td>
                        <td>
                          <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                            <?php if ($option_value['price']) { ?>
                              (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                            <?php } ?>
                          </label>
                        </td>
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
            <?php if (!$special) { ?>
              <span itemprop="price"><?php echo $price; ?></span>
            <?php } else { ?>
              <?php if (!$this->config->get('cosyone_product_yousave')) { ?>
                <span class="price-old"><?php echo $price; ?></span> <span class="price-new" itemprop="price"><?php echo $special; ?></span>
              <?php } ?>
            <?php } ?>

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
        <?php if($this->config->get('cosyone_product_share') == 'content'){ ?>
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
    	  <?php } ?>
        <?php if ($price) { ?>
          <?php if ($tax) { ?>
            <span class="price-tax"><?php echo $text_tax; ?> <?php echo $tax; ?></span><br />
          <?php } ?>
        <?php } ?>
      </div> <!-- .share ends -->
    </div> <!-- product-info-right END -->
  </div> <!-- product-info END -->
   
  <div id="tabs" class="htabs">
    <a href="#tab-description"><?php echo $tab_description; ?></a>    
    <?php if ($product_tabs_1) { ?>
      <?php foreach($product_tabs_1 as $product_tab_1) { ?>
        <a href="#tab-product-tab<?php echo $product_tab_1['tab_id'];?>"><?php echo $product_tab_1['name']; ?></a>
      <?php } ?>
    <?php } ?>

    <?php if ($attribute_groups) { ?>
      <a href="#tab-attribute"><?php echo $tab_attribute; ?></a>
    <?php } ?>
    <?php if ($review_status) { ?>
      <a href="#tab-review"><?php echo $tab_review; ?></a>
    <?php } ?>
    <a href="#tab-facebook">
      <?php echo $tab_facebook; ?>
    </a>    
  </div>

  <div id="tab-description" class="tab-content"><?php echo $description; ?></div>

   <?php if ($product_tabs_1) { ?>
    <?php foreach($product_tabs_1 as $product_tab_1) { ?>
      <div id="tab-product-tab<?php echo $product_tab_1['tab_id'];?>" class="tab-content"><?php echo $product_tab_1['text']; ?></div>
    <?php } ?>
  <?php } ?>
            
  <?php if ($attribute_groups) { ?>
    <div id="tab-attribute" class="tab-content">
      <table class="attribute">
        <?php foreach ($attribute_groups as $attribute_group) { ?>
          <thead>
            <tr>
              <td colspan="2"><?php echo $attribute_group['name']; ?></td>
            </tr>
          </thead>
          <tbody>
            <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
              <tr>
                <td><?php echo $attribute['name']; ?></td>
                <td><?php echo $attribute['text']; ?></td>
              </tr>
            <?php } ?>
          </tbody>
        <?php } ?>
      </table>
    </div>
  <?php } ?>
  
  <?php if ($review_status) { ?>
    <div id="tab-review" class="tab-content">
      <div id="review"></div>
      <div class="write_review contrast_font">
        <h3 id="review-title" class="light_font"><?php echo $text_write; ?></h3>
        <?php echo $entry_name; ?><br />
        <input type="text" name="name" value="" />
        <br />
        <br />
        <?php echo $entry_review; ?>
        <textarea name="text" cols="40" rows="8" style="width: 100%;"></textarea>
        <span style="font-size: 11px;"><?php echo $text_note; ?></span><br />
        <br />
        <?php echo $entry_rating; ?> <span><?php echo $entry_bad; ?></span>&nbsp;
        <input type="radio" name="rating" value="1" />
        &nbsp;
        <input type="radio" name="rating" value="2" />
        &nbsp;
        <input type="radio" name="rating" value="3" />
        &nbsp;
        <input type="radio" name="rating" value="4" />
        &nbsp;
        <input type="radio" name="rating" value="5" />
        &nbsp;<span><?php echo $entry_good; ?></span><br />
        <br />
        <?php echo $entry_captcha; ?><br />
        <input type="text" name="captcha" value="" />
        <br />
        <img src="index.php?route=product/product/captcha" alt="" id="captcha" />
       
        <a id="button-review" class="button"><?php echo $button_continue; ?></a>
      </div>
    </div>
  <?php } ?>

  <div id="tab-facebook" class="tab-content">
      <?php echo $bottom; ?>     
  </div>
  
     
  
  <?php if ($this->config->get('cosyone_product_break') == 'full-width') { ?>
      <div class="clearfix"></div>
    </div>
  <?php } ?>  
      
  <?php if ($tags) { ?>
    <div class="tags">
      <?php for ($i = 0; $i < count($tags); $i++) { ?>
        <?php if ($i < (count($tags) - 1)) { ?>
          <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
        <?php } else { ?>
          <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
        <?php } ?>
      <?php } ?>
    </div>
  <?php } ?><br/>

  <?php if ($products) { ?>
  	<div class="box products">
  	  <div class="box-heading products"><?php echo $tab_related; ?> (<?php echo count($products); ?>)</div>
      <div class="<?php echo $this->config->get('cosyone_grid_related')?>">
        <div class="grid_holder">
          <div class="product-grid carousel related">
            <?php foreach ($products as $product) { ?>
              <div class="item contrast_font">
                <div class="image">
                  <?php if ($product['special'] && $this->config->get('cosyone_percentage_sale_badge') == 'enabled') { ?>
                    <div class="sale_badge">-<?php echo $product['sales_percantage']; ?>%</div>
          	     <?php } ?>
                  <?php if ($product['thumb']) { ?>
                    <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a>
                  <?php } ?>
                  <!--<div class="main_quicklook">
                    <a href="<?php echo $product['quickview']; ?>" class="button quickview"><i class="fa fa-eye"></i> Quicklook</a>
                  </div>-->
                </div><!-- image ends -->
                <div class="information_wrapper">
                  <div class="left">
                    <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
                     <?php if ($product['brand_name'] && $this->config->get('cosyone_brand')) { ?>
                        <span class="brand main_font"><?php echo $product['brand_name']; ?></span>
                     <?php } ?>
                     <div class="stock-status">
                        <span style="display:inline-block;border-radius:50%;width:8px;height:8px;margin-right:3px;background-color:<?php echo ($product['quantity'] > 0) ? 'green' : 'red'; ?>;"></span>
                        <span style="font-weight:400;<?php echo ($product['quantity'] > 0) ? 'color:green' : 'color:red'; ?>">
                          <?php echo $product['stock']; ?>
                        </span>
                    </div>
                    <div class="rating">
                      <span class="rating r<?php echo $product['rating']; ?>">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                      </span>
                    </div>
                  
                  </div>
                  <?php if ($product['price']) { ?>
                    <div class="price">
                      <?php if (!$product['special']) { ?>
                        <?php echo $product['price']; ?>
                      <?php } else { ?>
                        <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
                      <?php } ?>
                    </div>
                  <?php } ?>
                  <!--<div class="cart">
                    <button type="submit" class="button contrast" onclick="addToCart('<?php echo $product['product_id']; ?>');" ><i class="fa fa-shopping-cart"></i> <?php echo $button_cart; ?></button>
                  </div>
                  <div class="icons_wrapper">
                    <a class="sq_icon" onclick="addToWishList('<?php echo $product['product_id']; ?>');" data-tooltip="<?php echo $button_wishlist; ?>"><i class="fa fa-heart"></i></a><a class="sq_icon compare" onclick="addToCompare('<?php echo $product['product_id']; ?>');" data-tooltip="<?php echo $button_compare; ?>"><i class="fa fa-arrow-right"></i><i class="fa fa-arrow-left"></i></a><a href="<?php echo $product['quickview']; ?>" class="sq_icon qlook quickview" data-tooltip="Quicklook"><i class="fa fa-eye"></i></a><a class="sq_icon contrast add_to_cart" onclick="addToCart('<?php echo $product['product_id']; ?>');" data-tooltip="<?php echo $button_cart; ?>"><i class="fa fa-shopping-cart"></i></a>
                    <a class="plain_link wishlist" onclick="addToWishList('<?php echo $product['product_id']; ?>');" ><?php echo $button_wishlist; ?></a>
                    <a class="plain_link compare" onclick="addToCompare('<?php echo $product['product_id']; ?>');" ><?php echo $button_compare; ?></a>
                  </div>-->
                </div>
              </div>
            <?php } ?>
          </div>
        </div>
      </div>
    </div>
  <?php } ?>
  <?php echo $content_bottom; ?>
  
<?php if ($this->config->get('cosyone_product_break') == 'narrow') { ?>
</div>
<?php } ?>
    
<script type="text/javascript" src="catalog/view/theme/cosyone/js/cloud-zoom.1.0.2.min.js"></script>
<script type="text/javascript"><!--
$(document).ready(function() {
  $('.colorbox').colorbox({
    overlayClose: true,
    maxWidth:'95%',
    rel:'gallery',
    opacity: 0.5
  }); 
});

//--></script>

<script type="text/javascript">
  jQuery(function($) {
        
        
	//Product thumbnails
	
				
	$(".cloud-zoom-gallery").last().removeClass("cboxElement");
				
	$(".cloud-zoom-gallery").click(function() {
		$("#zoom-btn").attr('href', $(this).attr('href'));
		$("#zoom-btn").attr('title', $(this).attr('title'));
	
		$(".cloud-zoom-gallery").each(function() {
			$(this).addClass("cboxElement");
		});
		$(this).removeClass("cboxElement");
		});
        
  });
</script>
    
    
<script type="text/javascript">
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
				$('#profile-description').css( "line-height", "38px" );
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
					
				$('.success').fadeIn('slow');
					
				$('#cart-total').html(json['total']);
				
				$('html, body').animate({ scrollTop: 0 }, 'slow'); 
				
				$('#cart').load('index.php?route=module/cart #cart > *'); //Added
			}	
		}
	});
});
</script>
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
<script type="text/javascript"><!--
$('#review .pagination a').live('click', function() {
	$('#review').fadeOut('slow');
		
	$('#review').load(this.href);
	
	$('#review').fadeIn('slow');
	
	return false;
});			

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').bind('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
		beforeSend: function() {
			$('.success, .warning').remove();
			$('#button-review').attr('disabled', true);
			$('#review-title').after('<div class="attention"><img src="catalog/view/theme/default/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
		},
		complete: function() {
			$('#button-review').attr('disabled', false);
			$('.attention').remove();
		},
		success: function(data) {
			if (data['error']) {
				$('#review-title').after('<div class="warning">' + data['error'] + '</div>');
			}
			
			if (data['success']) {
				$('#review-title').after('<div class="success">' + data['success'] + '</div>');
								
				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').attr('checked', '');
				$('input[name=\'captcha\']').val('');
			}
		}
	});
});
//--></script>
<script type="text/javascript"><!--
$('#tabs a').tabs();
//--></script> 
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script> 
<script type="text/javascript"><!--
$(document).ready(function() {
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
var wrapperWidth = $(".image-additional").width();
var itemWidth = (<?php echo $this->config->get('config_image_additional_width') ?> + 10);
var itemcalc = Math.round(wrapperWidth / itemWidth);
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
$(document).ready(function() {
var grid5 = 5;
var grid4 = 4;
var grid3 = 3;
var owlRelated = $('.product-grid.related.carousel');
owlRelated.owlCarousel({
itemsCustom: [ [0, 1], [350, 2], [550, 3], [1025, <?php echo $this->config->get('cosyone_grid_related')?>]],
pagination: false,
navigation:true,
slideSpeed:500,
scrollPerPage:false,
navigationText: [
"<div class='slide_arrow_prev'><i class='fa fa-angle-left'></i></div>",
"<div class='slide_arrow_next'><i class='fa fa-angle-right'></i></div>"]
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
<script type="text/javascript">
$(".to_review").click(function() {
    $('html, body').animate({
        scrollTop: $("#tab-review").offset().top
    }, 1000);
});
</script>

<?php echo $footer; ?>