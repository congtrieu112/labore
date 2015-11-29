<?php if (($style) == ('box')) { ?>
  <div class="box newsletter boxed primary_background">
    <div class="inner">
      <div class="box-content">
        <span class="heading"><?php echo $heading_title; ?></span>
        <p><?php echo $heading_welcome; ?></p>
        <form name="subscribe" id="subscribe<?php echo $module; ?>">
          <div style="display:none;">
            <input type="text" placeholder="<?php echo $entry_name; ?>" value="" name="subscribe_name" id="subscribe_name">
          </div>
          <div class="subscribe_form">
            <input type="text" placeholder="<?php echo $entry_email; ?>" value="" name="subscribe_email" id="subscribe_email">
            <a class="subscribe_icon" onclick="email_subscribe<?php echo $module; ?>()"><i class="fa fa-envelope"></i></a>
          </div>
    			<?php if($option_unsubscribe) { ?>
    			   <a class="unsubscribe" onclick="email_unsubscribe<?php echo $module; ?>()"><span><?php echo $entry_unbutton; ?></span></a>
    			<?php } ?>    
        </form>
        <div id="success_notification"></div>
      </div>
  	</div>
  </div>

<?php } else if (($style) == ('default')) { ?>  
  <div class="box-category newsletter">
    <div class="heading-category"><?php echo $heading_title; ?></div>
    <div class="box-content">
      <p class="contrast_font intro"><?php echo $heading_welcome; ?></p>
      <form name="subscribe" id="subscribe<?php echo $module; ?>">
        <div <?php if(!$thickbox) { ?>style="display:none;"<?php } ?>>
          <input type="text" placeholder="<?php echo $entry_name; ?>" value="" name="subscribe_name" id="subscribe_name">
        </div>
        <input type="text" placeholder="<?php echo $entry_email; ?>" value="" name="subscribe_email" id="subscribe_email">
        <a class="button" onclick="email_subscribe<?php echo $module; ?>()"><span><?php echo $entry_button; ?></span></a>
    		<?php if($option_unsubscribe) { ?>
    			<a class="button remove" onclick="email_unsubscribe<?php echo $module; ?>()"><span><?php echo $entry_unbutton; ?></span></a>
    		<?php } ?>    
      </form>
      <div id="success_notification"></div>
  	</div>
  </div>

<?php } else if (($style) == ('popup')) { ?>
  <div class="init_popup">
    <div style="display: none;" class="window_holder">
      <div class="window_content primary_border">
        <div class="box newsletter boxed popup">
          <div class="inner primary_background">
            <a class="popup_close">X</a>
            <div class="box-content">
              <div class="popup_block">
                <?php echo $custom_block; ?>
  		        </div>
              <form name="subscribe" id="subscribe<?php echo $module; ?>">
                <div class="field" <?php if(!$thickbox) { ?>style="display:none;"<?php } ?>>
                  <input type="text" placeholder="<?php echo $entry_name; ?>" value="" name="subscribe_name" id="subscribe_name">
                </div>
                <div class="subscribe_form field">
                  <input type="text" placeholder="<?php echo $entry_email; ?>" value="" name="subscribe_email" id="subscribe_email">
                </div>
			          <?php if($option_unsubscribe) { ?>
			             <a class="button unsubscribe" onclick="email_unsubscribe<?php echo $module; ?>()"><span><?php echo $entry_unbutton; ?></span></a>
                <?php } ?>  
                <a class="button" onclick="email_subscribe<?php echo $module; ?>()"><span><?php echo $entry_button; ?></span></a>  
              </form>
              <div id="success_notification"></div>
            </div>
		      </div>
        </div>
      </div>
    </div>
  </div>
  <div class="popup_mask popup_close" style="display: none;"></div>
<?php } ?>

<?php if(!isset($_COOKIE['newsletter_already_popup'])) { ?>
<script type="text/javascript">
$(document).ready(function() {	
if ($(window).width() > 760) {
	setTimeout(function() {	
		$('.popup_mask').fadeTo(750,0.5);	
		$('.window_holder').show();
		setTimeout(function() { $('.window_holder').addClass('active'); }, 750);
	}, <?php echo $popup_delay_time; ?>);
		
	$('.popup_close').click(function () {
		$('.popup_mask').hide();
		$('.window_holder').hide();
	});	
};
<?php if ($popup_only_show_once) { ?>
$.cookie( 'newsletter_already_popup' , 1 , { expires: 14 , path: '/' });
<?php } ?>
});
</script>
<?php } ?>

<script type="text/javascript">
$('.box.newsletter').click(function(e){
    e.preventDefault();
    $(this).find('#success_notification').addClass('active');
});

function email_subscribe<?php echo $module; ?>(){
	$.ajax({
			type: 'post',
			url: 'index.php?route=module/newslettersubscribe/subscribe',
			dataType: 'html',
            data:$("#subscribe<?php echo $module; ?>").serialize(),
			success: function (html) {
				eval(html);
			}}); 
	
	//$('html, body').animate({ scrollTop: 0 }, 'slow'); 
	
}
function email_unsubscribe<?php echo $module; ?>(){
	$.ajax({
			type: 'post',
			url: 'index.php?route=module/newslettersubscribe/unsubscribe',
			dataType: 'html',
            data:$("#subscribe<?php echo $module; ?>").serialize(),
			success: function (html) {
				eval(html);
			}}); 
	
	//$('html, body').animate({ scrollTop: 0 }, 'slow'); 
	
}
</script>

