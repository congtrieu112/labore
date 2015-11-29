<?php
class ControllerModuleCosyoneDeals extends Controller {
	protected function index($setting) {
	
		static $module = 0; // count calls
		
		$this->data['module'] = $module;
		$this->data['autoplay'] = $setting['autoplay'];
		$module++;
		
		
		
		
		$this->document->addScript('catalog/view/theme/cosyone/js/countdown/jquery.countdown.min.js');
		$this->document->addStyle('catalog/view/theme/cosyone/stylesheet/owl.transitions.css');
		
		$this->language->load('module/cosyone_deals'); 

      	$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['button_wishlist'] = $this->language->get('button_wishlist');
		$this->data['button_compare'] = $this->language->get('button_compare');
		$this->data['button_cart'] = $this->language->get('button_cart');
		
		$this->load->model('catalog/product'); 
		
		$this->load->model('tool/image');

		$this->data['products'] = array();
		
		$this->data['setting'] = $setting;
		
		$this->data['images_width'] = $setting['image_width'];
													
		$products = explode(',', $this->config->get('cosyone_deals_product'));		

		if (empty($setting['limit'])) {
			$setting['limit'] = 5;
		}
		
		$products = array_slice($products, 0, (int)$setting['limit']);
		
		foreach ($products as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				if ($product_info['image']) {
					$image = $this->model_tool_image->resize($product_info['image'], $setting['image_width'], $setting['image_height']);
				} else {
					$image = false;
				}

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}
						
				if ((float)$product_info['special']) {
					$special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
					$special_info = $this->model_catalog_product->getSpecialPriceEnd($product_info['product_id']);
        			$special_date_end = strtotime($special_info['date_end']) - time();
					$yousave = $this->currency->format(($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')))-($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax'))));
				} else {
					$special = false;
					$special_date_end = false;
					$yousave = false;
				}
				
				$this->data['text_special_price'] = $this->language->get('text_special_price');
				$this->data['text_old_price'] = $this->language->get('text_old_price');
				$this->data['text_you_save'] = $this->language->get('text_you_save');
				$this->data['text_expire'] = $this->language->get('text_expire');
				$this->data['text_items_sold'] = sprintf($this->language->get('text_items_sold'), $this->model_catalog_product->getItemsSold($product_id));
				$this->data['text_stock_quantity'] = sprintf($this->language->get('text_stock_quantity'), $product_info['quantity']);
				
				if ($this->config->get('config_review_status')) {
					$rating = $product_info['rating'];
				} else {
					$rating = false;
				}
					
				$this->data['products'][] = array(
					'product_id' => $product_info['product_id'],
					'thumb'   	 => $image,
					'name'    	 => $product_info['name'],
					'price'   	 => $price,
					'special' 	 => $special,
					'special_date_end' => $special_date_end,
					'yousave'    	 => $yousave,
					'stock_quantity' => sprintf($this->language->get('text_category_stock_quantity'), (int)$product_info['quantity']),
					'description' => utf8_substr(strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8')), 0, 175) . '..',
					'rating'     => $rating,
					'reviews'    => sprintf($this->language->get('text_reviews'), (int)$product_info['reviews']),
					'href'    	 => $this->url->link('product/product', 'product_id=' . $product_info['product_id']),
				);
			}
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/cosyone_deals.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/cosyone_deals.tpl';
		} else {
			$this->template = 'cosyone/template/module/cosyone_deals.tpl';
		}

		$this->render();
	}
}
?>