<div class="field_holder">
    
<?php foreach ($fields as $field) { ?>
  	<?php if ($field == 'country') { ?>
    	<?php if (!empty(${'field_' . $field}['display'])) { ?>
			<div class="left field contrast_font">
	  			<?php if (!empty(${'field_' . $field}['required'])) { ?>
	  				<span class="required">*</span>
	  			<?php } ?>
	  			<?php echo $entry_country; ?><br />
				<select name="country_id" class="large-field sdfsdfsdfsf">
                           
				  	<?php foreach ($countries as $country) { ?>
						<?php if ($country['country_id'] == $country_id) { ?>
							<option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
						<?php } else { ?>
							<option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
						<?php } ?>
				  	<?php } ?>
				</select><br />
			</div>
                                        
                                        
                                         
		<?php } else { ?>
			<select name="country_id" class="hide">
				<?php foreach ($countries as $country) { ?>
	  				<?php if ($country['country_id'] == $country_id) { ?>
	  					<option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
	  				<?php } else { ?>
	  					<option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
	  				<?php } ?>
				<?php } ?>
			</select>
		<?php } ?>
                
              
	<?php } elseif ($field == 'zone') { ?>
		<?php if (!empty(${'field_' . $field}['display'])) { ?>
                <div class="left field contrast_font" >
				<?php if (!empty(${'field_' . $field}['required'])) { ?>
					<span class="required">*</span>
				<?php } ?>
				<?php echo $entry_zone; ?><br />
				<select name="zone_id" class="large-field"></select><br />
			</div>
                                        
                        <div class="left field contrast_font zone_district " style="display: none">
				<span class="required">*</span>
                                <?php  $district = $district->rows;?>
                                Quận :
				<br />
                                
                                <select name="zone_district" style="display:none" class="large-field">
                                    <option value=""> ---Quận--- </option>
                                    <?php foreach($district as $item): ?>
                                    <option value='<?php echo $item["districtid"]; ?>'><?php echo $item['name']; ?></option>
                                <?php  endforeach; ?>
                                </select><br />
                                
			</div>
                                        
                                        
		<?php } else { ?>
			<select name="zone_id" class="hide"></select>
		<?php } ?>
	<?php } elseif ($field == 'customer_group') { ?>
	    	<?php if (!empty(${'field_' . $field}['display'])) { ?>
			<div class="left field contrast_font" style="display: <?php echo (count($customer_groups) > 1 ? 'block' : 'none'); ?>;"><?php echo $entry_account; ?><br />
		  		<select name="customer_group_id" class="large-field">
					<?php foreach ($customer_groups as $customer_group) { ?>
						<?php if ($customer_group['customer_group_id'] == $customer_group_id) { ?>
							<option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
						<?php } else { ?>
							<option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
						<?php } ?>
					<?php } ?>
		  		</select>
			</div>
		<?php } else { ?>
			<div class="left field contrast_font" style="display:none;"><?php echo $entry_account; ?><br />
				 <select name="customer_group_id" class="large-field">
					<?php foreach ($customer_groups as $customer_group) { ?>
						<?php if ($customer_group['customer_group_id'] == $customer_group_id) { ?>
							<option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
						<?php } else { ?>
							<option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
						<?php } ?>
					<?php } ?>
				 </select>
			</div>
			
		<?php }  ?>
		<!--<div id="company-id-display" class="left field contrast_font" style="display:none;">
	  		<span id="company-id-required" class="required">*</span> <?php echo $entry_company_id; ?><br />
	  		<input type="text" name="company_id" value="<?php echo $company_id; ?>" class="large-field" /><br />
		</div>
		<div id="tax-id-display" class="left field contrast_font" style="display:none;">
		  	<span id="tax-id-required" class="required">*</span> <?php echo $entry_tax_id; ?><br />
		  	<input type="text" name="tax_id" value="<?php echo $tax_id; ?>" class="large-field" /><br />
		</div>-->
			
	<?php } else { ?>
		<?php if (!empty(${'field_' . $field}['display'])) { ?>
			<div class="left field contrast_font">
			  	<?php if ($field == 'postcode') { ?>
			    		<span id="payment-postcode-required" class="required">*</span>
			  	<?php } elseif (!empty(${'field_' . $field}['required'])) { ?>
					<span class="required">*</span>
			  	<?php } ?>
			  	<?php echo ${'entry_' . $field}; ?><br />
			  	<input type="text" name="<?php echo $field; ?>" value="<?php echo ${$field} ? ${$field} : ${'field_' . $field}['default']; ?>" class="large-field" /><br />
			</div>
		<?php } else { ?>
			<input type="text" name="<?php echo $field; ?>" value="<?php echo ${$field} ? ${$field} : ${'field_' . $field}['default']; ?>" class="hide" />
		<?php } ?>
	<?php } ?>
<?php } ?>
</div>
<div style="clear:both;"></div>

