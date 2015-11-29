<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />
<title><?php echo $title; ?></title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/cosyone/stylesheet/stylesheet.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/cosyone/stylesheet/grid/<?php echo $this->config->get('cosyone_max_width')?>.css" />
<link href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<?php if($this->config->get('cosyone_use_responsive') == 'enabled'){ ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/cosyone/stylesheet/responsive.css" />
<?php } ?>
<?php foreach ($styles as $style) { ?>
<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
<script type="text/javascript" src="catalog/view/theme/cosyone/js/owl.carousel.min.js"></script>
<script type="text/javascript" src="catalog/view/theme/cosyone/js/cosyone_common.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />
<script type="text/javascript" src="catalog/view/javascript/jquery/tabs.js"></script>

<?php foreach ($scripts as $script) { ?>
      <script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>
<!--[if IE 8]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/cosyone/stylesheet/ie8.css" />
<![endif]-->
<?php if ($stores) { ?>
	<script type="text/javascript"><!--
		$(document).ready(function() {
			<?php foreach ($stores as $store) { ?>
				$('body').prepend('<iframe src="<?php echo $store; ?>" style="display: none;"></iframe>');
			<?php } ?>
		});
	//--></script>
<?php } ?>
<!--<script>
	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	 })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

	ga('create', 'UA-66085790-1', 'auto');
	ga('require', 'linkid', 'linkid.js');
	ga('require', 'displayfeatures'); 
	ga('send', 'pageview'); 
