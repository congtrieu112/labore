<?php echo $header; ?>
<?php if ($success) { ?>
<div class="success"><?php echo $success; ?></div>
<?php } ?>
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
  <?php echo $text_description; ?><br />
  <div class="login-content">
    <div class="left">
      <div class="box-heading"><?php echo $text_new_affiliate; ?></div>
      <div class="content"><?php echo $text_register_account; ?></div>
      <a href="<?php echo $register; ?>" class="button"><?php echo $button_continue; ?></a>
    </div>
    <div class="right">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <div class="box-heading"><?php echo $text_returning_affiliate; ?></div>
        <div class="content form">
          <p><?php echo $text_i_am_returning_affiliate; ?></p>
          <div class="input_field_full">
          <b><?php echo $entry_email; ?></b>
          <input type="text" name="email" value="<?php echo $email; ?>" />
          </div>
          <div class="input_field_full">
          <b><?php echo $entry_password; ?></b>
          <input type="password" name="password" value="<?php echo $password; ?>" />
         </div>
          </div><a href="<?php echo $forgotten; ?>" class="forgotten"><?php echo $text_forgotten; ?></a>
          <input type="submit" value="<?php echo $button_login; ?>" class="button" />
          <?php if ($redirect) { ?>
          <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
          <?php } ?>
      </form>
    </div>
  </div>
  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>