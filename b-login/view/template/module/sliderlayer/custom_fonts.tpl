<!-- Main font -->
<?php echo html_entity_decode($this->config->get('cosyone_font1_import'), ENT_QUOTES, 'UTF-8'); ?>
<style>
.slider-layers, .typos {
<?php echo ($this->config->get('cosyone_font1_name')); ?>
}
</style>

<!-- Contrast font -->
<?php echo html_entity_decode($this->config->get('cosyone_font2_import'), ENT_QUOTES, 'UTF-8'); ?>
<style>

/* Contrast font */
.contrast_font_heading,
.contrast_font_heading_dark,
.contrast_font_heading_primary,
.contrast_font_heading_secondary, 
.contrast_font_heading2,
.contrast_font_heading2_dark,
.contrast_font_heading2_primary,
.contrast_font_heading2_secondary, 
.contrast_font_sub_heading,
.contrast_font_sub_heading_dark,
.contrast_font_sub_heading_primary,
.contrast_font_sub_heading_secondary,
.contrast_font, 
.contrast_font_dark, 
.contrast_font_primary, 
.contrast_font_secondary, 
.contrast_font_slider_button, 
.contrast_font_slider_button_dark, 
.contrast_font_slider_button_primary,
.contrast_font_slider_button_secondary,
.contrast_font_slider_button_secondary a {
<?php echo ($this->config->get('cosyone_font2_name')); ?>
}



</style>
<!-- Google fonts ends -->
