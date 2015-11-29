<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  	<div class="breadcrumb">
    		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
    			<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    		<?php } ?>
  	</div>
  	<div id="social_login_content_holder"></div>
  	<h1><?php echo $heading_title; ?></h1>
	
 
  	<!-- Start -->
  	<div id="warning-messages"></div>
  	<div id="success-messages"></div>
  	<?php if ($mobile_stylesheet) { ?>
  		<link rel="stylesheet" href="<?php echo $stylesheet; ?>" />
  		<link rel="stylesheet" href="<?php echo $mobile_stylesheet; ?>" />
  	<?php } else { ?>
  		<link rel="stylesheet" href="<?php echo $stylesheet; ?>" />
  	<?php } ?>

  	<?php if ($html_header) { ?>
  		<div class="html_header"><?php echo $html_header; ?></div>
  	<?php } ?>

  	<div id="quickcheckout-countdown"></div>

  	<div id="quickcheckoutconfirm">

		 <?php if (!$logged && $login_module) { ?>
		  	<p class="contrast_font"><a class="login_trigger"><?php echo $text_already_have_account; ?></a></p>
		  	<div class="quickcheckoutmid" id="login-box">
		    		<div id="checkout">
			  		<div class="quickcheckout-heading box-heading"><?php echo $text_checkout_option; ?></div>
		      			<div class="quickcheckout-content"></div>
		    		</div>
		  	</div>
		<?php } ?>
  
   		<div class="grid_holder">  
			<div class="checkout-column">
			    	<?php if (!$logged) { ?>
			    		<div id="payment-address" class="address">
				  		<div class="quickcheckout-heading checkout-heading"><span><?php echo $text_checkout_account; ?></span></div>
			      			<div class="quickcheckout-content"></div>
			    		</div>
			    	<?php } else { ?>
				    	<div id="payment-address">
					  	<div class="quickcheckout-heading checkout-heading"><span><?php echo $text_checkout_payment_address; ?></span></div>
				      		<div class="quickcheckout-content"></div>
				    	</div>
			    	<?php } ?>
			    	<?php if ($shipping_required) { ?>
			    		<div id="shipping-address">
				  		<br /><div class="quickcheckout-heading box-heading"><?php echo $text_checkout_shipping_address; ?></div>
			      			<div class="quickcheckout-content"></div>
			    		</div>
				<?php } ?>
			</div>
  			<div class="checkout-column">
				<?php if ($shipping_required) { ?>
					<?php if ($shipping_module) { ?>
				    		<div id="shipping-method">
					<?php } else { ?>
						<div id="shipping-method" style="display:none;">
					<?php } ?>
					  	<div class="quickcheckout-heading checkout-heading"><?php echo $text_checkout_shipping_method; ?></div>
				      		<div class="quickcheckout-content"></div>
				    		</div>
				<?php } ?>
    				<?php if ($payment_module) { ?>
				    	<div id="payment-method">
				<?php } else { ?>
					<div id="payment-method" style="display:none;">
				<?php } ?>
					<div class="quickcheckout-heading checkout-heading"><?php echo $text_checkout_payment_method; ?></div>
				      	<div class="quickcheckout-content"></div>
				    	</div>
  
  				<?php if ($layout != '2') { ?>
  					</div> <!-- not if 2 columns -->
				<?php } ?>
  

				<?php if ($voucher_module || $coupon_module || $reward_module || $cart_module) { ?>
				  
				  	<?php if ($layout != '2') { ?>
				  		<div class="checkout-column cart"> <!-- not if 2 columns -->
				  	<?php } ?>
				  
				    	<?php if ($cart_module) { ?>
						<div id="cart1">
					  		<div class="quickcheckout-content" style="border:none; padding: 0px;"></div>
						</div>
					<?php } ?>
					
					<div id="voucher">
					  	<div class="quickcheckout-content" style="border:none; padding: 0px;overflow: hidden;"></div>
					</div>
				    
				    	<div id="terms">
					  	<div class="quickcheckout-content"></div>
					</div>
				  
				<?php } ?>
				</div>
  				</div>

				<?php if ($html_footer) { ?>
				  	<?php echo $html_footer; ?>
				<?php } ?>
  
  				<!-- End -->
			</div>
  			<?php echo $content_bottom; ?>
  		</div>
		<script type="text/javascript"><!--
		<?php if ($countdown && $countdown_end) { ?>
		$('#quickcheckout-countdown').countdown({
			timezone: <?php echo $timezone; ?>,
			until: new Date('<?php echo $countdown_end; ?>'),
		    layout: '<p><?php echo addslashes($countdown_before); ?><span class="contrast_font"><b><?php echo $countdown_timer; ?></b></span> {desc}',
		    description: '<?php echo addslashes($countdown_after); ?></p>'
		});
		<?php } ?>
		<?php if ($load_screen) { ?>
		$(window).load(function() {
		    $.blockUI({
				message: '<span style="font-size:16px;"><i class="fa fa-refresh fa-spin"></i> &nbsp;<?php echo $text_please_wait; ?></span>',
				css: {
					border: '2px solid #000000',
					padding: '20px 0px',
					backgroundColor: '#ffffff',
					opacity: .9,
					color: '#000000'
				}
			});

		    setTimeout($.unblockUI, 2000);
		});
		<?php } ?>

		<?php if (!$logged) { ?>
			<?php if ($login_module) { ?>
			// Login box
			$(document).ready(function() {
				$.ajax({
					url: 'index.php?route=quickcheckout/login',
					dataType: 'html',
					cache: false,
					beforeSend: function() {
						$('#checkout .quickcheckout-content').html('<div class="wait" style="text-align:center;">&nbsp;<img src="catalog/view/theme/default/image/quickcheckout-loading.gif" alt="" /></div>');
					},
					success: function(html) {
						$('#checkout .quickcheckout-content').html(html);
					},
					<?php if ($debug) { ?>
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
					<?php } ?>
				});
			});

			// Login Form Clicked
			$('#button-login').live('click', function() {
				$.ajax({
					url: 'index.php?route=quickcheckout/login/validate',
					type: 'post',
					data: $('#checkout #login :input'),
					dataType: 'json',
					cache: false,
					beforeSend: function() {
						$('#button-login').attr('disabled', true);
						$('#button-login').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
					},
					complete: function() {
						$('#button-login').attr('disabled', false);
						$('.wait').remove();
					},
					success: function(json) {
						$('.warning, .error').remove();

						if (json['redirect']) {
							location = json['redirect'];
						} else if (json['error']) {
							$('#warning-messages').prepend('<div class="warning" style="display: none;">' + json['error']['warning'] + '</div>');
							$('html, body').animate({ scrollTop: 0 }, 'slow');
							$('.warning').fadeIn('slow');
						}
					},
					<?php if ($debug) { ?>
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
					<?php } ?>
				});
			});
			<?php } ?>

		// Validate Register
		function validateRegister() {
			$.ajax({
				url: 'index.php?route=quickcheckout/register/validate',
				type: 'post',
				data: $('#payment-address input[type=\'text\'], #payment-address input[type=\'password\'], #payment-address input[type=\'checkbox\']:checked, #payment-address input[type=\'radio\']:checked, #payment-address input[type=\'hidden\'], #payment-address select'),
				dataType: 'json',
				cache: false,
				success: function(json) {
					$('.warning, .error').remove();

					if (json['redirect']) {
						location = json['redirect'];
					} else if (json['error']) {
						$('#button-payment-method').attr('disabled', false);
						$('.wait').remove();
					
						$('html, body').animate({ scrollTop: 0 }, 'slow');
						
						if (json['error']['warning']) {
							$('#warning-messages').prepend('<div class="warning" style="display: none;">' + json['error']['warning'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
							$('.warning').fadeIn('slow');
						}

						<?php if ($text_error) { ?>
							if (json['error']['firstname']) {
								$('#payment-address input[name=\'firstname\'] + br').after('<span class="error">' + json['error']['firstname'] + '</span>');
							}

							if (json['error']['lastname']) {
								$('#payment-address input[name=\'lastname\'] + br').after('<span class="error">' + json['error']['lastname'] + '</span>');
							}

							if (json['error']['email']) {
								$('#payment-address input[name=\'email\'] + br').after('<span class="error">' + json['error']['email'] + '</span>');
							}

							if (json['error']['telephone']) {
								$('#payment-address input[name=\'telephone\'] + br').after('<span class="error">' + json['error']['telephone'] + '</span>');
							}

							if (json['error']['fax']) {
								$('#payment-address input[name=\'fax\'] + br').after('<span class="error">' + json['error']['fax'] + '</span>');
							}

							if (json['error']['birthday']) {
								$('#payment-address input[name=\'birthday\'] + br').after('<span class="error">' + json['error']['birthday'] + '</span>');
							}

							if (json['error']['skin']) {
								$('#payment-address input[name=\'skin\'] + br').after('<span class="error">' + json['error']['skin'] + '</span>');
							}

							if (json['error']['company']) {
								$('#payment-address input[name=\'company\'] + br').after('<span class="error">' + json['error']['company'] + '</span>');
							}

							if (json['error']['company_id']) {
								$('#payment-address input[name=\'company_id\'] + br').after('<span class="error">' + json['error']['company_id'] + '</span>');
							}

							if (json['error']['tax_id']) {
								$('#payment-address input[name=\'tax_id\'] + br').after('<span class="error">' + json['error']['tax_id'] + '</span>');
							}

							if (json['error']['address_1']) {
								$('#payment-address input[name=\'address_1\'] + br').after('<span class="error">' + json['error']['address_1'] + '</span>');
							}

							if (json['error']['address_2']) {
								$('#payment-address input[name=\'address_2\'] + br').after('<span class="error">' + json['error']['address_2'] + '</span>');
							}

							if (json['error']['city']) {
								$('#payment-address input[name=\'city\'] + br').after('<span class="error">' + json['error']['city'] + '</span>');
							}

							if (json['error']['postcode']) {
								$('#payment-address input[name=\'postcode\'] + br').after('<span class="error">' + json['error']['postcode'] + '</span>');
							}

							if (json['error']['country']) {
								$('#payment-address select[name=\'country_id\'] + br').after('<span class="error">' + json['error']['country'] + '</span>');
							}

							if (json['error']['zone']) {
								$('#payment-address select[name=\'zone_id\'] + br').after('<span class="error">' + json['error']['zone'] + '</span>');
							}

							if (json['error']['password']) {
								$('#payment-address input[name=\'password\'] + br').after('<span class="error">' + json['error']['password'] + '</span>');
							}

							if (json['error']['confirm']) {
								$('#payment-address input[name=\'confirm\'] + br').after('<span class="error">' + json['error']['confirm'] + '</span>');
							}
						<?php } ?>
						<?php if ($highlight_error) { ?>
							if (json['error']['firstname']) {
								$('#payment-address input[name=\'firstname\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}

							if (json['error']['lastname']) {
								$('#payment-address input[name=\'lastname\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}

							if (json['error']['email']) {
								$('#payment-address input[name=\'email\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}

							if (json['error']['telephone']) {
								$('#payment-address input[name=\'telephone\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}

							if (json['error']['fax']) {
								$('#payment-address input[name=\'fax\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}

							if (json['error']['birthday']) {
								$('#payment-address input[name=\'birthday\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}

							if (json['error']['skin']) {
								$('#payment-address input[name=\'skin\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}

							if (json['error']['company']) {
								$('#payment-address input[name=\'company\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}

							if (json['error']['company_id']) {
								$('#payment-address input[name=\'company_id\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}

							if (json['error']['tax_id']) {
								$('#payment-address input[name=\'tax_id\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}

							if (json['error']['address_1']) {
								$('#payment-address input[name=\'address_1\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}

							if (json['error']['address_2']) {
								$('#payment-address input[name=\'address_2\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}

							if (json['error']['city']) {
								$('#payment-address input[name=\'city\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}

							if (json['error']['postcode']) {
								$('#payment-address input[name=\'postcode\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}

							if (json['error']['country']) {
								$('#payment-address select[name=\'country_id\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}

							if (json['error']['zone']) {
								$('#payment-address select[name=\'zone_id\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}

							if (json['error']['password']) {
								$('#payment-address input[name=\'password\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}

							if (json['error']['confirm']) {
								$('#payment-address input[name=\'confirm\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}
						<?php } ?>
					} else {
						<?php if ($shipping_required) { ?>
							var shipping_address = $('#payment-address input[name=\'shipping_address\']:checked').attr('value');

							if (shipping_address) {
								validateShippingMethod();
							} else {
								validateGuestShippingAddress();
							}
						<?php } else {?>
							validatePaymentMethod();
						<?php } ?>
					}
				},
				<?php if ($debug) { ?>
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
				<?php } ?>
			});
		}

		// Load Guest Payment Form
		$(document).ready(function() {
			$.ajax({
				url: 'index.php?route=quickcheckout/guest',
				dataType: 'html',
				cache: false,
				beforeSend: function() {
					$('#payment-address .quickcheckout-content').html('<div class="wait" style="width:100%;text-align:center;">&nbsp;<img src="catalog/view/theme/default/image/quickcheckout-loading.gif" alt="" /></div>');
				},
				success: function(html) {
					$('#payment-address .quickcheckout-content').html(html);
				},
				<?php if ($debug) { ?>
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
				<?php } ?>
			});
		});

		// Validate Guest Payment Address
		function validateGuestAddress() {
			$.ajax({
				url: 'index.php?route=quickcheckout/guest/validate',
				type: 'post',
				data: $('#payment-address input[type=\'text\'], #payment-address input[type=\'checkbox\']:checked, #payment-address input[type=\'radio\']:checked, #payment-address select'),
				dataType: 'json',
				cache: false,
				beforeSend: function() {
					$('#button-payment-method').attr('disabled', true);
					$('#button-payment-method').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
				},
				success: function(json) {		
					$('.warning, .error').remove();

					if (json['redirect']) {
						location = json['redirect'];
					} else if (json['error']) {
						$('#button-payment-method').attr('disabled', false);
						$('.wait').remove();
						
						$('html, body').animate({ scrollTop: 0 }, 'slow');
					
						if (json['error']['warning']) {
							$('#warning-messages').prepend('<div class="warning" style="display: none;">' + json['error']['warning'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
							$('.warning').fadeIn('slow');
						}

						<?php if ($text_error) { ?>
							if (json['error']['firstname']) {
								$('#payment-address input[name=\'firstname\'] + br').after('<span class="error">' + json['error']['firstname'] + '</span>');
							}

							if (json['error']['lastname']) {
								$('#payment-address input[name=\'lastname\'] + br').after('<span class="error">' + json['error']['lastname'] + '</span>');
							}

							if (json['error']['email']) {
								$('#payment-address input[name=\'email\'] + br').after('<span class="error">' + json['error']['email'] + '</span>');
							}

							if (json['error']['telephone']) {
								$('#payment-address input[name=\'telephone\'] + br').after('<span class="error">' + json['error']['telephone'] + '</span>');
							}

							if (json['error']['birthday']) {
								$('#payment-address input[name=\'birthday\'] + br').after('<span class="error">' + json['error']['birthday'] + '</span>');
							}

							if (json['error']['skin']) {
								$('#payment-address input[name=\'skin\'] + br').after('<span class="error">' + json['error']['skin'] + '</span>');
							}

							if (json['error']['fax']) {
								$('#payment-address input[name=\'fax\'] + br').after('<span class="error">' + json['error']['fax'] + '</span>');
							}

							if (json['error']['company']) {
								$('#payment-address input[name=\'company\'] + br').after('<span class="error">' + json['error']['company'] + '</span>');
							}

							if (json['error']['company_id']) {
								$('#payment-address input[name=\'company_id\'] + br').after('<span class="error">' + json['error']['company_id'] + '</span>');
							}

							if (json['error']['tax_id']) {
								$('#payment-address input[name=\'tax_id\'] + br').after('<span class="error">' + json['error']['tax_id'] + '</span>');
							}

							if (json['error']['address_1']) {
								$('#payment-address input[name=\'address_1\'] + br').after('<span class="error">' + json['error']['address_1'] + '</span>');
							}

							if (json['error']['address_2']) {
								$('#payment-address input[name=\'address_2\'] + br').after('<span class="error">' + json['error']['address_2'] + '</span>');
							}

							if (json['error']['city']) {
								$('#payment-address input[name=\'city\'] + br').after('<span class="error">' + json['error']['city'] + '</span>');
							}

							if (json['error']['postcode']) {
								$('#payment-address input[name=\'postcode\'] + br').after('<span class="error">' + json['error']['postcode'] + '</span>');
							}

							if (json['error']['country']) {
								$('#payment-address select[name=\'country_id\'] + br').after('<span class="error">' + json['error']['country'] + '</span>');
							}

							if (json['error']['zone']) {
								$('#payment-address select[name=\'zone_id\'] + br').after('<span class="error">' + json['error']['zone'] + '</span>');
							}
						<?php } ?>
						<?php if ($highlight_error) { ?>
							if (json['error']['firstname']) {
								$('#payment-address input[name=\'firstname\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}

							if (json['error']['lastname']) {
								$('#payment-address input[name=\'lastname\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}

							if (json['error']['email']) {
								$('#payment-address input[name=\'email\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}

							if (json['error']['telephone']) {
								$('#payment-address input[name=\'telephone\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}

							if (json['error']['birthday']) {
								$('#payment-address input[name=\'birthday\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}

							if (json['error']['skin']) {
								$('#payment-address input[name=\'skin\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}

							if (json['error']['fax']) {
								$('#payment-address input[name=\'fax\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}

							if (json['error']['company']) {
								$('#payment-address input[name=\'company\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}

							if (json['error']['company_id']) {
								$('#payment-address input[name=\'company_id\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}

							if (json['error']['tax_id']) {
								$('#payment-address input[name=\'tax_id\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}

							if (json['error']['address_1']) {
								$('#payment-address input[name=\'address_1\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}

							if (json['error']['address_2']) {
								$('#payment-address input[name=\'address_2\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}

							if (json['error']['city']) {
								$('#payment-address input[name=\'city\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}

							if (json['error']['postcode']) {
								$('#payment-address input[name=\'postcode\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}

							if (json['error']['country']) {
								$('#payment-address select[name=\'country_id\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}

							if (json['error']['zone']) {
								$('#payment-address select[name=\'zone_id\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}
						<?php } ?>
					} else {
						var create_account = $('#payment-address input[name=\'create_account\']:checked').attr('value');

						<?php if ($shipping_required) { ?>
							var shipping_address = $('#payment-address input[name=\'shipping_address\']:checked').attr('value');

							if (create_account) {
								validateRegister();
							} else {
								if (shipping_address) {
									validateShippingMethod();
								} else {
									validateGuestShippingAddress();
								}
							}
						<?php } else { ?>
							if (create_account) {
								validateRegister();
							} else {
								validatePaymentMethod();
							}
						<?php } ?>
					}
				},
				<?php if ($debug) { ?>
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
				<?php } ?>
			});
		}

		// Validate Guest Shipping Address
		function validateGuestShippingAddress() {
			$.ajax({
				url: 'index.php?route=quickcheckout/guest_shipping/validate',
				type: 'post',
				data: $('#shipping-address input[type=\'text\'], #shipping-address input[type=\'checkbox\']:checked, #shipping-address input[type=\'radio\']:checked, #shipping-address select'),
				dataType: 'json',
				cache: false,
				success: function(json) {
					$('.warning, .error').remove();

					if (json['redirect']) {
						location = json['redirect'];
					} else if (json['error']) {
						$('#button-payment-method').attr('disabled', false);
						$('.wait').remove();
						
						$('html, body').animate({ scrollTop: 0 }, 'slow');
						
						if (json['error']['warning']) {
							$('#warning-messages').prepend('<div class="warning" style="display: none;">' + json['error']['warning'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
							$('.warning').fadeIn('slow');
						}

						<?php if ($text_error) { ?>
							if (json['error']['firstname']) {
								$('#shipping-address input[name=\'firstname\']').after('<span class="error">' + json['error']['firstname'] + '</span>');
							}

							if (json['error']['lastname']) {
								$('#shipping-address input[name=\'lastname\']').after('<span class="error">' + json['error']['lastname'] + '</span>');
							}

							if (json['error']['address_1']) {
								$('#shipping-address input[name=\'address_1\']').after('<span class="error">' + json['error']['address_1'] + '</span>');
							}

							if (json['error']['address_2']) {
								$('#shipping-address input[name=\'address_2\']').after('<span class="error">' + json['error']['address_2'] + '</span>');
							}

							if (json['error']['company']) {
								$('#shipping-address input[name=\'company\'] + br').after('<span class="error">' + json['error']['company'] + '</span>');
							}

							if (json['error']['city']) {
								$('#shipping-address input[name=\'city\']').after('<span class="error">' + json['error']['city'] + '</span>');
							}

							if (json['error']['postcode']) {
								$('#shipping-address input[name=\'postcode\']').after('<span class="error">' + json['error']['postcode'] + '</span>');
							}

							if (json['error']['country']) {
								$('#shipping-address select[name=\'country_id\']').after('<span class="error">' + json['error']['country'] + '</span>');
							}

							if (json['error']['zone']) {
								$('#shipping-address select[name=\'zone_id\']').after('<span class="error">' + json['error']['zone'] + '</span>');
							}
						<?php } ?>
						<?php if ($highlight_error) { ?>
							if (json['error']['firstname']) {
								$('#shipping-address input[name=\'firstname\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}

							if (json['error']['lastname']) {
								$('#shipping-address input[name=\'lastname\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}

							if (json['error']['address_1']) {
								$('#shipping-address input[name=\'address_1\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}

							if (json['error']['address_2']) {
								$('#shipping-address input[name=\'address_2\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}

							if (json['error']['company']) {
								$('#shipping-address input[name=\'company\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}

							if (json['error']['city']) {
								$('#shipping-address input[name=\'city\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}

							if (json['error']['postcode']) {
								$('#shipping-address input[name=\'postcode\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}

							if (json['error']['country']) {
								$('#shipping-address select[name=\'country_id\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}

							if (json['error']['zone']) {
								$('#shipping-address select[name=\'zone_id\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}
						<?php } ?>
					} else {
						validateShippingMethod();
					}
				},
				<?php if ($debug) { ?>
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
				<?php } ?>
			});
		}

		// Confirm Payment
		$('#button-payment-method').live('click', function() {
			validateGuestAddress();
		});
		<?php } else { ?>
		// Load payment addresses
		$(document).ready(function() {
			$.ajax({
				url: 'index.php?route=quickcheckout/payment_address',
				dataType: 'html',
				cache: false,
				beforeSend: function() {
					$('#payment-address .quickcheckout-content').html('<div class="wait" style="width:100%;text-align:center;">&nbsp;<img src="catalog/view/theme/default/image/quickcheckout-loading.gif" alt="" /></div>');
				},
				success: function(html) {
					$('#payment-address .quickcheckout-content').html(html);
				},
				<?php if ($debug) { ?>
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
				<?php } ?>
			});
		});

		<?php if ($shipping_required) { ?>
		// Load shipping addresses
		$(document).ready(function() {
			$.ajax({
				url: 'index.php?route=quickcheckout/shipping_address',
				dataType: 'html',
				cache: false,
				beforeSend: function() {
					$('#shipping-address .quickcheckout-content').html('<div class="wait" style="width:100%;text-align:center;">&nbsp;<img src="catalog/view/theme/default/image/quickcheckout-loading.gif" alt="" /></div>');
				},
				success: function(html) {
					$('#shipping-address .quickcheckout-content').html(html);
				},
				<?php if ($debug) { ?>
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
				<?php } ?>
			});
		});
		<?php } ?>

		// Validate Payment Address
		function validatePaymentAddress() {
			$.ajax({
				url: 'index.php?route=quickcheckout/payment_address/validate',
				type: 'post',
				data: $('#payment-address input[type=\'text\'], #payment-address input[type=\'password\'], #payment-address input[type=\'checkbox\']:checked, #payment-address input[type=\'radio\']:checked, #payment-address input[type=\'hidden\'], #payment-address select'),
				dataType: 'json',
				cache: false,
				success: function(json) {
					$('.warning, .error').remove();

					if (json['redirect']) {
						location = json['redirect'];
					} else if (json['error']) {
						$('#button-payment-method').attr('disabled', false);
						$('.wait').remove();
						
						$('html, body').animate({ scrollTop: 0 }, 'slow');
						
						if (json['error']['warning']) {
							$('#warning-messages').prepend('<div class="warning" style="display: none;">' + json['error']['warning'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
							$('.warning').fadeIn('slow');
						}

						<?php if ($text_error) { ?>
							if (json['error']['firstname']) {
								$('#payment-address input[name=\'firstname\']').after('<span class="error">' + json['error']['firstname'] + '</span>');
							}

							if (json['error']['lastname']) {
								$('#payment-address input[name=\'lastname\']').after('<span class="error">' + json['error']['lastname'] + '</span>');
							}

							if (json['error']['company']) {
								$('#payment-address input[name=\'company\']').after('<span class="error">' + json['error']['company'] + '</span>');
							}

							if (json['error']['company_id']) {
								$('#payment-address input[name=\'company_id\'] + br').after('<span class="error">' + json['error']['company_id'] + '</span>');
							}

							if (json['error']['tax_id']) {
								$('#payment-address input[name=\'tax_id\'] + br').after('<span class="error">' + json['error']['tax_id'] + '</span>');
							}

							if (json['error']['address_1']) {
								$('#payment-address input[name=\'address_1\']').after('<span class="error">' + json['error']['address_1'] + '</span>');
							}

							if (json['error']['address_2']) {
								$('#payment-address input[name=\'address_2\']').after('<span class="error">' + json['error']['address_2'] + '</span>');
							}

							if (json['error']['city']) {
								$('#payment-address input[name=\'city\']').after('<span class="error">' + json['error']['city'] + '</span>');
							}

							if (json['error']['postcode']) {
								$('#payment-address input[name=\'postcode\']').after('<span class="error">' + json['error']['postcode'] + '</span>');
							}

							if (json['error']['country']) {
								$('#payment-address select[name=\'country_id\']').after('<span class="error">' + json['error']['country'] + '</span>');
							}

							if (json['error']['zone']) {
								$('#payment-address select[name=\'zone_id\']').after('<span class="error">' + json['error']['zone'] + '</span>');
							}
						<?php } ?>
						<?php if ($highlight_error) { ?>
							if (json['error']['firstname']) {
								$('#payment-address input[name=\'firstname\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}

							if (json['error']['lastname']) {
								$('#payment-address input[name=\'lastname\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}

							if (json['error']['company']) {
								$('#payment-address input[name=\'company\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}

							if (json['error']['company_id']) {
								$('#payment-address input[name=\'company_id\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}

							if (json['error']['tax_id']) {
								$('#payment-address input[name=\'tax_id\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}

							if (json['error']['address_1']) {
								$('#payment-address input[name=\'address_1\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}

							if (json['error']['address_2']) {
								$('#payment-address input[name=\'address_2\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}

							if (json['error']['city']) {
								$('#payment-address input[name=\'city\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}

							if (json['error']['postcode']) {
								$('#payment-address input[name=\'postcode\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}

							if (json['error']['country']) {
								$('#payment-address select[name=\'country_id\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}

							if (json['error']['zone']) {
								$('#payment-address select[name=\'zone_id\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}
						<?php } ?>
					} else {
						<?php if ($shipping_required) { ?>
							validateShippingAddress();
						<?php } else { ?>
							validatePaymentMethod();
						<?php } ?>
					}
				},
				<?php if ($debug) { ?>
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
				<?php } ?>
			});
		}

		<?php if ($shipping_required) { ?>
		// Validate Shipping Address
		function validateShippingAddress() {
			$.ajax({
				url: 'index.php?route=quickcheckout/shipping_address/validate',
				type: 'post',
				data: $('#shipping-address input[type=\'text\'], #shipping-address input[type=\'password\'], #shipping-address input[type=\'checkbox\']:checked, #shipping-address input[type=\'radio\']:checked, #shipping-address select'),
				dataType: 'json',
				cache: false,
				success: function(json) {
					$('.warning, .error').remove();

					if (json['redirect']) {
						location = json['redirect'];
					} else if (json['error']) {
						$('#button-payment-method').attr('disabled', false);
						$('.wait').remove();
						
						$('html, body').animate({ scrollTop: 0 }, 'slow');
						
						if (json['error']['warning']) {
							$('#warning-messages').prepend('<div class="warning" style="display: none;">' + json['error']['warning'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
							$('.warning').fadeIn('slow');
						}

						<?php if ($text_error) { ?>
							if (json['error']['firstname']) {
								$('#shipping-address input[name=\'firstname\']').after('<span class="error">' + json['error']['firstname'] + '</span>');
							}

							if (json['error']['lastname']) {
								$('#shipping-address input[name=\'lastname\']').after('<span class="error">' + json['error']['lastname'] + '</span>');
							}

							if (json['error']['address_1']) {
								$('#shipping-address input[name=\'address_1\']').after('<span class="error">' + json['error']['address_1'] + '</span>');
							}

							if (json['error']['address_2']) {
								$('#shipping-address input[name=\'address_2\']').after('<span class="error">' + json['error']['address_2'] + '</span>');
							}

							if (json['error']['comapny']) {
								$('#shipping-address input[name=\'comapny\']').after('<span class="error">' + json['error']['comapny'] + '</span>');
							}

							if (json['error']['city']) {
								$('#shipping-address input[name=\'city\']').after('<span class="error">' + json['error']['city'] + '</span>');
							}

							if (json['error']['postcode']) {
								$('#shipping-address input[name=\'postcode\']').after('<span class="error">' + json['error']['postcode'] + '</span>');
							}

							if (json['error']['country']) {
								$('#shipping-address select[name=\'country_id\']').after('<span class="error">' + json['error']['country'] + '</span>');
							}

							if (json['error']['zone']) {
								$('#shipping-address select[name=\'zone_id\']').after('<span class="error">' + json['error']['zone'] + '</span>');
							}
						<?php } ?>
						<?php if ($highlight_error) { ?>
							if (json['error']['firstname']) {
								$('#shipping-address input[name=\'firstname\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}

							if (json['error']['lastname']) {
								$('#shipping-address input[name=\'lastname\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}

							if (json['error']['address_1']) {
								$('#shipping-address input[name=\'address_1\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}

							if (json['error']['address_2']) {
								$('#shipping-address input[name=\'address_2\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}

							if (json['error']['company']) {
								$('#shipping-address input[name=\'company\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}

							if (json['error']['city']) {
								$('#shipping-address input[name=\'city\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}

							if (json['error']['postcode']) {
								$('#shipping-address input[name=\'postcode\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}

							if (json['error']['country']) {
								$('#shipping-address select[name=\'country_id\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}

							if (json['error']['zone']) {
								$('#shipping-address select[name=\'zone_id\']').css('border', '1px solid #f00').css('background', '#F8ACAC');
							}
						<?php } ?>
					} else {
						validateShippingMethod();
					}
				},
				<?php if ($debug) { ?>
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
				<?php } ?>
			});
		}
		<?php } ?>

		// Confirm payment
		$('#button-payment-method').live('click', function() {
			validatePaymentAddress();
		});
		<?php } ?> // Close if logged php

		// Payment Method
		function reloadPaymentMethod() {
			$.ajax({
				url: 'index.php?route=quickcheckout/payment_method',
				type: 'post',
				data: $('#payment-address input[type=\'text\'], #payment-address input[type=\'checkbox\']:checked, #payment-address input[type=\'radio\']:checked, #payment-address input[type=\'hidden\'], #payment-address select, #payment-method input[type=\'text\'], #payment-method input[type=\'checkbox\']:checked, #payment-method input[type=\'radio\']:checked, #payment-method input[type=\'hidden\'], #payment-method select'),
				dataType: 'html',
				cache: false,
				beforeSend: function() {
					$('#payment-method .quickcheckout-content').html('<div class="wait" style="width:100%;text-align:center;">&nbsp;<img src="catalog/view/theme/default/image/quickcheckout-loading.gif" alt="" /></div>');
				},
				success: function(html) {
					$('#payment-method .quickcheckout-content').html(html);
				},
				<?php if ($debug) { ?>
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
				<?php } ?>
			});
		}

		function reloadPaymentMethodById(address_id) {
			$.ajax({
				url: 'index.php?route=quickcheckout/payment_method&address_id=' + address_id,
				type: 'post',
				data: $('#payment-method input[type=\'checkbox\']:checked, #payment-method input[type=\'radio\']:checked, #payment-method input[type=\'hidden\'], #payment-method select'),
				dataType: 'html',
				cache: false,
				beforeSend: function() {
					$('#payment-method .quickcheckout-content').html('<div class="wait" style="width:100%;text-align:center;">&nbsp;<img src="catalog/view/theme/default/image/quickcheckout-loading.gif" alt="" /></div>');
				},
				success: function(html) {
					$('#payment-method .quickcheckout-content').html(html);
				},
				<?php if ($debug) { ?>
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
				<?php } ?>
			});
		}

		// Validate Payment Method
		function validatePaymentMethod() {
			$.ajax({
				url: 'index.php?route=quickcheckout/payment_method/validate',
				type: 'post',
				data: $('#payment-method select, #payment-method input[type=\'radio\']:checked, #payment-method input[type=\'checkbox\']:checked, #payment-method textarea'),
				dataType: 'json',
				cache: false,
				success: function(json) {
					$('.warning, .error').remove();

					if (json['redirect']) {
						location = json['redirect'];
					} else if (json['error']) {
						$('#button-payment-method').attr('disabled', false);
						$('.wait').remove();
						
						$('html, body').animate({ scrollTop: 0 }, 'slow');
						
						if (json['error']['warning']) {
							$('#warning-messages').prepend('<div class="warning" style="display: none;">' + json['error']['warning'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
							$('.warning').fadeIn('slow');
						}
					} else {
						validateTerms();
					}
				},
				<?php if ($debug) { ?>
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
				<?php } ?>
			});
		}

		// Shipping Method
		<?php if ($shipping_required) { ?>
			function reloadShippingMethod(type) {
				if (type == 'payment') {
					var post_data = $('#payment-address input[type=\'text\'], #payment-address input[type=\'checkbox\']:checked, #payment-address input[type=\'radio\']:checked, #payment-address input[type=\'hidden\'], #payment-address select, #shipping-method input[type=\'text\'], #shipping-method input[type=\'checkbox\']:checked, #shipping-method input[type=\'radio\']:checked, #shipping-method input[type=\'hidden\'], #shipping-method select');
				} else {
					var post_data = $('#shipping-address input[type=\'text\'], #shipping-address input[type=\'checkbox\']:checked, #shipping-address input[type=\'radio\']:checked, #shipping-address input[type=\'hidden\'], #shipping-address select, #shipping-method input[type=\'text\'], #shipping-method input[type=\'checkbox\']:checked, #shipping-method input[type=\'radio\']:checked, #shipping-method input[type=\'hidden\'], #shipping-method select');
				}
				
				$.ajax({
					url: 'index.php?route=quickcheckout/shipping_method',
					type: 'post',
					data: post_data,
					dataType: 'html',
					cache: false,
					beforeSend: function() {
						$('#shipping-method .quickcheckout-content').html('<div class="wait" style="width:100%;text-align:center;">&nbsp;<img src="catalog/view/theme/default/image/quickcheckout-loading.gif" alt="" /></div>');
					},
					success: function(html) {
						$('#shipping-method .quickcheckout-content').html(html);
					},
					<?php if ($debug) { ?>
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
					<?php } ?>
				});
			}

			function reloadShippingMethodById(address_id) {
				$.ajax({
					url: 'index.php?route=quickcheckout/shipping_method&address_id=' + address_id,
					type: 'post',
					data: $('#shipping-method input[type=\'text\'], #shipping-method input[type=\'checkbox\']:checked, #shipping-method input[type=\'radio\']:checked, #shipping-method input[type=\'hidden\'], #shipping-method select'),
					dataType: 'html',
					cache: false,
					beforeSend: function() {
						$('#shipping-method .quickcheckout-content').html('<div class="wait" style="width:100%;text-align:center;">&nbsp;<img src="catalog/view/theme/default/image/quickcheckout-loading.gif" alt="" /></div>');
					},
					success: function(html) {
						$('#shipping-method .quickcheckout-content').html(html);
					},
					<?php if ($debug) { ?>
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
					<?php } ?>
				});
			}

			// Validate Shipping Method
			function validateShippingMethod() {
				$.ajax({
					url: 'index.php?route=quickcheckout/shipping_method/validate',
					type: 'post',
					data: $('#shipping-method select, #shipping-method input[type=\'radio\']:checked, #shipping-method textarea, #shipping-method input[type=\'text\']'),
					dataType: 'json',
					cache: false,
					success: function(json) {
						$('.warning, .error').remove();

						if (json['redirect']) {
							location = json['redirect'];
						} else if (json['error']) {
							$('#button-payment-method').attr('disabled', false);
							$('.wait').remove();
							
							$('html, body').animate({ scrollTop: 0 }, 'slow');
						
							if (json['error']['warning']) {
								$('#warning-messages').prepend('<div class="warning" style="display: none;">' + json['error']['warning'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
								$('.warning').fadeIn('slow');
							}
						} else {
							validatePaymentMethod();
						}
					},
					<?php if ($debug) { ?>
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
					<?php } ?>
				});
			}
		<?php } ?>

		// Load confirm button
		$(document).ready(function() {
			$.ajax({
				url: 'index.php?route=quickcheckout/terms',
				dataType: 'html',
				cache: false,
				beforeSend: function() {
					$('#terms .quickcheckout-content').html('<div class="wait" style="width:100%;text-align:center;">&nbsp;<img src="catalog/view/theme/default/image/quickcheckout-loading.gif" alt="" /></div>');
				},
				success: function(html) {
					$('#terms .quickcheckout-content').html(html);
				},
				<?php if ($debug) { ?>
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
				<?php } ?>
			});
		});

		// Validate confirm button
		function validateTerms() {
			$.ajax({
				url: 'index.php?route=quickcheckout/terms/validate',
				type: 'post',
				data: $('#terms input[type=\'checkbox\']:checked'),
				dataType: 'json',
				cache: false,
				success: function(json) {
					if (json['error']) {
						$('#button-payment-method').attr('disabled', false);
						$('.wait').remove();
						
						$('html, body').animate({ scrollTop: 0 }, 'slow');
						
						if (json['error']['warning']) {
							$('#warning-messages').prepend('<div class="warning" style="display: none;">' + json['error']['warning'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
							$('.warning').fadeIn('slow');
						}
					} else {
						loadConfirm();
					}
				},
				<?php if ($debug) { ?>
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
				<?php } ?>
			});
		}

		// Load confirm
		function loadConfirm() {
			$.ajax({
				url: 'index.php?route=quickcheckout/confirm',
				dataType: 'html',
				cache: false,
				beforeSend: function() {
					$('html, body').animate({ scrollTop: 0 }, 'slow');
					<?php if ($slide_effect) { ?>
					$('#quickcheckoutconfirm').slideUp('slow');
					<?php } else { ?>
					$('#quickcheckoutconfirm').html('<div class="wait" style="width:100%;text-align:center;">&nbsp;<img src="catalog/view/theme/default/image/quickcheckout-loading.gif" alt="" /></div>');
					<?php } ?>
				},
				success: function(html) {
					<?php if ($load_screen) { ?>
					$.blockUI({
						message: '<span style="font-size:16px;"><i class="fa fa-refresh fa-spin"></i> &nbsp;<?php echo $text_please_wait; ?></span>',
						css: {
							border: '2px solid #000000',
							padding: '20px 0px',
							backgroundColor: '#ffffff',
							opacity: .9,
							color: '#000000'
						}
					});

					setTimeout($.unblockUI, 2000);
					<?php } ?>

					$('#quickcheckoutconfirm').css('display', 'none');
								
					$('#quickcheckoutconfirm').html(html);
					
					<?php if (!$auto_submit) { ?>
						<?php if ($slide_effect) { ?>
						$('#quickcheckoutconfirm').slideDown('slow');
						<?php } else { ?>
						$('#quickcheckoutconfirm').css('display', 'block');
						<?php } ?>
					<?php } ?>
				},
				<?php if ($debug) { ?>
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
				<?php } ?>
			});
		}

		// Load cart
		<?php if ($cart_module) { ?>
		function loadCart() {
			$.ajax({
				url: 'index.php?route=quickcheckout/cart',
				dataType: 'html',
				cache: false,
				beforeSend: function() {
					$('#cart1 .quickcheckout-content').html('<div style="width:100%;text-align:center;">&nbsp;<img src="catalog/view/theme/default/image/quickcheckout-loading.gif" alt="" /></div>');
				},
				success: function(html) {
					$('#cart1 .quickcheckout-content').html(html);
				},
				<?php if ($debug) { ?>
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
				<?php } ?>
			});
		}

		$(document).ready(function(){
			loadCart();
		});
		<?php } ?>

		// Load Voucher / Coupon / Reward
		<?php if ($voucher_module || $coupon_module || $reward_module) { ?>
		$(document).ready(function() {
			$.ajax({
				url: 'index.php?route=quickcheckout/voucher',
				dataType: 'html',
				cache: false,
				beforeSend: function() {
					$('#voucher .quickcheckout-content').html('<div style="text-align:center;">&nbsp;<img src="catalog/view/theme/default/image/quickcheckout-loading.gif" alt="" /></div>');
				},
				success: function(html) {
					$('#voucher .quickcheckout-content').html(html);

					$('#voucher .quickcheckout-content').slideDown('slow');
				},
				<?php if ($debug) { ?>
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
				<?php } ?>
			});
		});

		$('.login_trigger').live('click', function() {
		    if($('#login-box').is(':visible')){
		      $('#login-box').slideUp('slow');
		    } else {
		      $('#login-box').slideDown('slow');
		    };
		});

		$('#coupon-heading').live('click', function() {
		    if($('#coupon-content').is(':visible')){
		      $('#coupon-content').slideUp('slow');
		    } else {
		      $('#coupon-content').slideDown('slow');
		    };
		});

		$('#voucher-heading').live('click', function() {
		    if($('#voucher-content').is(':visible')){
		      $('#voucher-content').slideUp('slow');
		    } else {
		      $('#voucher-content').slideDown('slow');
		    };
		});

		$('#reward-heading').live('click', function() {
		    if($('#reward-content').is(':visible')){
		      $('#reward-content').slideUp('slow');
		    } else {
		      $('#reward-content').slideDown('slow');
		    };
		});

		$('#button-coupon').live('click', function() {
			$.ajax({
				url: 'index.php?route=quickcheckout/voucher/validateCoupon',
				type: 'post',
				data: $('#coupon-content :input'),
				dataType: 'json',
				cache: false,
				beforeSend: function() {
					$('#button-coupon').attr('disabled', true);
					$('#button-coupon').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
				},
				complete: function() {
					$('#button-coupon').attr('disabled', false);
					$('#coupon-content .wait').remove();
				},
				success: function(json) {
					$('.warning, .success').remove();

					if (json['success']) {
						$('#success-messages').prepend('<div class="success" style="display:none;">' + json['success'] + '</div>');
						$('html, body').animate({ scrollTop: 0 }, 'slow');
						$('.success').fadeIn('slow');
					} else if (json['error']) {
						$('#warning-messages').prepend('<div class="warning" style="display: none;">' + json['error']['warning'] + '</div>');
						$('html, body').animate({ scrollTop: 0 }, 'slow');
						$('.warning').fadeIn('slow');
					}

					<?php if (!$logged) { ?>
					if ($('#payment-address input[name=\'shipping_address\']:checked').val()) {
						reloadPaymentMethod();
						reloadShippingMethod('payment');
					} else {
						reloadPaymentMethod();
						reloadShippingMethod('shipping');
					}
					<?php } else { ?>
					if ($('#payment-address input[name=\'payment_address\']:checked').val() == 'new') {
						reloadPaymentMethod();
					} else {
						reloadPaymentMethodById($('#payment-address select[name=\'address_id\']').val());
					}
					
					if ($('#shipping-address input[name=\'shipping_address\']:checked').val() == 'new') {
						reloadShippingMethod('shipping');
					} else {
						reloadShippingMethodById($('#shipping-address select[name=\'address_id\']').val());
					}
					<?php } ?>
				},
				<?php if ($debug) { ?>
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
				<?php } ?>
			});
		});

		$('#button-voucher').live('click', function() {
			$.ajax({
				url: 'index.php?route=quickcheckout/voucher/validateVoucher',
				type: 'post',
				data: $('#voucher-content :input'),
				dataType: 'json',
				cache: false,
				beforeSend: function() {
					$('#button-voucher').attr('disabled', true);
					$('#button-voucher').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
				},
				complete: function() {
					$('#button-voucher').attr('disabled', false);
					$('#voucher-content .wait').remove();
				},
				success: function(json) {
					$('.warning, .success').remove();

					if (json['success']) {
						$('#success-messages').prepend('<div class="success" style="display:none;">' + json['success'] + '</div>');
						$('html, body').animate({ scrollTop: 0 }, 'slow');
						$('.success').fadeIn('slow');
					} else if (json['error']) {
						$('#warning-messages').prepend('<div class="warning" style="display: none;">' + json['error']['warning'] + '</div>');
						$('html, body').animate({ scrollTop: 0 }, 'slow');
						$('.warning').fadeIn('slow');
					}

					<?php if (!$logged) { ?>
					if ($('#payment-address input[name=\'shipping_address\']:checked').val()) {
						reloadPaymentMethod();
						reloadShippingMethod('payment');
					} else {
						reloadPaymentMethod();
						reloadShippingMethod('shipping');
					}
					<?php } else { ?>
					if ($('#payment-address input[name=\'payment_address\']:checked').val() == 'new') {
						reloadPaymentMethod();
					} else {
						reloadPaymentMethodById($('#payment-address select[name=\'address_id\']').val());
					}
					
					if ($('#shipping-address input[name=\'shipping_address\']:checked').val() == 'new') {
						reloadShippingMethod('shipping');
					} else {
						reloadShippingMethodById($('#shipping-address select[name=\'address_id\']').val());
					}
					<?php } ?>
				},
				<?php if ($debug) { ?>
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
				<?php } ?>
			});
		});

		$('#button-reward').live('click', function() {
			$.ajax({
				url: 'index.php?route=quickcheckout/voucher/validateReward',
				type: 'post',
				data: $('#reward-content :input'),
				dataType: 'json',
				cache: false,
				beforeSend: function() {
					$('#button-reward').attr('disabled', true);
					$('#button-reward').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
				},
				complete: function() {
					$('#button-reward').attr('disabled', false);
					$('#reward-content .wait').remove();
				},
				success: function(json) {
					$('.warning, .success').remove();

					if (json['success']) {
						$('#success-messages').prepend('<div class="success" style="display:none;">' + json['success'] + '</div>');
						$('html, body').animate({ scrollTop: 0 }, 'slow');
						$('.success').fadeIn('slow');
					} else if (json['error']) {
						$('#warning-messages').prepend('<div class="warning" style="display: none;">' + json['error']['warning'] + '</div>');
						$('html, body').animate({ scrollTop: 0 }, 'slow');
						$('.warning').fadeIn('slow');
					}

					<?php if (!$logged) { ?>
					if ($('#payment-address input[name=\'shipping_address\']:checked').val()) {
						reloadPaymentMethod();
						reloadShippingMethod('payment');
					} else {
						reloadPaymentMethod();
						reloadShippingMethod('shipping');
					}
					<?php } else { ?>
					if ($('#payment-address input[name=\'payment_address\']:checked').val() == 'new') {
						reloadPaymentMethod();
					} else {
						reloadPaymentMethodById($('#payment-address select[name=\'address_id\']').val());
					}
					
					if ($('#shipping-address input[name=\'shipping_address\']:checked').val() == 'new') {
						reloadShippingMethod('shipping');
					} else {
						reloadShippingMethodById($('#shipping-address select[name=\'address_id\']').val());
					}
					<?php } ?>
				},
				<?php if ($debug) { ?>
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
				<?php } ?>
			});
		});
		<?php } ?>

		<?php if ($shipping_required) { ?>
		$('input[name=\'postcode\']').live('focusout', function(){
			if ($('#payment-address input[name=\'shipping_address\']:checked').attr('value')) {
				reloadShippingMethod('payment');
			} else {
				reloadShippingMethod('shipping');
			}
		});
		<?php } ?>

		<?php if ($highlight_error) { ?>
			$('input').live('keydown', function() {
				$(this).css('background', '').css('border', '');
			});
			$('select').live('change', function() {
				$(this).css('background', '').css('border', '');
			});
		<?php } ?>

		<?php if ($edit_cart) { ?>
		$('.button-update').live('click', function() {
			$.ajax({
				url: 'index.php?route=quickcheckout/cart/update',
				type: 'post',
				data: $('#cart1 :input'),
				dataType: 'json',
				cache: false,
				beforeSend: function() {
					$('#cart1 .quickcheckout-content').html('<div style="width:100%;text-align:center;">&nbsp;<img src="catalog/view/theme/default/image/quickcheckout-loading.gif" alt="" /></div>');
				},
				success: function(json) {
					if (json['redirect']) {
						location = json['redirect'];
					} else {
						<?php if (!$logged) { ?>
						if ($('#payment-address input[name=\'shipping_address\']:checked').val()) {
							reloadPaymentMethod();
							reloadShippingMethod('payment');
						} else {
							reloadPaymentMethod();
							reloadShippingMethod('shipping');
						}
						<?php } else { ?>
						if ($('#payment-address input[name=\'payment_address\']:checked').val() == 'new') {
							reloadPaymentMethod();
						} else {
							reloadPaymentMethodById($('#payment-address select[name=\'address_id\']').val());
						}
						
						if ($('#shipping-address input[name=\'shipping_address\']:checked').val() == 'new') {
							reloadShippingMethod('shipping');
						} else {
							reloadShippingMethodById($('#shipping-address select[name=\'address_id\']').val());
						}
						<?php } ?>
					}
				},
				<?php if ($debug) { ?>
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
				<?php } ?>
			});
		});

		$('.button-remove').live('click', function() {
			var remove_id = $(this).attr('href');

			$.ajax({
				url: 'index.php?route=quickcheckout/cart/update&remove=' + remove_id,
				type: 'get',
				dataType: 'json',
				cache: false,
				beforeSend: function() {
					$('#cart1 .quickcheckout-content').html('<div style="width:100%;text-align:center;">&nbsp;<img src="catalog/view/theme/default/image/quickcheckout-loading.gif" alt="" /></div>');
				},
				success: function(json) {
					if (json['redirect']) {
						location = json['redirect'];
					} else {
						<?php if (!$logged) { ?>
						if ($('#payment-address input[name=\'shipping_address\']:checked').val()) {
							reloadPaymentMethod();
							reloadShippingMethod('payment');
						} else {
							reloadPaymentMethod();
							reloadShippingMethod('shipping');
						}
						<?php } else { ?>
						if ($('#payment-address input[name=\'payment_address\']:checked').val() == 'new') {
							reloadPaymentMethod();
						} else {
							reloadPaymentMethodById($('#payment-address select[name=\'address_id\']').val());
						}
						
						if ($('#shipping-address input[name=\'shipping_address\']:checked').val() == 'new') {
							reloadShippingMethod('shipping');
						} else {
							reloadShippingMethodById($('#shipping-address select[name=\'address_id\']').val());
						}
						<?php } ?>
					}
				},
				<?php if ($debug) { ?>
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
				<?php } ?>
			});

			return false;
		});
		<?php } ?>

		<?php if ($delivery) { ?>
		$(document).ready(function() {
			<?php if ($delivery_time == '1') { ?>
				$(document).on('focus', 'input[name=\'delivery_date\']', function() {
					$(this).datetimepicker({
						dateFormat: 'DD d MM yy',
						minDate: '+<?php echo $delivery_min; ?>D',
						maxDate: '+<?php echo $delivery_max; ?>D',
						hourMin: <?php echo $delivery_min_hour; ?>,
						hourMax: <?php echo $delivery_max_hour; ?>,
						beforeShowDay: unavailable
					});

					$('.ui-datepicker').css('z-index', '9999');
				});
			<?php } else { ?>
				$(document).on('focus', 'input[name=\'delivery_date\']', function() {
					$(this).datepicker({
						dateFormat: 'DD d MM yy',
						minDate: '+<?php echo $delivery_min; ?>D',
						maxDate: '+<?php echo $delivery_max; ?>D',
						beforeShowDay: unavailable
					});

					$('.ui-datepicker').css('z-index', '9999');
				});
			<?php } ?>
		});

		function unavailable(date) {
			var unavailableDates = [<?php echo html_entity_decode($delivery_unavailable, ENT_QUOTES); ?>];

			dmy = date.getDate() + "-" + (date.getMonth()+1) + "-" + date.getFullYear();
			if ($.inArray(dmy, unavailableDates) == -1) {
				return [true, ""];
			} else {
				return [false,"","Not Available"];
			}
		}
		<?php } ?>
		//--></script>

		<?php if ($delivery_time == '1') { ?>
		<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script>
		<?php } ?>
		<?php echo $footer; ?>