<div style="clear: both; padding-top: 10px;">
	<?php if (!empty($field_register['display'])) { ?>
	<?php if (!$guest_checkout || !empty($field_register['required'])) { ?>
	  	<input type="checkbox" name="create_account" value="1" id="create" class="hide" checked="checked" />
  		<div id="create_account"></div>
	<?php } else { ?>
  		<input type="checkbox" name="create_account" value="1" id="create"<?php echo !empty($field_register['default']) ? ' checked="checked"' : ''; ?> /> <label for="create"><?php echo $text_create_account; ?></label><br />
  		<div id="create_account"></div>
	<?php } ?>
	<?php } else { ?>
		<input type="checkbox" name="create_account" value="1" id="create" class="hide" />
	<?php } ?>
	<?php if ($shipping_required) { ?>
		<?php if ($shipping_address) { ?>
			<input type="checkbox" name="shipping_address" value="1" id="shipping" checked="checked" />
		<?php } else { ?>
			<input type="checkbox" name="shipping_address" value="1" id="shipping" />
		<?php } ?>
		<label for="shipping"><?php echo $entry_shipping; ?></label>
	<?php } ?>
	<br />
</div>
<script type="text/javascript"><!--
    	
    $('#payment-address select[name=\'customer_group_id\']').live('change', function() {
		var customer_group = [];
		
		<?php foreach ($customer_groups as $customer_group) { ?>
			customer_group[<?php echo $customer_group['customer_group_id']; ?>] = [];
			customer_group[<?php echo $customer_group['customer_group_id']; ?>]['company_id_display'] = '<?php echo $customer_group['company_id_display']; ?>';
			customer_group[<?php echo $customer_group['customer_group_id']; ?>]['company_id_required'] = '<?php echo $customer_group['company_id_required']; ?>';
			customer_group[<?php echo $customer_group['customer_group_id']; ?>]['tax_id_display'] = '<?php echo $customer_group['tax_id_display']; ?>';
			customer_group[<?php echo $customer_group['customer_group_id']; ?>]['tax_id_required'] = '<?php echo $customer_group['tax_id_required']; ?>';
		<?php } ?>	

		if (customer_group[this.value]) {
			if (customer_group[this.value]['company_id_display'] == '1') {
				$('#company-id-display').show();
			} else {
				$('#company-id-display').hide();
			}
			
			if (customer_group[this.value]['company_id_required'] == '1') {
				$('#company-id-required').show();
			} else {
				$('#company-id-required').hide();
			}
			
			if (customer_group[this.value]['tax_id_display'] == '1') {
				$('#tax-id-display').show();
			} else {
				$('#tax-id-display').hide();
			}
			
			if (customer_group[this.value]['tax_id_required'] == '1') {
				$('#tax-id-required').show();
			} else {
				$('#tax-id-required').hide();
			}	
		}
	});

	$('#payment-address select[name=\'customer_group_id\']').trigger('change');
