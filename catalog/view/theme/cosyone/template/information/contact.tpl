<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content">
<div class="content_wrapper">
<?php echo $content_top; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  
  <?php if ($this->config->get('cosyone_google_map')) { ?>
  <h1><?php echo $text_location; ?></h1>
  <div class="contact_map">
  <?php echo html_entity_decode($this->config->get('cosyone_google_map'), ENT_QUOTES, 'UTF-8'); ?>
   </div>
   <?php } else { ?>
   <h1><?php echo $heading_title; ?></h1>
  <?php } ?>
  
    <div class="contact_info_wrapper">
      
      <div class="left contrast_font">
      <div class="box">
      <div class="box-heading short"><?php echo $text_address; ?></div>
        <p><?php echo $store; ?><br />
        <?php echo $address; ?></p>
        </div>
        <?php if ($telephone) { ?>
        <div class="box">
        <div class="box-heading short"><?php echo $text_telephone; ?></div>
        <span><i class="fa fa-phone"></i><?php echo $telephone; ?></span>
        <?php } ?>
        <?php if ($fax) { ?>
        <br /><span><?php echo $text_fax; ?></span>
        <span><?php echo $fax; ?></span>
        <?php } ?>
        </div>
      </div>
      
      <div class="right">
      
    <div class="content form">
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
     <div class="box-heading short"><?php echo $text_contact; ?></div>
      <div class="input_field_half">
    <b><?php echo $entry_name; ?><span class="required">*</span></b>
    <input type="text" name="name" value="<?php echo $name; ?>" />
    <br />
    <?php if ($error_name) { ?>
    <span class="error"><?php echo $error_name; ?></span>
    <?php } ?>
    </div>
    <div class="input_field_half right">
    <b><?php echo $entry_email; ?><span class="required">*</span></b>
    <input type="text" name="email" value="<?php echo $email; ?>" />
    <br />
    <?php if ($error_email) { ?>
    <span class="error"><?php echo $error_email; ?></span>
    <?php } ?>
    </div>
    <div class="input_field_full">
    <b><?php echo $entry_enquiry; ?><span class="required">*</span></b>
    <textarea name="enquiry"  rows="10" ><?php echo $enquiry; ?></textarea>
    <br />
    <?php if ($error_enquiry) { ?>
    <span class="error"><?php echo $error_enquiry; ?></span>
    <?php } ?>
   </div>
   <div class="clearfix"></div>
   <div class="input_field_full">
    <b><?php echo $entry_captcha; ?><span class="required">*</span></b>
    <input type="text" name="captcha" class="capcha_filed" value="<?php echo $captcha; ?>" />
    </div>
    <img src="index.php?route=information/contact/captcha" alt="" />
    
    
    <input type="submit" value="<?php echo $button_continue; ?>" class="button" />
    <div class="clearfix"></div>
    <?php if ($error_captcha) { ?>
    <span class="error"><?php echo $error_captcha; ?></span>
    <?php } ?>
    
    </div>
    
  </form>
  </div>
  </div>
  <?php echo $content_bottom; ?></div></div>
<?php echo $footer; ?>