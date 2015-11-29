<?php
//-----------------------------------------------------
// TagCloud for Opencart v1.5.6    						
// Adapted by villagedefrance                          		
// contact@villagedefrance.net                        		
//-----------------------------------------------------

class ControllerModuleTagCloud extends Controller {
	private $error = array();
	private $_name = 'tagcloud';
	private $_version = '1.5.6';
	private $_revision = '1.1';

	public function index() { 
	
		if ((substr(VERSION, 0, 5) == '1.5.5') || (substr(VERSION, 0, 5) == '1.5.6')) {
			$this->language->load('module/' . $this->_name);
		} else {
			$this->load->language('module/' . $this->_name);
		}

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->data[$this->_name . '_version'] = $this->_version;
		
		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
			$this->model_setting_setting->editSetting($this->_name, $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			if ($this->request->post['buttonForm'] == 'apply') {
				$this->redirect($this->url->link('module/' . $this->_name, 'token=' . $this->session->data['token'], 'SSL'));
			} else {
				$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
			}
		}
		
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_enabled']  = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_yes'] = $this->language->get('text_yes'); 
		$this->data['text_no']	= $this->language->get('text_no');
		$this->data['text_content_top'] = $this->language->get('text_content_top');
		$this->data['text_content_bottom'] = $this->language->get('text_content_bottom');		
		$this->data['text_column_left'] = $this->language->get('text_column_left');
		$this->data['text_column_right'] = $this->language->get('text_column_right');
		
		$this->data['text_module_settings'] = $this->language->get('text_module_settings');
	
		$this->data['entry_header'] = $this->language->get('entry_header'); 
		$this->data['entry_title'] = $this->language->get('entry_title');
	
		$this->data['entry_generate'] = $this->language->get('entry_generate');
	
