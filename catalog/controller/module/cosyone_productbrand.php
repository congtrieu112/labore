<?php
class ControllerModuleCosyoneProductbrand extends Controller {
	protected function index($setting) {
		static $module = 0;
		
		$this->load->model('tool/image');

		$this->load->model('catalog/product');

		if (isset($this->request->get['product_id'])) {
			$product_id = (int)$this->request->get['product_id'];
		} else {
			$product_id = 0;
		}
		
		$product_info = $this->model_catalog_product->getProduct($product_id);

		if (isset($this->request->get['product_id'])){
			
			// Start manufacturer image
			$manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($product_info['manufacturer_id']);

			if($manufacturer_info){
				$this->data['manufacturer_img'] = $this->model_tool_image->resize($manufacturer_info['image'], $setting['img_w'], $setting['img_h']);
				$this->data['manufacturer_url'] = $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $product_info['manufacturer_id']);
			}else{
				$this->data['manufacturer_img'] = false;
			}
			// End manufacturer image
			
		}
				
		
		
		$this->data['theme_name'] = $this->config->get('config_template');

		$this->data['module'] = $module++;
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/cosyone_productbrand.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/cosyone_productbrand.tpl';
		} else {
			$this->template = 'cosyone/template/module/cosyone_productbrand.tpl';
		}

		$this->render();
	}
}
?>