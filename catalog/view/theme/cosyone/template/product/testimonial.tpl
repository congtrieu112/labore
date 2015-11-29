<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>  
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
      <h1><?php echo $heading_title; ?></h1>

  <div class="middle">

    <?php if ($testimonials) { ?>
    
      <?php foreach ($testimonials as $testimonial) { ?>
      
      <div class="testimonial_list">
      <span class="heading"><?php echo $testimonial['title']; ?></span>

          <div class="testimonial"><?php echo $testimonial['description'] ; ?></div>

          
			<div class="contrast_font">
			<?php echo $testimonial['name']; ?>, 
			<span class="city"><?php echo $testimonial['city']; ?></span>
			</div>

                <?php if ($testimonial['rating']) { ?>
                <span class="rating r<?php echo $testimonial['rating']; ?>">
                <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
                </span>
                <?php } ?>
    	</div>
      <?php } ?>

    	<?php if ( isset($pagination)) { ?>
    		<div class="pagination"><?php echo $pagination;?></div>
    		<div class="buttons" align="right">
            <a class="button remove" href="<?php echo $write_url;?>" title="<?php echo $write;?>"><i class="fa fa-pencil"></i> <?php echo $write;?></a>
            </div>
    	<?php }?>

    	<?php if (isset($showall_url)) { ?>
    		<div class="buttons" align="right">
            <a class="button remove" href="<?php echo $write_url;?>" title="<?php echo $write;?>"><i class="fa fa-pencil"></i> <?php echo $write;?></a>
            <a class="button remove" href="<?php echo $showall_url;?>" title="<?php echo $showall;?>"><?php echo $showall;?></a>
            </div>
    	<?php }?>
    <?php } ?>
  </div>
  
</div>
<?php echo $footer; ?> 