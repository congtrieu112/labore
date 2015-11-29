<?php if($this->config->get('cosyone_header_wishlist') == 'enabled'){ ?>
<div class="shortcut wishlist">
<a class="shortcut_heading" id="header_wishlist" href="<?php echo $wishlist_link; ?>"><?php echo $text_header_wishlist; ?></a>
</div>  
<?php } ?>

<?php if($this->config->get('cosyone_header_compare') == 'enabled'){ ?>
<div class="shortcut compare">
<a class="shortcut_heading" id="header_compare" href="<?php echo $compare_link; ?>"><?php echo $text_header_compare; ?></a>
</div>
<?php } ?>