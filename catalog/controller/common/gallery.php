<?php  
class ControllerCommonGallery extends Controller {
	public function index() {
		$this->document->setTitle($this->config->get('config_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));

		$this->data['heading_title'] = $this->config->get('config_title');
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/gallery.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/gallery.tpl';
		} else {
			$this->template = 'cosyone/template/common/gallery.tpl';
		}
		
		$this->children = array(
			'common/home_top_top',
			'common/home_top_fullwidth',
			'common/home_top_left',
			'common/home_top_center',
			'common/home_top_right',
			'common/content_bottom_half',
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