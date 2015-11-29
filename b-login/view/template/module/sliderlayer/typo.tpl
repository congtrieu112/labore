<script type="text/javascript" src="view/javascript/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
<link rel="stylesheet" href="<?php echo $typoFile;?>" type="text/css">
<!-- Custom colors -->
<?php if($this->config->get('cosyone_use_custom') == 'enabled'){ ?>
<?php require( 'custom_style.tpl' ); ?>

<?php } else { ?> 
<style>

</style>
<?php } ?>
<!-- Custom colors -->

<!-- Custom fonts -->
<?php if($this->config->get('cosyone_use_custom_font') == 'enabled'){ ?>
<?php require( 'custom_fonts.tpl' ); ?>
<?php } else { ?>
<link href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,600' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Roboto+Slab:300,400,500,600,700' rel='stylesheet' type='text/css'>  
<style>
.contrast_font_heading,
.contrast_font_heading_dark,
.contrast_font_heading_primary,
.contrast_font_heading_secondary, 
.contrast_font_heading2,
.contrast_font_heading2_dark,
.contrast_font_heading2_primary,
.contrast_font_heading2_secondary, 
.contrast_font_sub_heading,
.contrast_font_sub_heading_dark,
.contrast_font_sub_heading_primary,
.contrast_font_sub_heading_secondary,
.contrast_font, 
.contrast_font_dark, 
.contrast_font_primary, 
.contrast_font_secondary, 
.contrast_font_slider_button, 
.contrast_font_slider_button_dark, 
.contrast_font_slider_button_primary,
.contrast_font_slider_button_secondary,
.contrast_font_slider_button_secondary a { font-family: 'Roboto Slab', serif;}
	
body { font-family: 'Roboto', serif;}
</style>
<?php } ?>
<!-- Custom fonts -->


<style>
	.typo{ position: relative; width: 90%; min-height: 50px; padding:12px 0;}
	.typo .tp-caption {
	    display: block;
	    left: 0;
	    margin: 0;
	    padding: 0;
	    top: 0;
	}
	.note{ font-size: 12px;}
	.note a { color: #003A88 }
</style>
<div class="typos">
	<div class="note"> 
		NOTE: <p>These Below Typos are getting in the file:<a href="<?php echo $typoFile ?>" target="_blank"><?php echo $typoFile; ?></a>
		<br>you can open this file and add yours css style and it will be listed in here!!!</p>
		<p>To Select One, You Click The Text Of Each Typo</p>
	</div>
	 
	<div class="typos-wrap">	
  		
		<?php foreach( $captions as $caption ) {  ?>
  		<div class="typo"><div class="tp-caption <?php echo $caption;?>" data-class="<?php echo $caption;?>">Use This Caption Typo</div></div>
  		<?php } ?>	
	 </div>
</div>  

<script type="text/javascript">
$('div.typo').live('click', function() {  
	parent.$('#<?php echo $field; ?>').attr('value',  $("div", this).attr("data-class") );
	parent.$('#dialog').dialog('close');
			
	parent.$('#dialog').remove();	
});
</script>