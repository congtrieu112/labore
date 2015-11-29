<?php
class ControllerModuleLbLastViewed extends Controller {
	protected function index($setting) {
    
        		$lblastviewed_products = array();
        
	        	if (isset($this->request->cookie['lblastviewed'])) {
	            	$lblastviewed_products = explode(',', $this->request->cookie['lblastviewed']);
	        	} else if (isset($this->session->data['lblastviewed'])) {
	      		$lblastviewed_products = $this->session->data['lblastviewed'];
	    	}
	        
	        	if (isset($this->request->get['route']) && $this->request->get['route'] == 'product/product') {
	            
		            $product_id = $this->request->get['product_id'];   
		               
		            $lblastviewed_products = array_diff($lblastviewed_products, array($product_id));
		            
		            array_unshift($lblastviewed_products, $product_id);
		            
		            setcookie('lblastviewed', implode(',',$lblastviewed_products), time() + 60 * 60 * 24 * 30, '/', $this->request->server['HTTP_HOST']);
	        
	           	if (!isset($this->session->data['lblastviewed']) || $this->session->data['lblastviewed'] != $lblastviewed_products) {
	          			$this->session->data['lblastviewed'] = $lblastviewed_products;
	        		}
	        	} 
        
        		$show_on_product = $this->config->get('show_on_product');
        
	       	 if (isset($this->request->get['route']) && $this->request->get['route'] == 'product/product' && (!isset($show_on_product) || !$show_on_product)) {
	            	return;
	        	}
        
           	$lblastviewed_count = $this->config->get('lblastviewed_count');
        
	          $products = array();
	            
	           if (isset($lblastviewed_count) && $lblastviewed_count > 0) {
		            for ($i = 0; $i < $lblastviewed_count; $i++) {
		            
			           $key = isset($product_id) ? $i + 1 : $i;
			                
			           if (isset($lblastviewed_products[$key])) {
			                    	$products[] = $lblastviewed_products[$key];
			           }
		            }
	        	}
        
        
		$this->language->load('module/lblastviewed'); 

		$this->language->load('product/product');

      		$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['button_cart'] = $this->language->get('button_cart');
		$this->data['button_wishlist'] = $this->language->get('button_wishlist');
		$this->data['button_compare'] = $this->language->get('button_compare');
		
		$this->load->model('catalog/product'); 
		
		$this->load->model('tool/image');

		$this->data['products'] = array();

		foreach ($products as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				if ($product_info['image']) {
					$image = $this->model_tool_image->resize($product_info['image'], $setting['image_width'], $setting['image_height']);
				} else {
					$image = false;
				}
				
				// Cosyone custom code starts	
			  	if ((float)$product_info['special']) {
					$sales_percantage = ((($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')))-($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax'))))/(($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')))/100));
				} else {
					$sales_percantage = false;
				}
			  	// Cosyone custom code ends

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}
						
				if ((float)$product_info['special']) {
					$special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}
				
				if ($this->config->get('config_review_status')) {
					$rating = $product_info['rating'];
				} else {
					$rating = false;
				}

				if($product_info['quantity'] <= 0){
					$product_info['stock'] = $product_info['stock_status'];
				}
				elseif($this->config->get('config_stock_display')){
					$product_info['stock'] = $product_info['quantity'];
				}
				else{
					$product_info['stock'] = $this->language->get('text_instock');
				}
					
				$this->data['products'][] = array(
					'product_id' => $product_info['product_id'],
					'thumb'   	 => $image,
					'name'    	 => $product_info['name'],
					'brand_name'    	 => $product_info['manufacturer'],
					'price'   	 => $price,
					'special' 	 => $special,
					'quantity' => $product_info['quantity'],
					'stock' => $product_info['stock'],
					'sales_percantage' => number_format($sales_percantage, 0, ',', '.'),
					'rating'     => $rating,
					'reviews'    => sprintf($this->language->get('text_reviews'), (int)$product_info['reviews']),
					'quickview'  => $this->url->link('product/quickview', 'product_id=' . $product_info['product_id']),
					'href'    	 => $this->url->link('product/product', 'product_id=' . $product_info['product_id']),
				);
			}
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/lblastviewed.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/lblastviewed.tpl';
		} else {
			$this->template = 'cosyone/template/module/lblastviewed.tpl';
		}

		$this->render();
	}
}
?>