<?php   
class ControllerCommonHeader extends Controller {
	protected function index() {
		$this->data['title'] = $this->document->getTitle();

		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		if (isset($this->session->data['error']) && !empty($this->session->data['error'])) {
			$this->data['error'] = $this->session->data['error'];

			unset($this->session->data['error']);
		} else {
			$this->data['error'] = '';
		}

		$this->data['base'] = $server;
		$this->data['description'] = $this->document->getDescription();
		$this->data['keywords'] = $this->document->getKeywords();
		$this->data['links'] = $this->document->getLinks();	 
		$this->data['styles'] = $this->document->getStyles();
		$this->data['scripts'] = $this->document->getScripts();
		$this->data['lang'] = $this->language->get('code');
		$this->data['direction'] = $this->language->get('direction');
		$this->data['google_analytics'] = html_entity_decode($this->config->get('config_google_analytics'), ENT_QUOTES, 'UTF-8');
		$this->data['name'] = $this->config->get('config_name');

		if ($this->config->get('config_icon') && file_exists(DIR_IMAGE . $this->config->get('config_icon'))) {
			$this->data['icon'] = $server . 'image/' . $this->config->get('config_icon');
		} else {
			$this->data['icon'] = '';
		}

		if ($this->config->get('config_logo') && file_exists(DIR_IMAGE . $this->config->get('config_logo'))) {
			$this->data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$this->data['logo'] = '';
		}	

		$this->language->load('common/cosyone');
		$this->data['cosyone_text_mobile_menu'] = $this->language->get('cosyone_text_mobile_menu');	

		$this->language->load('common/header');

		$this->data['text_home'] = $this->language->get('text_home');
		$this->data['text_gallery'] = $this->language->get('text_gallery');
		$this->data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
		$this->data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
		$this->data['text_search'] = $this->language->get('text_search');
		$this->data['text_welcome'] = sprintf($this->language->get('text_welcome'), $this->url->link('account/login', '', 'SSL'), $this->url->link('account/register', '', 'SSL'));
		$this->data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', 'SSL'), $this->customer->getFirstName(), $this->url->link('account/logout', '', 'SSL'));
		$this->data['text_account'] = $this->language->get('text_account');
		$this->data['text_checkout'] = $this->language->get('text_checkout');
		$this->data['text_telephone'] = $this->language->get('text_telephone');
		$this->data['text_information'] = $this->language->get('text_information');

		$this->data['home'] = $this->url->link('common/home');
		$this->data['gallery'] = $this->url->link('common/gallery');
		$this->data['wishlist'] = $this->url->link('account/wishlist', '', 'SSL');
		$this->data['logged'] = $this->customer->isLogged();
		$this->data['account'] = $this->url->link('account/account', '', 'SSL');
		$this->data['shopping_cart'] = $this->url->link('checkout/cart');
		$this->data['checkout'] = $this->url->link('checkout/checkout', '', 'SSL');

		$this->data['telephone'] = $this->config->get('config_telephone');
		$this->data['facebook'] = $this->config->get('config_facebook');
		$this->data['twitter'] = $this->config->get('config_twitter');
		$this->data['google'] = $this->config->get('config_google');
		$this->data['linkedin'] = $this->config->get('config_linkedin');

		// Daniel's robot detector
		$status = true;

		if (isset($this->request->server['HTTP_USER_AGENT'])) {
			$robots = explode("\n", trim($this->config->get('config_robots')));

			foreach ($robots as $robot) {
				if ($robot && strpos($this->request->server['HTTP_USER_AGENT'], trim($robot)) !== false) {
					$status = false;

					break;
				}
			}
		}

		// A dirty hack to try to set a cookie for the multi-store feature
		$this->load->model('setting/store');

		$this->data['stores'] = array();

		if ($this->config->get('config_shared') && $status) {
			$this->data['stores'][] = $server . 'catalog/view/javascript/crossdomain.php?session_id=' . $this->session->getId();

			$stores = $this->model_setting_store->getStores();

			foreach ($stores as $store) {
				$this->data['stores'][] = $store['url'] . 'catalog/view/javascript/crossdomain.php?session_id=' . $this->session->getId();
			}
		}

		// Search		
		if (isset($this->request->get['search'])) {
			$this->data['search'] = $this->request->get['search'];
		} else {
			$this->data['search'] = '';
		}

		$this->load->model('catalog/information');

		$this->data['informations'] = array();

		foreach ($this->model_catalog_information->getInformations() as $result) {
			if ($result['bottom']) {
				$this->data['informations'][] = array(
					'title' => $result['title'],
					'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
				);
			}
		}

		// Menu
		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$this->data['categories'] = array();

		// Custom categories starts
		// Add current class for active categories
		if (isset($this->request->get['path'])) {
			$parts = explode('_', (string)$this->request->get['path']);
		} else {
			$parts = array();
		}
		
		if (isset($parts[0])) {
			$this->data['category_1_id'] = $parts[0];
		} else {
			$this->data['category_1_id'] = 0;
		}
					
		$categories_1 = $this->model_catalog_category->getCategories(0);
		
		$this->load->model('tool/image');
		
		foreach ($categories_1 as $category_1) {
			if ($category_1['top']) {
				$level_2_data = array();
				
				$categories_2 = $this->model_catalog_category->getCategories($category_1['category_id']);
				
				foreach ($categories_2 as $category_2) {
					$level_3_data = array();

					// Third level
					$categories_3 = $this->model_catalog_category->getCategories($category_2['category_id']);

					foreach ($categories_3 as $category_3) {
						
						$total = $this->model_catalog_product->getTotalProducts(array('filter_category_id'  => $category_3['category_id']));

						$level_3_data[] = array(
						'name' => $category_3['name'] .($this->config->get('config_product_count') ?  ' (' . $total . ')' : ''),
						'href' => $this->url->link('product/category', 'path=' . $category_1['category_id'] . '_' . $category_2['category_id'] . '_' . $category_3['category_id'])
						);
					 } 
					
					// Second level
					$categories_2 = $this->model_catalog_category->getCategories(0);
					
					$total = $this->model_catalog_product->getTotalProducts(array('filter_category_id'  => $category_2['category_id'], 'filter_sub_category' => true));
					
					
		        			if ($category_2['image']) {
						$category_2_image = $this->model_tool_image->resize($category_2['image'], $this->config->get('cosyone_menu_mega_second_image_w'), $this->config->get('cosyone_menu_mega_second_image_h'));
					} else {
						$category_2_image = '';
					}
								
					$level_2_data[] = array(
						'name'    	=> $category_2['name']  .($this->config->get('config_product_count') ?  '<span>' . ' (' . $total . ')' . '</span>' : ''),
						'thumb' 	=> $category_2_image,
						'children'	=> $level_3_data,
						'href'    	=> $this->url->link('product/category', 'path=' . $category_1['category_id'] . '_' . $category_2['category_id'])
					);					
				}
				
				// First level
        	

				$this->data['categories'][] = array(
					'category_1_id' => $category_1['category_id'],
					'column'   => $category_1['column'] ? $category_1['column'] : 1,
					'name'     => $category_1['name'],
					'children' => $level_2_data,
					'href'     => $this->url->link('product/category', 'path=' . $category_1['category_id'])
				);
			}
		}
		// Custom categories ends
		
		//News
		if (isset($this->request->get['catid'])) {
			$partnews = explode('_', (string)$this->request->get['catid']);
		} else {
			$partnews = array();
		}
		
		if (isset($partnews[0])) {
			$this->data['cat_id'] = $partnews[0];
		} else {
			$this->data['cat_id'] = 0;
		}

		$this->load->model('catalog/news_category');
		$this->load->model('catalog/news');
		
		$this->data['categoriesnews'] = array();
					
		$categoriesnews = $this->model_catalog_news_category->getNewsCategories(0);
		
		foreach ($categoriesnews as $cat) {
			if ($cat['top']) {
				$childrennews_data = array();
				
				$childrennews = $this->model_catalog_news_category->getNewsCategories($cat['news_category_id']);
				$news_totals = $this->model_catalog_news->getTotalNewsByCategory($cat['news_category_id']);
				foreach ($childrennews as $childnews) {	
					$news_total = $this->model_catalog_news->getTotalNewsByCategory($childnews['news_category_id']);
					if($childnews['image']!='') {
						$image = $childnews['image'];			
					}else{
						$image = $cat['image'];			
					}

					$children_level2 = $this->model_catalog_news_category->getNewsCategories($childnews['news_category_id']);
					$children_data_level2 = array();
					foreach ($children_level2 as $child_level2) {
						
						$news_total = $this->model_catalog_news->getTotalNewsByCategory($child_level2['news_category_id']);
						if($child_level2['image']!='') {
							$image = $child_level2['image'];			
						}else{
							$image = $childnews['image'];			
						}

						$children_data_level2[] = array(
							'name'  => $child_level2['name'],
							'image'    	=> $image,
							'href'  	=> $this->url->link('news/news_category', 'cat_id=' . $childnews['news_category_id'] . '_' . $child_level2['news_category_id']),
							'id' => $cat['news_category_id']. '_' . $childnews['news_category_id']. '_' . $child_level2['news_category_id']
						);
					}
					
					$childrennews_data[] = array(
						'name'  => $childnews['name'],
						'image'    	=> $image,
						'href'  	=> $this->url->link('news/news_category', 'cat_id=' . $cat['news_category_id'] . '_' . $childnews['news_category_id']),
						'id' => $cat['news_category_id']. '_' . $childnews['news_category_id'],
						'children_level2' => $children_data_level2,	
					);					
				}
				
				// Level 1
				$this->data['categoriesnews'][] = array(
					'name'     => $cat['name'],
					'cat_id'   => $cat['news_category_id'],
					'children' => $childrennews_data,
					'column'   => $cat['column'] ? $cat['column'] : 1,
					'href'     => $this->url->link('news/news_category', 'cat_id=' . $cat['news_category_id'])
				);
			}
		}

		$this->children = array(
			'module/language',
			'module/header_login',
			'module/header_wishlist_compare',
			'module/currency',
			'module/cart'
		);

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/header.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/header.tpl';
		} else {
			$this->template = 'cosyone/template/common/header.tpl';
		}

		$this->render();
	} 	
}
?>
