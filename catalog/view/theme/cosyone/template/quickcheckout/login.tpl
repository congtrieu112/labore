<div id="login">
  <div class="field_holder">
    <div class="left field contrast_font">
      <?php echo $entry_email; ?><br /> 
      <input type="text" name="email" value="" />
    </div>
    <div class="left field contrast_font">
      <?php echo $entry_password; ?><br />
      <input type="password" name="password" value="" />
    </div>
  </div>
  <div style="width: 100%; text-align: right;"><input type="button" value="<?php echo $button_login; ?>" id="button-login" class="button" /></div>
</div>

<script type="text/javascript"><!--
  $('#login input').keydown(function(e) {
  	if (e.keyCode == 13) {
  		$('#button-login').click();
  	}
  });
//--></script>   