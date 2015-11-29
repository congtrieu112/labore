<?php  
class ControllerModuleCosyoneBannerwall extends Controller {
    protected function index($setting) {
    
	$this->load->model('tool/image');
	    
        
        if (!empty($setting['image1'][$this->config->get('config_language_id')]) && file_exists(DIR_IMAGE . $setting['image1'][$this->config->get('config_language_id')])) {
            $this->data['image1'] = $this->model_tool_image->resize($setting['image1'][$this->config->get('config_language_id')], 360, 300);
        } else {
            $this->data['image1'] = false;
        }
		
		if (!empty($setting['html1'][$this->config->get('config_language_id')])) {
            $this->data['html1'] = html_entity_decode($setting['html1'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
        } else {
            $this->data['html1'] = false;
        }
        
        if (!empty($setting['image2'][$this->config->get('config_language_id')]) && file_exists(DIR_IMAGE . $setting['image2'][$this->config->get('config_language_id')])) {
            $this->data['image2'] = $this->model_tool_image->resize($setting['image2'][$this->config->get('config_language_id')], 360, 500);
        } else {
            $this->data['image2'] = false;
        }
		
		if (!empty($setting['html2'][$this->config->get('config_language_id')])) {
            $this->data['html2'] = html_entity_decode($setting['html2'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
        } else {
            $this->data['html2'] = false;
        }
		
        
        if (!empty($setting['image3'][$this->config->get('config_language_id')]) && file_exists(DIR_IMAGE . $setting['image3'][$this->config->get('config_language_id')])) {
            $this->data['image3'] = $this->model_tool_image->resize($setting['image3'][$this->config->get('config_language_id')], 360, 170);
        } else {
            $this->data['image3'] = false;
        }
		
		if (!empty($setting['html3'][$this->config->get('config_language_id')])) {
            $this->data['html3'] = html_entity_decode($setting['html3'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
        } else {
            $this->data['html3'] = false;
        }
        
        if (!empty($setting['image4'][$this->config->get('config_language_id')]) && file_exists(DIR_IMAGE . $setting['image4'][$this->config->get('config_language_id')])) {
            $this->data['image4'] = $this->model_tool_image->resize($setting['image4'][$this->config->get('config_language_id')], 360, 170);
        } else {
            $this->data['image4'] = false;
        }
        
		if (!empty($setting['html4'][$this->config->get('config_language_id')])) {
            $this->data['html4'] = html_entity_decode($setting['html4'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
        } else {
            $this->data['html4'] = false;
        }
		
        if (!empty($setting['image5'][$this->config->get('config_language_id')]) && file_exists(DIR_IMAGE . $setting['image5'][$this->config->get('config_language_id')])) {
            $this->data['image5'] = $this->model_tool_image->resize($setting['image5'][$this->config->get('config_language_id')], 360, 300);
        } else {
            $this->data['image5'] = false;
        }
		
		if (!empty($setting['html5'][$this->config->get('config_language_id')])) {
            $this->data['html5'] = html_entity_decode($setting['html5'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
        } else {
            $this->data['html5'] = false;
        }

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/cosyone_bannerwall.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/module/cosyone_bannerwall.tpl';
        } else {
            $this->template = 'cosyone/template/module/cosyone_bannerwall.tpl';
        }

        $this->render();
    }
}
?>