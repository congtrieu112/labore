<?php
class ControllerQuickCheckoutGuestShipping extends Controller {
  	public function index() {
		$this->language->load('quickcheckout/checkout');

		$this->data['text_select'] = $this->language->get('text_select');
		$this->data['text_none'] = $this->language->get('text_none');

		$this->data['entry_firstname'] = $this->language->get('entry_firstname');
		$this->data['entry_lastname'] = $this->language->get('entry_lastname');
		$this->data['entry_company'] = $this->language->get('entry_company');
		$this->data['entry_address_1'] = $this->language->get('entry_address_1');
		$this->data['entry_address_2'] = $this->language->get('entry_address_2');
		$this->data['entry_postcode'] = $this->language->get('entry_postcode');
		$this->data['entry_city'] = $this->language->get('entry_city');
		$this->data['entry_country'] = $this->language->get('entry_country');
		$this->data['entry_zone'] = $this->language->get('entry_zone');

		if (isset($this->session->data['guest']['shipping']['firstname'])) {
			$this->data['firstname'] = $this->session->data['guest']['shipping']['firstname'];
		} else {
			$this->data['firstname'] = '';
		}

		if (isset($this->session->data['guest']['shipping']['lastname'])) {
			$this->data['lastname'] = $this->session->data['guest']['shipping']['lastname'];
		} else {
			$this->data['lastname'] = '';
		}

		if (isset($this->session->data['guest']['shipping']['company'])) {
			$this->data['company'] = $this->session->data['guest']['shipping']['company'];
		} else {
			$this->data['company'] = '';
		}

		if (isset($this->session->data['guest']['shipping']['address_1'])) {
			$this->data['address_1'] = $this->session->data['guest']['shipping']['address_1'];
		} else {
			$this->data['address_1'] = '';
		}

		if (isset($this->session->data['guest']['shipping']['address_2'])) {
			$this->data['address_2'] = $this->session->data['guest']['shipping']['address_2'];
		} else {
			$this->data['address_2'] = '';
		}

		if (isset($this->session->data['guest']['shipping']['postcode'])) {
			$this->data['postcode'] = $this->session->data['guest']['shipping']['postcode'];
		} elseif (isset($this->session->data['shipping_postcode'])) {
			$this->data['postcode'] = $this->session->data['shipping_postcode'];
		} else {
			$this->data['postcode'] = '';
		}

		if (isset($this->session->data['guest']['shipping']['city'])) {
			$this->data['city'] = $this->session->data['guest']['shipping']['city'];
		} else {
			$this->data['city'] = '';
		}

		if (isset($this->session->data['guest']['shipping']['country_id'])) {
			$this->data['country_id'] = $this->session->data['guest']['shipping']['country_id'];
		} elseif (isset($this->session->data['shipping_country_id'])) {
			$this->data['country_id'] = $this->session->data['shipping_country_id'];
		} else {
			$country = $this->config->get('quickcheckout_field_country');

			$this->data['country_id'] = $country['cosyone'];
		}

		if (isset($this->session->data['guest']['shipping']['zone_id'])) {
			$this->data['zone_id'] = $this->session->data['guest']['shipping']['zone_id'];
		} elseif (isset($this->session->data['shipping_zone_id'])) {
			$this->data['zone_id'] = $this->session->data['shipping_zone_id'];
		} else {
			$zone = $this->config->get('quickcheckout_field_zone');

			$this->data['zone_id'] = $zone['cosyone'];
		}

		$this->load->model('localisation/country');

		$this->data['countries'] = $this->model_localisation_country->getCountries();

		// Fields
		$fields = array(
			'firstname',
			'lastname',
			'company',
			'address_1',
			'address_2',
			'city',
			'postcode',
			'country',
			'zone'
		);

		// All variables
		$this->data['debug'] = $this->config->get('quickcheckout_debug');
		$this->data['country_reload'] = $this->config->get('quickcheckout_country_reload');

		$sort_order = array();

		foreach ($fields as $key => $field) {
			$field_data = $this->config->get('quickcheckout_field_' . $field);

			$this->data['field_' . $field] = $field_data;

			$sort_order[$key] = $field_data['sort_order'];
		}

		array_multisort($sort_order, SORT_ASC, $fields);

		$this->data['fields'] = $fields;

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/quickcheckout/guest_shipping.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/quickcheckout/guest_shipping.tpl';
		} else {
			$this->template = 'cosyone/template/quickcheckout/guest_shipping.tpl';
		}

