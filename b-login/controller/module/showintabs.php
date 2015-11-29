<?php 
class ControllerModuleShowintabs extends Controller {
	private $error = array(); 

	public function index() {
		$this->language->load('module/showintabs');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
		
		$this->document->addScript('view/javascript/jquery/jquery.qtip-1.0.0-rc3.min.js');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('showintabs', $this->request->post);				
			
			$this->session->data['success'] = $this->language->get('text_success');

			if(isset( $this->request->get['exit'])){
				$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
			}else{
				$this->redirect($this->url->link('module/showintabs', 'token=' . $this->session->data['token'], 'SSL'));
			}
		}

		//Textos
		$this->data = array_merge($this->data, $this->load->language('module/showintabs'));
		
		
		 
		//Comprobacion de errores
		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];
			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}
		
		//Camino de migas de pan
  		$this->data['breadcrumbs'] = array();
   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),       		
      		'separator' => false
   		);
   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/showintabs', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
				
		//Links y actions
		$this->data['action'] = $this->url->link('module/showintabs', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['token'] = $this->session->data['token'];

		//Datos de configuracion
		$this->data['modules'] = array();
		
		if (isset($this->request->post['showintabs_module'])) {
			$this->data['modules'] = $this->request->post['showintabs_module'];
		} elseif ($this->config->get('showintabs_module')) { 
			$this->data['modules'] = $this->config->get('showintabs_module');
		}	

		$this->data['tabs'] = array();

		if (isset($this->request->post['showintabs_tab'])) {
			$this->data['tabs'] = $this->request->post['showintabs_tab'];
		} elseif ($this->config->get('showintabs_tab')) { 
			$this->data['tabs'] = $this->config->get('showintabs_tab');
		}	

		$this->load->model('catalog/product');
		$this->load->model('tool/image');

		//Ordenamos las pestañas 
		ksort($this->data['tabs']);

		//Completamos info de pestañas de cada pestaña
		foreach( $this->data['tabs'] as $keyTab => $tab ){
			//Preparamos title de pestañas
			if(isset($this->data['tabs'][$keyTab]['title'][$this->config->get('config_language_id')]) && $this->data['tabs'][$keyTab]['title'][$this->config->get('config_language_id')] != ''){
				$this->data['tabs'][$keyTab]['tab_title'] = $this->data['tabs'][$keyTab]['title'][$this->config->get('config_language_id')];
			}else{
				$this->data['tabs'][$keyTab]['tab_title'] = $this->language->get('text_tab') . $keyTab . $this->language->get('text_notitle');
			}
			//Preparamos datos productos
			if(isset($tab['products'])){
				foreach ( $tab['products'] as $value ) {
					$product_info = $this->model_catalog_product->getProduct($value['product_id']);
					
					if ($product_info) {			
						$this->data['tabs'][$keyTab]['products'][$value['product_id']] = array(
							'product_id'    => $value['product_id'],
							'name'          => $product_info['name'],
							'model'         => $product_info['model'],
						);
					}
				}
			}
		}
		//Layouts
		$this->load->model('design/layout');
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();

		//idiomas
		$this->load->model('localisation/language');
		
		$this->data['languages'] = $this->model_localisation_language->getLanguages();

		//idioma del admin
		$this->data['language_admin_id']  = $this->config->get('config_language_id');

		//Categories
		$this->load->model('catalog/category');

		$this->data['categories'] = $this->model_catalog_category->getCategories(array());

		//Manufacturers
		$this->load->model('catalog/manufacturer');

		$this->data['manufacturers'] = $this->model_catalog_manufacturer->getManufacturers(array());


		$this->template = 'module/showintabs.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/showintabs')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}

	//Para autocompletar custom
	public function autocomplete() {
		$json = array();
		
		if ( isset($this->request->get['filter_name']) ) {
			$this->load->model('catalog/product');

			$data = array(
				'filter_name'  => $this->request->get['filter_name'],
				'start'        => 0,
				'limit'        => 20
			);
			
			$results = $this->model_catalog_product->getProducts($data);

			foreach ($results as $result) {
				$json[] = array(
					'product_id' => $result['product_id'],
					'name'       => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8')),	
					'model'      => $result['model']
				);	
			}
		}
		$this->response->setOutput(json_encode($json));
	}
}
?>