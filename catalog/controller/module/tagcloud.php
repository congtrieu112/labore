<?php
//-----------------------------------------------------
// TagCloud for Opencart v1.5.6    						
// Adapted by villagedefrance                          		
// contact@villagedefrance.net                       		
//-----------------------------------------------------

class ControllerModuleTagCloud extends Controller {

	private $_name = 'tagcloud';
	
	protected function index($setting) {
		static $module = 0;
	
		$this->language->load('module/' . $this->_name);
	
      	$this->data['heading_title'] = $this->language->get('heading_title');
	
		$this->load->model('localisation/language');
	
		$this->data['title'] = $this->config->get($this->_name . '_title' . $this->config->get('config_language_id'));
		$this->data['header'] = $this->config->get($this->_name . '_header');
	
		if (!$this->data['title']) { $this->data['title'] = $this->data['heading_title']; } 
		if (!$this->data['header']) { $this->data['title'] = ''; }
	
		$this->data['text_notags'] = $this->language->get('text_notags');
		$this->data['text_href_title'] = $this->language->get('text_href_title');
	
		// Tag Cloud
		if (isset($setting['random'])) { $randomize = 1; } else { $randomize = 0; }
	
		$this->load->model('catalog/tagcloud');
	
		$this->data['tagcloud'] = $this->model_catalog_tagcloud->getRandomTags(array(
			'limit'         		=> (int)$setting['limit'],
			'random'       		=> $randomize
		));
	
		$this->data['module'] = $module++;
	
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/' . $this->_name . '.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/' . $this->_name . '.tpl';
		} else {
			$this->template = 'cosyone/template/module/' . $this->_name . '.tpl';
		}
       
        $this->render();
    }
}
?>