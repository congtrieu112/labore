<?php if ($addresses) { ?>
	<input type="radio" name="payment_address" value="existing" id="payment-address-existing" checked="checked" />
	<label for="payment-address-existing"><?php echo $text_address_existing; ?></label>
	<div id="payment-existing">
	  	<select name="address_id" style="width: 100%; margin-bottom: 15px;" size="5">
	    		<?php foreach ($addresses as $address) { ?>
	    			<?php if ($address['address_id'] == $address_id) { ?>
	    				<option value="<?php echo $address['address_id']; ?>" selected="selected"><?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['postcode']; ?>, <?php echo $address['zone']; ?>, <?php echo $address['country']; ?></option>
	    			<?php } else { ?>
	    				<option value="<?php echo $address['address_id']; ?>"><?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['postcode']; ?>, <?php echo $address['zone']; ?>, <?php echo $address['country']; ?></option>
	    			<?php } ?>
	    		<?php } ?>
	  	</select>
	</div>
	<p>
  		<input type="radio" name="payment_address" value="new" id="payment-address-new" />
  		<label for="payment-address-new"><?php echo $text_address_new; ?></label>
	</p>
<?php } else { ?>
  	<input type="radio" name="payment_address" value="existing" id="payment-address-existing" class="hide"  />
  	<input type="radio" name="payment_address" value="new" id="payment-address-new" checked="checked" class="hide" />
<?php } ?>
<div id="payment-new" style="display: <?php echo ($addresses ? 'none' : 'block'); ?>;">
	<div class="field_holder">
		<?php foreach ($fields as $field) { ?>
  			<?php if ($field == 'country') { ?>
    				<?php if (!empty(${'field_' . $field}['display'])) { ?>
					<div class="left field contrast_font">
						<?php if (!empty(${'field_' . $field}['required'])) { ?>
						  	<span class="required">*</span>
						<?php } ?>
						<?php echo $entry_country; ?>
					  	<select name="country_id" class="large-field">
							<?php foreach ($countries as $country) { ?>
								<?php if ($country['country_id'] == $country_id) { ?>
									<option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
								<?php } else { ?>
									<option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
								<?php } ?>
							<?php } ?>
				  		</select>
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
					<div class="left field contrast_font">
					  	<?php if (!empty(${'field_' . $field}['required'])) { ?>
					  		<span class="required">*</span>
					  	<?php } ?>
					  	<?php echo $entry_zone; ?>
					  	<select name="zone_id" class="large-field"></select>
					</div>
				<?php } else { ?>
				  	<select name="zone_id" class="hide"></select>
				<?php } ?>
			<?php } elseif ($field == 'customer_group') { ?>
				<?php if ($company_id_display) { ?>
					<div class="left field contrast_font">
					  	<?php if ($company_id_required) { ?>
					  		<span class="required">*</span>
					  	<?php } ?>
					  	<?php echo $entry_company_id; ?>
					  	<input type="text" name="company_id" value="" class="large-field" />
					</div>
				<?php } ?>
				<?php if ($tax_id_display) { ?>
					<div class="left field contrast_font">
					  	<?php if ($tax_id_required) { ?>
					  		<span class="required">*</span>
					  	<?php } ?>
					  	<?php echo $entry_tax_id; ?>
					  	<input type="text" name="tax_id" value="" class="large-field" />
					</div>
				<?php } ?>
				<?php } else { ?>
				<?php if (!empty(${'field_' . $field}['display'])) { ?>
					<div class="left field contrast_font">
					  	<?php if ($field == 'postcode') { ?>
					    		<span id="payment-postcode-required" class="required">*</span>
					  	<?php } elseif (!empty(${'field_' . $field}['required'])) { ?>
							<span class="required">*</span>
					  	<?php } ?>
					  	<?php echo ${'entry_' . $field}; ?>
					  	<input type="text" name="<?php echo $field; ?>" value="<?php echo ${'field_' . $field}['default']; ?>" class="large-field" />
					</div>
				<?php } else { ?>
					<input type="text" name="<?php echo $field; ?>" value="<?php echo ${'field_' . $field}['default']; ?>" class="hide" />
				<?php } ?>
			<?php } ?>
		<?php } ?>
	</div>
</div>

<script type="text/javascript"><!--
// Payment address form function
$('#payment-address input[name=\'payment_address\']').live('change', function() {
	if (this.value == 'new') {
		$('#payment-existing').slideUp();
		$('#payment-new').slideDown();

		reloadPaymentMethod();
	} else {
		$('#payment-existing').slideDown();
		$('#payment-new').slideUp();
		
		reloadPaymentMethodById($('#payment-address select[name=\'address_id\']').val());
	}
});

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
				reloadPaymentMethod();
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

$('#payment-address select[name=\'zone_id\']').bind('change', function() {
	reloadPaymentMethod();
});

$('#payment-address select[name=\'address_id\']').live('change', function() {
	reloadPaymentMethodById($('#payment-address select[name=\'address_id\']').val());
});

$('#payment-address input[name=\'payment_address\']:checked').trigger('change');
//--></script>