<?php  
class ControllerModuleShowintabs extends Controller {
	protected function index($setting) {
    	$this->load->language('module/showintabs');
    	$this->data['text_all'] = $this->language->get('text_all');

    	$this->language->load('product/product');

    	$this->load->model('catalog/product');

    	$this->document->addStyle('catalog/view/theme/cosyone/stylesheet/cosyone_slideshow.css');
    	$this->document->addScript('catalog/view/theme/cosyone/js/cycle2/jquery.cycle2.js');
		$this->document->addScript('catalog/view/javascript/jquery/tabs.js');
    	
    	//Obetenemos datos de las pestañas
    	$tabs = $this->config->get('showintabs_tab');

    	$this->data['module_number'] = $setting['module_row'];

    	//preparamos pestañas de este modulo
    	$this->data['tabs'] = array();

		$this->load->model('tool/image');

		$tabs_module = isset($setting['tabs']) ? $setting['tabs'] : array();

    	foreach ($tabs_module as $keyTab ) {

	    	
			if ( isset($tabs[$keyTab]['title'][$this->config->get('config_language_id')]) && !empty($tabs[$keyTab]['title'][$this->config->get('config_language_id')])) {
				$this->data['tabs'][$keyTab]['title'] = $tabs[$keyTab]['title'][$this->config->get('config_language_id')];
			}else{
				$this->data['tabs'][$keyTab]['title']  = $this->language->get('heading_default');
			}
			
		
			$this->data['carousel'] = $setting['carousel'];
			$this->data['columns'] = $setting['columns'];

			//Productos de la pestaña
			$products = array();

			switch ($tabs[$keyTab]['data_source']) {
				case 'SP': //Select Products
					$results = $this->getSelectProducts($tabs[$keyTab],$setting['limit']);
					break;
				case 'PG': //Product Group
					$results = $this->getProductGroups($tabs[$keyTab],$setting['limit']);
					break;
				case 'CQ': //Custom Query
					$results = $this->getCustomQuery($tabs[$keyTab],$setting['limit']);
					break;
				default:
					$this->log->write('SHOW_IN_TAB::ERROR: The tab don\'t have product configured.');
					break;
			}
			
				

			//Preparo la info de cada producto
			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $setting['image_width'], $setting['image_height']);
				} else {
					$image = false;
				}
				
