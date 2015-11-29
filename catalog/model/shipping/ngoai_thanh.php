<?php
class ModelShippingNgoaiThanh extends Model {
	function getQuote($address) {
		$this->language->load('shipping/ngoai_thanh');

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int)$this->config->get('ngoai_thanh_geo_zone_id') . "' AND country_id = '" . (int)$address['country_id'] . "' AND (zone_id = '" . (int)$address['zone_id'] . "' OR zone_id = '0')");

		if (!$this->config->get('ngoai_thanh_geo_zone_id')) {
			$status = true;
		} elseif ($query->num_rows) {
			$status = true;
		} else {
			$status = false;
		}

		$method_data = array();

		if ((float)$this->cart->getTotal() >= $this->config->get('free_total')) {
		   $status = false;
		}

		if ($status) {
			$quote_data = array();

			$quote_data['ngoai_thanh'] = array(
				'code'         => 'ngoai_thanh.ngoai_thanh',
				'title'        => $this->language->get('text_description'),
				'cost'         => $this->config->get('ngoai_thanh_cost'),
				'tax_class_id' => $this->config->get('ngoai_thanh_tax_class_id'),
				'text'         => $this->currency->format($this->tax->calculate($this->config->get('ngoai_thanh_cost'), $this->config->get('ngoai_thanh_tax_class_id'), $this->config->get('config_tax')))
			);

			$method_data = array(
				'code'       => 'ngoai_thanh',
				'title'      => $this->language->get('text_title'),
				'quote'      => $quote_data,
				'sort_order' => $this->config->get('ngoai_thanh_sort_order'),
				'error'      => false
			);
		}

		return $method_data;
	}
}
?>