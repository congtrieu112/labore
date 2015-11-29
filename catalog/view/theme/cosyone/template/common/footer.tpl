  <div class="clearfix footer_margin"></div>
</div>

<div class="footer-bottom">
  <div class="inner_container">
    <div id="footer">
    	<!--<div class="column">
        <div class="box-heading heading"><?php echo ($this->config->get('cosyone_footer_custom_block_title_' . $this->config->get('config_language_id'))) ?></div>
        <div class="custom_block"><?php echo html_entity_decode($this->config->get('cosyone_footer_custom_block_' . $this->config->get('config_language_id')), ENT_QUOTES, 'UTF-8'); ?></div>
      </div>-->
      <div class="column">
        <h2><?php echo $text_information; ?></h2>
        <ul class="contrast_font">
            <?php if ($informations) { ?>
              <?php foreach ($informations as $information) { ?>
                <li><i class="fa fa-caret-right"></i><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
              <?php } ?>
            <?php } ?>
           <li><i class="fa fa-caret-right"></i><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
        </ul>
      </div>
      <div class="column">
        <h2><?php echo $text_extra; ?></h2>
        <ul class="contrast_font">
            <li><i class="fa fa-caret-right"></i><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
            <li><i class="fa fa-caret-right"></i><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
            <li><i class="fa fa-caret-right"></i><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
            <li><i class="fa fa-caret-right"></i><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
            <li><i class="fa fa-caret-right"></i><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
        </ul>
      </div>
      <div class="column">
        <h2><?php echo $text_account; ?></h2>
        <ul class="contrast_font">
            <li><i class="fa fa-caret-right"></i><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
            <li><i class="fa fa-caret-right"></i><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
            <li><i class="fa fa-caret-right"></i><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
            <li><i class="fa fa-caret-right"></i><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
            <li><i class="fa fa-caret-right"></i><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
        </ul>
      </div>
    </div>
    <div class="bottom_line"> <a class="scroll_top icon tablet_hide"><i class="fa fa-angle-up"></i></a>
      <div id="powered"><?php echo $powered; ?></div>
      <?php if($this->config->get('cosyone_footer_payment_icon')){ ?>
            <div id="footer_payment_icon"><img src="image/<?php echo $this->config->get('cosyone_footer_payment_icon')?>" alt="" /></div>
      <?php } ?>
      <div class="clearfix"></div>
    </div>
  </div>
</div> <!-- #footer ends --> 
<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//-->

<script type="text/javascript" src="catalog/view/javascript/jquery/ui/external/jquery.cookie.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/colorbox/jquery.colorbox.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/cosyone/stylesheet/custom_colorbox.css" media="screen" />

<script type="text/javascript" src="catalog/view/theme/cosyone/js/quickview.js"></script>
<?php if($this->config->get('cosyone_use_retina')) { ?>
<script type="text/javascript" src="catalog/view/theme/cosyone/js/retina.min.js"></script>
<?php } ?>
</body></html>