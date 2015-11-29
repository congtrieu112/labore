<br />
<div class="field_holder">
     <div class="left field contrast_font">
          <span class="required">*</span> <?php echo $entry_password; ?><br />
          <input type="password" name="password" value="" class="large-field" /><br />
     </div>
    <div class="left field contrast_font">
            <span class="required">*</span> <?php echo $entry_confirm; ?> <br />
            <input type="password" name="confirm" value="" class="large-field" /><br />
    </div>
</div>

<div style="clear: both; padding-bottom: 15px;padding-top:5px; border-bottom: 1px solid #EEEEEE; margin-bottom:15px;">
      <?php if (!empty($field_newsletter['required'])) { ?>
	     <input type="checkbox" name="newsletter" value="1" id="newsletter" class="hide" checked="checked" />
      <?php } elseif (!empty($field_newsletter['display'])) { ?>
        	<?php if(!empty($field_newsletter['default'])) { ?>
        	     <input type="checkbox" name="newsletter" value="1" id="newsletter" checked="checked" />
        	<?php } else { ?>
        	     <input type="checkbox" name="newsletter" value="1" id="newsletter" />
        	<?php } ?>
        	     <label for="newsletter"><?php echo $entry_newsletter; ?></label><br />
      <?php } else { ?>
            <input type="checkbox name="newsletter" value="1" id="newsletter" class="hide" />
      <?php } ?>
      <?php if ($text_agree) { ?>
              <input type="checkbox" name="agree" value="1" id="agree-reg" />
           <label for="agree-reg"><?php echo $text_agree; ?></label>
      <?php } ?>
</div>

<script type="text/javascript"><!--
      $(document).ready(function() {
            $('.colorbox').colorbox({
            	width: 940,
            	height: 580,
            	maxWidth:'95%'
            });
      });
//--></script> 