<?php
class ControllerModuleNewslettersubscribe extends Controller {
	private $error = array(); 
	
	public function index() {   
	
		$this->load->language('module/newslettersubscribe');
		
		$this->load->model('localisation/language');
		
		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
		
		$this->load->model('jacklb/newslettersubscribe');
		
		$this->model_jacklb_newslettersubscribe->check_db();
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
			
			$this->model_setting_setting->editSetting('newslettersubscribe', $this->request->post);		
					 
			$this->session->data['success'] = $this->language->get('text_success');
						
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}
				
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_yes'] = $this->language->get('text_yes');
		$this->data['text_no'] = $this->language->get('text_no');
		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_content_top'] = $this->language->get('text_content_top');
		$this->data['text_content_bottom'] = $this->language->get('text_content_bottom');		
		$this->data['text_column_left'] = $this->language->get('text_column_left');
		$this->data['text_column_right'] = $this->language->get('text_column_right');
		$this->data['text_no_results'] = $this->language->get('text_no_results');
		$this->data['text_default'] = $this->language->get('text_default');
		$this->data['text_newsletter'] = $this->language->get('text_newsletter');
		$this->data['text_customer_all'] = $this->language->get('text_customer_all');	
		$this->data['text_customer'] = $this->language->get('text_customer');	
		$this->data['text_customer_group'] = $this->language->get('text_customer_group');
		$this->data['text_affiliate_all'] = $this->language->get('text_affiliate_all');	
		$this->data['text_affiliate'] = $this->language->get('text_affiliate');	
		$this->data['text_product'] = $this->language->get('text_product');	
		$this->data['text_lbnewsletter'] = $this->language->get('text_lbnewsletter');	
		$this->data['text_sendall'] = $this->language->get('text_sendall');	
		$this->data['text_mail_success'] = $this->language->get('text_mail_success');	
		$this->data['text_info'] = $this->language->get('text_info');	
				
		$this->data['tab_general'] = $this->language->get('tab_general');
		$this->data['tab_list'] = $this->language->get('tab_list');
		$this->data['tab_mail'] = $this->language->get('tab_mail');
		$this->data['tab_statistic'] = $this->language->get('tab_statistic');
		
		$this->data['entry_admin'] = $this->language->get('entry_admin');
		$this->data['entry_layout'] = $this->language->get('entry_layout');
		$this->data['entry_position'] = $this->language->get('entry_position');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$this->data['entry_unsubscribe'] = $this->language->get('entry_unsubscribe');
		$this->data['entry_thickbox'] = $this->language->get('entry_thickbox');
		$this->data['entry_registered'] = $this->language->get('entry_registered');	
		$this->data['entry_mail'] = $this->language->get('entry_mail');
		$this->data['entry_options'] = $this->language->get('entry_options');
		$this->data['entry_store'] = $this->language->get('entry_store');
		$this->data['entry_to'] = $this->language->get('entry_to');
		$this->data['entry_customer_group'] = $this->language->get('entry_customer_group');
		$this->data['entry_customer'] = $this->language->get('entry_customer');
		$this->data['entry_affiliate'] = $this->language->get('entry_affiliate');
		$this->data['entry_product'] = $this->language->get('entry_product');
		$this->data['entry_subject'] = $this->language->get('entry_subject');
		$this->data['entry_message'] = $this->language->get('entry_message');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_add_module'] = $this->language->get('button_add_module');
		$this->data['button_remove'] = $this->language->get('button_remove');
		$this->data['button_delete'] = $this->language->get('button_delete');
		$this->data['button_send'] = $this->language->get('button_send');
		
		//Errors
		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

