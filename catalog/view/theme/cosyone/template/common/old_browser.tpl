<div class="bar ie">
<div class="inner_container">
<span class="message"><?php echo ($this->config->get('cosyone_ie_text_' . $this->config->get('config_language_id'))); ?></span>
<?php if ($this->config->get('cosyone_ie_url')) { ?>
<a href="<?php echo $this->config->get('cosyone_ie_url')?>" target="_blank" class="bar_button button active"><?php echo ($this->config->get('cosyone_ie_update_text_' . $this->config->get('config_language_id'))); ?></a>
<?php } ?>
</div>
</div>
<script type="text/javascript">
$(document).ready(function() {
		$('.bar.cookie').hide();
});
</script>