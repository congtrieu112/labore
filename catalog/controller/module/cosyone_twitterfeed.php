<?php  
class ControllerModuleCosyoneTwitterfeed extends Controller {
	protected function index($setting) {
		static $module = 0;
		
		
		$this->load->model('tool/image');
		
		$this->document->addScript('catalog/view/theme/cosyone/js/tweetfeed.min.js');
		
		$this->data['module_title']     = $setting['module_title'];
		if (isset($setting['module_title'])){
				$this->data['module_title'] = html_entity_decode($setting['module_title'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
			} else {
				$this->data['module_title'] = false;
			}
			
		$this->data['widget_id']     = $setting['widget_id'];
		if (isset($setting['widget_id'])){
				$this->data['widget_id'] = $setting['widget_id'];
			} else {
				$this->data['widget_id'] = false;
			}
		
		$this->data['limit']     = $setting['limit'];
		if (isset($setting['limit'])){
				$this->data['limit'] = $setting['limit'];
			} else {
				$this->data['limit'] = false;
			}
					
		

		$this->data['module'] = $module++;
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/cosyone_twitterfeed.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/cosyone_twitterfeed.tpl';
		} else {
			$this->template = 'cosyone/template/module/cosyone_twitterfeed.tpl';
		}
		
		$this->render();
	}
}
?>