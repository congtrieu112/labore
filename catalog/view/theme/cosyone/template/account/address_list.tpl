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
  <div class="content">
  <h3><?php echo $text_address_book; ?></h3>
  <?php foreach ($addresses as $result) { ?>
    <div class="address_list">
       <a href="<?php echo $result['delete']; ?>" data-tooltip="<?php echo $button_delete; ?>" class="sq_icon"><i class="fa fa-times"></i></a>
       <a href="<?php echo $result['update']; ?>" data-tooltip="<?php echo $button_edit; ?>" class="sq_icon"><i class="fa fa-pencil"></i></a> 
       <?php echo $result['address']; ?>
     </div>
  <?php } ?>
  </div>
  <div class="buttons">
    <div class="left"><a href="<?php echo $back; ?>" class="button"><?php echo $button_back; ?></a></div>
    <div class="right"><a href="<?php echo $insert; ?>" class="button"><?php echo $button_new_address; ?></a></div>
  </div>
  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>