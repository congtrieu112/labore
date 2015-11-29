<?php
class ControllerModuleCosyoneBannerwall extends Controller {
	private $error = array(); 
	 
	public function index() {   
		$this->language->load('module/cosyone_bannerwall');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('cosyone_bannerwall', $this->request->post);	
			
			
			if (isset($this->request->post['continue']) && $this->request->post['continue'] == '1') {
				$this->session->data['success'] = $this->language->get('text_success');	
				$this->redirect($this->url->link('module/cosyone_bannerwall', 'token=' . $this->session->data['token'], 'SSL')); 
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
		$this->data['text_image_manager'] = $this->language->get('text_image_manager');
		$this->data['text_browse'] = $this->language->get('text_browse');
		$this->data['text_clear'] = $this->language->get('text_clear');
		
		$this->data['entry_image1'] = $this->language->get('entry_image1');
		$this->data['entry_image2'] = $this->language->get('entry_image2');
		$this->data['entry_image3'] = $this->language->get('entry_image3');
		$this->data['entry_image4'] = $this->language->get('entry_image4');
		$this->data['entry_image5'] = $this->language->get('entry_image5');
		$this->data['entry_html'] = $this->language->get('entry_html');
		$this->data['entry_layout'] = $this->language->get('entry_layout');
		$this->data['entry_position'] = $this->language->get('entry_position');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_add_module'] = $this->language->get('button_add_module');
		$this->data['button_remove'] = $this->language->get('button_remove');
		
		$this->data['tab_module'] = $this->language->get('tab_module');

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
                'href'      => $this->url->link('module/cosyone_bannerwall', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/cosyone_bannerwall', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['token'] = $this->session->data['token'];
                
                //$this->debug->dump($this->config->get('cosyone_bannerwall_module'));
                
		$this->load->model('tool/image');
		
		$this->load->model('localisation/language');
		$languages = $this->model_localisation_language->getLanguages();
                
		$modules = array();
		
		if (isset($this->request->post['cosyone_bannerwall_module'])) {
                    $modules = $this->request->post['cosyone_bannerwall_module'];
		} elseif ($this->config->get('cosyone_bannerwall_module')) { 
                    $modules = $this->config->get('cosyone_bannerwall_module');
		}
                
                $this->data['modules'] = array();
                
                foreach($modules as $module) {
                    foreach($languages as $language) {
                        $language_id = $language['language_id'];

                        if (!empty($module['image1'][$language_id]) && file_exists(DIR_IMAGE . $module['image1'][$language_id])) {
                            $thumb1[$language_id] = $this->model_tool_image->resize($module['image1'][$language_id], 100, 100);
                            $image1[$language_id] = $module['image1'][$language_id];
                        } else {
                            $thumb1[$language_id] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
                            $image1[$language_id] = NULL;
                        }
						
						if (!empty($module['html1'][$language_id])) {
                            $html1[$language_id] = $module['html1'][$language_id];
                        } else {
                            $html1[$language_id] = NULL;
                        }
						
                        if (!empty($module['image2'][$language_id]) && file_exists(DIR_IMAGE . $module['image2'][$language_id])) {
                            $thumb2[$language_id] = $this->model_tool_image->resize($module['image2'][$language_id], 100, 100);
                            $image2[$language_id] = $module['image2'][$language_id];
                        } else {
                            $thumb2[$language_id] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
                            $image2[$language_id] = NULL;
                        }
						
						if (!empty($module['html2'][$language_id])) {
                            $html2[$language_id] = $module['html2'][$language_id];
                        } else {
                            $html2[$language_id] = NULL;
                        }

                        if (!empty($module['image3'][$language_id]) && file_exists(DIR_IMAGE . $module['image3'][$language_id])) {
                            $thumb3[$language_id] = $this->model_tool_image->resize($module['image3'][$language_id], 100, 100);
                            $image3[$language_id] = $module['image3'][$language_id];
                        } else {
                            $thumb3[$language_id] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
                            $image3[$language_id] = NULL;
                        }
						
						
						if (!empty($module['html3'][$language_id])) {
                            $html3[$language_id] = $module['html3'][$language_id];
                        } else {
                            $html3[$language_id] = NULL;
                        }

                        if (!empty($module['image4'][$language_id]) && file_exists(DIR_IMAGE . $module['image4'][$language_id])) {
                            $thumb4[$language_id] = $this->model_tool_image->resize($module['image4'][$language_id], 100, 100);
                            $image4[$language_id] = $module['image4'][$language_id];
                        } else {
                            $thumb4[$language_id] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
                            $image4[$language_id] = NULL;
                        }
						
						if (!empty($module['html4'][$language_id])) {
                            $html4[$language_id] = $module['html4'][$language_id];
                        } else {
                            $html4[$language_id] = NULL;
                        }

                        if (!empty($module['image5'][$language_id]) && file_exists(DIR_IMAGE . $module['image5'][$language_id])) {
                            $thumb5[$language_id] = $this->model_tool_image->resize($module['image5'][$language_id], 100, 100);
                            $image5[$language_id] = $module['image5'][$language_id];
                        } else {
                            $thumb5[$language_id] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
                            $image5[$language_id] = NULL;
                        }
						
						if (!empty($module['html5'][$language_id])) {
                            $html5[$language_id] = $module['html5'][$language_id];
                        } else {
                            $html5[$language_id] = NULL;
                        }
						
						
                    }
                    
                    $this->data['modules'][] = array(
                        'thumb1'     => $thumb1,
                        'thumb2'     => $thumb2,
                        'thumb3'     => $thumb3,
                        'thumb4'     => $thumb4,
                        'thumb5'     => $thumb5,
                        'image1'     => $image1,
                        'image2'     => $image2,
                        'image3'     => $image3,
                        'image4'     => $image4,
                        'image5'     => $image5,
						'html1'     => $html1,
						'html2'     => $html2,
						'html3'     => $html3,
						'html4'     => $html4,
						'html5'     => $html5,
                        'layout_id'  => $module['layout_id'],
                        'position'   => $module['position'],
                        'status'     => $module['status'],
                        'sort_order' => $module['sort_order'],
                    );
                }
                
                //$this->debug->dump($this->data['modules']);
		
                $this->data['no_image'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
                
		$this->load->model('design/layout');
		$this->data['layouts'] = $this->model_design_layout->getLayouts();
                
                $this->data['languages'] = $languages;

		$this->template = 'module/cosyone_bannerwall.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
	
	
	
	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/cosyone_bannerwall')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}
?>