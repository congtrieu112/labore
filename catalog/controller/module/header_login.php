<?php 
class ControllerModuleHeaderLogin extends Controller {
	public function index() {
		
		
		$this->language->load('account/login');
		
		$this->data['text_login'] = $this->language->get('text_login');
		$this->data['text_logout'] = $this->language->get('text_logout');
		$this->data['entry_email'] = $this->language->get('entry_email');
		$this->data['entry_password'] = $this->language->get('entry_password');
		$this->data['text_forgotten'] = $this->language->get('text_forgotten');
		
		$this->data['button_login'] = $this->language->get('button_login');
		$this->data['text_new_customer'] = $this->language->get('text_new_customer');
		$this->data['text_register'] = $this->language->get('text_register');

		$this->language->load('module/account');
		$this->data['text_logout'] = $this->language->get('text_logout');
		
		$this->load->model('account/customer');

		$this->data['action'] = $this->url->link('account/login', '', 'SSL');
		$this->data['logout_link'] = $this->url->link('account/logout', '', 'SSL');
		$this->data['login_link'] = $this->url->link('account/login', '', 'SSL');
		$this->data['register'] = $this->url->link('account/register', '', 'SSL');
		$this->data['forgotten'] = $this->url->link('account/forgotten', '', 'SSL');
		
		$this->data['logged'] = $this->customer->isLogged();
		
		// Added strpos check to pass McAfee PCI compliance test (http://forum.opencart.com/viewtopic.php?f=10&t=12043&p=151494#p151295)
		if (isset($this->request->post['redirect']) && (strpos($this->request->post['redirect'], $this->config->get('config_url')) !== false || strpos($this->request->post['redirect'], $this->config->get('config_ssl')) !== false)) {
			$this->data['redirect'] = $this->request->post['redirect'];
		} elseif (isset($this->session->data['redirect'])) {
			$this->data['redirect'] = $this->session->data['redirect'];

			unset($this->session->data['redirect']);		  	
		} else {
			$this->data['redirect'] = '';
		}

		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}

		if (isset($this->request->post['email'])) {
			$this->data['email'] = $this->request->post['email'];
		} else {
			$this->data['email'] = '';
		}

		if (isset($this->request->post['password'])) {
			$this->data['password'] = $this->request->post['password'];
		} else {
			$this->data['password'] = '';
		}
		

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/header_login.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/header_login.tpl';
		} else {
			$this->template = 'cosyone/template/module/header_login.tpl';
		}

		$this->response->setOutput($this->render());		
	}
}
?>