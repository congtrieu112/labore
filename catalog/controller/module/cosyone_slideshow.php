<?php  
class ControllerModuleCosyoneSlideshow extends Controller {
	protected function index($setting) {
		static $module = 0;
		
		$this->load->model('design/banner');
		$this->load->model('tool/image');
		
		$this->document->addScript('catalog/view/theme/cosyone/js/cycle2/jquery.cycle2.js');
		
		if (file_exists('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/cosyone_slideshow.css')) {
			$this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/cosyone_slideshow.css');
		} else {
			$this->document->addStyle('catalog/view/theme/cosyone/stylesheet/cosyone_slideshow.css');
		}
		
		$this->data['width'] = $setting['width'];
		$this->data['height'] = $setting['height'];
		
		$this->data['banners'] = array();
		
		if (isset($setting['banner_id'])) {
			$results = $this->model_design_banner->getBanner($setting['banner_id']);
			  
			foreach ($results as $result) {
				if (file_exists(DIR_IMAGE . $result['image'])) {
					$this->data['banners'][] = array(
						'title' => $result['title'],
						'link'  => $result['link'],
						'image' => $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height'])
					);
				}
			}
		}
		
		$this->data['module'] = $module++;
						
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/cosyone_slideshow.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/cosyone_slideshow.tpl';
		} else {
			$this->template = 'cosyone/template/module/cosyone_slideshow.tpl';
		}
		
		//Settings
		if (isset($this->request->post['chosen_transition_effect'])) {
			$this->data['chosen_transition_effect'] = $this->request->post['chosen_transition_effect'];
		} else {
			$this->data['chosen_transition_effect'] = $this->config->get('chosen_transition_effect');
		}
		
		if (isset($this->request->post['chosen_easing_effect'])) {
			$this->data['chosen_easing_effect'] = $this->request->post['chosen_easing_effect'];
		} else {
			$this->data['chosen_easing_effect'] = $this->config->get('chosen_easing_effect');
		}
		
		if (isset($this->request->post['chosen_sync_effect'])) {
			$this->data['chosen_sync_effect'] = $this->request->post['chosen_sync_effect'];
		} else {
			$this->data['chosen_sync_effect'] = $this->config->get('chosen_sync_effect');
		}
		
		if (isset($this->request->post['slider_pausetime'])) {
			$this->data['slider_pausetime'] = $this->request->post['slider_pausetime'];
		} else {
			$this->data['slider_pausetime'] = $this->config->get('slider_pausetime');
		}
		
		if (isset($this->request->post['slider_delaytime'])) {
			$this->data['slider_delaytime'] = $this->request->post['slider_delaytime'];
		} else {
			$this->data['slider_delaytime'] = $this->config->get('slider_delaytime');
		}
		
		if (isset($this->request->post['slider_transition_speed'])) {
			$this->data['slider_transition_speed'] = $this->request->post['slider_transition_speed'];
		} else {
			$this->data['slider_transition_speed'] = $this->config->get('slider_transition_speed');
		}
		
		$this->render();
	}
}
?>