<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content" class="<?php echo $this->config->get('cosyone_grid_category')?>"><?php echo $content_top; ?>
  	<div class="breadcrumb">
    		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
    			<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    		<?php } ?>
  	</div>
  	<script type="text/javascript" src="catalog/view/theme/cosyone/js/countdown/jquery.countdown.min.js"></script>
  	<h1><?php echo $heading_title; ?></h1>
  	<div class="content border">
	  	<h3><?php echo $text_critea; ?></h3>
	    	<div class="clearfix"></div>
	    	<div class="input_field_half">
	     		<?php if ($search) { ?>
	      			<input type="text" name="search" value="<?php echo $search; ?>" />
	      		<?php } else { ?>
	     	 		<input type="text" name="search" value="<?php echo $search; ?>" onclick="this.value = '';" onkeydown="this.style.color = '000000'" style="color: #999;" />
	      		<?php } ?>
	      	</div>
	       	<div class="input_field_half">
	      		<select name="category_id">
	        			<option value="0"><?php echo $text_category; ?></option>
	        			<?php foreach ($categories as $category_1) { ?>
	        				<?php if ($category_1['category_id'] == $category_id) { ?>
	        					<option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
	        				<?php } else { ?>
	        					<option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
	        				<?php } ?>
	        				<?php foreach ($category_1['children'] as $category_2) { ?>
	        					<?php if ($category_2['category_id'] == $category_id) { ?>
	        						<option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
	        					<?php } else { ?>
	        						<option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
	        					<?php } ?>
	        					<?php foreach ($category_2['children'] as $category_3) { ?>
	        						<?php if ($category_3['category_id'] == $category_id) { ?>
	        							<option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
	        						<?php } else { ?>
	        							<option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
	        						<?php } ?>
	        					<?php } ?>
	        				<?php } ?>
	        			<?php } ?>
	      		</select>
	      	</div>
	      	<div class="clearfix" style="height:5px;"></div>
	       	<div class="input_field_half">
			<?php if ($sub_category) { ?>
			      	<input type="checkbox" name="sub_category" value="1" id="sub_category" checked="checked" />
			<?php } else { ?>
			      	<input type="checkbox" name="sub_category" value="1" id="sub_category" />
			<?php } ?>
	      		<label for="sub_category"><?php echo $text_sub_category; ?></label>
	 	 </div>
	       	<div class="input_field_half">
	      		<?php if ($description) { ?>
	    			<input type="checkbox" name="description" value="1" id="description" checked="checked" />
	    		<?php } else { ?>
	    			<input type="checkbox" name="description" value="1" id="description" />
	    		<?php } ?>
	    		<label for="description"><?php echo $entry_description; ?></label>
	    	</div>
	  	<div class="clearfix"></div>
	</div>
  	<div class="buttons">
    		<input type="button" value="<?php echo $button_search; ?>" id="button-search" class="button" />
  	</div>
  	<h3><?php echo $text_search; ?></h3>
  
  
  	<?php if ($products) { ?>
		 <div class="product-filter">
		  	<div class="display-title"><?php echo $text_display; ?></div>
		    	<div class="display"> 
		    		<a id="grid_view_icon"><i class="fa fa-th"></i></a><!--<a id="list_view_icon"><i class="fa fa-list"></i></a>-->
		    	</div>
		    	<div class="limit mobile_hide"><?php echo $text_limit; ?>
			      	<select onchange="location = this.value;">
			        		<?php foreach ($limits as $limits) { ?>
			        			<?php if ($limits['value'] == $limit) { ?>
			        				<option value="<?php echo $limits['href']; ?>" selected="selected">
			        					<?php echo $limits['text']; ?>
			        				</option>
			        			<?php } else { ?>
			        				<option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
			        			<?php } ?>
			        		<?php } ?>
			      	</select>
			</div>
		    	<div class="sort"><?php echo $text_sort; ?>
		      		<select onchange="location = this.value;">
		        			<?php foreach ($sorts as $sorts) { ?>
		        				<?php if ($sorts['value'] == $sort . '-' . $order) { ?>
		        					<option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
		        				<?php } else { ?>
		        					<option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
		        				<?php } ?>
		        			<?php } ?>
		      		</select>
		    	</div>
     			<div class="product-compare mobile_hide"><a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a></div>
  		</div>
  		<div id="main" class="product-<?php echo $this->config->get('cosyone_default_view')?>">
  			<div class="grid_holder">
    				<?php foreach ($products as $product) { ?>
    					<div class="item contrast_font">
					       	<div class="image">
					        		<?php if ($product['special'] && $this->config->get('cosyone_percentage_sale_badge') == 'enabled') { ?>
						    		<div class="sale_badge">-<?php echo $product['sales_percantage']; ?>%</div>
						    	<?php } ?>
					        		<?php if ($product['thumb_hover'] && $this->config->get('cosyone_rollover_effect') == 'enabled') { ?>
					        			<div class="image_hover">
					        				<a href="<?php echo $product['href']; ?>">
					        					<img src="<?php echo $product['thumb_hover']; ?>" alt="<?php echo $product['name']; ?>" />
					        				</a>
					        			</div>
					        			<a href="<?php echo $product['href']; ?>">
					        				<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" />
					        			</a>
					        		<?php } elseif ($product['thumb']) { ?>
					        			<a href="<?php echo $product['href']; ?>">
					        				<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" />
					        			</a>
					        		<?php } ?>   
					        		<!--<?php if ($this->config->get('cosyone_text_ql_' . $this->config->get('config_language_id'))) { ; ?>
					        			<div class="main_quicklook">
					        				<a href="<?php echo $product['quickview']; ?>" class="button quickview">
					        					<i class="fa fa-eye"></i> <?php echo ($this->config->get('cosyone_text_ql_' . $this->config->get('config_language_id'))) ; ?>
					        				</a>
					        			</div>
					    		<?php } ?>-->
					        	</div><!-- image ends -->
            
      						<div class="information_wrapper">
      							<div class="left">
      								<div class="name">
      									<a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
      								</div>
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
      							<div class="description main_font"><?php echo $product['description']; ?></div>
      							<?php if ($product['price']) { ?>
							      	<div class="price">
							        		<?php if (!$product['special']) { ?>
							        			<?php echo $product['price']; ?>
							        		<?php } else { ?>
							        			<span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
							        		<?php } ?>
							        		<?php if ($product['tax']) { ?>
							        			<br />
							        			<span class="price-tax">
							        				<?php echo $text_tax; ?> <?php echo $product['tax']; ?>
							        			</span>
							        		<?php } ?>
							      	</div>
      							<?php } ?>
      							<!--<div class="cart">       
      								<button type="submit" class="button contrast" onclick="addToCart('<?php echo $product['product_id']; ?>');" >
      									<i class="fa fa-shopping-cart"></i> <?php echo $button_cart; ?>
      								</button>
    							</div>  
    							<div class="icons_wrapper">
    								<a class="sq_icon" onclick="addToWishList('<?php echo $product['product_id']; ?>');" data-tooltip="<?php echo $button_wishlist; ?>"><i class="fa fa-heart"></i></a>
    								<a class="sq_icon compare" onclick="addToCompare('<?php echo $product['product_id']; ?>');" data-tooltip="<?php echo $button_compare; ?>"><i class="fa fa-arrow-right"></i><i class="fa fa-arrow-left"></i></a>
    								<?php if ($this->config->get('cosyone_text_ql_' . $this->config->get('config_language_id'))) { ; ?>
    									<a href="<?php echo $product['quickview']; ?>" class="sq_icon qlook quickview" data-tooltip="<?php echo ($this->config->get('cosyone_text_ql_' . $this->config->get('config_language_id'))) ; ?>"><i class="fa fa-eye"></i></a>
    								<?php } ?>
    								<a class="sq_icon contrast add_to_cart" onclick="addToCart('<?php echo $product['product_id']; ?>');" data-tooltip="<?php echo $button_cart; ?>"><i class="fa fa-shopping-cart"></i></a>
    								<a class="plain_link wishlist" onclick="addToWishList('<?php echo $product['product_id']; ?>');" ><?php echo $button_wishlist; ?></a>
    								<a class="plain_link compare" onclick="addToCompare('<?php echo $product['product_id']; ?>');" ><?php echo $button_compare; ?></a>
    							</div>-->
        
        							<?php if ((($product['special']) && ($product['special_date_end'] > 0) && ($this->config->get('cosyone_product_countdown')))) { ?>
    								<div class="offer_popup">
       									<div class="offer_background"></div>
        									<div class="offer_content">
        										<div class="countdown <?php echo $product['product_id']; ?>"></div>
									        	<?php if ($this->config->get('cosyone_product_hurry')) { ?>
									        		<span class="hurry main_font"><?php echo $product['stock_quantity']; ?></span>
									        	<?php } ?>
									</div>
								</div>
								<script type="text/javascript">
								$('.<?php echo $product['product_id']; ?>').countdown({
								until: <?php echo $product['special_date_end']; ?>, 
								layout: '<span class="main_font"><?php echo $text_category_expire; ?></span><br /><i>{dn}</i> {dl}&nbsp; <i>{hn}</i>  {hl}&nbsp; <i>{mn}</i>  {ml}&nbsp; <i>{sn}</i> {sl}'});
								</script>
    							<?php } ?>
    						</div>
    					</div>

    				<?php } ?>
    			</div>
    		</div>
  		<div class="pagination"><?php echo $pagination; ?></div>
	<?php } else { ?>
		<div class="content"><?php echo $text_empty; ?></div>
	<?php }?>
	<?php echo $content_bottom; ?>
