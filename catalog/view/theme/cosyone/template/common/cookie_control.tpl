<div class="bar cookie">
<div class="bar_background"></div>
<div class="inner_container">
<span class="message"><?php echo ($this->config->get('cosyone_cookie_text_' . $this->config->get('config_language_id'))); ?></span>
<a href="<?php echo $this->config->get('cosyone_readmore_url')?>" class="bar_button button read_more"><?php echo ($this->config->get('cosyone_cookie_button_readmore_' . $this->config->get('config_language_id'))); ?></a>
<a class="bar_button button active"><?php echo ($this->config->get('cosyone_cookie_button_accept_' . $this->config->get('config_language_id'))); ?></a>
</div>
</div>
<script type="text/javascript">
$(document).ready(function() {

		$.cookie( 'cookie_check' , 1 , { expires: 365 , path: '/' });
	$('.bar_button.button.active').click(function() {
		$('.bar').fadeOut(300);
	});
});
</script>