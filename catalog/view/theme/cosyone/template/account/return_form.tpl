<?php echo $header; ?>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <h1><?php echo $heading_title; ?></h1>
  <?php echo $text_description; ?>
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
    <div class="content form">
    <h3><?php echo $text_order; ?></h3>
      <div class="input_field_half"><b><?php echo $entry_firstname; ?> <span class="required">*</span></b>
        <input type="text" name="firstname" value="<?php echo $firstname; ?>" />
        <?php if ($error_firstname) { ?>
        <span class="error"><?php echo $error_firstname; ?></span>
        <?php } ?>
        </div>
        <div class="input_field_half right">
        <b><?php echo $entry_lastname; ?> <span class="required">*</span></b>
        <input type="text" name="lastname" value="<?php echo $lastname; ?>" />
        <?php if ($error_lastname) { ?>
        <span class="error"><?php echo $error_lastname; ?></span>
        <?php } ?>
        </div>
        <div class="input_field_half">
        <b><?php echo $entry_email; ?> <span class="required">*</span></b>
        <input type="text" name="email" value="<?php echo $email; ?>" />
       <?php if ($error_email) { ?>
        <span class="error"><?php echo $error_email; ?></span>
        <?php } ?>
        </div>
        <div class="input_field_half right">
        <b><?php echo $entry_telephone; ?> <span class="required">*</span></b>
        <input type="text" name="telephone" value="<?php echo $telephone; ?>" />
        <?php if ($error_telephone) { ?>
        <span class="error"><?php echo $error_telephone; ?></span>
        <?php } ?>
        </div>
       <div class="input_field_half">
        <b><?php echo $entry_order_id; ?> <span class="required">*</span></b>
        <input type="text" name="order_id" value="<?php echo $order_id; ?>" />
        <?php if ($error_order_id) { ?>
        <span class="error"><?php echo $error_order_id; ?></span>
        <?php } ?>
        </div>
      	<div class="input_field_half right">
        <b><?php echo $entry_date_ordered; ?></b>
        <input type="text" name="date_ordered" value="<?php echo $date_ordered; ?>" class="date" />
        </div>
      </div> 
    <div id="return-product">
      <div class="content form">
        <h3><?php echo $text_product; ?></h3>
       <div class="input_field_half">
        <b><?php echo $entry_product; ?> <span class="required">*</span></b>
        <input type="text" name="product" value="<?php echo $product; ?>" />
        <?php if ($error_product) { ?>
        <span class="error"><?php echo $error_product; ?></span>
        <?php } ?>
        </div>
        <div class="input_field_half right">
        <b><?php echo $entry_model; ?> <span class="required">*</span></b>
        <input type="text" name="model" value="<?php echo $model; ?>" />
        <?php if ($error_model) { ?>
        <span class="error"><?php echo $error_model; ?></span>
        <?php } ?>
        </div>
        <div class="input_field_half">
        <b><?php echo $entry_quantity; ?></b>
        <input type="text" name="quantity" value="<?php echo $quantity; ?>" />
        </div>
        </div>
        <div class="return-reason content form">
          <div class="input_field_full radio"><b><?php echo $entry_reason; ?><span class="required">*</span></b>
            <table>
              <?php foreach ($return_reasons as $return_reason) { ?>
              <?php if ($return_reason['return_reason_id'] == $return_reason_id) { ?>
              <tr>
                <td width="1"><input type="radio" name="return_reason_id" value="<?php echo $return_reason['return_reason_id']; ?>" id="return-reason-id<?php echo $return_reason['return_reason_id']; ?>" checked="checked" /></td>
                <td><label for="return-reason-id<?php echo $return_reason['return_reason_id']; ?>"><?php echo $return_reason['name']; ?></label></td>
              </tr>
              <?php } else { ?>
              <tr>
                <td width="1"><input type="radio" name="return_reason_id" value="<?php echo $return_reason['return_reason_id']; ?>" id="return-reason-id<?php echo $return_reason['return_reason_id']; ?>" /></td>
                <td><label for="return-reason-id<?php echo $return_reason['return_reason_id']; ?>"><?php echo $return_reason['name']; ?></label></td>
              </tr>
              <?php  } ?>
              <?php  } ?>
            </table>
            <?php if ($error_reason) { ?>
            <span class="error"><?php echo $error_reason; ?></span>
            <?php } ?>
            </div>
            </div>
           <div class="content form">
           <div class="input_field_full radio"><b><?php echo $entry_opened; ?></b>
            <?php if ($opened) { ?>
            <input type="radio" name="opened" value="1" id="opened" checked="checked" />
            <?php } else { ?>
            <input type="radio" name="opened" value="1" id="opened" />
            <?php } ?>
            <label for="opened"><?php echo $text_yes; ?></label>
            <?php if (!$opened) { ?>
            <input type="radio" name="opened" value="0" id="unopened" checked="checked" />
            <?php } else { ?>
            <input type="radio" name="opened" value="0" id="unopened" />
            <?php } ?>
            <label for="unopened"><?php echo $text_no; ?></label>
            </div>
            </div>
            <div class="content form">
			<div class="input_field_full">
            <b><?php echo $entry_fault_detail; ?></b>
            <textarea name="comment" cols="150" rows="6"><?php echo $comment; ?></textarea>
          	</div>
            

            <div class="input_field_full">
    <b><?php echo $entry_captcha; ?><span class="required">*</span></b>
    <input type="text" name="captcha" class="capcha_filed" value="<?php echo $captcha; ?>" />
    </div>
    <img src="index.php?route=information/contact/captcha" alt="" />
            
            <?php if ($error_captcha) { ?>
            <span class="error"><?php echo $error_captcha; ?></span>
            <?php } ?>
          
          </div>
        </div> 
      <?php if ($text_agree) { ?>
    <div class="buttons">
      <div class="left"><a href="<?php echo $back; ?>" class="button"><?php echo $button_back; ?></a></div>
      <div class="right"><?php echo $text_agree; ?>
        <?php if ($agree) { ?>
        <input type="checkbox" name="agree" value="1" checked="checked" />
        <?php } else { ?>
        <input type="checkbox" name="agree" value="1" />
        <?php } ?>
        <input type="submit" value="<?php echo $button_continue; ?>" class="button" />
      </div>
      </div>
    <?php } else { ?>
    <div class="buttons">
      <div class="left"><a href="<?php echo $back; ?>" class="button"><?php echo $button_back; ?></a></div>
      <div class="right">
        <input type="submit" value="<?php echo $button_continue; ?>" class="button" />
      </div>
    </div>
    <?php } ?>
  </form>
  <?php echo $content_bottom; ?></div>
<script type="text/javascript"><!--
$(document).ready(function() {
	$('.date').datepicker({dateFormat: 'yy-mm-dd'});
});
//--></script>  
<script type="text/javascript"><!--
$(document).ready(function() {
	$('.colorbox').colorbox({
		width: 640,
		height: 480
	});
});
//--></script> 
<?php echo $footer; ?>