				// Cosyone custom code starts	
			   	$images = $this->model_catalog_product->getProductImages($result['product_id']);
	           		if(isset($images[0]['image']) && !empty($images[0]['image'])){
	                  			$images = $images[0]['image'];
				} else {
					$images = false;
				}
				  // Cosyone custom code ends
				  
				  
					
				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}
						
				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}
				
				// Cosyone custom code starts	
				  if ((float)$result['special']) {
					$sales_percantage = ((($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')))-($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax'))))/(($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')))/100));
				} else {
					$sales_percantage = false;
				}
				  // Cosyone custom code ends
					
				if ($this->config->get('config_review_status')) {
					$rating = $result['rating'];
				} else {
					$rating = false;
				}

				if($result['quantity'] <= 0){
					$result['stock'] = $result['stock_status'];
				}
				elseif($this->config->get('config_stock_display')){
					$result['stock'] = $result['quantity'];
				}
				else{
					$result['stock'] = $this->language->get('text_instock');
				}
								
				$products[] = array(
					'product_id' => $result['product_id'],
					'thumb'   	 => $image,
					'thumb_hover'  => $this->model_tool_image->resize($images, $setting['image_width'], $setting['image_height']),
					'name'    	 => $result['name'],
					'brand_name' => $result['manufacturer'],
					'price'   	 => $price,
					'special' 	 => $special,
					'quantity' => $result['quantity'],
					'stock' => $result['stock'],
					'sales_percantage' => number_format($sales_percantage, 0, ',', '.'),
					'rating'     => $rating,
					'reviews'    => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
					'quickview'  => $this->url->link('product/quickview', 'product_id=' . $result['product_id']),
					'href'    	 => $this->url->link('product/product', 'product_id=' . $result['product_id']),
				);
			}	

			$this->data['tabs'][$keyTab]['products'] = $products;
			
    	}

    	$this->language->load('module/manufacturer');

		$this->data['heading_title'] = $this->language->get('heading_title');

		if (isset($this->request->get['manufacturer_id'])) {
			$manufacturer_id = $this->request->get['manufacturer_id'];
		} 
		else{
			$manufacturer_id='';
		}

		$this->data['manufacturer_id']=$manufacturer_id;

		$this->load->model('catalog/manufacturer');

		$this->load->model('catalog/product');

		$this->data['manufacturers'] = array();

		$data = array(
			'sort'  => 'p.date_added',
			'order' => 'DESC',
			'start' => 0,
			'limit' => 5
		);

		$manufacturers = $this->model_catalog_manufacturer->getManufacturers($data);

		foreach ($manufacturers as $category) {
			$total = $this->model_catalog_product->getTotalProducts(array('filter_manufacturer_id' => $category['manufacturer_id']));
			
			$this->data['manufacturers'][] = array(
				'manufacturer_id' => $category['manufacturer_id'],
				'name'        => $category['name'] . ($this->config->get('config_product_count') ? ' (' . $total . ')' : ''),
				'href'        => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $category['manufacturer_id'])
			);	
		}

    	$this->load->model('design/banner');
		$this->load->model('tool/image');
				
		$this->data['skincare_banners'] = $this->model_design_banner->getBanner(10);		
		
		$this->data['supplement_banners'] = $this->model_design_banner->getBanner(11);
		
		$this->data['mama_baby_banners'] = $this->model_design_banner->getBanner(12);

		$this->data['makeup_banners'] = $this->model_design_banner->getBanner(13);

		$this->data['body_bath_banners'] = $this->model_design_banner->getBanner(14);

		$this->data['kit_banners'] = $this->model_design_banner->getBanner(15);

		$this->data['sales_banners'] = $this->model_design_banner->getBanner(16);

		$this->data['text_all'] = $this->language->get('text_all');
    	$this->data['button_cart'] = $this->language->get('button_cart');
		$this->data['button_wishlist'] = $this->language->get('button_wishlist');
		$this->data['button_compare'] = $this->language->get('button_compare');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/showintabs.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/showintabs.tpl';
		} else {
			$this->template = 'cosyone/template/module/showintabs.tpl';
		}
		
		$this->render();
  	}

  	// Obtiene los productos de los grupos predefinidos de opencart
  	private function getProductGroups( $tabInfo , $limit ){
  		$results = array();

  		//Obtengo listado de productos en funcion del criterio
  		switch ( $tabInfo['product_group'] ) {
  			case 'BS':
  				$results = $this->model_catalog_product->getBestSellerProducts($limit);
  				break;
  			case 'LA':
  				$results = $this->model_catalog_product->getLatestProducts($limit);
  				break;
  			case 'SP':
  				$results = $this->model_catalog_product->getProductSpecials(array('start' => 0,'limit' => $limit));
  				break;
  			case 'PP':
  				$results = $this->model_catalog_product->getPopularProducts($limit);
  				break;
  		}

  		return $results;
  	}

	// Obtiene los productos seleccionados por el user con toda la info necesaria
  	private function getSelectProducts( $tabInfo , $limit ){
  		$results = array();

  		if(isset($tabInfo['products'])){
  			$limit_count = 0;
			foreach ( $tabInfo['products'] as $product ) {
				if ($limit_count++ == $limit) break;
				$results[$product['product_id']] = $this->model_catalog_product->getProduct($product['product_id']);
			}
		}

		return $results;
  	}

  	//Obtiene los productos segun los datos del custom query
  	private function getCustomQuery( $tabInfo , $limit){
  		$results = array();

  		if ( $tabInfo['sort'] == 'rating' || $tabInfo['sort'] == 'p.date_added') {
  			$order = 'DESC';
  		}else{
  			$order = 'ASC';
  		}

  		$data = array(
  			'filter_category_id' => $tabInfo['filter_category']=='ALL' ? '' : $tabInfo['filter_category'], 
  			'filter_manufacturer_id' => $tabInfo['filter_manufacturer']=='ALL' ? '' : $tabInfo['filter_manufacturer'], 
  			'sort' => $tabInfo['sort'], 
  			'order' => $order,
  			'start' => 0,
  			'limit' => $limit
  		);

  		$results = $this->model_catalog_product->getProducts($data);

		return $results;
  	}

}
?>