<?php if (count($products) > 0) { ?>
      <div class="box">
            <div class="box-heading"><?php echo $heading_title; ?></div>
            <div class="grid_holder <?php echo $this->config->get('cosyone_grid_related')?>">
                  <div class="product-grid">
			     <?php foreach ($products as $product) { ?>
				      <div class="item contrast_font">
                                <?php if ($product['thumb']) { ?>
            					<div class="image">
                    			           <?php if ($product['special'] && $this->config->get('cosyone_percentage_sale_badge') == 'enabled') { ?>
            	    			                 <div class="sale_badge">-<?php echo $product['sales_percantage']; ?>%</div>
            	    			            <?php } ?>
        			                       <a href="<?php echo $product['href']; ?>">
                                                  <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" />
                                            </a>
                                  		<!--<div class="main_quicklook">
                                  		      <a href="<?php echo $product['quickview']; ?>" class="button quickview"><i class="fa fa-eye"></i> Quicklook</a>
                                  		</div>-->
        		                      </div><!-- image ends -->
				           <?php } ?>
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
                                  		
				                </div><!-- left wrapper ends -->
                                      <?php if ($product['price']) { ?>
					                 <div class="price">
					                       <?php if (!$product['special']) { ?>
					                            <?php echo $product['price']; ?>
					                      <?php } else { ?>
					                           <span class="price-old">
                                                            <?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?>
                                                       </span>
					                     <?php } ?>
					                 </div>
					           <?php } ?>
				                <!--<div class="cart">
                                            <button type="submit" class="button contrast" onclick="addToCart('<?php echo $product['product_id']; ?>');" ><i class="fa fa-shopping-cart"></i> <?php echo $button_cart; ?></button>
                                      </div> 
     			                      <div class="icons_wrapper">
                                            <a class="sq_icon" onclick="addToWishList('<?php echo $product['product_id']; ?>');" data-tooltip="<?php echo $button_wishlist; ?>">
                                                  <i class="fa fa-heart"></i>
                                            </a>
                                            <a class="sq_icon compare" onclick="addToCompare('<?php echo $product['product_id']; ?>');" data-tooltip="<?php echo $button_compare; ?>">
                                                  <i class="fa fa-arrow-right"></i><i class="fa fa-arrow-left"></i>
                                            </a>
                                            <?php if ($this->config->get('cosyone_text_ql_' . $this->config->get('config_language_id'))) { ; ?>
                                                  <a href="<?php echo $product['quickview']; ?>" class="sq_icon qlook quickview" data-tooltip="<?php echo ($this->config->get('cosyone_text_ql_' . $this->config->get('config_language_id'))) ; ?>">
                                                        <i class="fa fa-eye"></i>
                                                  </a>
                                            <?php } ?>
                                            <a class="sq_icon contrast add_to_cart" onclick="addToCart('<?php echo $product['product_id']; ?>');" data-tooltip="<?php echo $button_cart; ?>">
                                                  <i class="fa fa-shopping-cart"></i>
                                            </a>
                                            <a class="plain_link wishlist" onclick="addToWishList('<?php echo $product['product_id']; ?>');" >
                                                  <?php echo $button_wishlist; ?>
                                            </a>
                                            <a class="plain_link compare" onclick="addToCompare('<?php echo $product['product_id']; ?>');" >
                                                  <?php echo $button_compare; ?>
                                            </a>
                                      </div>-->
				            </div><!-- informtion wrapper ends -->
                            </div> 
			     <?php } ?>
                </div>
		</div>
      </div>
<?php } ?>