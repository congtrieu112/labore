<?php

$this->data['prev_text'] = "";
$this->data['next_text'] = "";
$this->data['prev_url']  = "";
$this->data['next_url']  = "";

if ($this->config->get('nextprevlinks_status')) {

  
  // definice promennych
  
  $products_np = array(); // produkty
  $nextprev    = false;   // identifikator
  $url         = "";      // cesta

  // inicializace parametru

	if (isset($this->request->get['category_id'])) {
		$category_id = $this->request->get['category_id'];
	} else {
		$category_id = '';
	}

  if (isset($this->request->get['description'])) {
		$description = $this->request->get['description'];
	} else {
		$description = '';
	}

	if (isset($this->request->get['model'])) {
		$model = $this->request->get['model'];
    $url .= '&model=' . $model;
	} else {
		$model = '';
	}

	if (isset($this->request->get['order'])) {
		$order = $this->request->get['order'];
    $url .= '&order=' . $order;
	} else {
		$order = 'ASC';
	}

	if (isset($this->request->get['page'])) {
		$page = $this->request->get['page'];
	} else {
		$page = 1;
	}

	if (isset($this->request->get['sort'])) {
		$sort = $this->request->get['sort'];
    $url .= '&sort=' . $sort;
	} else {
		$sort = 'p.sort_order';
	}

	// nacteni seznamu produktu

	if (isset($this->request->get['bestseller'])) {
		$products_np = $this->model_catalog_product->getBestSellerProducts($this->config->get('bestseller_limit')); //getProductsByKeyword
		$nextprev = true;
		$url .= '&bestseller=' . $this->request->get['bestseller'];
	}

	if (isset($this->request->get['featured'])) {
		$products_np = $this->model_catalog_product->getFeaturedProducts_np($this->config->get('featured_limit')); //getProductsByKeyword
		$nextprev = true;
		$url .= '&featured=' . $this->request->get['featured'];
	}

	if (isset($this->request->get['keyword'])) {
		$key_results = $this->model_catalog_product->getProductsByKeyword_np($this->request->get['keyword'], $category_id, $description, $model, $sort, $order, 0, 9999999); //getProductsByKeyword
		$products_np = $this->model_catalog_product->getProductsByTag_np($this->request->get['keyword'], $category_id, $sort, $order, ($page - 1) * $this->config->get('config_catalog_limit'), $this->config->get('config_catalog_limit'));
		foreach ($key_results as $res_key => $value) {
			$products_np[$value['product_id']] = $key_results[$res_key];
		}
		$nextprev = true;
	}  

	if (isset($this->request->get['latest'])) {
		$products_np = $this->model_catalog_product->getLatestProducts($this->config->get('latest_limit')); //getProductsByKeyword
		$nextprev = true;
		$url .= '&latest=' . $this->request->get['latest'];
	}

  if (isset($this->request->get['manufacturer_id'])) {
		$products_np = $this->model_catalog_product->getProductsByManufacturerId_np($this->request->get['manufacturer_id'], $sort, $order, 0, 9999999); //getProductsByManufacturerId
		$nextprev = true;
	}

	if (isset($this->request->get['path'])) {
		$cat_path_ids = explode("_",$this->request->get['path']);
		$cat_path_id  = $cat_path_ids[count($cat_path_ids) - 1];
		$products_np  = $this->model_catalog_product->getProductsByCategoryId_np($cat_path_id, $sort, $order, 0, 9999999); //getTotalProductsByCategoryId
		$nextprev = true;
    $url .= '&path=' . $this->request->get['path'];
	}

	if (isset($this->request->get['special'])) {
		$products_np = $this->model_catalog_product->getProductSpecials_np($sort, $order, 0, 9999999); //getProductsByManufacturerId
		$nextprev = true;
		$url .= '&special=' . $this->request->get['special'];
	}

	if ($nextprev) {

		$prev_link = 0;
		$next_link = 0;
		$pnpm = 0;
		$products_np_ids_hold = array(); // +
		$products_np_ids      = array(); // +
		$products_np_multi    = array(); // +

		foreach($products_np as $product_np) {
			$products_np_ids_hold[$pnpm] = $product_np['product_id'];
			$products_np_ids[$pnpm]      = $product_np['product_id'];
			$products_np_multi[$pnpm]['product_id'] = $product_np['product_id'];
			$products_np_multi[$pnpm]['name']       = $product_np['name'];
			$pnpm++;
		}

		if ( isset($this->request->get['product_id']) ) {
			$key = array_search($this->request->get['product_id'], $products_np_ids); // $key = 2;
			//$key = array_search($this->request->get['product_id'], $products_np_ids_hold); // $products_np_ids
		} else {
			$key = 0;
		}
	
		if ($key == 0 && $key != (count($products_np_multi)-1)) { // this is the first product in search 
			$this->data['prev_url']  = "";
			$this->data['prev_text'] = "";
			if ( count($products_np) == 0 ) { // ochrane pres pouzitim: keyword (nenalezeno) + product_id (nalezeno)
				// doplneny kod
				$this->data['next_url']  = "";
				$this->data['next_text'] = "";
			} else {
				// puvodni kod
				$this->data['next_url']  = $this->url->link('product/product' . $url . '&product_id=' . $products_np_multi[$key+1]['product_id']);
				$this->data['next_text'] = $products_np_multi[$key+1]['name'];
			}
		}
		
    if ($key != 0 && $key != (count($products_np_multi)-1)) { // this is NOT the first product  and NOT the last
			$this->data['prev_url']  = $this->url->link('product/product' . $url . '&product_id=' . $products_np_multi[$key-1]['product_id']);
			$this->data['prev_text'] = $products_np_multi[$key-1]['name'];
			
			$this->data['next_url']  = $this->url->link('product/product' . $url . '&product_id=' . $products_np_multi[$key+1]['product_id']);
			$this->data['next_text'] = $products_np_multi[$key+1]['name'];
		}
		
    if ($key != 0 && $key == (count($products_np_multi)-1)) { // this is NOT the first but it IS the last
			$this->data['prev_url']  = $this->url->link('product/product' . $url . '&product_id=' . $products_np_multi[$key-1]['product_id']);
			$this->data['prev_text'] = $products_np_multi[$key-1]['name'];
			$this->data['next_url']  = "";
			$this->data['next_text'] = "";
		}
		
    if ($key == 0 && $key == (count($products_np_multi)-1)) { // this is the first and it IS the last
			$this->data['prev_url']  = "";
			$this->data['prev_text'] = "";
			$this->data['next_url']  = "";
			$this->data['next_text'] = "";
		}
		
	} // if $nextprev
}
?>