</script>-->
<!-- Custom css -->
<?php if($this->config->get('cosyone_use_custom_css') == 'enabled'){ ?>
<style>
	<?php echo html_entity_decode($this->config->get('cosyone_custom_css_content'), ENT_QUOTES, 'UTF-8'); ?>
</style>
<?php } ?>
<!-- Custom styling -->
<?php if($this->config->get('cosyone_use_custom') == 'enabled'){ require( 'custom_style.tpl' ); } ?>
<!-- Custom script -->
<?php if($this->config->get('cosyone_use_custom_javascript') == 'enabled'){ ?>
	<script type="text/javascript">
		$(document).ready(function() {
			<?php echo html_entity_decode($this->config->get('cosyone_custom_javascript_content'), ENT_QUOTES, 'UTF-8'); ?>
		});
	</script>
<?php } ?>
<!-- Custom fonts -->
<?php if($this->config->get('cosyone_use_custom_font') == 'enabled'){ ?>
	<?php require( 'custom_fonts.tpl' ); ?>
<?php } else { ?>
	<link href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,600' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Roboto+Slab:300,400,500,600,700' rel='stylesheet' type='text/css'>  
<?php } ?>
</head>
<body>
  <!-- Cookie message -->
  <?php if((!isset($_COOKIE['cookie_check'])) && ($this->config->get('cosyone_use_cookie'))){ require( 'cookie_control.tpl' ); } ?>
  <div class="outer_container 
  	<?php echo $this->config->get('cosyone_default_product_style')?> 
  	<?php if($this->config->get('cosyone_use_custom') == 'enabled'){ echo $this->config->get('cosyone_container_layout'); } ?> 
  	<?php echo $this->config->get('cosyone_use_breadcrumb')?>">
      <div class="header_wrapper 
        <?php echo $this->config->get('cosyone_menu_sticky')?> 
        <?php echo $this->config->get('cosyone_menu_border')?> 
        <?php echo $this->config->get('cosyone_header_style')?>">
        <div class="header_top_line_wrapper">
          <div class="header_top_line inner_container">
            <?php if($this->config->get('cosyone_header_style') == 'header1'){ ?>
            <?php } else { ?>
              <div class="drop_downs_wrapper">
                <?php echo $header_login; ?>
            	   <?php echo $language; ?>
              	<?php echo $currency; ?>
              </div>
            <?php } ?>
           	<div class="promo_message">
              <!--<?php echo html_entity_decode($this->config->get('cosyone_top_promo_message_' . $this->config->get('config_language_id')), ENT_QUOTES, 'UTF-8'); ?>-->
              <?php if($facebook) { ?>
                <a class="external sq_icon" href="<?php echo $facebook; ?>">
                  <i class="fa fa-facebook"></i>
                </a>
              <?php } ?>
              <?php if($twitter) { ?>
                <a class="external sq_icon" href="<?php echo $twitter; ?>">
                  <i class="fa fa-twitter"></i>
                </a>
              <?php } ?>
              <?php if($google) { ?>
                <a class="external sq_icon" href="<?php echo $google; ?>">
                  <i class="fa fa-google-plus"></i>
                </a>
              <?php } ?>
              <?php if($linkedin) { ?>
                <a class="external sq_icon" href="<?php echo $linkedin; ?>">
                  <i class="fa fa-linkedin"></i>
                </a>
              <?php } ?>
            </div>
            <div class="links contrast_font">
              <!--<a href="<?php echo $account; ?>"><?php echo $text_account; ?></a>-->
              <?php echo $language; ?>
              <div class="information_current contrast_font">
                <a class="head"><?php echo $text_information; ?></a>
                <div id="information" class="top_information_drop_down">
                  <?php if ($informations) { ?>
                    <?php foreach ($informations as $information) { ?>
                      <a class="current" href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a>
                    <?php } ?>
                  <?php } ?>
                </div>
              </div>
              <?php echo $header_login; ?>
              <!--<a><i class="fa fa-phone"></i>&nbsp;&nbsp;<?php echo $telephone; ?></a>
              <a href="<?php echo $wishlist; ?>" id="wishlist-total"><?php echo $text_wishlist; ?></a>
              <a href="<?php echo $shopping_cart; ?>"><?php echo $text_shopping_cart; ?></a>-->
              <!--<a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a>-->
            </div>
            <div class="clearfix"></div>
          </div>
        </div>
        <div class="inner_container header">
          <div class="header_main">
            <div class="header_right"> 
              <?php if ($logo) { ?>
              	<div class="logo">
                  <a href="<?php echo $home; ?>">
                    <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" />
                  </a>
              	</div>
              <?php } ?>
              <div class="mobile_clear"></div>
              <!-- Position for header login, lang, curr, in the header main -->
            	<?php if($this->config->get('cosyone_header_style') == 'header1'){ ?>
                <div class="search-holder">
                  <div id="search">
                    <i class="fa fa-search button-search btn btn-danger"></i>
                    <input type="text" name="search" class="search_input" placeholder="<?php echo $text_search; ?>" value="<?php echo $search; ?>" />
                  </div>
                </div>
                <?php echo $cart; ?>
                <?php echo $currency; ?>
              <?php } ?> 
            </div>
            <a class="header__newsletter__link" href="http://www.lazada.vn/cach-mang-mua-sam-online/">
              <img alt="Cách mạng mua sắm trực tuyến" src="http://static.lazada.vn/cms/header/top-head.jpg" style="margin: 20px 0;">
            </a>
          </div>           
                      
        	<div class="menu_wrapper">
            <div class="inner_container menu_border"></div>
            <div class="inner_container menu_holder">
              <div id="menu">
                <a class="mobile_menu_trigger up_to_tablet"><i class="fa fa-bars"></i> <?php echo $cosyone_text_mobile_menu; ?></a>
              	<ul class="only_desktop">
            	    <li class="home only_desktop <?php echo $this->config->get('cosyone_show_home_icon') ?>"><a href="<?php echo $home; ?>"><?php echo $text_home; ?></a></li>
                   		<!-- Category Product-->
                  <?php if ($categories) { ?>
                   	<?php foreach ($categories as $category_1) { ?>
                    	<?php if ($category_1['category_1_id'] == $category_1_id) { ?>
    		                <li class="col<?php echo $category_1['column']; ?> current"><a href="<?php echo $category_1['href']; ?>" ><?php echo $category_1['name']; ?><i class="fa fa-sort-desc"></i></a>
                    	<?php } else { ?>
                        <li class="col<?php echo $category_1['column']; ?>"><a href="<?php echo $category_1['href']; ?>" ><?php echo $category_1['name']; ?><i class="fa fa-sort-desc"></i></a>
                    	<?php } ?>
                      	<?php if ($category_1['children']) { ?>
                          <div class="menu_drop_down" style="width: <?php echo ((($category_1['column']) * (195)) + (10)); ?>px">
                            <div class="wrapper">
                              <ul>
                                <?php foreach ($category_1['children'] as $category_2) { ?>
                                  <li class="column level2">
                                    <a href="<?php echo $category_2['href']; ?>"><?php echo $category_2['name']; ?><i class="fa fa-caret-right"></i></a>
                                    <?php if($this->config->get('cosyone_menu_mega_second_thumb') == 'enabled' && $category_2['thumb']) { ?>
                                      <img src="<?php echo $category_2['thumb']; ?>" alt="<?php echo $category_2['name']; ?>"/>
                                    <?php } ?>
                                    <?php if ($category_2['children']) { ?>
                                      <div class="third">
                                        <ul>
                                          <?php foreach ($category_2['children'] as $category_3) { ?>
                                            <li><a href="<?php echo $category_3['href']; ?>"><?php echo $category_3['name']; ?></a></li>
                                          <?php } ?>
                                        </ul>
                                      </div>
                                    <?php } ?>
                                  </li>
                                <?php } ?>
                              </ul>
                            </div><!-- wrapper ends -->
                          </div>
            	          <?php } ?>
                      </li>
                    <?php } ?>
                    <!-- End Category Product-->
                  <?php } ?>
                  <!--<li><a href="<?php echo $gallery; ?>"><?php echo $text_gallery; ?></a></li>-->
                  <li><a href="http://gaotanny.vn" target="_blank">Blog</a></li>
                  <!--<?php foreach ($categoriesnews as $cat) { ?>
                    <li class="col1">
                      <a href="<?php echo $cat['href']; ?>"><?php echo $cat['name']; ?><i class="fa fa-sort-desc"></i></a>
                      <?php if ($cat['children']) { ?>
                        <div class="menu_drop_down">
                          <div class="wrapper">
                          	<?php for ($i = 0; $i < count($cat['children']);) { ?>
                              <ul>
                                <?php $j = $i + ceil(count($cat['children']) / $cat['column']); ?>
                                <?php for (; $i < $j; $i++) { ?>
                                  <?php if (isset($cat['children'][$i])) { ?>                                     
                                    <li class="column level2">
                                      <?php if(count($cat['children'][$i]['children_level2'])>0){ ?>
                                        <a href="<?php echo $cat['children'][$i]['href']; ?>">
                                          <?php echo $cat['children'][$i]['name']; ?><i class="fa fa-caret-right"></i>
                                        </a>
                                      <?php } else { ?>
                                        <a href="<?php echo $cat['children'][$i]['href']; ?>">
                                        	<?php echo $cat['children'][$i]['name']; ?>
                                        </a>
                                      <?php } ?>

                                      <?php if ($cat['children'][$i]['children_level2']) { ?>
                                        <div class="third">
                                          <ul id="id_menu_<?php echo $cat['children'][$i]['id']; ?>">
                                            <?php for ($wi = 0; $wi < count($cat['children'][$i]['children_level2']); $wi++) { ?>
                                              <li>
                                                <a href="<?php echo $cat['children'][$i]['children_level2'][$wi]['href']; ?>"  >
                                                </a>
                                              </li>
                                           	<?php } ?>
                                          </ul>
                                        </div>
                                      <?php } ?>          
                                    </li>
                                                                    
                                  <?php } ?>
                                <?php } ?>
                              </ul>
                            <?php } ?>
                          </div>
                        </div>
                      <?php } ?>
                    </li>
                  <?php } ?>-->

                  <?php if($this->config->get('cosyone_custom_menu_block') == 'enabled'){ ?>
        		        <li class="withsubs custom_block"><a><?php echo ($this->config->get('cosyone_custom_menu_block_title_' . $this->config->get('config_language_id'))) ?><i class="fa fa-sort-desc"></i></a>
                      <div class="menu_drop_down" style="width:<?php echo $this->config->get('cosyone_menu_block_width') ?>px"><?php echo html_entity_decode($this->config->get('cosyone_menu_custom_block_' . $this->config->get('config_language_id')), ENT_QUOTES, 'UTF-8'); ?></div>
                    </li>
                  <?php } ?>
                  <?php if($this->config->get('cosyone_custom_menu_link1') == 'enabled'){ ?>
        		        <li><a href="<?php echo $this->config->get('cosyone_custom_menu_url1')?>"><?php echo ($this->config->get('cosyone_custom_menu_title1_' . $this->config->get('config_language_id'))) ?></a>
        		        </li>
                  <?php } ?>
                  <?php if($this->config->get('cosyone_custom_menu_link2') == 'enabled'){ ?>
        		        <li><a href="<?php echo $this->config->get('cosyone_custom_menu_url2')?>"><?php echo ($this->config->get('cosyone_custom_menu_title2_' . $this->config->get('config_language_id'))) ?></a>
        		        </li>
      		        <?php } ?>
                </ul>
              </div> <!-- menu_holder ends -->
              <div class="inner_container menu_border"></div>
            </div> <!-- menu ends -->
        	</div> <!-- menu_wrapper ends -->
                      
         
          <div class="clearfix"></div>
          <div class="mobile_menu_wrapper">
            <div class="mobile_menu">
              <?php if ($categories) { ?>
                <ul>
                  <?php foreach ($categories as $category_1) { ?>
                    <li><a href="<?php echo $category_1['href']; ?>" ><?php echo $category_1['name']; ?></a>
                      <?php if ($category_1['children']) { ?>
                        <span class="plus"><i class="fa fa-plus"></i><i class="fa fa-minus"></i></span>
                        <ul>
                          <?php foreach ($category_1['children'] as $category_2) { ?>
                            <li>
                              <a href="<?php echo $category_2['href']; ?>"><?php echo $category_2['name']; ?></a>
                              <?php if ($category_2['children']) { ?>
                                <span class="plus"><i class="fa fa-plus"></i><i class="fa fa-minus"></i></span>
                                <ul>
                                  <?php foreach ($category_2['children'] as $category_3) { ?>
                                    <li><a href="<?php echo $category_3['href']; ?>"><?php echo $category_3['name']; ?></a></li>
                                  <?php } ?>
                                </ul>
                              <?php } ?>
                            </li>
                          <?php } ?>
                        </ul>
                      <?php } ?>
                    </li>
                  <?php } ?>
                  <?php if($this->config->get('cosyone_custom_menu_link1') == 'enabled'){ ?>
      		          <li><a href="<?php echo $this->config->get('cosyone_custom_menu_url1')?>"><?php echo ($this->config->get('cosyone_custom_menu_title1_' . $this->config->get('config_language_id'))) ?></a></li>
      		        <?php } ?>
                  <?php if($this->config->get('cosyone_custom_menu_link2') == 'enabled'){ ?>
      		      	  <li><a href="<?php echo $this->config->get('cosyone_custom_menu_url2')?>"><?php echo ($this->config->get('cosyone_custom_menu_title2_' . $this->config->get('config_language_id'))) ?></a></li>
      		        <?php } ?>
                </ul>
              <?php } ?>
            </div>
          </div>
          <?php if ($error) { ?>
            <div class="warning"><?php echo $error ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>
          <?php } ?>
          <div id="notification"></div>
        </div> <!-- header_wrapper ends -->
      </div> <!-- inner conainer ends -->
      <div class="breadcrumb_wrapper"></div>
      <div class="inner_container main">
      