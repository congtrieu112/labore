<?php
class ControllerModuleCosyoneSlideshow extends Controller {
	private $error = array(); 
	
	public function index() {   
		$this->load->language('module/cosyone_slideshow');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('cosyone_slideshow', $this->request->post);
			
			if (isset($this->request->post['continue']) && $this->request->post['continue'] == '1') {
				$this->session->data['success'] = $this->language->get('text_success');	
				$this->redirect($this->url->link('module/cosyone_slideshow', 'token=' . $this->session->data['token'], 'SSL')); 
			}
						
					
			$this->session->data['success'] = $this->language->get('text_success');
						
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}
				
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_content_top'] = $this->language->get('text_content_top');
		$this->data['text_content_bottom'] = $this->language->get('text_content_bottom');		
		$this->data['text_column_left'] = $this->language->get('text_column_left');
		$this->data['text_column_right'] = $this->language->get('text_column_right');
		
		//start
		$this->data['easing_effect'] = $this->language->get('easing_effect');
		$this->data['transition_effect'] = $this->language->get('transition_effect');
		$this->data['transition_speed'] = $this->language->get('transition_speed');
		$this->data['pausetime'] = $this->language->get('pausetime');
		$this->data['delay'] = $this->language->get('delay');
		$this->data['sync'] = $this->language->get('sync');
		$this->data['transition_speed_help'] = $this->language->get('transition_speed_help');
		$this->data['pausetime_help'] = $this->language->get('pausetime_help');
		$this->data['delay_help'] = $this->language->get('delay_help');
		$this->data['sync_help'] = $this->language->get('sync_help');
		//end
		
		$this->data['entry_banner'] = $this->language->get('entry_banner');
		$this->data['entry_dimension'] = $this->language->get('entry_dimension'); 
		$this->data['entry_layout'] = $this->language->get('entry_layout');
		$this->data['entry_position'] = $this->language->get('entry_position');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_add_module'] = $this->language->get('button_add_module');
		$this->data['button_remove'] = $this->language->get('button_remove');
		
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
		
		if (isset($this->error['dimension'])) {
			$this->data['error_dimension'] = $this->error['dimension'];
		} else {
			$this->data['error_dimension'] = array();
		}
		
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
		
		
		//start
		
		$this->data['slider_transition_speed']	=	1500;
		$this->data['slider_pausetime']	=	6000;
		$this->data['slider_delaytime']	=	10000;
		//
		$this->data['easing_effect_option'] = $this->language->get('easing_effect_option');
		
		if (isset($this->request->post['chosen_easing_effect'])) {
			$this->data['chosen_easing_effect'] = $this->request->post['chosen_easing_effect'];
		} else {
			$this->data['chosen_easing_effect'] = $this->config->get('chosen_easing_effect');
		}
		//
		$this->data['transition_effect_option'] = $this->language->get('transition_effect_option');
		
		if (isset($this->request->post['chosen_transition_effect'])) {
			$this->data['chosen_transition_effect'] = $this->request->post['chosen_transition_effect'];
		} else {
			$this->data['chosen_transition_effect'] = $this->config->get('chosen_transition_effect');
		}
		//
		$this->data['sync_effect_option'] = $this->language->get('sync_effect_option');
		
		if (isset($this->request->post['chosen_sync_effect'])) {
			$this->data['chosen_sync_effect'] = $this->request->post['chosen_sync_effect'];
		} else {
			$this->data['chosen_sync_effect'] = $this->config->get('chosen_sync_effect');
		}
		//
		if (isset($this->request->post['slider_transition_speed'])) {
			$this->data['slider_transition_speed'] = $this->request->post['slider_transition_speed'];
		} elseif ($this->config->get('slider_transition_speed')) { 
			$this->data['slider_transition_speed'] = $this->config->get('slider_transition_speed');
		}
		
		if (isset($this->request->post['slider_pausetime'])) {
			$this->data['slider_pausetime'] = $this->request->post['slider_pausetime'];
		} elseif ($this->config->get('slider_pausetime')) { 
			$this->data['slider_pausetime'] = $this->config->get('slider_pausetime');
		}
		
		if (isset($this->request->post['slider_delaytime'])) {
			$this->data['slider_delaytime'] = $this->request->post['slider_delaytime'];
		} elseif ($this->config->get('slider_delaytime')) { 
			$this->data['slider_delaytime'] = $this->config->get('slider_delaytime');
		}
		
		// end
		
   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/cosyone_slideshow', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/cosyone_slideshow', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['modules'] = array();
		
		if (isset($this->request->post['cosyone_slideshow_module'])) {
			$this->data['modules'] = $this->request->post['cosyone_slideshow_module'];
		} elseif ($this->config->get('cosyone_slideshow_module')) { 
			$this->data['modules'] = $this->config->get('cosyone_slideshow_module');
		}	
						
		$this->load->model('design/layout');
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();

		$this->load->model('design/banner');
		
		$this->data['banners'] = $this->model_design_banner->getBanners();
		
		$this->template = 'module/cosyone_slideshow.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/cosyone_slideshow')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (isset($this->request->post['cosyone_slideshow_module'])) {
			foreach ($this->request->post['cosyone_slideshow_module'] as $key => $value) {
				if (!$value['width'] || !$value['height']) {
					$this->error['dimension'][$key] = $this->language->get('error_dimension');
				}				
			}
		}	
						
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}
?>