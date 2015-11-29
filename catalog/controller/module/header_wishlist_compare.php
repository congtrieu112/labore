<?php 
class ControllerModuleHeaderWishlistCompare extends Controller {
	public function index() {
		
		$this->language->load('module/header_wishlist_compare');
		
		$this->data['text_header_wishlist'] = sprintf($this->language->get('text_header_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
		$this->data['wishlist_link'] = $this->url->link('account/wishlist', '', 'SSL');
		
		
		$this->data['text_header_compare'] = sprintf($this->language->get('text_header_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));
		$this->data['compare_link'] = $this->url->link('product/compare', '', 'SSL');

		
		

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/header_wishlist_compare.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/header_wishlist_compare.tpl';
		} else {
			$this->template = 'cosyone/template/module/header_wishlist_compare.tpl';
		}

		$this->response->setOutput($this->render());		
	}
}
?>