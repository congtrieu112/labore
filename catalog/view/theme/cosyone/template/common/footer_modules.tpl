</div> <!-- .inner_container ends -->

<div class="footer_modules">
	<div class="inner_container">
		<div class="footer_modules_wrapper <?php echo ($this->config->get('cosyone_footer_columns')) ?>">
			<?php foreach ($modules as $module) { ?>
				<?php echo $module; ?>
			<?php } ?>
		</div>
	</div>
</div>
