<?php
class ControllerModuleDAjaxSearch extends Controller {
	public $route = 'module/d_ajax_search';
	public $mbooth = 'mbooth_d_ajax_search.xml';
	private $error = array(); 
	private $input = array();
	
	public function index() {

		/*
		*	Multistore
		*/
		if(isset($this->request->get['store_id'])){ $store_id = $this->request->get['store_id']; }else{  $store_id = 0; }
		
		$this->document->addLink('//fonts.googleapis.com/css?family=PT+Sans:400,700,700italic,400italic&subset=latin,cyrillic-ext,latin-ext,cyrillic', "stylesheet");
		$this->document->addStyle('view/stylesheet/shopunity/normalize.css');
		$this->document->addStyle('view/javascript/shopunity/uniform/css/uniform.default.css');
		$this->document->addStyle('view/stylesheet/shopunity/icons.css');
		$this->document->addStyle('view/stylesheet/shopunity/shopunity.css');
		$this->document->addScript('view/javascript/shopunity/uniform/jquery.uniform.min.js');		
		$this->document->addScript('view/javascript/shopunity/shopunity.js');
		$this->document->addScript('view/javascript/shopunity/tooltip/tooltip.js');   
		$this->language->load('module/d_ajax_search');

		$this->document->setTitle($this->language->get('heading_title_main'));
		
		$this->load->model('setting/setting');
		$this->load->model('design/layout');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			
			$settings = $this->request->post;
			$count_layout =  count($this->model_design_layout->getLayouts());
			
			for ($i=1;$i<=$count_layout;$i++)
			$settings['d_ajax_search_module'][] = array (
				'layout_id' => (string)$i,
				'position' => 'content_top',
				'status' => 1,
				'sort_order' => ''
			);

			$this->model_setting_setting->editSetting('d_ajax_search', $settings, $store_id);

			$this->session->data['success'] = $this->language->get('text_success');
	
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->data['version'] = $this->get_version();
        $this->data['token'] =  $this->session->data['token'];
		$this->data['route'] = $this->route;
		$this->data['module_link'] = $this->url->link($this->route, 'token=' . $this->session->data['token'], 'SSL');
		$this->data['heading_title'] = $this->language->get('heading_title_main');

		$this->data['text_yes'] = $this->language->get('text_yes');
		$this->data['text_no'] = $this->language->get('text_no');
		$this->data['text_settings'] = $this->language->get('text_settings');
		$this->data['text_instructions'] = $this->language->get('text_instructions');
		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_module'] = $this->language->get('text_module');
		$this->data['text_no_update'] = $this->language->get('text_no_update');
		$this->data['text_new_update'] = $this->language->get('text_new_update');
		$this->data['text_error_update'] = $this->language->get('text_error_update');
		$this->data['text_error_failed'] = $this->language->get('text_error_failed');
		$this->data['text_version_check'] = sprintf($this->language->get('text_version_check'), $this->data['version']);
		
		
		$this->data['entry_search_on_off'] = $this->language->get('entry_search_on_off');
		$this->data['entry_search_width'] = $this->language->get('entry_search_width');
		$this->data['entry_search_max_symbols'] = $this->language->get('entry_search_max_symbols');
		$this->data['entry_search_max_results'] = $this->language->get('entry_search_max_results');
		$this->data['entry_search_first_sybmols'] = $this->language->get('entry_search_first_sybmols');
		$this->data['entry_search_priority'] = $this->language->get('entry_search_priority');
		$this->data['entry_search_price'] = $this->language->get('entry_search_price');
		$this->data['entry_search_special'] = $this->language->get('entry_search_special');
		$this->data['entry_search_tax'] = $this->language->get('entry_search_tax');
		$this->data['entry_search_class'] = $this->language->get('entry_search_class');
		
		$this->data['text_on'] = $this->language->get('text_on');
		$this->data['text_off'] = $this->language->get('text_off');
		$this->data['text_product'] = $this->language->get('text_product');
		$this->data['text_category'] = $this->language->get('text_category');
		$this->data['text_manufacturer'] = $this->language->get('text_manufacturer');
		$this->data['text_information'] = $this->language->get('text_information');
		$this->data['text_blog_article'] = $this->language->get('text_blog_article');
		$this->data['text_blog_category'] = $this->language->get('text_blog_category');
		$this->data['button_save_and_stay'] = $this->language->get('button_save_and_stay');
		$this->data['button_version_check'] = $this->language->get('button_version_check');
		$this->data['text_instructions_full'] = $this->language->get('text_instructions_full');
		
		$this->data['tooltip_search_width'] = $this->language->get('tooltip_search_width');
		$this->data['tooltip_search_max_symbols'] = $this->language->get('tooltip_search_max_symbols');
		$this->data['tooltip_search_max_results'] = $this->language->get('tooltip_search_max_results');
		$this->data['tooltip_search_on_off'] = $this->language->get('tooltip_search_on_off');
		$this->data['tooltip_general_version'] = $this->language->get('tooltip_general_version');
		$this->data['tooltip_search_class'] = $this->language->get('tooltip_search_class');
		$this->data['tooltip_search_first_symbols'] = $this->language->get('tooltip_search_first_symbols');

		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
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
       		'text'      => $this->language->get('heading_title_main'),
			'href'      => $this->url->link('module/d__ajax_search', 'token=' . $this->session->data['token'] . '&store_id='.$store_id, 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/d_ajax_search', 'token=' . $this->session->data['token'] . '&store_id='.$store_id, 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
		if (isset($this->request->post['d_ajax_search'])) {
			$this->data['d_ajax_search'] = $this->request->post['d_ajax_search'];
		} elseif($this->model_setting_setting->getSetting('d_ajax_search', $store_id)){
			$this->data['d_ajax_search'] = $this->model_setting_setting->getSetting('d_ajax_search', $store_id);
			$this->data['d_ajax_search'] = $this->data['d_ajax_search']['d_ajax_search'];
		}else{
			$this->data['d_ajax_search'] = '';
		}

		//Get stores
		$this->data['store_id'] = $store_id;
		$this->load->model('setting/store');
		$results = $this->model_setting_store->getStores();
		if($results){
			$this->data['stores'][] = array('store_id' => 0, 'name' => $this->config->get('config_name'));
			foreach ($results as $result) {
				$this->data['stores'][] = array(
					'store_id' => $result['store_id'],
					'name' => $result['name']
					
				);
			}	
		}
		
		if (file_exists(DIR_APPLICATION . "controller/blog")) $this->data['is_blog']=1; else $this->data['is_blog']=0;
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();
				
		$this->template = 'module/d_ajax_search.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
	
	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/d_ajax_search')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
	
	function install(){
		$this->version_check(1);
	}
	function uninstall(){
		$this->version_check(0);
	}

	public function get_version(){
		$xml = file_get_contents(DIR_APPLICATION . 'mbooth/xml/' . $this->mbooth);

		$mbooth = new SimpleXMLElement($xml);

		return $mbooth->version ;
		}
		
	public function version_check($status = 1){
		$json = array();
		$mbooth = $this->mbooth;
		$this->load->language($this->route);
		$str = file_get_contents(DIR_APPLICATION . 'mbooth/xml/' . $this->mbooth);
		$xml = new SimpleXMLElement($str);
	
		$current_version = $xml->version ;

		$customer_url = HTTP_SERVER;
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "language` WHERE language_id = " . (int)$this->config->get('config_language_id') ); 
		$language_code = $query->row['code'];
		$ip = $this->request->server['REMOTE_ADDR'];

		$check_version_url = 'http://opencart.dreamvention.com/update/index.php?mbooth=' . $mbooth . '&store_url=' . $customer_url . '&module_version=' . $current_version . '&language_code=' . $language_code . '&opencart_version=' . VERSION . '&ip='.$ip . '&status=' .$status ;
		
		$curl = curl_init();
		curl_setopt($curl, CURLOPT_URL, $check_version_url);
		curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
		$return_data = curl_exec($curl);
		$return_code = curl_getinfo($curl, CURLINFO_HTTP_CODE);
		curl_close($curl);

      if ($return_code == 200) {
         $data = simplexml_load_string($return_data);
	
         if ((string) $data->version == (string) $current_version || (string) $data->version <= (string) $current_version) {
			 
           $json['success']   = $this->language->get('text_no_update');

         } elseif ((string) $data->version > (string) $current_version) {
			 
			$json['attention']   = $this->language->get('text_new_update');
				
			foreach($data->updates->update as $update){

				if((string) $update->attributes()->version > (string)$current_version){
					$version = (string)$update->attributes()->version;
					$json['update'][$version] = (string) $update[0];
				}
			}
         } else {
            $json['error']   = $this->language->get('text_error_update');
         }
      } else { 
         $json['error']   =  $this->language->get('text_error_failed');
      }
		 $json['asdasd']= 'asdasda';
	      if (file_exists(DIR_SYSTEM.'library/json.php')) { 
	         $this->load->library('json');
	         $this->response->setOutput(Json::encode($json));
	      } else {
	         $this->response->setOutput(json_encode($json));
	      }
	}
}
?>