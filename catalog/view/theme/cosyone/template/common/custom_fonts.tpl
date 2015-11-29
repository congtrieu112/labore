<!-- Main font -->
<?php echo html_entity_decode($this->config->get('cosyone_font1_import'), ENT_QUOTES, 'UTF-8'); ?>
<style>
body, input, textarea, select, .main_font, #menu li.custom_block .menu_drop_down p, .sale_badge, small, .sq_icon {
<?php echo ($this->config->get('cosyone_font1_name')); ?>
}
</style>

<!-- Contrast font -->
<?php echo html_entity_decode($this->config->get('cosyone_font2_import'), ENT_QUOTES, 'UTF-8'); ?>
<style>
/* Contrast font */
.contrast_font, .contrast_font_secondary, .contrast_font_heading, .contrast_font_heading2, .contrast_font_sub_heading, .contrast_font_slider_button,.contrast_font_heading_dark, .contrast_font_heading2_dark, .contrast_font_sub_heading_dark, .contrast_font_slider_button_dark, .contrast_font_heading_primary, .contrast_font_heading2_primary, .contrast_font_sub_heading_primary, .contrast_font_slider_button_primary, .contrast_font_heading_secondary, .contrast_font_heading2_secondary, .contrast_font_sub_heading_secondary, .contrast_font_slider_button_secondary, .checkout-content, .box-content ul, .button, h1, h2, h3, h4, h5, .heading, .price, .title, .box-heading, #menu, .mobile_menu, .htabs a, .cart-info tbody .name a, .checkout-heading, .input_field_half b, .input_field_full b {
<?php echo ($this->config->get('cosyone_font2_name')); ?>
}
body, input, textarea, select, #menu li.custom_block .menu_drop_down p, .sale_badge, small, .sq_icon, .light_font, h1, .heading, .box-heading, .checkout-heading, .rich_banner .inner h4, .rich_banner .info_wrapper h4, .main_font, .main_font_dark, .main_font_primary, .main_font_secondary, .rich_banner .info_wrapper p, .layerslider-wrapper a {
	font-weight:300;
}
.contrast_font,.checkout-content, .layerslider-wrapper, .box-content ul, .button, h2, h3, h4, h5, .price, .title, #menu, .mobile_menu, .htabs a, .cart-info tbody .name a, .input_field_half b, .input_field_full b, .price-old, .deals .hurry .items_left, .product-info h1, .product-info .hurry .items_left {
	font-weight:400;
}
.header_top_line b, .success a, .warning a, .information a, .attention a, .buttons .right a, .buttons .right b, p a {
	font-weight:500;
}
b, .checkout-content h2, #cart .mini-cart-total tr:last-child td, .price, .bar .message, .shortcut .shortcut_heading .total, #menu .level2 > a, table.list thead td, #shipping-method table.radio td b, table.radio tr.highlight td:nth-child(3) label, li.open > a, ul.box-filter span, .item.testimonial .heading, .testimonial_list .heading, .deals .hasCountdown i, .extended_offer .amount, .compare-info tr td:first-child, .product-info .options h2, .order-detail, .cart-info tr.confirm_totals td, .cart-info thead td, .cart-total table, .checkout-product thead td, .box.custom.info2 .box-single h3 {
	font-weight:600;
}
</style>
<!-- Google fonts ends -->
