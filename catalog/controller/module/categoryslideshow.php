<?php  
class ControllerModuleCategorySlideshow extends Controller {
	protected function index($setting) {
		static $module = 0;
		
		if(isset($this->request->get["route"]) && $this->request->get["route"] == 'product/category'){
			if(isset($this->request->get["path"])){
				$cats = explode('_',$this->request->get["path"]);
				if($this->request->get["path"] == $setting['category_id'] || in_array($setting['category_id'], $cats)){
					$this->load->model('design/banner');
					$this->load->model('tool/image');
					
					$this->document->addScript('catalog/view/javascript/jquery/nivo-slider/jquery.nivo.slider.pack.js');
					
					if (file_exists('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/categoryslideshow.css')) {
						$this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/categoryslideshow.css');
					} else {
						$this->document->addStyle('catalog/view/theme/default/stylesheet/categoryslideshow.css');
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

					if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/categoryslideshow.tpl')) {
						$this->template = $this->config->get('config_template') . '/template/module/categoryslideshow.tpl';
					} else {
						$this->template = 'cosyone/template/module/categoryslideshow.tpl';
					}
					
					$this->render();
				}
			}
		}
	}
}
?>