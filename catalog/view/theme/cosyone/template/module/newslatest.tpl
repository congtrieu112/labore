<?php if ($position == 'content_top'  or $position == 'content_bottom') { ?>
      <div class="box">
           <div class="box-heading"><?php echo $heading_title; ?></div>
           <div class="grid_holder grid3">
                <div class="product-grid">
                      <?php foreach ($newss as $news) { ?>
                            <div class="item contrast_font">
                                  <?php if ($news['thumb']) { ?>
                                      <div class="image">
                                            <a href="<?php echo $news['href']; ?>">
                                                  <img src="<?php echo $news['thumb']; ?>" alt="<?php echo $news['name']; ?>" <?php echo $news['width']; ?> <?php echo $news['height']; ?> />
                                            </a>
                                      </div>
                                  <?php } ?>
                                 <div class="information_wrapper">
                                      <div class="name">
                                            <a href="<?php echo $news['href']; ?>"><?php echo $news['name']; ?></a>
                                      </div>
                                      <?php echo $news['short_description'];?>
                                 </div>
                            </div>
                      <?php } ?>
                </div>
           </div>
      </div>
 <?php } else if ($position == 'column_left' or $position == 'column_right') { ?>                            
      <div class="box products grid1">
          <div class="box-heading"><?php echo $heading_title; ?></div>
           <div class="grid_holder">
                <div class="product-grid">
                      <?php foreach ($newss as $news) { ?>
                            <div class="item contrast_font">
                                  <?php if ($news['thumb']) { ?>
                                        <div class="image">
                                            <a href="<?php echo $news['href']; ?>">
                                                  <img src="<?php echo $news['thumb']; ?>" alt="<?php echo $news['name']; ?>" <?php echo $news['width']; ?> <?php echo $news['height']; ?> />
                                            </a>
                                       </div>
                                  <?php } ?>
                                  <div class="information_wrapper">
                                      <div class="left">
                                            <div class="name"><a href="<?php echo $news['href']; ?>"><?php echo $news['name']; ?></a></div>
                                       </div>
                                       <!--<?php echo $news['short_description'];?>-->
                                  </div>
                            </div>
                      <?php } ?>
                </div>
            </div>
      </div>                           
<?php } ?>
