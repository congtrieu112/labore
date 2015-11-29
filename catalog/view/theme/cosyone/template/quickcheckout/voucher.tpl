<?php if ($coupon_module) { ?>
	<div id="coupon-heading" class="contrast_font"><?php echo $entry_coupon; ?></div>
	<div id="coupon-content">
		<input type="text" name="coupon" value="" />
		<input type="button" value="<?php echo $text_use_coupon; ?>" id="button-coupon" class="button" />
	</div>
<?php } ?>
<?php if ($voucher_module) { ?>
	<div id="voucher-heading" class="contrast_font"><?php echo $entry_voucher; ?></div>
	<div id="voucher-content">
		<input type="text" name="voucher" value="" />
		<input type="button" value="<?php echo $text_use_voucher; ?>" id="button-voucher" class="button" />
	</div>
<?php } ?>
<?php if ($reward_module && $reward) { ?>
	<div id="reward-heading" class="contrast_font"><?php echo $entry_reward; ?></div>
	<div id="reward-content">
		<input type="text" name="reward" value="" />
		<input type="button" value="<?php echo $text_use_reward; ?>" id="button-reward" class="button" />
	</div>
<?php } ?>