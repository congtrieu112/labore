<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
      <div class="breadcrumb">
            <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                 <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
            <?php } ?>
      </div>
      <h1><?php echo $heading_title; ?></h1>
      <div class="sitemap-info">
            <div class="left">
                  <ul>
                      <?php foreach ($categories as $category_1) { ?>
                            <li>
                                 <a href="<?php echo $category_1['href']; ?>"><i class="fa fa-bars"></i>&nbsp;&nbsp;<?php echo $category_1['name']; ?></a>
                                 <?php if ($category_1['children']) { ?>
                                      <ul>
                                            <?php foreach ($category_1['children'] as $category_2) { ?>
                                                  <li>
                                                       <a href="<?php echo $category_2['href']; ?>"><i class="fa fa-file-o"></i>&nbsp;&nbsp;<?php echo $category_2['name']; ?></a>
                                                       <?php if ($category_2['children']) { ?>
                                                              <ul>
                                                                  <?php foreach ($category_2['children'] as $category_3) { ?>
                                                                        <li><a href="<?php echo $category_3['href']; ?>"><i class="fa fa-check"></i>&nbsp;&nbsp;<?php echo $category_3['name']; ?></a></li>
                                                                  <?php } ?>
                                                              </ul>
                                                        <?php } ?>
                                                  </li>
                                            <?php } ?>
                                      </ul>
                                 <?php } ?>
                            </li>
                      <?php } ?>
                  </ul>
            </div>    
            <div class="right">
                <ul>
                      <li><a href="<?php echo $special; ?>"><i class="fa fa-usd"></i>&nbsp;&nbsp;<?php echo $text_special; ?></a></li>
                      <li><a href="<?php echo $account; ?>"><i class="fa fa-sign-in"></i>&nbsp;&nbsp;<?php echo $text_account; ?></a>
                            <ul>
                                <li><a href="<?php echo $edit; ?>"><i class="fa fa-check"></i>&nbsp;&nbsp;<?php echo $text_edit; ?></a></li>
                                <li><a href="<?php echo $password; ?>"><i class="fa fa-check"></i>&nbsp;&nbsp;<?php echo $text_password; ?></a></li>
                                <li><a href="<?php echo $address; ?>"><i class="fa fa-check"></i>&nbsp;&nbsp;<?php echo $text_address; ?></a></li>
                                <li><a href="<?php echo $history; ?>"><i class="fa fa-check"></i>&nbsp;&nbsp;<?php echo $text_history; ?></a></li>
                                <li><a href="<?php echo $download; ?>"><i class="fa fa-check"></i>&nbsp;&nbsp;<?php echo $text_download; ?></a></li>
                            </ul>
                      </li>
                      <li><a href="<?php echo $cart; ?>"><i class="fa fa-shopping-cart"></i>&nbsp;&nbsp;<?php echo $text_cart; ?></a></li>
                      <li><a href="<?php echo $checkout; ?>"><i class="fa fa-ship"></i>&nbsp;&nbsp;<?php echo $text_checkout; ?></a></li>
                      <li><a href="<?php echo $search; ?>"><i class="fa fa-search"></i>&nbsp;&nbsp;<?php echo $text_search; ?></a></li>
                      <li><i class="fa fa-info"></i>&nbsp;&nbsp;<?php echo $text_information; ?>
                            <ul>
                                  <?php foreach ($informations as $information) { ?>
                                       <li><a href="<?php echo $information['href']; ?>"><i class="fa fa-check"></i>&nbsp;&nbsp;<?php echo $information['title']; ?></a></li>
                                  <?php } ?>
                            </ul>
                      </li>
                      <li><a href="<?php echo $contact; ?>"><i class="fa fa-mobile"></i>&nbsp;&nbsp;<?php echo $text_contact; ?></a></li>
                </ul>
          </div>
      </div>
      <?php echo $content_bottom; ?>
</div>
<?php echo $footer; ?>