</div>
<script type="text/javascript">
	
	$('#content input[name=\'search\']').keydown(function(e) {
		if (e.keyCode == 13) {
			$('#button-search').trigger('click');
		}
	});

	$('select[name=\'category_id\']').bind('change', function() {
		if (this.value == '0') {
			$('input[name=\'sub_category\']').attr('disabled', 'disabled');
			$('input[name=\'sub_category\']').removeAttr('checked');
		} else {
			$('input[name=\'sub_category\']').removeAttr('disabled');
		}
	});

	$('select[name=\'category_id\']').trigger('change');

	$('#button-search').bind('click', function() {
		url = 'index.php?route=product/search';
		
		var search = $('#content input[name=\'search\']').attr('value');
		
		if (search) {
			url += '&search=' + encodeURIComponent(search);
		}

		var category_id = $('#content select[name=\'category_id\']').attr('value');
		
		if (category_id > 0) {
			url += '&category_id=' + encodeURIComponent(category_id);
		}
		
		var sub_category = $('#content input[name=\'sub_category\']:checked').attr('value');
		
		if (sub_category) {
			url += '&sub_category=true';
		}
			
		var filter_description = $('#content input[name=\'description\']:checked').attr('value');
		
		if (filter_description) {
			url += '&description=true';
		}

		location = url;
	});


	$(function() {
		var pv = $.cookie('product_view');
		if (pv == 'g') {
			$('#main').removeClass();
			$('#main').addClass('product-grid');
			$('#list_view_icon').removeClass();
			$('#grid_view_icon').addClass('active');
		} else if (pv == 'l') {
			$('#main').removeClass();
			$('#main').addClass('product-list');
			$('#grid_view_icon').removeClass();
			$('#list_view_icon').addClass('active');
		} else {
			$('#<?php echo $this->config->get('cosyone_default_view')?>_view_icon').addClass('active');
		}
	});
	$(document).ready(function() {
		$('#grid_view_icon').click(function() {
			$(this).addClass('active');
			$('#list_view_icon').removeClass();
			$('#main').fadeOut(300, function() {
				$(this).removeClass();
				$(this).addClass('product-grid').fadeIn(300);
				$.cookie('product_view', 'g');
			});
			return false;
		});
		$('#list_view_icon').click(function() {
			$(this).addClass('active');
			$('#grid_view_icon').removeClass();
			$('#main').fadeOut(300, function() {
				$(this).removeClass();
				$(this).addClass('product-list').fadeIn(300);
				$.cookie('product_view', 'l');
			});
			return false;
		});
	});
	</script>
<?php echo $footer; ?>