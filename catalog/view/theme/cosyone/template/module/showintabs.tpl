<div class="box products <?php echo $columns; ?>">
  <div>
    <?php if ($tabs) { ?> 
      <?php if (count($tabs) <= 0) { ?>
        <div class="box-heading">
          <?php foreach ($tabs as $keyTab => $tab) { ?>
            <?php echo $tab['title']; ?>
          <?php } ?>
        </div>
      <?php } else { ?>
        <div id="tabs-<?php echo $module_number; ?>" class="box-heading tabs display-inline margin-bottom-5">
          <?php foreach ($tabs as $keyTab => $tab) { ?>
            <?php $title = "tab-".$module_number."-".$keyTab; ?>
            <?php if($title === 'tab-0-3'): $title = 'skincare'; ?>
            <?php elseif($title === 'tab-0-4'): $title  = "cleanse"; ?>
            <?php elseif($title === 'tab-0-5'): $title  = "exfoliate-tone"; ?>
            <?php elseif($title === 'tab-0-6'): $title  = "moisturise"; ?>
            <?php elseif($title === 'tab-0-7'): $title  = "serums-oils"; ?>
            <?php elseif($title === 'tab-1-8'): $title  = "supplement"; ?>
            <?php elseif($title === 'tab-1-20'): $title = "san-pham-moi-nhat"; ?>
            <?php elseif($title === 'tab-2-9') : $title = "mama-baby"; ?>
            <?php elseif($title === 'tab-2-20'): $title = "san-pham-moi-nhat"; ?>
            <?php elseif($title === 'tab-3-10'): $title = "body_bath"; ?>
            <?php elseif($title === 'tab-3-11'): $title = "face"; ?>
            <?php elseif($title === 'tab-3-12'): $title = "lips"; ?>
            <?php elseif($title === 'tab-3-13'): $title = "eyes"; ?>
            <?php elseif($title === 'tab-3-14'): $title = "skin"; ?>
            <?php elseif($title === 'tab-3-15'): $title = "brushes"; ?>
            <?php elseif($title === 'tab-3-16'): $title = "gifts"; ?>
            <?php elseif($title === 'tab-4-21'): $title = "body-bath"; ?>
            <?php elseif($title === 'tab-4-22'): $title = "body"; ?>
            <?php elseif($title === 'tab-4-23'): $title = "hair"; ?>
            <?php elseif($title === 'tab-4-23'): $title = "hair"; ?>
            <?php elseif($title === 'tab-5-24'): $title = "kit"; ?>
            <?php elseif($title === 'tab-5-25'): $title = "kits-gifts"; ?>
            <?php elseif($title === 'tab-6-26'): $title = "sales"; ?>
            <?php endif; ?>
            <a href="#<?php  echo $title; ?>"><?php echo $tab['title']; ?></a>
          <?php } ?>
        </div>
      <?php } ?>
    </div>
    <?php if ($module_number == 0) { ?>
      <div class="banner_modules contrast">
        <div class="margin-top-5">
          <div class="banner_modules_wrapper column-2">
            <div class="box box-1 r_slideshow-wrapper">
              <a class="p1 slide_arrow_next icon"><i class="fa fa-angle-right"></i></a>
              <a class="n1 slide_arrow_prev icon"><i class="fa fa-angle-left"></i></a>    
              <div class="skincare_slider cycle-slideshow"
                data-cycle-slides="> div"
                data-cycle-slides="> a"
                data-cycle-fx="scrollHorz"
                data-cycle-easing="jswing"
                data-cycle-sync="1"
                data-cycle-delay="4000"
                data-cycle-timeout="4000"
                data-cycle-speed="500"
                data-cycle-pause="1"
                data-cycle-swipe="true"
                data-cycle-prev=".p1"
                data-cycle-next=".n1">
                <?php foreach ($skincare_banners as $key => $value) {?>
                  <div><a href="<?php echo $value["link"]; ?>"><img alt="" src="<?php echo $this->model_tool_image->resize($value["image"], 1140, 300); ?>"></a></div>
                <?php }?>
              </div>
            </div>
            <div class="box box-2 skincare-wrapper">
              <ul style="list-style:none;" class="list-thuonghieu; position: relative;">
                <?php foreach ($manufacturers as $manufacturer) { ?>
                  <li>
                    <a href="<?php echo $manufacturer['href']; ?>"><?php echo $manufacturer['name']; ?></a>
                  </li>
                <?php } ?>
                <li><a href="" style="color:red;">Xem tất cả</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    <?php }?>
        
    <?php if ($module_number == 1) { ?>
      <div class="banner_modules contrast">
        <div class="margin-top-5">
          <div class="banner_modules_wrapper column-2"> 
            <div class="box box-1 r_slideshow-wrapper">
              <a class="p1 slide_arrow_next icon"><i class="fa fa-angle-right"></i></a>
              <a class="n1 slide_arrow_prev icon"><i class="fa fa-angle-left"></i></a> 
              <div class="supplement_slider cycle-slideshow"
                data-cycle-slides="> div"
                data-cycle-slides="> a"
                data-cycle-fx="scrollHorz"
                data-cycle-easing="jswing"
                data-cycle-sync="1"
                data-cycle-delay="4000"
                data-cycle-timeout="4000"
                data-cycle-speed="500"
                data-cycle-pause="1"
                data-cycle-swipe="true"
                data-cycle-prev=".p1"
                data-cycle-next=".n1">
                <?php foreach ($supplement_banners as $key => $value) {?>
                  <a href="<?php echo $value["link"]; ?>"><img alt="" src="<?php echo $this->model_tool_image->resize($value["image"], 1140, 300); ?>"></a>
                <?php }?>
              </div> 
            </div>
            <div class="box box-2 skincare-wrapper">
              <ul style="list-style:none;" class="list-thuonghieu; position: relative;">
                <?php foreach ($manufacturers as $manufacturer) { ?>
                  <li>
                    <a href="<?php echo $manufacturer['href']; ?>"><?php echo $manufacturer['name']; ?></a>
                  </li>
                <?php } ?>
                <li><a href="" style="color:red;">Xem tất cả</a></li>
              </ul>
            </div> 
          </div>
        </div>
      </div>
    <?php }?>   
        
    <?php if ($module_number == 2) { ?>
      <div class="banner_modules contrast">
        <div class="margin-top-5">
          <div class="banner_modules_wrapper column-2"> 
            <div class="box box-1 mama_baby_slider cycle-slideshow"
              data-cycle-slides="> div"
              data-cycle-slides="> a"
              data-cycle-fx="scrollHorz"
              data-cycle-easing="jswing"
              data-cycle-sync="1"
              data-cycle-delay="4000"
              data-cycle-timeout="4000"
              data-cycle-speed="500"
              data-cycle-pause="1"
              data-cycle-swipe="true"
              data-cycle-prev=".p1"
              data-cycle-next=".n1">
              <?php foreach ($mama_baby_banners as $key => $value) {?>
                <a href="<?php echo $value["link"]; ?>"><img alt="" src="<?php echo $this->model_tool_image->resize($value["image"], 1140, 300); ?>"></a>
              <?php }?>
            </div>
            <div class="box box-2 skincare-wrapper">
              <ul style="list-style:none;" class="list-thuonghieu; position: relative;">
                <?php foreach ($manufacturers as $manufacturer) { ?>
                  <li>
                    <a href="<?php echo $manufacturer['href']; ?>"><?php echo $manufacturer['name']; ?></a>
                  </li>
                <?php } ?>
                <li><a href="" style="color:red;">Xem tất cả</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    <?php }?>

    <?php if ($module_number == 3) { ?>
      <div class="banner_modules contrast">
        <div class="margin-top-5">
          <div class="banner_modules_wrapper column-2"> 
            <div class="box box-1 makeup_slider cycle-slideshow"
              data-cycle-slides="> div"
              data-cycle-slides="> a"
              data-cycle-fx="scrollHorz"
              data-cycle-easing="jswing"
              data-cycle-sync="1"
              data-cycle-delay="4000"
              data-cycle-timeout="4000"
              data-cycle-speed="500"
              data-cycle-pause="1"
              data-cycle-swipe="true"
              data-cycle-prev=".p1"
              data-cycle-next=".n1">
              <?php foreach ($makeup_banners as $key => $value) {?>
                <a href="<?php echo $value["link"]; ?>"><img alt="" src="<?php echo $this->model_tool_image->resize($value["image"], 1140, 300); ?>"></a>
              <?php }?>
            </div>
            <div class="box box-2 skincare-wrapper">
              <ul style="list-style:none;" class="list-thuonghieu; position: relative;">
                <?php foreach ($manufacturers as $manufacturer) { ?>
                  <li>
                    <a href="<?php echo $manufacturer['href']; ?>"><?php echo $manufacturer['name']; ?></a>
                  </li>
                <?php } ?>
                <li><a href="" style="color:red;">Xem tất cả</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    <?php }?>

    <?php if ($module_number == 4) { ?>
      <div class="banner_modules contrast">
        <div class="margin-top-5">
          <div class="banner_modules_wrapper column-2"> 
            <div class="box box-1 makeup_slider cycle-slideshow"
              data-cycle-slides="> div"
              data-cycle-slides="> a"
              data-cycle-fx="scrollHorz"
              data-cycle-easing="jswing"
              data-cycle-sync="1"
              data-cycle-delay="4000"
              data-cycle-timeout="4000"
              data-cycle-speed="500"
              data-cycle-pause="1"
              data-cycle-swipe="true"
              data-cycle-prev=".p1"
              data-cycle-next=".n1">
              <?php foreach ($body_bath_banners as $key => $value) {?>
                <a href="<?php echo $value["link"]; ?>"><img alt="" src="<?php echo $this->model_tool_image->resize($value["image"], 1140, 300); ?>"></a>
              <?php }?>
            </div>
            <div class="box box-2 skincare-wrapper">
              <ul style="list-style:none;" class="list-thuonghieu; position: relative;">
                <?php foreach ($manufacturers as $manufacturer) { ?>
                  <li>
                    <a href="<?php echo $manufacturer['href']; ?>"><?php echo $manufacturer['name']; ?></a>
                  </li>
                <?php } ?>
                <li><a href="" style="color:red;">Xem tất cả</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    <?php }?>

    <?php if ($module_number == 5) { ?>
      <div class="banner_modules contrast">
        <div class="margin-top-5">
          <div class="banner_modules_wrapper column-2"> 
            <div class="box box-1 kit_slider cycle-slideshow"
              data-cycle-slides="> div"
              data-cycle-slides="> a"
              data-cycle-fx="scrollHorz"
              data-cycle-easing="jswing"
              data-cycle-sync="1"
              data-cycle-delay="4000"
              data-cycle-timeout="4000"
              data-cycle-speed="500"
              data-cycle-pause="1"
              data-cycle-swipe="true"
              data-cycle-prev=".p1"
              data-cycle-next=".n1">
              <?php foreach ($kit_banners as $key => $value) {?>
                <a href="<?php echo $value["link"]; ?>"><img alt="" src="<?php echo $this->model_tool_image->resize($value["image"], 1140, 300); ?>"></a>
              <?php }?>
            </div>
            <div class="box box-2 skincare-wrapper">
              <ul style="list-style:none;" class="list-thuonghieu; position: relative;">
                <?php foreach ($manufacturers as $manufacturer) { ?>
                  <li>
                    <a href="<?php echo $manufacturer['href']; ?>"><?php echo $manufacturer['name']; ?></a>
                  </li>
                <?php } ?>
                <li><a href="" style="color:red;">Xem tất cả</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    <?php }?>

        <?php if ($module_number == 6) { ?>
      <div class="banner_modules contrast">
        <div class="margin-top-5">
          <div class="banner_modules_wrapper column-2"> 
            <div class="box box-1 sales_slider cycle-slideshow"
              data-cycle-slides="> div"
              data-cycle-slides="> a"
              data-cycle-fx="scrollHorz"
              data-cycle-easing="jswing"
              data-cycle-sync="1"
              data-cycle-delay="4000"
              data-cycle-timeout="4000"
              data-cycle-speed="500"
              data-cycle-pause="1"
              data-cycle-swipe="true"
              data-cycle-prev=".p1"
              data-cycle-next=".n1">
              <?php foreach ($sales_banners as $key => $value) {?>
                <a href="<?php echo $value["link"]; ?>"><img alt="" src="<?php echo $this->model_tool_image->resize($value["image"], 1140, 300); ?>"></a>
              <?php }?>
            </div>
            <div class="box box-2 skincare-wrapper">
              <ul style="list-style:none;" class="list-thuonghieu; position: relative;">
                <?php foreach ($manufacturers as $manufacturer) { ?>
                  <li>
                    <a href="<?php echo $manufacturer['href']; ?>"><?php echo $manufacturer['name']; ?></a>
                  </li>
                <?php } ?>
                <li><a href="" style="color:red;">Xem tất cả</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    <?php }?>
    
    <?php foreach ($tabs as $keyTab => $tab) { ?>
      <?php $title = "tab-".$module_number."-".$keyTab; ?>
      <?php if($title === 'tab-0-3'): $title = 'skincare'; ?>
      <?php elseif($title === 'tab-0-4'): $title  = "cleanse"; ?>
      <?php elseif($title === 'tab-0-5'): $title  = "exfoliate-tone"; ?>
      <?php elseif($title === 'tab-0-6'): $title  = "moisturise"; ?>
      <?php elseif($title === 'tab-0-7'): $title  = "serums-oils"; ?>
      <?php elseif($title === 'tab-1-8'): $title  = "supplement"; ?>
      <?php elseif($title === 'tab-1-20'): $title = "san-pham-moi-nhat"; ?>
      <?php elseif($title === 'tab-2-9') : $title = "mama-baby"; ?>
      <?php elseif($title === 'tab-2-20'): $title = "san-pham-moi-nhat"; ?>
      <?php elseif($title === 'tab-3-10'): $title = "body_bath"; ?>
      <?php elseif($title === 'tab-3-11'): $title = "face"; ?>
      <?php elseif($title === 'tab-3-12'): $title = "lips"; ?>
      <?php elseif($title === 'tab-3-13'): $title = "eyes"; ?>
      <?php elseif($title === 'tab-3-14'): $title = "skin"; ?>
      <?php elseif($title === 'tab-3-15'): $title = "brushes"; ?>
      <?php elseif($title === 'tab-3-16'): $title = "gifts"; ?>
      <?php elseif($title === 'tab-4-21'): $title = "body-bath"; ?>
      <?php elseif($title === 'tab-4-22'): $title = "body"; ?>
      <?php elseif($title === 'tab-4-23'): $title = "hair"; ?>
      <?php elseif($title === 'tab-4-23'): $title = "hair"; ?>
      <?php elseif($title === 'tab-5-24'): $title = "kit"; ?>
      <?php elseif($title === 'tab-5-25'): $title = "kits-gifts"; ?>
      <?php elseif($title === 'tab-6-26'): $title = "sales"; ?>
      <?php endif; ?>
      <div id="<?php echo $title; ?>" class="tab-content">
        <div class="grid_holder">
          <div class="product-grid <?php echo $module_number; ?> <?php if ($carousel) { ?>carousel<?php } ?>">
            <?php foreach ($tab['products'] as $product) { ?>
              <div class="item contrast_font">
                <?php if ($product['thumb']) { ?>
                  <div class="image">
                    <?php if ($product['special'] && $this->config->get('cosyone_percentage_sale_badge') == 'enabled') { ?>
                      <div class="sale_badge">-<?php echo $product['sales_percantage']; ?>%</div>
                    <?php } ?>
                    <?php if ($product['thumb_hover'] && $this->config->get('cosyone_rollover_effect') == 'enabled') { ?>
                      <div class="image_hover">
                        <a href="<?php echo $product['href']; ?>">
                          <img src="<?php echo $product['thumb_hover']; ?>" alt="<?php echo $product['name']; ?>" />
                        </a>
                      </div>
                      <a href="<?php echo $product['href']; ?>">
                        <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" />
                      </a>
                    <?php } elseif ($product['thumb']) { ?>
                      <a href="<?php echo $product['href']; ?>">
                        <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" />
                      </a>
                    <?php } ?>
                  </div><!-- image ends -->
                <?php } ?>
                <div class="information_wrapper">
                  <div class="name">
                    <a href="<?php echo $product['href']; ?>">
                      <?php echo $product['name']; ?>
                    </a>
                  </div>
                  <?php if ($product['price']) { ?>
                    <div class="price">
                      <?php if (!$product['special']) { ?>
                        <?php echo $product['price']; ?>
                      <?php } else { ?>
                        <span class="price-old">
                          <?php echo $product['price']; ?>
                        </span> 
                        <span class="price-new">
                          <?php echo $product['special']; ?>
                        </span>
                       <?php } ?>
                    </div>
                  <?php } ?>
                  <?php if ($product['brand_name'] && $this->config->get('cosyone_brand')) { ?>
                    <span class="brand main_font">
                      <?php echo $product['brand_name']; ?>
                    </span>
                  <?php } ?>
                  <div class="stock-status">
                    <span style="display:inline-block;border-radius:50%;width:8px;height:8px;margin-right:3px;background-color:<?php echo ($product['quantity'] > 0) ? '#50c8ec' : 'red'; ?>;"></span>
                    <span style="font-weight:400;<?php echo ($product['quantity'] > 0) ? 'color:#50c8ec' : 'color:red'; ?>"> <?php echo $product['stock']; ?></span>
                  </div>
                  <div class="rating">
                    <span class="rating r<?php echo $product['rating']; ?>">
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                    </span>
                  </div>
                  <!--<div class="cart">
                    <button type="submit" class="button contrast" onclick="addToCart('<?php echo $product['product_id']; ?>');" >
                      <i class="fa fa-shopping-cart"></i> <?php echo $button_cart; ?>
                    </button>
                  </div> 
                  <div class="icons_wrapper">
                    <a class="sq_icon" onclick="addToWishList('<?php echo $product['product_id']; ?>');" data-tooltip="<?php echo $button_wishlist; ?>">
                      <i class="fa fa-heart"></i>
                    </a>
                    <a class="sq_icon compare" onclick="addToCompare('<?php echo $product['product_id']; ?>');" data-tooltip="<?php echo $button_compare; ?>">
                      <i class="fa fa-arrow-right"></i><i class="fa fa-arrow-left"></i>
                    </a>
                    <?php if ($this->config->get('cosyone_text_ql_' . $this->config->get('config_language_id'))) { ; ?>
                      <a href="<?php echo $product['quickview']; ?>" class="sq_icon qlook quickview" data-tooltip="<?php echo ($this->config->get('cosyone_text_ql_' . $this->config->get('config_language_id'))) ; ?>">
                        <i class="fa fa-eye"></i>
                      </a>
                    <?php } ?>
                    <a class="sq_icon contrast add_to_cart" onclick="addToCart('<?php echo $product['product_id']; ?>');" data-tooltip="<?php echo $button_cart; ?>">
                      <i class="fa fa-shopping-cart"></i>
                    </a>
                    <a class="plain_link wishlist" onclick="addToWishList('<?php echo $product['product_id']; ?>');" ><?php echo $button_wishlist; ?></a>
                    <a class="plain_link compare" onclick="addToCompare('<?php echo $product['product_id']; ?>');" ><?php echo $button_compare; ?></a>
                  </div>-->
                </div><!-- informtion wrapper ends -->
              </div> 
            <?php } ?>
          </div>
          <div class="bottom-banner"></div>
        </div>
      </div>
    <?php } ?>
  <?php } ?>
  
  <?php if ($module_number == 0) { ?>
    <div class="bottom-all-product"><a href="skincare">Tất cả</a><i class="fa fa-caret-right fa-lg"></i></div>
  <?php } ?>
  <?php if ($module_number == 1) { ?>
    <div class="bottom-all-product"><a href="supplement">Tất cả</a><i class="fa fa-caret-right fa-lg"></i></div>
  <?php } ?>
  <?php if ($module_number == 2) { ?>
    <div class="bottom-all-product"><a href="mama-baby">Tất cả</a><i class="fa fa-caret-right fa-lg"></i></div>
  <?php } ?> 
  <?php if ($module_number == 3) { ?>
    <div class="bottom-all-product"><a href="makeup">Tất cả</a><i class="fa fa-caret-right fa-lg"></i></div>
  <?php } ?> 
  <?php if ($module_number == 4) { ?>
    <div class="bottom-all-product"><a href="body-bath">Tất cả</a><i class="fa fa-caret-right fa-lg"></i></div>
  <?php } ?> 
  <?php if ($module_number == 5) { ?>
    <div class="bottom-all-product"><a href="kit">Tất cả</a><i class="fa fa-caret-right fa-lg"></i></div>
  <?php } ?> 
  <?php if ($module_number == 6) { ?>
    <div class="bottom-all-product"><a href="sales">Tất cả</a><i class="fa fa-caret-right fa-lg"></i></div>
  <?php } ?> 
</div>
<script type="text/javascript"><!--
  $('#tabs-<?php echo $module_number; ?> a').tabs();
//--></script>

<?php if ($carousel) { ?>
  <script type="text/javascript"><!--
    $(document).ready(function() {
    var grid5 = 5;
    var grid4 = 4;
    var grid3 = 3;
    var grid1 = 1;
    $('.product-grid.<?php echo $module_number; ?>').owlCarousel({
    itemsCustom: [ [0, 1], [350, 2], [550, 3], [1025, <?php echo $columns; ?>]],

    pagination: false,
    navigation:true,
    slideSpeed:500,
    scrollPerPage:false,
    navigationText: [
    "<div class='slide_arrow_prev'><i class='fa fa-angle-left'></i></div>",
    "<div class='slide_arrow_next'><i class='fa fa-angle-right'></i></div>"
    ]
  }); 
}); 
//--></script>
<style type="text/css" media="screen">
  .information_wrapper .name a{
    min-height: 34px;
    display: block; 
  } 
</style>
<?php } ?>