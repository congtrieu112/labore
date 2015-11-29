<?php echo $header; ?>
<?php if ($success) { ?>
    <div class="success"><?php echo $success; ?><i class="fa fa-times"></i></div>
<?php } ?>
<?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
      <div class="breadcrumb">
          <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
          <?php } ?>
      </div>
      <h1><?php echo $heading_title; ?></h1>
      <?php if ($products) { ?>
            <table class="compare-info">
                <thead>
                      <tr>
                      </tr>
                </thead>
                <tbody>
                      <tr>
                            <td class="contrast_font"><?php echo $text_name; ?></td>
                            <?php foreach ($products as $product) { ?>
                                  <td class="contrast_font name">
                                      <?php if ($products[$product['product_id']]['thumb']) { ?>
                                            <img src="<?php echo $products[$product['product_id']]['thumb']; ?>" alt="<?php echo $products[$product['product_id']]['name']; ?>" />
                                      <?php } ?>
                                        <a href="<?php echo $products[$product['product_id']]['href']; ?>"><?php echo $products[$product['product_id']]['name']; ?></a>
                                  </td>
                            <?php } ?>
                      </tr>
                       <?php if ($review_status) { ?>
                            <tr>
                                  <td class="contrast_font"><?php echo $text_rating; ?></td>
                                  <?php foreach ($products as $product) { ?>
                                        <td>
                                            <span class="rating r<?php echo $products[$product['product_id']]['rating']; ?>">
                                                  <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
                                            </span>
                                            <br />
                                            <span class="rating_count"><?php echo $products[$product['product_id']]['reviews']; ?></span>
                                      </td>
                              <?php } ?>
                            </tr>
                      <?php } ?>
                      <tr>
                            <td class="contrast_font"><?php echo $text_price; ?></td>
                            <?php foreach ($products as $product) { ?>
                                  <td class="price"><?php if ($products[$product['product_id']]['price']) { ?>
                                        <?php if (!$products[$product['product_id']]['special']) { ?>
                                            <span class="price-new"><?php echo $products[$product['product_id']]['price']; ?></span>
                                        <?php } else { ?>
                                            <span class="price-old"><?php echo $products[$product['product_id']]['price']; ?></span> <span class="price-new"><?php echo $products[$product['product_id']]['special']; ?></span>
                                        <?php } ?>
                                  <?php } ?></td>
                            <?php } ?>
                      </tr>
                      <tr>
                            <td class="contrast_font"><?php echo $text_summary; ?></td>
                            <?php foreach ($products as $product) { ?>
                                  <td class="description"><?php echo $products[$product['product_id']]['description']; ?></td>
                            <?php } ?>
                      </tr>
                      <tr>
                            <td class="contrast_font"><?php echo $text_manufacturer; ?></td>
                            <?php foreach ($products as $product) { ?>
                                  <td><?php echo $products[$product['product_id']]['manufacturer']; ?></td>
                            <?php } ?>
                      </tr>
                      <tr>
                            <td class="contrast_font"><?php echo $text_availability; ?></td>
                            <?php foreach ($products as $product) { ?>
                                  <td><?php echo $products[$product['product_id']]['availability']; ?></td>
                            <?php } ?>
                      </tr>
                      <tr>
                            <td class="contrast_font"><?php echo $text_model; ?></td>
                            <?php foreach ($products as $product) { ?>
                                  <td><?php echo $products[$product['product_id']]['model']; ?></td>
                            <?php } ?>
                      </tr> 
                      <tr>
                            <td class="contrast_font"><?php echo $text_weight; ?></td>
                            <?php foreach ($products as $product) { ?>
                                  <td><?php echo $products[$product['product_id']]['weight']; ?></td>
                            <?php } ?>
                      </tr>
                      <tr>
                            <td class="contrast_font"><?php echo $text_dimension; ?></td>
                            <?php foreach ($products as $product) { ?>
                                  <td><?php echo $products[$product['product_id']]['length']; ?> x <?php echo $products[$product['product_id']]['width']; ?> x <?php echo $products[$product['product_id']]['height']; ?></td>
                            <?php } ?>
                      </tr>
                </tbody>
                <?php foreach ($attribute_groups as $attribute_group) { ?>
                      <thead>
                            <tr>
                                  <td class="compare-attribute contrast_font" colspan="<?php echo count($products) + 1; ?>"><?php echo $attribute_group['name']; ?></td>
                            </tr>
                      </thead>
                      <?php foreach ($attribute_group['attribute'] as $key => $attribute) { ?>
                            <tbody>
                                 <tr>
                                      <td class="contrast_font"><?php echo $attribute['name']; ?></td>
                                      <?php foreach ($products as $product) { ?>
                                            <?php if (isset($products[$product['product_id']]['attribute'][$key])) { ?>
                                                  <td><?php echo $products[$product['product_id']]['attribute'][$key]; ?></td>
                                            <?php } else { ?>
                                                  <td></td>
                                            <?php } ?>
                                      <?php } ?>
                                 </tr>
                            </tbody>
                      <?php } ?>
                <?php } ?>
                <tr>
                      <td></td>
                      <?php foreach ($products as $product) { ?>
                            <td class="action">
                                <a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button contrast" /><i class="fa fa-shopping-cart"></i> <?php echo $button_cart; ?></a><br />
                                <a href="<?php echo $product['remove']; ?>" class="button remove"><i class="fa fa-times"></i> <?php echo $button_remove; ?></a>
                            </td>
                      <?php } ?>
                </tr>
            </table>
      <?php } else { ?>
            <div class="content"><?php echo $text_empty; ?></div>
            <div class="buttons">
                  <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
            </div>
      <?php } ?>
      <?php echo $content_bottom; ?>
</div>
<?php echo $footer; ?>