//--></script>  
<script type="text/javascript"><!--
	$('#payment-address select[name=\'country_id\']').bind('change', function() {
		$.ajax({
			url: 'index.php?route=quickcheckout/checkout/country&country_id=' + this.value,
			dataType: 'json',
			cache: false,
			beforeSend: function() {
				$('#payment-address select[name=\'country_id\']').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
			},
			complete: function() {
				$('.wait').remove();
			},			
			success: function(json) {
				if (json['postcode_required'] == '1') {
					$('#payment-postcode-required').show();
				} else {
					$('#payment-postcode-required').hide();
				}
				
				html = '<option value=""><?php echo $text_select; ?></option>';
				
				if (json['zone'] != '') {
					for (i = 0; i < json['zone'].length; i++) {
	        			html += '<option value="' + json['zone'][i]['zone_id'] + '"';
		    			
						if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
							html += ' selected="selected"';
						}
		
		    			html += '>' + json['zone'][i]['name'] + '</option>';
					}
				} else {
					html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
				}
				
				$('#payment-address select[name=\'zone_id\']').html(html);
				
				<?php if ($country_reload) { ?>
					if ($('#payment-address input[name=\'shipping_address\']:checked').attr('value')) {
						reloadPaymentMethod();
						reloadShippingMethod('payment');
					} else {
						reloadPaymentMethod();
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

	$('#payment-address select[name=\'country_id\']').trigger('change');

	// Guest Shipping Form
	$('#payment-address input[name=\'shipping_address\']').live('change', function() {
		if ($('#payment-address input[name=\'shipping_address\']:checked').attr('value')) {
			$('#shipping-address').slideUp('slow');

			reloadPaymentMethod();
			reloadShippingMethod('payment');
		} else {
			$('#shipping-address').show();
			
			$.ajax({
				url: 'index.php?route=quickcheckout/guest_shipping',
				dataType: 'html',
				cache: false,
				beforeSend: function() {
					$('#shipping-address .quickcheckout-content').html('<div class="wait" style="width:100%;text-align:center;">&nbsp;<img src="catalog/view/theme/default/image/quickcheckout-loading.gif" alt="" /></div>');
				},	
				success: function(html) {
					$('#shipping-address .quickcheckout-content').html(html);
						
					$('#shipping-address .quickcheckout-content').slideDown('slow');

					reloadPaymentMethod();
				},
				<?php if ($debug) { ?>
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
				<?php } ?>
			});	
		}
	});	
	$('#payment-address input[name=\'shipping_address\']').trigger('change');

	$('#payment-address select[name=\'zone_id\']').bind('change', function() {
            //alert(this.value);
            if(this.value==3780){
                $("select[name='zone_district']").css('display','block');
                 $(".zone_district").css('display','block');
                  $("input[name='city']").parent().css('visibility','hidden');

            }else{
                $("select[name='zone_district']").css('display','none');
                $(".zone_district").css('display','none');
                $($("input[name='city']")).parent().css('visibility','visible');
            }
		if ($('#payment-address input[name=\'shipping_address\']:checked').attr('value')) {
			reloadPaymentMethod();
			reloadShippingMethod('payment');
		} else {
			reloadPaymentMethod();
		}
	});

	// Create account
	$('#payment-address input[name=\'create_account\']').live('change', function() {
		if ($('#payment-address input[name=\'create_account\']:checked').attr('value')) {
			$('#create_account').slideDown('slow');
			$.ajax({
				url: 'index.php?route=quickcheckout/register',
				dataType: 'html',
				cache: false,
				beforeSend: function() {
					$('#create_account').html('<div class="wait" style="text-align:center;">&nbsp;<img src="catalog/view/theme/default/image/quickcheckout-loading.gif" alt="" /></div>');
				},	
				success: function(html) {
					$('#create_account').html(html);
					$('#create_account').slideDown('slow');
				},
				<?php if ($debug) { ?>
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
				<?php } ?>
			});	
		} else {
			$('#create_account').slideUp('slow');
		}
	});	
	$('#payment-address input[name=\'create_account\']').trigger('change');
        
//--></script>