		$this->response->setOutput($this->render());
	}

	public function validate() {
		$this->language->load('quickcheckout/checkout');

		$json = array();

		// Validate cart has products and has stock.
		if ((!$this->cart->hasProducts() && empty($this->session->data['vouchers'])) || (!$this->cart->hasStock() && !$this->config->get('config_stock_checkout'))) {
			$json['redirect'] = $this->url->link('checkout/cart');
		}

		// Check if guest checkout is avaliable.
		if (!$this->customer->isLogged()) {
			if (!$this->config->get('config_guest_checkout') || $this->config->get('config_customer_price') || $this->cart->hasDownload()) {
				$json['redirect'] = $this->url->link('quickcheckout/checkout', '', 'SSL');
			}
		}

		if (!$json) {
			$firstname = $this->config->get('quickcheckout_field_firstname');

			if (!empty($firstname['required'])) {
				if ((utf8_strlen($this->request->post['firstname']) < 1) || (utf8_strlen($this->request->post['firstname']) > 32)) {
					$json['error']['firstname'] = $this->language->get('error_firstname');
				}
			}

			$lastname = $this->config->get('quickcheckout_field_lastname');

			if (!empty($lastname['required'])) {
				if ((utf8_strlen($this->request->post['lastname']) < 1) || (utf8_strlen($this->request->post['lastname']) > 32)) {
					$json['error']['lastname'] = $this->language->get('error_lastname');
				}
			}

			$address_1 = $this->config->get('quickcheckout_field_address_1');

			if (!empty($address_1['required'])) {
				if ((utf8_strlen($this->request->post['address_1']) < 3) || (utf8_strlen($this->request->post['address_1']) > 128)) {
					$json['error']['address_1'] = $this->language->get('error_address_1');
				}
			}

			$address_2 = $this->config->get('quickcheckout_field_address_2');

			if (!empty($address_2['required'])) {
				if ((utf8_strlen($this->request->post['address_2']) < 3) || (utf8_strlen($this->request->post['address_2']) > 128)) {
					$json['error']['address_2'] = $this->language->get('error_address_2');
				}
			}

			$city = $this->config->get('quickcheckout_field_city');

			if (!empty($city['required'])) {
				if ((utf8_strlen($this->request->post['city']) < 2) || (utf8_strlen($this->request->post['city']) > 128)) {
					$json['error']['city'] = $this->language->get('error_city');
				}
			}

			$company = $this->config->get('quickcheckout_field_company');

			if (!empty($company['required'])) {
				if ((utf8_strlen($this->request->post['company']) < 3) || (utf8_strlen($this->request->post['company']) > 32)) {
					$json['error']['company'] = $this->language->get('error_company');
				}
			}

			$this->load->model('localisation/country');

			$country_info = $this->model_localisation_country->getCountry($this->request->post['country_id']);

			if ($country_info && $country_info['postcode_required'] && (utf8_strlen($this->request->post['postcode']) < 2) || (utf8_strlen($this->request->post['postcode']) > 10)) {
				$json['error']['postcode'] = $this->language->get('error_postcode');
			}

			$country = $this->config->get('quickcheckout_field_country');

			if (!empty($country['required'])) {
				if ($this->request->post['country_id'] == '') {
					$json['error']['country'] = $this->language->get('error_country');
				}
			}

			$zone = $this->config->get('quickcheckout_field_zone');

			if (!empty($zone['required'])) {
				if ($this->request->post['zone_id'] == '') {
					$json['error']['zone'] = $this->language->get('error_zone');
				}
			}
		}

		if (!$json) {
			if ($this->customer->isLogged()) {
				$this->load->model('account/address');

				$this->session->data['shipping_address_id'] = $this->model_account_address->addAddress($this->request->post);
			} else {
				$this->session->data['guest']['shipping']['firstname'] = trim($this->request->post['firstname']);
				$this->session->data['guest']['shipping']['lastname'] = trim($this->request->post['lastname']);
				$this->session->data['guest']['shipping']['company'] = trim($this->request->post['company']);
				$this->session->data['guest']['shipping']['address_1'] = $this->request->post['address_1'];
				$this->session->data['guest']['shipping']['address_2'] = $this->request->post['address_2'];
				$this->session->data['guest']['shipping']['postcode'] = $this->request->post['postcode'];
				$this->session->data['guest']['shipping']['city'] = $this->request->post['city'];
				$this->session->data['guest']['shipping']['country_id'] = $this->request->post['country_id'];
				$this->session->data['guest']['shipping']['zone_id'] = $this->request->post['zone_id'];

				$this->load->model('localisation/country');

				$country_info = $this->model_localisation_country->getCountry($this->request->post['country_id']);

				if ($country_info) {
					$this->session->data['guest']['shipping']['country'] = $country_info['name'];
					$this->session->data['guest']['shipping']['iso_code_2'] = $country_info['iso_code_2'];
					$this->session->data['guest']['shipping']['iso_code_3'] = $country_info['iso_code_3'];
					$this->session->data['guest']['shipping']['address_format'] = $country_info['address_format'];
				} else {
					$this->session->data['guest']['shipping']['country'] = '';
					$this->session->data['guest']['shipping']['iso_code_2'] = '';
					$this->session->data['guest']['shipping']['iso_code_3'] = '';
					$this->session->data['guest']['shipping']['address_format'] = '';
				}

				$this->load->model('localisation/zone');

				$zone_info = $this->model_localisation_zone->getZone($this->request->post['zone_id']);

				if ($zone_info) {
					$this->session->data['guest']['shipping']['zone'] = $zone_info['name'];
					$this->session->data['guest']['shipping']['zone_code'] = $zone_info['code'];
				} else {
					$this->session->data['guest']['shipping']['zone'] = '';
					$this->session->data['guest']['shipping']['zone_code'] = '';
				}
			}

			$this->session->data['shipping_country_id'] = $this->request->post['country_id'];
			$this->session->data['shipping_zone_id'] = $this->request->post['zone_id'];
			$this->session->data['shipping_postcode'] = $this->request->post['postcode'];
		}

		$this->response->setOutput(json_encode($json));
	}
}
?>