  		//Breadcrumb
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
			'href'      => $this->url->link('module/newslettersubscribe', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		//Actions
		$this->data['action'] = $this->url->link('module/newslettersubscribe', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['delete'] = $this->url->link('module/newslettersubscribe/unsubscribe', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		
		if (isset($this->request->post['option_unsubscribe'])) {
			$this->data['option_unsubscribe'] = $this->request->post['option_unsubscribe'];
		} else {
			$this->data['option_unsubscribe'] = $this->config->get('option_unsubscribe');
		}
		
		if (isset($this->request->post['newslettersubscribe_registered'])) {
			$this->data['newslettersubscribe_registered'] = $this->request->post['newslettersubscribe_registered'];
		} else {
			$this->data['newslettersubscribe_registered'] = $this->config->get('newslettersubscribe_registered');
		}
		
		if (isset($this->request->post['popup_delay_time'])) {
			$this->data['popup_delay_time'] = $this->request->post['popup_delay_time'];
		} else {
			$this->data['popup_delay_time'] = $this->config->get('popup_delay_time');
		}
		
		if (isset($this->request->post['popup_only_show_once'])) {
			$this->data['popup_only_show_once'] = $this->request->post['popup_only_show_once'];
		} else {
			$this->data['popup_only_show_once'] = $this->config->get('popup_only_show_once');
		}
		
		$languages = $this->model_localisation_language->getLanguages();
		$this->data['languages'] = $languages;
		foreach ($languages as $language) { $custom_popup = 'popup_custom_block_' . $language['language_id'];
			if (isset($this->request->post[$custom_popup])) {
				$this->data[$custom_popup] = $this->request->post[$custom_popup];
			} else {
				$this->data[$custom_popup] = $this->config->get($custom_popup);
			}
		}
		
		if (isset($this->request->post['newslettersubscribe_mail_status'])) {
			$this->data['newslettersubscribe_mail_status'] = $this->request->post['newslettersubscribe_mail_status'];
		} else {
			$this->data['newslettersubscribe_mail_status'] = $this->config->get('newslettersubscribe_mail_status');
		}
		
		if (isset($this->request->post['newslettersubscribe_thickbox'])) {
			$this->data['newslettersubscribe_thickbox'] = $this->request->post['newslettersubscribe_thickbox'];
		} else {
			$this->data['newslettersubscribe_thickbox'] = $this->config->get('newslettersubscribe_thickbox');
		}
		
		$this->load->model('design/layout');
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();
		
		$this->data['modules'] = array();
				
		if (isset($this->request->post['newslettersubscribe_module'])) {
			$this->data['modules'] = $this->request->post['newslettersubscribe_module'];
		} elseif ($this->config->get('newslettersubscribe_module')) { 
			$this->data['modules'] = $this->config->get('newslettersubscribe_module');
		}	
		
		if (isset($this->request->post['newslettersubscribe_module'])) {
			$this->data['newslettersubscribe_module'] = $this->request->post['newslettersubscribe_module'];
		} else {
			$this->data['newslettersubscribe_module'] = $this->config->get('newslettersubscribe_module');
		}
		
		//Get User List
		
		$user_total = $this->model_jacklb_newslettersubscribe->getTotalUsers();
		
		if (isset($this->request->get['page'])) {
			
			$page = $this->request->get['page'];
			
		} else {
			
			$page = 1;
			
		}
		
		$this->data['page_nav'] = ($page-1) * $this->config->get('config_admin_limit');
		
		$url = '';
		
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
		
		$data = array(
			'start'           => ($page - 1) * $this->config->get('config_admin_limit'),
			'limit'           => $this->config->get('config_admin_limit')
		);
		
		$results = $this->model_jacklb_newslettersubscribe->getList($data);
		
		$this->data['users'] = array();
		
		foreach ($results as $result) {
		 
		 	$action = array();
			
			$action[] = array(
				'text' => $this->language->get('text_delete'),
				'href' => $this->url->link('module/newslettersubscribe/unsubscribe', 'token=' . $this->session->data['token'] . '&user_id=' . $result['id'] . $url, 'SSL')
			);
			
			$this->data['users'][] = array(
				'id' 			=> $result['id'],
				'name'       	=> $result['name'],
				'email_id'      => $result['email_id'],
				'selected'   	=> isset($this->request->post['selected']) && in_array($result['id'], $this->request->post['selected']),
				'action'     	=> $action,
				'start'         => ($page - 1) * $this->config->get('config_admin_limit'),
				'limit'         => $this->config->get('config_admin_limit')
			);
		
		}

		//Mail
		$this->load->model('setting/store');
		
		$this->data['token'] = $this->session->data['token'];
		
		$this->data['stores'] = $this->model_setting_store->getStores();
		
		$this->load->model('sale/customer_group');
				
		$this->data['customer_groups'] = $this->model_sale_customer_group->getCustomerGroups(0);

		//Graph
		$today = date("Y-m-d");
		
		$previous_date = date('Y-m-d', strtotime("-15 days"));
		
		$dates = $this->GetDays($previous_date, $today); 
		
		$graphs = $this->model_jacklb_newslettersubscribe->graphs();
		
		foreach ($dates as $d) {
			$new_dates[$d] = 0;
		}
		
		$new_graphs = array();
		
		foreach ($graphs as $graph) {
			$date = $graph['date'];
			$new_graphs[$date] = $graph['total'];
		}
		
		$this->data['jack'] = array_merge($new_dates, $new_graphs);
		
		//Pagination 
		$pagination = new Pagination();
		$pagination->total = $user_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('module/newslettersubscribe', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');
			
		$this->data['pagination'] = $pagination->render();
		
				
		$this->template = 'module/newslettersubscribe.tpl';
		$this->children = array(
			'common/header',
			'common/footer',
		);
				
		$this->response->setOutput($this->render());
	}
	
	public function unsubscribe() {
		
		$this->load->model('jacklb/newslettersubscribe');
		
		$data = '';
		
		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			
			foreach ($this->request->post['selected'] as $user_id) {
				$this->model_jacklb_newslettersubscribe->delete($user_id);                
	  		}
			
			$this->session->data['success'] = $this->language->get('text_success');
			
			$url = '';
			
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			
			$this->redirect($this->url->link('module/newslettersubscribe', 'token=' . $this->session->data['token'] . $url, 'SSL'));
			
		} else if( isset($this->request->get['user_id']) ) {
			
			$data = $this->request->get['user_id'];
			
			$this->model_jacklb_newslettersubscribe->delete($data);
			
			if (isset($this->request->get['page'])) {
				$page = $this->request->get['page'];
			} else {
				$page = 1;
			}
			
			$url = '';
			
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			
			$this->redirect($this->url->link('module/newslettersubscribe', 'token=' . $this->session->data['token'] . $url, 'SSL'));
			
		
		} else {
		
			$this->index();
			
		}
		
		
	}
	
	//Send Mail Function
	
	public function send() {
		$this->language->load('module/newslettersubscribe');
		
		$json = array();
		
		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			if (!$this->user->hasPermission('modify', 'module/newslettersubscribe')) {
				$json['error']['warning'] = $this->language->get('error_permission');
			}
					
			if (!$this->request->post['subject']) {
				$json['error']['subject'] = $this->language->get('error_subject');
			}
	
			if (!$this->request->post['message']) {
				$json['error']['message'] = $this->language->get('error_message');
			}
			
			if (!$json) {
				
				$this->load->model('setting/store');
			
				$store_info = $this->model_setting_store->getStore($this->request->post['store_id']);			
				
				if ($store_info) {
					$store_name = $store_info['name'];
				} else {
					$store_name = $this->config->get('config_name');
				}
	
				$this->load->model('sale/customer');
				
				$this->load->model('sale/customer_group');
				
				$this->load->model('sale/affiliate');
	
				$this->load->model('sale/order');
				
				$this->load->model('jacklb/newslettersubscribe');
	
				if (isset($this->request->get['page'])) {
					$page = $this->request->get['page'];
				} else {
					$page = 1;
				}
								
				$email_total = 0;
							
				$emails = array();
				
				switch ($this->request->post['to']) {
					case 'newsletter':
						$customer_data = array(
							'filter_newsletter' => 1,
							'start'             => ($page - 1) * 10,
							'limit'             => 10
						);
						
						$email_total = $this->model_sale_customer->getTotalCustomers($customer_data);
							
						$results = $this->model_sale_customer->getCustomers($customer_data);
					
						foreach ($results as $result) {
							$emails[] = $result['email'];
						}
						break;
					/* Start : Bhavin */	
					case 'sendall':
						$customer_data = array(
							'filter_newsletter' => 1,
							'start'             => ($page - 1) * 10,
							'limit'             => 10
						);
						
						$email_total = $this->model_sale_customer->getTotalCustomers($customer_data);
							
						$results = $this->model_sale_customer->getCustomers($customer_data);
						
						$email_total1 = $this->model_jacklb_newslettersubscribe->getTotalUsers();
							
						$results1 = $this->model_jacklb_newslettersubscribe->getList($customer_data);
						
						$email_total = $email_total + $email_total1;
						
						foreach ($results as $result) {
							$emails[] = $result['email'];
						}
						
						foreach ($results1 as $result1) {
							$emails1[] = $result1['email_id'];
						}
						
						$emails = array_merge($emails,$emails1);
						
						break;
					case 'lbnewsletter':
						$customer_data = array(
							'filter_newsletter' => 1,
							'start'             => ($page - 1) * 10,
							'limit'             => 10
						);
						
						$email_total = $this->model_jacklb_newslettersubscribe->getTotalUsers();
							
						$results = $this->model_jacklb_newslettersubscribe->getList($customer_data);
						
						foreach ($results as $result) {
							$emails[] = $result['email_id'];
						}
						break;
					/* End : Bhavin */
					case 'customer_all':
						$customer_data = array(
							'start'  => ($page - 1) * 10,
							'limit'  => 10
						);
									
						$email_total = $this->model_sale_customer->getTotalCustomers($customer_data);
										
						$results = $this->model_sale_customer->getCustomers($customer_data);
				
						foreach ($results as $result) {
							$emails[] = $result['email'];
						}						
						break;
					case 'customer_group':
						$customer_data = array(
							'filter_customer_group_id' => $this->request->post['customer_group_id'],
							'start'                    => ($page - 1) * 10,
							'limit'                    => 10
						);
						
						$email_total = $this->model_sale_customer->getTotalCustomers($customer_data);
										
						$results = $this->model_sale_customer->getCustomers($customer_data);
				
						foreach ($results as $result) {
							$emails[$result['customer_id']] = $result['email'];
						}						
						break;
					case 'customer':
						if (!empty($this->request->post['customer'])) {					
							foreach ($this->request->post['customer'] as $customer_id) {
								$customer_info = $this->model_sale_customer->getCustomer($customer_id);
								
								if ($customer_info) {
									$emails[] = $customer_info['email'];
								}
							}
						}
						break;	
					case 'affiliate_all':
						$affiliate_data = array(
							'start'  => ($page - 1) * 10,
							'limit'  => 10
						);
						
						$email_total = $this->model_sale_affiliate->getTotalAffiliates($affiliate_data);		
						
						$results = $this->model_sale_affiliate->getAffiliates($affiliate_data);
				
						foreach ($results as $result) {
							$emails[] = $result['email'];
						}						
						break;	
					case 'affiliate':
						if (!empty($this->request->post['affiliate'])) {					
							foreach ($this->request->post['affiliate'] as $affiliate_id) {
								$affiliate_info = $this->model_sale_affiliate->getAffiliate($affiliate_id);
								
								if ($affiliate_info) {
									$emails[] = $affiliate_info['email'];
								}
							}
						}
						break;											
					case 'product':
						if (isset($this->request->post['product'])) {
							$email_total = $this->model_sale_order->getTotalEmailsByProductsOrdered($this->request->post['product']);	
							
							$results = $this->model_sale_order->getEmailsByProductsOrdered($this->request->post['product'], ($page - 1) * 10, 10);
													
							foreach ($results as $result) {
								$emails[] = $result['email'];
							}
						}
						break;												
				}
				
				if ($emails) {
					$start = ($page - 1) * 10;
					$end = $start + 10;
					
					if ($end < $email_total) {
						$json['success'] = sprintf($this->language->get('text_sent'), $start, $email_total);
					} else { 
						$json['success'] = $this->language->get('text_mail_success');
					}				
						
					if ($end < $email_total) {
						$json['next'] = str_replace('&amp;', '&', $this->url->link('module/newslettersubscribe/send', 'token=' . $this->session->data['token'] . '&page=' . ($page + 1), 'SSL'));
					} else {
						$json['next'] = '';
					}
										
					$message  = '<html dir="ltr" lang="en">' . "\n";
					$message .= '  <head>' . "\n";
					$message .= '    <title>' . $this->request->post['subject'] . '</title>' . "\n";
					$message .= '    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">' . "\n";
					$message .= '  </head>' . "\n";
					$message .= '  <body>' . html_entity_decode($this->request->post['message'], ENT_QUOTES, 'UTF-8') . '</body>' . "\n";
					$message .= '</html>' . "\n";
					
					foreach ($emails as $email) {
						$mail = new Mail();	
						$mail->protocol = $this->config->get('config_mail_protocol');
						$mail->parameter = $this->config->get('config_mail_parameter');
						$mail->hostname = $this->config->get('config_smtp_host');
						$mail->username = $this->config->get('config_smtp_username');
						$mail->password = $this->config->get('config_smtp_password');
						$mail->port = $this->config->get('config_smtp_port');
						$mail->timeout = $this->config->get('config_smtp_timeout');				
						$mail->setTo($email);
						$mail->setFrom($this->config->get('config_email'));
						$mail->setSender($store_name);
						$mail->setSubject(html_entity_decode($this->request->post['subject'], ENT_QUOTES, 'UTF-8'));					
						$mail->setHtml($message);
						$mail->send();
					}
				} 
			}
		}
		
		$this->response->setOutput(json_encode($json));	
	}
	
	// Gives you dates between start and end
	public function GetDays($sStartDate, $sEndDate) {
$sStartDate = gmdate("Y-m-d", strtotime($sStartDate));
$sEndDate = gmdate("Y-m-d", strtotime($sEndDate));
$aDays[] = $sStartDate;
$sCurrentDate = $sStartDate;
while($sCurrentDate < $sEndDate) {
$sCurrentDate = gmdate("Y-m-d", strtotime("+2 day", strtotime($sCurrentDate)));
$aDays[] = $sCurrentDate;
}
return $aDays;
}
	
	
		
	protected function validateDelete() {
    	if (!$this->user->hasPermission('modify', 'module/newslettersubscribe')) {
      		$this->error['warning'] = $this->language->get('error_permission');  
    	}
		
		if (!$this->error) {
	  		return true;
		} else {
	  		return false;
		}
  	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/newslettersubscribe')) {
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