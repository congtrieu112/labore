<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <h1><?php echo $heading_title; ?></h1>
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
    <div class="content form"> 
    <h3><?php echo $text_your_payment; ?></h3>
      <div class="input_field_half">
       <b><?php echo $entry_tax; ?></b>
        <input type="text" name="tax" value="<?php echo $tax; ?>" />
          </div>
          <div class="clearfix"></div>
          <div class="input_field_full radio">
            <b><?php echo $entry_payment; ?></b>
            <?php if ($payment == 'cheque') { ?>
              <input type="radio" name="payment" value="cheque" id="cheque" checked="checked" />
              <?php } else { ?>
              <input type="radio" name="payment" value="cheque" id="cheque" />
              <?php } ?>
              <label for="cheque"><?php echo $text_cheque; ?></label><br />
              <?php if ($payment == 'paypal') { ?>
              <input type="radio" name="payment" value="paypal" id="paypal" checked="checked" />
              <?php } else { ?>
              <input type="radio" name="payment" value="paypal" id="paypal" />
              <?php } ?>
              <label for="paypal"><?php echo $text_paypal; ?></label><br />
              <?php if ($payment == 'bank') { ?>
              <input type="radio" name="payment" value="bank" id="bank" checked="checked" />
              <?php } else { ?>
              <input type="radio" name="payment" value="bank" id="bank" />
              <?php } ?>
              <label for="bank"><?php echo $text_bank; ?></label>
          </div>
        <div id="payment-cheque" class="payment">
            <div class="input_field_half">
            <b><?php echo $entry_cheque; ?></b>
            <input type="text" name="cheque" value="<?php echo $cheque; ?>" />
            </div>
        </div>
        <div class="payment" id="payment-paypal">
            <div class="input_field_half">
            <b><?php echo $entry_paypal; ?></b>
            <input type="text" name="paypal" value="<?php echo $paypal; ?>" />
            </div>
        </div>
        <div id="payment-bank" class="payment">
        <div class="input_field_half">
           <b><?php echo $entry_bank_name; ?></b>
            <input type="text" name="bank_name" value="<?php echo $bank_name; ?>" />
            </div>
            <div class="input_field_half right">
            <b><?php echo $entry_bank_branch_number; ?></b>
            <input type="text" name="bank_branch_number" value="<?php echo $bank_branch_number; ?>" />
         	</div>
            <div class="input_field_half">
            <b><?php echo $entry_bank_swift_code; ?></b>
            <input type="text" name="bank_swift_code" value="<?php echo $bank_swift_code; ?>" />
         	</div>
            <div class="input_field_half right">
            <b><?php echo $entry_bank_account_name; ?></b>
            <input type="text" name="bank_account_name" value="<?php echo $bank_account_name; ?>" />
          	</div>
            <div class="input_field_half">
            <b><?php echo $entry_bank_account_number; ?></b>
            <input type="text" name="bank_account_number" value="<?php echo $bank_account_number; ?>" />
          	</div>
        </div>
    </div>
    <div class="buttons">
      <div class="left"><a href="<?php echo $back; ?>" class="button"><?php echo $button_back; ?></a></div>
      <div class="right"><input type="submit" value="<?php echo $button_continue; ?>" class="button" /></div>
    </div>
  </form>
  <?php echo $content_bottom; ?></div>
<script type="text/javascript"><!--
$('input[name=\'payment\']').bind('change', function() {
	$('.payment').hide();
	
	$('#payment-' + this.value).show();
});

$('input[name=\'payment\']:checked').trigger('change');
//--></script> 
<?php echo $footer; ?> 