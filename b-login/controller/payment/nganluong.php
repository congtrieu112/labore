<?php
class ControllerPaymentNganLuong extends Controller {
	  private $error = array(); 
	  public function index() {
	  $this->load->language('payment/nganluong');
	  $this->document->setTitle($this->language->get('heading_title'));
		$this->load->model('setting/setting');
	if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('nganluong', $this->request->post);				
			$this->session->data['success'] = $this->language->get('text_success');
			$this->redirect($this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL'));
		}
	  $this->data['heading_title']  		= $this->language->get('heading_title');
	  $this->data['text_enabled']   		= $this->language->get('text_enabled');
	  $this->data['text_disabled']  		= $this->language->get('text_disabled');
	  $this->data['entry_receiver'] 		= $this->language->get('entry_receiver');
      $this->data['entry_order_status'] 	= $this->language->get('entry_order_status');		
	  $this->data['entry_status'] 			= $this->language->get('entry_status');
	  $this->data['entry_sort_order'] 		= $this->language->get('entry_sort_order');
	  $this->data['button_save'] 			= $this->language->get('button_save');
	  $this->data['button_cancel'] 			= $this->language->get('button_cancel');
	  $this->data['tab_general'] 			= $this->language->get('tab_general');
  if (isset($this->error['warning'])) {
		  $this->data['error_warning'] = $this->error['warning'];
		  } else {
		  $this->data['error_warning'] = '';
		  }
		  if (isset($this->error['receiver'])) {
		  $this->data['error_receiver'] = $this->error['receiver'];
		  } else {
		  $this->data['error_receiver'] = '';
		  }
			$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_payment'),
			'href'      => $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('payment/nganluong', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
				
		$this->data['action'] = $this->url->link('payment/nganluong', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL');
		if (isset($this->request->post['nganluong_total'])) {
			$this->data['nganluong_total'] = $this->request->post['nganluong_total'];
		} else {
			$this->data['nganluong_total'] = $this->config->get('nganluong_total'); 
		}	
	
	  if (isset($this->request->post['nganluong_receiver'])) {
	  $this->data['nganluong_receiver'] = $this->request->post['nganluong_receiver'];
	  } else {
	  $this->data['nganluong_receiver'] = $this->config->get('nganluong_receiver');
	  }
	  if (isset($this->request->post['nganluong_order_status_id'])) {
	  $this->data['nganluong_order_status_id'] = $this->request->post['nganluong_order_status_id'];
	  } else {
	  $this->data['nganluong_order_status_id'] = $this->config->get('nganluong_order_status_id'); 
	  }  
  	$this->data['callback'] = HTTP_CATALOG . 'index.php?route=payment/nganluong/callback';
  
    	$this->load->model('localisation/order_status');
		
		$this->data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();
  
  if (isset($this->request->post['nganluong_status'])) {
  $this->data['nganluong_status'] = $this->request->post['nganluong_status'];
  } else {
  $this->data['nganluong_status'] = $this->config->get('nganluong_status');
  }
  if (isset($this->request->post['nganluong_sort_order'])) {
  $this->data['nganluong_sort_order'] = $this->request->post['nganluong_sort_order'];
  } else {
  $this->data['nganluong_sort_order'] = $this->config->get('nganluong_sort_order');
  }
  
$this->template = 'payment/nganluong.tpl';
		$this->children = array(
			'common/header',
			'common/footer',
		);
				
		$this->response->setOutput($this->render());
	}
  private function validate() {
	  if (!$this->user->hasPermission('modify', 'payment/nganluong')) {
	  $this->error['warning'] = $this->language->get('error_permission');
	  }	
	  if (!$this->request->post['nganluong_receiver']) {
	  $this->error['receiver'] = $this->language->get('error_receiver');
	  }
	if (!$this->error) {
			return true;
		} else {
			return false;
		}		
  }
}
?>