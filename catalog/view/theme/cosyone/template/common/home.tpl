<?php echo $header; ?>
</div>
<script type="text/javascript">
	$("li.home").addClass("current");
	$(".breadcrumb_wrapper").hide();
</script>
<?php echo $home_top_fullwidth; ?>
<div class="inner_container main">
<?php echo $home_top_top; ?>
<div class="home_top_wrapper">
	<?php echo $home_top_center; ?><?php echo $home_top_right; ?>
</div>
<?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content" class="homepage">
<?php echo $content_top; ?>
<h1 style="display: none;"><?php echo $heading_title; ?></h1>
<?php echo $content_bottom_half; ?>
<?php echo $content_bottom; ?>
</div>
<?php echo $footer; ?>