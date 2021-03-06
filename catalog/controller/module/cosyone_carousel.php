<?php  
class ControllerModuleCosyoneCarousel extends Controller {
	protected function index($setting) {
		static $module = 0;

		$this->load->model('design/banner');
		$this->load->model('tool/image');

		$this->data['columns'] = $setting['columns'];
		
		$this->data['name'] = html_entity_decode($setting['name'][$this->config->get('config_language_id')],  ENT_QUOTES, 'UTF-8');
		

		$this->data['banners'] = array();

		$results = $this->model_design_banner->getBanner($setting['banner_id']);

		foreach ($results as $result) {
			if (file_exists(DIR_IMAGE . $result['image'])) {
				$this->data['banners'][] = array(
					'title' => $result['title'],
					'link'  => $result['link'],
					'image' => $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']),
					
					'width' => $setting['width'],
					'height' => $setting['height'],
					'name' => $setting['name']
				);
			}
		}

		$this->data['module'] = $module++; 

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/cosyone_carousel.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/cosyone_carousel.tpl';
		} else {
			$this->template = 'cosyone/template/module/cosyone_carousel.tpl';
		}

		$this->render(); 
	}
}
?>