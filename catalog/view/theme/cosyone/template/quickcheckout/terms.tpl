<?php if ($text_agree) { ?>
  	<?php echo $text_agree; ?>
  	<?php if ($agree) { ?>
  		<input type="checkbox" name="agree" value="1" checked="checked" />
  	<?php } else { ?>
  		<input type="checkbox" name="agree" value="1" />
  	<?php } ?>
<?php } ?>
<div class="confirm"><input type="button" value="<?php echo $button_continue; ?>" id="button-payment-method" class="button active" /></div>

<script type="text/javascript"><!--
$(document).ready(function() {
$('.colorbox').colorbox({
	width: 940,
	height: 580,
	maxWidth:'95%'
});
});
//--></script>   