<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
      <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($this->config->get('success_page_status')) { ?>
    <?php if ($this->config->get('success_page_to_default')) { ?>
      <h1><?php echo $heading_title; ?></h1>
    <?php } ?>
    <?php if ($this->config->get('success_page_facebook_status')) { ?>
      <div id="fb-root"></div>
      <script>(function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = "//connect.facebook.net/en_EN/all.js#xfbml=1";
        fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));
      </script>
    <?php } ?>
  <?php } else { ?>
    <h1><?php echo $heading_title; ?></h1>
  <?php } ?>
  <?php echo $text_message; ?>
  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
  </div>
  <?php echo $content_bottom; ?>
</div>
<?php echo $footer; ?>

<?php if(isset($link_pay)&&isset($code_pay)&&$code_pay=="nganluong") {
  echo '<script language="javascript">location.href ="'.$link_pay.'";</script>'; 
} ?>