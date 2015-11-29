<?php  
class ControllerModuleCosyoneSocials extends Controller {
	protected function index($setting) {
		static $module = 0;
		
		
		$this->load->model('tool/image');
		
		$this->data['module_title']     = $setting['module_title'];
		if (isset($setting['module_title'])){
				$this->data['module_title'] = html_entity_decode($setting['module_title'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
			} else {
				$this->data['module_title'] = false;
			}
		
					
		$this->data['sections'] = array();
		
		$section_row = 0;
		
		foreach($setting['sections'] as $section){
			
			if (isset($section['social_type'])){
				$social_type = $section['social_type'];
			} else {
				$social_type = false;
			}
			
			if (isset($section['link'])){
				$link = $section['link'];
			} else {
				$link = false;
			}
			
			if (isset($section['link_type'])){
				$link_type = $section['link_type'];
			} else {
				$link_type = false;
			}
			
			if (isset($section['tooltip'])){
				$tooltip = $section['tooltip'];
			} else {
				$tooltip = false;
			}

			$this->data['sections'][] = array(
				'id'          	=> 'slide-' . $module . '-' . $section_row,
				'link'       	=> $link,
				'link_type'		=> $link_type,
				'tooltip'		=> $tooltip,
				'social_type'	=> $social_type
			);
			
		}

		$this->data['module'] = $module++;
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/cosyone_socials.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/cosyone_socials.tpl';
		} else {
			$this->template = 'cosyone/template/module/cosyone_socials.tpl';
		}
		
		$this->render();
	}
}
?>