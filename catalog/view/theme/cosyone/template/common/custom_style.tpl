<?php if($this->config->get('cosyone_custom_bg_icon')){ ?>
<style>  
body {background-image:url('image/<?php echo $this->config->get('cosyone_custom_bg_icon')?>');}
</style>
<?php } else {?>
<style>  
body {background-image:url('catalog/view/theme/cosyone/image/patterns/<?php echo $this->config->get('cosyone_body_image')?>');}
</style> 
<?php } ?>

<style>
/* Body */
body {
	background-color:#<?php echo $this->config->get('cosyone_body_background')?>;
}
.outer_container {
	box-shadow:0px 0px 25px rgba(0, 0, 0, 0.1);
}
/* Top line */
.header_top_line_wrapper {
	background:#<?php echo $this->config->get('cosyone_top_border_background')?>;
	border-color:#<?php echo $this->config->get('cosyone_top_border_border')?>;
}
.header_top_line {
	color:#<?php echo $this->config->get('cosyone_top_border_text')?>;
}
.promo_message a, 
.header_top_line .links a,
.header_top_line .login_drop_heading .log_link,
.header_top_line .currency_current .head, 
.header_top_line .language_current .head {
	color:#<?php echo $this->config->get('cosyone_top_border_link')?>;
}
.header_top_line a:hover, .header_top_line b {
	color:#<?php echo $this->config->get('cosyone_top_border_link_hover')?>;
}
.shortcut .shortcut_heading i {
	border-color:#<?php echo $this->config->get('cosyone_shortcut_separator')?>;
}
/* Menu background */
#menu {
	background:#<?php echo $this->config->get('cosyone_menu_background')?>;
}
/* Menu link color */
#menu > ul > li > a, .mobile_menu_trigger,
#menu .shortcut .shortcut_heading i,
#menu .shortcut .shortcut_heading .count,
#menu .shortcut .shortcut_heading .total {
	color:#<?php echo $this->config->get('cosyone_menu_link_color')?>;
}
/* Menu link color hover */
#menu > ul > li:hover > a,
#menu > ul > li.current > a,
#menu #cart:hover .shortcut_heading .count,
#menu #cart:hover .shortcut_heading i,
#menu #cart:hover .shortcut_heading .total,
.mobile_menu_trigger, 
.mobile_menu_trigger:hover {
	color:#<?php echo $this->config->get('cosyone_menu_link_color_hover')?>;
}
/* Menu link background on hover/active */
#menu > ul > li:hover > a,
#menu > ul > li.current > a,
#menu #cart.shortcut:hover .shortcut_heading,
.mobile_menu_trigger, 
.mobile_menu_trigger:hover {
	background-color:#<?php echo $this->config->get('cosyone_menu_link_background_hover')?>;
}
/* Primary color */
.header_main .button-search:hover,
.rich_banner .primary_background .inner .button:hover,
.box.custom.info2 .box-single i.fa,
.rich_banner .info_wrapper a,
.wishlist .shortcut_heading:hover i, 
.compare .shortcut_heading:hover i,
.tp-caption.contrast_font_heading_primary,
.tp-caption.contrast_font_heading2_primary,
.tp-caption.contrast_font_sub_heading_primary, 
.tp-caption.contrast_font_primary,
.tp-caption.contrast_font_slider_button_primary,
.tp-caption.contrast_font_slider_button_primary a,
.tp-caption.main_font_heading_primary,
.tp-caption.main_font_heading2_primary,
.tp-caption.main_font_sub_heading_primary, 
.tp-caption.main_font_primary,
.tp-caption.main_font_slider_button_primary,
.tp-caption.main_font_slider_button_primary a,
.box.newsletter.boxed.popup .inner .button:hover {
	color:#<?php echo $this->config->get('cosyone_primary_color')?>;
}
.primary_background,
.rich_banner .info_wrapper span:before,
.box.custom.info1 .box-single i.fa,
#cart.shortcut:hover .shortcut_heading {
	background-color:#<?php echo $this->config->get('cosyone_primary_color')?>;
}
.box.custom.info1 .box-content, 
.box.custom.info1 .box-single, 
.tp-caption.contrast_font_slider_button_primary:hover, 
.tp-caption.main_font_slider_button_primary:hover, 
.primary_border {
	border-color:#<?php echo $this->config->get('cosyone_primary_color')?> !important;
}
.tp-caption.contrast_font_slider_button_primary, .tp-caption.main_font_slider_button_primary {
	border-top-color:#<?php echo $this->config->get('cosyone_primary_color')?>;
}
/* Secondary color */
.secondary_background,
.box.custom.action1 .box-content,
a.button.second,
a.button.quickview:hover {
	background-color:#<?php echo $this->config->get('cosyone_secondary_color')?>;
}
.contrast_color,
.box.custom.action2 .box-content .left,
.box.custom.action1 .box-content .button,
a.button.second:hover,
.rich_banner .secondary_background .inner .button:hover,
.cart-total tr:last-child td, 
.cart-total #total tr:last-child > td:last-child,
table.radio tr.highlight td:nth-child(3) label,
.cart-info tr.confirm_totals:last-child td,
.tp-caption.contrast_font_heading_secondary,
.tp-caption.contrast_font_heading2_secondary,
.tp-caption.contrast_font_sub_heading_secondary, 
.tp-caption.contrast_font_secondary,
.tp-caption.contrast_font_slider_button_secondary,
.tp-caption.contrast_font_slider_button_secondary a,
.tp-caption.main_font_heading_secondary,
.tp-caption.main_font_heading2_secondary,
.tp-caption.main_font_sub_heading_secondary, 
.tp-caption.main_font_secondary,
.tp-caption.main_font_slider_button_secondary,
.tp-caption.main_font_slider_button_secondary a {
	color:#<?php echo $this->config->get('cosyone_secondary_color')?>;
}
a.button.second:hover, .tp-caption.contrast_font_slider_button_secondary:hover, .tp-caption.main_font_slider_button_secondary:hover  {
	border-color:#<?php echo $this->config->get('cosyone_secondary_color')?>;
}
.tp-caption.contrast_font_slider_button_secondary, .tp-caption.main_font_slider_button_secondary {
	border-top-color:#<?php echo $this->config->get('cosyone_secondary_color')?>;
}
/* Offer color */
#main .offer_background,
.product-info .hasCountdown,
.deals .hasCountdown,
.deals_wrapper .owl-page.active {
	background:#<?php echo $this->config->get('cosyone_offer_color')?>;
}
.deals_heading,
.extended_offer .price-save {
	color:#<?php echo $this->config->get('cosyone_offer_color')?>;
}
.deals_wrapper,
.deals_wrapper .owl-page {
	border-color:#<?php echo $this->config->get('cosyone_offer_color')?>;
}
/* Link hover */
a:hover,
.product-filter a:hover,
.top_header_drop_down a:hover, 
.top_header_drop_down .current, 
#login.top_header_drop_down a.forgotten:hover {
	color:#<?php echo $this->config->get('cosyone_link_hover_color')?>;
}
/* Sale badge */
.sale_badge {
	background-color:#<?php echo $this->config->get('cosyone_salebadge_background')?>;
}
/* Price */
.price, .price-new {
	color:#<?php echo $this->config->get('cosyone_price_color')?>;
}
/* Icon hover color */
.icon:hover, .slide_arrow_next:hover, .slide_arrow_prev:hover, #cboxPrevious:hover:after, #cboxNext:hover:after, #cboxClose:hover:after, #list_view_icon.active, #list_view_icon:hover, #grid_view_icon.active, #grid_view_icon:hover, .currency_current:hover, .language_current:hover, .login_drop_heading:hover, .login_drop_heading.active {
	background:#<?php echo $this->config->get('cosyone_icons_background_hover')?>;
}
/* Buttons */
/* Default button */
a.button, input.button, button.button {
	background-color:#<?php echo $this->config->get('cosyone_button_background')?>;
	color:#<?php echo $this->config->get('cosyone_button_color')?>;
	border-color:#<?php echo $this->config->get('cosyone_button_border')?>;
}
a.button:hover, input.button:hover, button.button:hover {
	background-color:#<?php echo $this->config->get('cosyone_button_hover_background')?>;
	color:#<?php echo $this->config->get('cosyone_button_hover_color')?>;
	border-color:#<?php echo $this->config->get('cosyone_button_hover_border')?>;
}
/* Cart/contrast buttons */
a.button.contrast, .button.contrast, .sq_icon.contrast, input.button.contrast,
a.button.active, input.button.active, #button-confirm, .style-2 .add_to_cart { 
	background-color:#<?php echo $this->config->get('cosyone_button2_background')?>;
	color:#<?php echo $this->config->get('cosyone_button2_color')?>;
	border-color:#<?php echo $this->config->get('cosyone_button2_border')?>;
}
a.button.contrast:hover, .button.contrast:hover, .sq_icon.contrast:hover, input.button.contrast:hover,
a.button.active:hover, input.button.active:hover, #button-confirm:hover, .style-2 .add_to_cart:hover  { 
	background-color:#<?php echo $this->config->get('cosyone_button2_hover_background')?>;
	color:#<?php echo $this->config->get('cosyone_button2_hover_color')?>;
	border-color:#<?php echo $this->config->get('cosyone_button2_hover_border')?>;
}

</style>