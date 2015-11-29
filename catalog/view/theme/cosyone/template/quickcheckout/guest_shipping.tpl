<div class="field_holder">
<?php foreach ($fields as $field) { ?>
  <?php if ($field == 'country') { ?>
    <?php if (!empty(${'field_' . $field}['display'])) { ?>
	<div class="left field contrast_font">
	  <?php if (!empty(${'field_' . $field}['required'])) { ?>
	  <span class="required">*</span>
	  <?php } ?>
	  <?php echo $entry_country; ?><br />
	  <select name="country_id" class="large-field">
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
	<div class="left field contrast_font">
	  <?php if (!empty(${'field_' . $field}['required'])) { ?>
	  <span class="required">*</span>
	  <?php } ?>
	  <?php echo $entry_zone; ?><br />
	  <select name="zone_id" class="large-field"></select><br />
	</div>
	<?php } else { ?>
	  <select name="zone_id" class="hide"></select>
	<?php } ?>
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
<script type="text/javascript"><!--
$('#shipping-address select[name=\'country_id\']').bind('change', function() {
	$.ajax({
		url: 'index.php?route=quickcheckout/checkout/country&country_id=' + this.value,
		dataType: 'json',
		cache: false,
		beforeSend: function() {
			$('#shipping-address select[name=\'country_id\']').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},
		complete: function() {
			$('.wait').remove();
		},
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('#shipping-postcode-required').show();
			} else {
				$('#shipping-postcode-required').hide();
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

			$('#shipping-address select[name=\'zone_id\']').html(html);

			<?php if ($country_reload) { ?>
				reloadShippingMethod('shipping');
			<?php } ?>
		},
		<?php if ($debug) { ?>
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
		<?php } ?>
	});
});

$('#shipping-address select[name=\'country_id\']').trigger('change');

$('#shipping-address select[name=\'zone_id\']').bind('change', function() {
	reloadShippingMethod('shipping');
});
//--></script>