<?php  
class ControllerModuleManufacturer extends Controller {
	protected function index($setting) {
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

		$manufacturers = $this->model_catalog_manufacturer->getManufacturers();

		foreach ($manufacturers as $category) {
			$total = $this->model_catalog_product->getTotalProducts(array('filter_manufacturer_id' => $category['manufacturer_id']));
			
			$this->data['manufacturers'][] = array(
				'manufacturer_id' => $category['manufacturer_id'],
				'name'        => $category['name'] . ($this->config->get('config_product_count') ? ' (' . $total . ')' : ''),
				'href'        => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $category['manufacturer_id'])
			);	
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/manufacturer.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/manufacturer.tpl';
		} else {
			$this->template = 'cosyone/template/module/manufacturer.tpl';
		}

		$this->render();
	}
}
?>