<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content">
 <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
      <h1><?php echo $heading_title ?></h1>


  	
  	<div class="content"><p><?php echo $text_conditions ?></p></div>
  
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="testimonial">
	<div class="content form">
        
        <div class="input_field_full">
        <b><?php echo $entry_title ?></b>
              <input type="text" name="title" value="<?php echo $title; ?>" size = 90 />
              <?php if ($error_title) { ?>
              <span class="error"><?php echo $error_title; ?></span>
              <?php } ?>
              </div>
              <div class="input_field_full">
            <b><?php echo $entry_enquiry ?><span class="required">*</span></b>
              <textarea name="description" rows="10"><?php echo $description; ?></textarea><br />
              <?php if ($error_enquiry) { ?>
              <span class="error"><?php echo $error_enquiry; ?></span>
              <?php } ?>
              </div>
              
              <div class="input_field_full radio">
            <b><?php echo $entry_rating; ?> </b>
            <span><?php echo $entry_bad; ?></span>&nbsp;
        		<input type="radio" name="rating" value="1" style="margin: 0;" <?php if ( $rating == 1 ) echo 'checked="checked"';?> />
        		&nbsp;
        		<input type="radio" name="rating" value="2" style="margin: 0;" <?php if ( $rating == 2 ) echo 'checked="checked"';?> />
        		&nbsp;
        		<input type="radio" name="rating" value="3" style="margin: 0;" <?php if ( $rating == 3 ) echo 'checked="checked"';?> />
        		&nbsp;
        		<input type="radio" name="rating" value="4" style="margin: 0;" <?php if ( $rating == 4 ) echo 'checked="checked"';?> />
        		&nbsp;
        		<input type="radio" name="rating" value="5" style="margin: 0;" <?php if ( $rating == 5 ) echo 'checked="checked"';?> />
        		&nbsp; <span><?php echo $entry_good; ?></span>
			</div>
              
            <div class="input_field_half">
            <b><?php echo $entry_name ?></b>
              <input type="text" name="name" value="<?php echo $name; ?>" />
              <?php if ($error_name) { ?>
              <span class="error"><?php echo $error_name; ?></span>
              <?php } ?>
			</div>
            
            <div class="input_field_half right">
             <b><?php echo $entry_city ?></b>
			<input type="text" name="city" value="<?php echo $city; ?>" />
			</div>
            
            <div class="input_field_half">
             <b><?php echo $entry_email ?></b>
              <input type="text" name="email" value="<?php echo $email; ?>" />
              <?php if ($error_email) { ?>
              <span class="error"><?php echo $error_email; ?></span>
              <?php } ?>
              </div>
              <div class="clearfix"></div>
              
            	<div class="input_field_full">
              <b><?php echo $entry_captcha; ?><span class="required">*</span></b>
              <input type="text" name="captcha" value="<?php echo $captcha; ?>" /><br>
              <?php if ($error_captcha) { ?>
              <span class="error"><?php echo $error_captcha; ?></span>
              <?php } ?>
              </div>
              
              
        <a style="float:right" onclick="$('#testimonial').submit();" class="button"><span><?php echo $button_send; ?></span></a>

      
              <img src="index.php?route=information/contact/captcha" />
		
		
	  </div>
      
    </form>

  
</div>
<?php echo $footer; ?> 