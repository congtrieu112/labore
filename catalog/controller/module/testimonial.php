<?php  
class ControllerModuletestimonial extends Controller {

	protected function index($setting) {
		
		static $module = 0;
		
		$this->language->load('module/testimonial');

		$this->data['testimonial_title'] = html_entity_decode($setting['testimonial_title'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');

      	$this->data['heading_title'] = $this->language->get('heading_title');
      	$this->data['text_more'] = $this->language->get('text_more');
      	$this->data['text_more2'] = $this->language->get('text_more2');
		$this->data['isi_testimonial'] = $this->language->get('isi_testimonial');
		$this->data['show_all'] = $this->language->get('show_all');
		$this->data['showall_url'] = $this->url->link('product/testimonial', '', 'SSL'); 
		$this->data['more'] = $this->url->link('product/testimonial', 'testimonial_id=' , 'SSL'); 
		$this->data['link'] = $this->url->link('product/testimonial', 'testimonial_id=' , 'SSL'); 
		$this->data['isitesti'] = $this->url->link('product/isitestimonial', '', 'SSL');
		
		
		
		$this->load->model('catalog/testimonial');
		
		$this->data['testimonials'] = array();
		
		$this->data['total'] = $this->model_catalog_testimonial->getTotalTestimonials();
		$results = $this->model_catalog_testimonial->getTestimonials(0, $setting['testimonial_limit'], (isset($setting['testimonial_random']))?true:false);
		$this->data['module'] = $module++;

		foreach ($results as $result) {
			
			 
			
			$result['description'] = trim($result['description']);
			$result['description'] = str_replace('«<p>', '', $result['description']);
			$result['description'] = str_replace('</p>»', '', $result['description']);
			
			$this->data['columns'] = $setting['columns'];
			
			if (isset($setting['testimonial_full_width']))
			{
				$this->data['full_width'] = "1";
			} else {
				$this->data['full_width'] = false;
			}
			
			if (isset($setting['testimonial_show_links']))
			{
				$this->data['show_links'] = "1";
			} else {
				$this->data['show_links'] = false;
			}
			
			if (isset($setting['testimonial_carousel']))
			{
				$this->data['carousel'] = "1";
			} else {
				$this->data['carousel'] = false;
			}
			if (!isset($setting['testimonial_character_limit']))
				$setting['testimonial_character_limit'] = 0;

			if ($setting['testimonial_character_limit']>0)
			{
				$lim = $setting['testimonial_character_limit'];

				if (mb_strlen($result['description'],'UTF-8')>$lim) 
					$result['description'] = mb_substr($result['description'], 0, $lim-3, 'UTF-8'). ' ' .'<a href="'.$this->data['more']. $result['testimonial_id'] .'" title="'.$this->data['text_more2'].'">'. $this->data['text_more'] . '</a>';

			}


			if (mb_strlen($result['title'],'UTF-8')>37)
					$result['title'] = mb_substr($result['title'], 0, 34, 'UTF-8').'...';

			if (mb_strlen($result['name'],'UTF-8')>17)
					$result['name'] = mb_substr($result['name'], 0, 14, 'UTF-8').'...';

			if (mb_strlen($result['city'],'UTF-8')>17)
					$result['city'] = mb_substr($result['city'], 0, 14, 'UTF-8').'...';
					
			$result['link'] = $this->data['more']. $result['testimonial_id'];

			$this->data['testimonials'][] = array(
				'id'			=> $result['testimonial_id'],											  
				'title'		=> $result['title'],
				'description'	=> $result['description'],
				'rating'		=> $result['rating'],
				'name'		=> $result['name'],
				'date_added'	=> $result['date_added'],
				'city'		=> $result['city'],
				'link'		=> $result['link']

			);
		}

		

		$this->id = 'testimonial';

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/testimonial.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/testimonial.tpl';
		} else {
			$this->template = 'cosyone/template/module/testimonial.tpl';
		}
		
		$this->render();
	}
}
?>