		$this->data['entry_limit'] = $this->language->get('entry_limit');
		$this->data['entry_random'] = $this->language->get('entry_random');
		$this->data['entry_layout'] = $this->language->get('entry_layout');
		$this->data['entry_position'] = $this->language->get('entry_position');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		
		$this->data['button_generate'] = $this->language->get('button_generate');
	
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_apply'] = $this->language->get('button_apply');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_add_module'] = $this->language->get('button_add_module');
		$this->data['button_remove'] = $this->language->get('button_remove');
	
		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
	
		
	
		$this->data['breadcrumbs'] = array();
	
		$this->data['breadcrumbs'][] = array(
			'href'      => $this->url->link('common/home', '&token=' . $this->session->data['token'], 'SSL'),
			'text'      => $this->language->get('text_home'),
			'separator' => FALSE
		);
	
		$this->data['breadcrumbs'][] = array(
			'href'      => $this->url->link('extension/module', '&token=' . $this->session->data['token'], 'SSL'),
			'text'      => $this->language->get('text_module'),
			'separator' => ' :: '
		);
	
		$this->data['breadcrumbs'][] = array(
			'href'      => $this->url->link('module/' . $this->_name, '&token=' . $this->session->data['token'], 'SSL'),
			'text'      => $this->language->get('heading_title'),
			'separator' => ' :: '
		);
	
		$this->data['action']  = $this->url->link('module/' . $this->_name, '&token=' . $this->session->data['token'], 'SSL');
        
		$this->data['cancel']  = $this->url->link('extension/module', '&token=' . $this->session->data['token'], 'SSL');
		
		// Version Check
		$this->data['text_status'] = $this->language->get('text_status');
		$this->data['module_name'] = $this->language->get('text_module_name');
		$this->data['module_current_name'] = $this->_name;
		$this->data['module_list'] = $this->language->get('text_module_list');
		$this->data['store_version'] = sprintf($this->language->get('text_store_version'), VERSION);
		$this->data['store_base_version'] = substr(VERSION, 0, 5);
		$this->data['text_template'] = $this->language->get('text_template');
	
		$this->data['compatibles'] = array();
	
		$this->data['compatibles'][] = array('opencart' => '1.5.4', 'title' => $this->language->get('text_v154'));
		$this->data['compatibles'][] = array('opencart' => '1.5.5', 'title' => $this->language->get('text_v155'));
		$this->data['compatibles'][] = array('opencart' => '1.5.6', 'title' => $this->language->get('text_v156'));
		
		$this->data['button_showhide'] = $this->language->get('button_showhide');
		$this->data['button_support'] = $this->language->get('button_support');
	
		$this->data['module_current_version'] = sprintf($this->language->get('text_module_version'), $this->_version);
		$this->data['module_current_revision'] = sprintf($this->language->get('text_module_revision'), $this->_revision);
		$this->data['text_no_file'] = $this->language->get('text_no_file');
		$this->data['text_update'] = $this->language->get('text_update');
		$this->data['text_getupdate'] = $this->language->get('text_getupdate');
	
		$vdfurl = 'http://villagedefrance.net/updater/module/' . $this->_name . '/revisions.txt';
		$vdfhandler = curl_init($vdfurl);
		curl_setopt($vdfhandler,  CURLOPT_RETURNTRANSFER, TRUE);
		$resp = curl_exec($vdfhandler);
		$vdf = curl_getinfo($vdfhandler, CURLINFO_HTTP_CODE);
	
		if ($vdf == '200') { 
			$getRevisions = file_get_contents($vdfurl);
		} else {
			$getRevisions = '';
		}
	
		if ($getRevisions !== '') {
			$revisionList = explode("\n", $getRevisions);
		
			foreach ($revisionList as $revision) { 
			
				$version = substr($revision, 0, 5);
				$subversion = substr($revision, -3);
			
				if ($version > $this->_version) {
					$this->data['version'] = sprintf($this->language->get('text_v_update'), $version);
					$this->data['ver_update'] = true;
				
					$this->data['revision'] = $this->language->get('text_no_revision');
				} else {
					$this->data['version'] = sprintf($this->language->get('text_v_no_update'), $version);
					$this->data['ver_update'] = false;
				
					if ($subversion > $this->_revision) {
						$this->data['revision'] = sprintf($this->language->get('text_r_update'), $subversion);
						$this->data['rev_update'] = true;
					} else {
						$this->data['revision'] = sprintf($this->language->get('text_r_no_update'), $subversion);
						$this->data['rev_update'] = false;
					}
				}
			}
		} else {
			$this->data['version'] = '';
			$this->data['revision'] = '';
			$this->data['ver_update'] = false;
			$this->data['rev_update'] = false;
		}
	
		$this->data['generate_url'] = $this->url->link('module/' . $this->_name . '/generate', '&token=' . $this->session->data['token'], 'SSL');
	
		// Template
		$this->data['templates'] = array();
	
		$directories = glob(DIR_CATALOG . 'view/theme/*', GLOB_ONLYDIR);
	
		foreach ($directories as $directory) {
			$this->data['templates'][] = basename($directory);
		}
	
		if (isset($this->request->post['config_template'])) {
			$this->data['config_template'] = $this->request->post['config_template'];
		} else {
			$this->data['config_template'] = $this->config->get('config_template');	
		}
	
		// Module
		$this->data['font_weights'] = array();

		$this->data['font_weights'][] = array(
			'font_weight' 	=> 'normal',
			'title'    	=> $this->language->get('text_normal')
		);
	
		$this->data['font_weights'][] = array(
			'font_weight' 	=> 'bold',
			'title'    	=> $this->language->get('text_bold')
		);
	
		$this->load->model('localisation/language');
		
		$languages = $this->model_localisation_language->getLanguages();
		
		foreach ($languages as $language) {
			if (isset($this->request->post[$this->_name . '_title' . $language['language_id']])) {
				$this->data[$this->_name . '_title' . $language['language_id']] = $this->request->post[$this->_name . '_title' . $language['language_id']];
			} else {
				$this->data[$this->_name . '_title' . $language['language_id']] = $this->config->get($this->_name . '_title' . $language['language_id']);
			}
		}
	
		$this->data['languages'] = $languages;
	
		if (isset($this->request->post[$this->_name . '_header'])) { 
			$this->data[$this->_name . '_header'] = $this->request->post[$this->_name . '_header']; 
		} else { 
			$this->data[$this->_name . '_header'] = $this->config->get($this->_name . '_header' ); 
		}
		if (isset($this->request->post[$this->_name . '_title'])) { 
			$this->data[$this->_name . '_title'] = $this->request->post[$this->_name . '_title']; 
		} else { 
			$this->data[$this->_name . '_title'] = $this->config->get($this->_name . '_title' ); 
		} 	
		
		if (isset($this->request->post[$this->_name . '_generate'])) {
			$this->data[$this->_name . '_generate'] = $this->request->post[$this->_name . '_generate'];
		} else {
			$this->data[$this->_name . '_generate'] = $this->config->get($this->_name . '_generate');
		}
	

		$this->data['modules'] = array();

		if (isset($this->request->post[$this->_name . '_module'])) {
			$this->data['modules'] = $this->request->post[$this->_name . '_module'];
		} elseif ($this->config->get($this->_name . '_module')) {
			$this->data['modules'] = $this->config->get($this->_name . '_module');
		}
    
		$this->load->model('design/layout');
    
		$this->data['layouts'] = $this->model_design_layout->getLayouts();
    
		$this->template = 'module/tagcloud.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
        
		$this->response->setOutput($this->render());
	}

	public function generate() { 
	
		if ((substr(VERSION, 0, 5) == '1.5.5') || (substr(VERSION, 0, 5) == '1.5.6')) {
			$this->language->load('module/' . $this->_name);
		} else {
			$this->load->language('module/' . $this->_name);
		}

		if (!$this->user->hasPermission('modify', 'module/tagcloud')) {
			$json['status']  = 'Error';
			$json['message'] = $this->language->get('error_permission');
		} else {
			$json = $this->generateTagCloud();
		}

		$this->response->setOutput(json_encode($json));
	}
	
	private function generateTagCloud() { 
	
		if ((substr(VERSION, 0, 5) == '1.5.5') || (substr(VERSION, 0, 5) == '1.5.6')) {
			$this->language->load('module/' . $this->_name);
		} else {
			$this->load->language('module/' . $this->_name);
		}
	
		$this->load->model('catalog/tagcloud');

		$rawdata = $this->model_catalog_tagcloud->getRawTags();
	
		foreach($rawdata as $row) {
			$rowTags = explode(',', $row['tag']);
		
			foreach($rowTags as $key => $value) {
				$data[] = array(
					'store_id' 		=> $row['store_id'],
					'language_id' 	=> $row['language_id'],
					'qty' 			=> '1',
					'tag' 			=> trim($value)
				);
			}
		}
	
		$this->model_catalog_tagcloud->clear();
		$this->model_catalog_tagcloud->update($data);
		
		return array('status' => 'Success', 'message' => $this->language->get('generate_success'));
	}

    private function validate() {
		if (!$this->user->hasPermission('modify', 'module/' . $this->_name)) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
    
		
        
		if (!$this->error) {
			return TRUE;
		} else {
			return FALSE;
		}
	}

	public function install() {
		$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "tag_cloud` (`qty` int(11) NOT NULL,`tag` varchar(255) COLLATE utf8_bin NOT NULL,`language_id` int(11) NOT NULL,`store_id` int(11) NOT NULL, PRIMARY KEY (`tag`,`language_id`,`store_id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin");
	}

	public function uninstall() {
		$this->db->query("DROP TABLE " . DB_PREFIX . "tag_cloud");
	}
}
?>