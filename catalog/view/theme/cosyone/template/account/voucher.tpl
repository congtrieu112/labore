<?php echo $header; ?>
<?php $this->load->model('tool/image');?>
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
      <p><?php echo $text_description; ?></p>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
           <div class="content form">
                <div class="input_field_half">
                      <b><?php echo $entry_to_name; ?> <span class="required">*</span></b>
                      <input type="text" name="to_name" value="<?php echo $to_name; ?>" />
                      <?php if ($error_to_name) { ?>
                           <span class="error"><?php echo $error_to_name; ?></span>
                      <?php } ?>
                </div>
                <div class="input_field_half right">
                      <b><?php echo $entry_to_email; ?> <span class="required">*</span></b>
                      <input type="text" name="to_email" value="<?php echo $to_email; ?>" />
                      <?php if ($error_to_email) { ?>
                            <span class="error"><?php echo $error_to_email; ?></span>
                      <?php } ?>
                </div>

                <div class="input_field_half">
                      <b><?php echo $entry_from_name; ?> <span class="required">*</span></b>
                      <input type="text" name="from_name" value="<?php echo $from_name; ?>" />
                      <?php if ($error_from_name) { ?>
                            <span class="error"><?php echo $error_from_name; ?></span>
                      <?php } ?>
                </div>
                <div class="input_field_half right">
                      <b><?php echo $entry_from_email; ?> <span class="required">*</span></b>
                      <input type="text" name="from_email" value="<?php echo $from_email; ?>" />
                      <?php if ($error_from_email) { ?>
                            <span class="error"><?php echo $error_from_email; ?></span>
                      <?php } ?>
                </div>
	                <div class="input_field_full">
                      <b><?php echo $entry_message; ?></b>
                      <textarea name="message" cols="40" rows="5"><?php echo $message; ?></textarea>
                </div>
                <div class="input_field_full radio">
                      <b><?php echo $entry_theme; ?> <span class="required">*</span></b>
               	      <?php
                            $vc_col = 3 ;
                            $vc_colwidth = 100 / $vc_col ;
                            $thumbnail_size = 100 ;
                      ?>

                      <td>
                            <table style="border:1px solid #DBDEE1;background:#EEEEEE;-webkit-border-radius: 7px 7px 7px 7px;-moz-border-radius: 7px 7px 7px 7px;-khtml-border-radius: 7px 7px 7px 7px;border-radius: 7px 7px 7px 7px">
                                  <tr>
                                       <?php foreach ($voucher_themes as $voucher_theme) { ?>
                                            <?php $vc_col-- ;
                                            if ($voucher_theme['image']) {
                                                  $thumbnail = $this->model_tool_image->resize($voucher_theme['image'], $thumbnail_size, $thumbnail_size);
                                            } else {
                                                  $thumbnail  = '';
                                            }?>

                                            <td style="width:<?php echo $vc_colwidth ?>%">
                                                  <img src="<?php echo $thumbnail; ?>" title="<?php echo $voucher_theme['name']; ?>" alt="<?php echo $voucher_theme['name']; ?>" style="border:1px solid #E7E7E7" />
                                                  <br />

                                                  <?php if ($voucher_theme['voucher_theme_id'] == $voucher_theme_id) { ?>
                                                        <input type="radio" name="voucher_theme_id" value="<?php echo $voucher_theme['voucher_theme_id']; ?>" id="voucher-<?php echo $voucher_theme['voucher_theme_id']; ?>" checked="checked" />
                                                        <label for="voucher-<?php echo $voucher_theme['voucher_theme_id']; ?>"><?php echo $voucher_theme['name']; ?></label>
                                                  <?php } else { ?>
                                                        <input type="radio" name="voucher_theme_id" value="<?php echo $voucher_theme['voucher_theme_id']; ?>" id="voucher-<?php echo $voucher_theme['voucher_theme_id']; ?>" />
                                                        <label for="voucher-<?php echo $voucher_theme['voucher_theme_id']; ?>"><?php echo $voucher_theme['name']; ?></label>
                                                  <?php } ?>
                                            </td>

                                            <?php if ($vc_col == 0) { ?>
                                                  </tr>
                                                  <tr>
                                                  <?php $vc_col = 3 ; ?>
                                            <?php } ?>

                                        <?php } ?>
                                  </tr>
                            </table>
                            <?php if ($error_theme) { ?>
                                  <span class="error"><?php echo $error_theme; ?></span>
                            <?php } ?>
                      </td>
                </div>
  
                <div class="input_field_half">
              	       <b><span class="required">*</span><?php echo $entry_amount; ?></b>
                      <input type="text" name="amount" value="<?php echo $amount; ?>" size="5" />
                      <?php if ($error_amount) { ?>
                            <span class="error"><?php echo $error_amount; ?></span>
                      <?php } ?>
                </div>
          </div>
          <div class="buttons">
                <div class="right"><?php echo $text_agree; ?>
                      <?php if ($agree) { ?>
                            <input type="checkbox" name="agree" value="1" checked="checked" />
                      <?php } else { ?>
                            <input type="checkbox" name="agree" value="1" />
                      <?php } ?>
                      <input type="submit" value="<?php echo $button_continue; ?>" class="button" />
                </div>
          </div>
      </form>
      <?php echo $content_bottom; ?>
</div>
<?php echo $footer; ?>