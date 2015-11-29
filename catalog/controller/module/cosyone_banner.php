<?php  
class ControllerModuleCosyoneBanner extends Controller {
	protected function index($setting) {
		static $module = 0;
		
		
		$this->load->model('tool/image');
		
		$this->data['module_title']     = $setting['module_title'];
		if (isset($setting['module_title'][$this->config->get('config_language_id')])){
				$this->data['module_title'] = html_entity_decode($setting['module_title'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
			} else {
				$this->data['module_title'] = false;
			}
		
			
		$this->data['columns']     = $setting['columns'];
		if (isset($setting['columns'])){
				$this->data['columns'] = $setting['columns'];
			} else {
				$this->data['columns'] = false;
			}
			
		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}
		
		
		$number_sections = count($setting['sections']);	
		
		$this->data['sections'] = array();
		
		$section_row = 0;
		
		foreach($setting['sections'] as $section){
			if (isset($section['title'][$this->config->get('config_language_id')])){
				$title = html_entity_decode($section['title'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
			} else {
				$title = false;
			}
			
			
			if ($this->config->get('config_logo') && file_exists(DIR_IMAGE . $this->config->get('config_logo'))) {
			$this->data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$this->data['logo'] = '';
		}
			
			
			if (isset($section['image'][$this->config->get('config_language_id')])){
				$image = $server . 'image/' . $section['image'][$this->config->get('config_language_id')];
			} else {
				$image = false;
			}
			
			if (isset($section['description'][$this->config->get('config_language_id')])){
				$description = html_entity_decode($section['description'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
			} else {
				$description = false;
			}

			$this->data['sections'][] = array(
				'id'          => 'slide-' . $module . '-' . $section_row,
				'title'       => $title,
				'image'       => $image,
				'description' => $description
			);
			
		}

		$this->data['module'] = $module++;
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/cosyone_banner.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/cosyone_banner.tpl';
		} else {
			$this->template = 'cosyone/template/module/cosyone_banner.tpl';
		}
		
		$this->render();
	}
}
?>