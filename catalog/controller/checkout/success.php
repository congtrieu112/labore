<?php
class ControllerCheckoutSuccess extends Controller { 
	public function index() { 	
		if (isset($this->session->data['order_id'])) {
			$this->session->data['last_order_id'] = $this->session->data['order_id'];
			$this->load->model('checkout/order');
			
			$order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);
			
			$this->cart->clear();
			$this->data['link_pay']="";
			$this->data['code_pay']= $this->session->data['payment_method']['code'];
			if(isset($_SESSION['link_pay'])){$this->data['link_pay'] = $_SESSION['link_pay'];} unset($_SESSION['link_pay']); 

			unset($this->session->data['shipping_method']);
			unset($this->session->data['shipping_methods']);
			unset($this->session->data['payment_method']);
			unset($this->session->data['payment_methods']);
			unset($this->session->data['guest']);
			unset($this->session->data['comment']);
			unset($this->session->data['order_id']);	
			unset($this->session->data['coupon']);
			unset($this->session->data['reward']);
			unset($this->session->data['voucher']);
			unset($this->session->data['vouchers']);
		}	
									   
		$this->language->load('checkout/success');
		
		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->data['breadcrumbs'] = array(); 

      	$this->data['breadcrumbs'][] = array(
        	'href'      => $this->url->link('common/home'),
        	'text'      => $this->language->get('text_home'),
        	'separator' => false
      	); 
		
      	$this->data['breadcrumbs'][] = array(
        	'href'      => $this->url->link('checkout/cart'),
        	'text'      => $this->language->get('text_basket'),
        	'separator' => $this->language->get('text_separator')
      	);
				
		$this->data['breadcrumbs'][] = array(
			'href'      => $this->url->link('checkout/checkout', '', 'SSL'),
			'text'      => $this->language->get('text_checkout'),
			'separator' => $this->language->get('text_separator')
		);	
					
      	$this->data['breadcrumbs'][] = array(
        	'href'      => $this->url->link('checkout/success'),
        	'text'      => $this->language->get('text_success'),
        	'separator' => $this->language->get('text_separator')
      	);

		$this->data['heading_title'] = $this->language->get('heading_title');
		
		if ($this->customer->isLogged()) {
    		$this->data['text_message'] = sprintf($this->language->get('text_customer'), $this->url->link('account/account', '', 'SSL'), $this->url->link('account/order', '', 'SSL'), $this->url->link('account/download', '', 'SSL'), $this->url->link('information/contact'));
		} else {
    		$this->data['text_message'] = sprintf($this->language->get('text_guest'), $this->url->link('information/contact'));
		}
		
    	$this->data['button_continue'] = $this->language->get('button_continue');

    	$this->data['continue'] = $this->url->link('common/home');

    	if ($this->config->get('success_page_redirect_status')) {
			$this->redirect($this->config->get('success_page_redirect_url'));
		} elseif ($this->config->get('success_page_status')) {
			$this->load->model('checkout/order');

			if (!empty($this->session->data['last_order_id'])) {
				$order_info = $this->model_checkout_order->getOrder($this->session->data['last_order_id']);
			}
			
			if (isset($order_info) && !empty($order_info)) {
				$order_id = $order_info['order_id'];
				$email = $order_info['email'];
				$date_order = date($this->language->get('date_format_short'), strtotime($order_info['date_added']));
				$shipping_method = $order_info['shipping_method'];
				$facebook = '';
				$is_logged = '';

				if ($order_info['shipping_address_format']) {
					$format = $order_info['shipping_address_format'];
				} else {
					$format = '{firstname} {lastname}' . "\n" . '{company}' . "\n" . '{address_1}' . "\n" . '{address_2}' . "\n" . '{city} {postcode}' . "\n" . '{zone}' . "\n" . '{country}';
				}

				$find = array(
					'{firstname}',
					'{lastname}',
					'{company}',
					'{address_1}',
					'{address_2}',
					'{city}',
					'{postcode}',
					'{zone}',
					'{zone_code}',
					'{country}'
				);

				$replace = array(
					'firstname' => $order_info['shipping_firstname'],
					'lastname'  => $order_info['shipping_lastname'],
					'company'   => $order_info['shipping_company'],
					'address_1' => $order_info['shipping_address_1'],
					'address_2' => $order_info['shipping_address_2'],
					'city'      => $order_info['shipping_city'],
					'postcode'  => $order_info['shipping_postcode'],
					'zone'      => $order_info['shipping_zone'],
					'zone_code' => $order_info['shipping_zone_code'],
					'country'   => $order_info['shipping_country']  
				);

				$delivery_address = str_replace(array("\r\n", "\r", "\n"), '<br />', preg_replace(array("/\s\s+/", "/\r\r+/", "/\n\n+/"), '<br />', trim(str_replace($find, $replace, $format))));

				$find = array(
					'{order_id}',
					'{email}',
					'{delivery_address}',
					'{date_order}',
					'{shipping_method}',
					'{facebook}',
					'{is_logged}'
				);

				$is_logged = $this->config->get('success_page_is_logged');

				$replace = array(
					'order_id'         => $order_info['order_id'],
					'email'            => $order_info['email'],
					'delivery_address' => $delivery_address,
					'date_order'       => date($this->language->get('date_format_short'), strtotime($order_info['date_added'])),
					'shipping_method'  => $order_info['shipping_method'],
					'facebook'         => ($this->config->get('success_page_facebook_status')) ? '<div class="fb-like-box" data-href="http' . ((isset($_SERVER['HTTPS']) && (($_SERVER['HTTPS'] == 'on') || ($_SERVER['HTTPS'] == '1'))) ? 's' : '') . '://www.facebook.com/' . $this->config->get('success_page_facebook_profile') . '" data-width="' . $this->config->get('success_page_facebook_width') . '" data-height="' . $this->config->get('success_page_facebook_height') . '" border-color="' . $this->config->get('success_page_facebook_border') . '" data-show-faces="true" data-stream="false" data-header="false"></div>' : '',
					'is_logged'        => ($this->customer->isLogged() && isset($is_logged[$this->config->get('config_language_id')])) ? html_entity_decode($is_logged[$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8') : ''
				);

				$description = $this->config->get('success_page_description');

				if (isset($description[$this->config->get('config_language_id')])) {
					if ($this->config->get('success_page_to_cosyone')) {
						$this->data['text_message'] .= str_replace($find, $replace, html_entity_decode($description[$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8'));
					} else {
						$this->data['text_message'] = str_replace($find, $replace, html_entity_decode($description[$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8'));
					}
				}
			}
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/success.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/success.tpl';
		} else {
			$this->template = 'cosyone/template/common/success.tpl';
		}
		
		$this->children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'common/footer',
			'common/header'			
		);
				
		$this->response->setOutput($this->render());
  	}
}
?>