<div class="categoryslideshow">
  <?php if(count($banners) > 1):?>
  <div id="categoryslideshow<?php echo $module; ?>" class="nivoSlider">
  <?php else: ?>
  <div>
  <?php endif;?>
    <?php foreach ($banners as $banner) { ?>
    <?php if ($banner['link']) { ?>
    <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" /></a>
    <?php } else { ?>
    <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" />
    <?php } ?>
    <?php } ?>
  </div>
</div>

<script type="text/javascript"><!--
$(document).ready(function() {
	$('#categoryslideshow<?php echo $module; ?>').nivoSlider();
});
--></script>