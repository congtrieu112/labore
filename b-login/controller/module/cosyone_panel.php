<?php
class ControllerModuleCosyonePanel extends Controller {
	private $error = array(); 
	
	public function index() {   
		$this->load->language('module/cosyone_panel');
		$this->load->model('localisation/language');
		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('cosyone_panel', $this->request->post);		
			
			if (isset($this->request->post['continue']) && $this->request->post['continue'] == '1') {
				$this->session->data['success'] = $this->language->get('text_success');	
				$this->redirect($this->url->link('module/cosyone_panel', 'token=' . $this->session->data['token'], 'SSL')); 
			}
			
			$this->session->data['success'] = $this->language->get('text_success');			
			
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}
		
		// Language starts
		$this->data['heading_title'] = $this->language->get('heading_title');
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		
		// Tabs
		$this->data['text_tab_general'] = $this->language->get('text_tab_general');
		$this->data['text_tab_design'] = $this->language->get('text_tab_design');
		$this->data['text_tab_custom_css'] = $this->language->get('text_tab_custom_css');
		
		// General settings
		$this->data['text_heading_google_fonts'] = $this->language->get('text_heading_google_fonts');
		$this->data['text_use_google_fonts'] = $this->language->get('text_use_google_fonts');
		$this->data['text_google_font_family'] = $this->language->get('text_google_font_family');
		$this->data['text_google_font_weight'] = $this->language->get('text_google_font_weight');
		$this->data['text_google_font_latin_extended'] = $this->language->get('text_google_font_latin_extended');

		$this->data['text_heading_layout'] = $this->language->get('text_heading_layout');
		$this->data['text_max_width'] = $this->language->get('text_max_width');
		$this->data['text_use_responsive_layout'] = $this->language->get('text_use_responsive_layout');
		$this->data['text_custom_top_promo_message'] = $this->language->get('text_custom_top_promo_message');
		$this->data['text_custom_top_promo_message_help'] = $this->language->get('text_custom_top_promo_message_help');
		
		$this->data['text_heading_main_menu_general'] = $this->language->get('text_heading_main_menu_general');
		$this->data['text_heading_mega_menu_settings'] = $this->language->get('text_heading_mega_menu_settings');

		$this->data['text_use_home_icon'] = $this->language->get('text_use_home_icon');

		$this->data['text_menu_mega_second_thumb'] = $this->language->get('text_menu_mega_second_thumb');
		$this->data['text_menu_mega_second_thumb_help'] = $this->language->get('text_menu_mega_second_thumb_help');
		
		$this->data['text_menu_mega_second_image_w'] = $this->language->get('text_menu_mega_second_image_w');
		$this->data['text_menu_mega_second_image_h'] = $this->language->get('text_menu_mega_second_image_h');
		$this->data['text_menu_mega_show_thumb'] = $this->language->get('text_menu_mega_show_thumb');
		$this->data['text_menu_mega_show_thumb_help'] = $this->language->get('text_menu_mega_show_thumb_help');
		$this->data['text_use_custom_menu_link1'] = $this->language->get('text_use_custom_menu_link1');
		$this->data['text_use_custom_menu_title1'] = $this->language->get('text_use_custom_menu_title1');
		$this->data['text_use_custom_menu_url1'] = $this->language->get('text_use_custom_menu_url1');
		$this->data['text_use_custom_menu_link2'] = $this->language->get('text_use_custom_menu_link2');
		$this->data['text_use_custom_menu_title2'] = $this->language->get('text_use_custom_menu_title2');
		$this->data['text_use_custom_menu_url2'] = $this->language->get('text_use_custom_menu_url2');
		$this->data['text_use_custom_menu_title2'] = $this->language->get('text_use_custom_menu_title2');
		$this->data['text_use_custom_menu_block'] = $this->language->get('text_use_custom_menu_block');
		$this->data['text_use_custom_menu_block_title'] = $this->language->get('text_use_custom_menu_block_title');
		$this->data['text_menu_custom_block_content'] = $this->language->get('text_menu_custom_block_content');
		$this->data['text_menu_custom_block_content_help'] = $this->language->get('text_menu_custom_block_content_help');
		$this->data['text_heading_product_page'] = $this->language->get('text_heading_product_page');
		$this->data['text_heading_product_listings'] = $this->language->get('text_heading_product_listings');
		$this->data['text_grid_home'] = $this->language->get('text_grid_home');
		$this->data['text_grid_category'] = $this->language->get('text_grid_category');
		$this->data['text_grid_related'] = $this->language->get('text_grid_related');
		$this->data['text_default_product_listing'] = $this->language->get('text_default_product_listing');
		$this->data['text_percentage_sale_badge'] = $this->language->get('text_percentage_sale_badge');
		$this->data['text_rollover_effect'] = $this->language->get('text_rollover_effect');
		
		$this->data['text_heading_footer_social'] = $this->language->get('text_heading_footer_social');
		
		
		$this->data['text_upload_payment_icon'] = $this->language->get('text_upload_payment_icon');
		$this->data['text_browse'] = $this->language->get('text_browse');
		$this->data['text_clear'] = $this->language->get('text_clear');
		
		// Design settings
		$this->data['text_use_custom_design'] = $this->language->get('text_use_custom_design');
		$this->data['text_reset_design'] = $this->language->get('text_reset_design');
		$this->data['text_reset_design_info'] = $this->language->get('text_reset_design_info');
		$this->data['text_heading_header'] = $this->language->get('text_heading_header');
		$this->data['text_header_background'] = $this->language->get('text_header_background');

		$this->data['text_top_border_background'] = $this->language->get('text_top_border_background');
		$this->data['text_top_border_opacity'] = $this->language->get('text_top_border_opacity');
		$this->data['text_top_border_text'] = $this->language->get('text_top_border_text');
		$this->data['text_top_border_text_hover'] = $this->language->get('text_top_border_text_hover');
		$this->data['text_lang_curr_style'] = $this->language->get('text_lang_curr_style');
		$this->data['text_header_text_color'] = $this->language->get('text_header_text_color');
		$this->data['text_heading_design_usermenu'] = $this->language->get('text_heading_design_usermenu');
		$this->data['text_user_menu_background'] = $this->language->get('text_user_menu_background');
		$this->data['text_user_menu_background_opacity'] = $this->language->get('text_user_menu_background_opacity');
		$this->data['text_user_menu_background_opacity_hover'] = $this->language->get('text_user_menu_background_opacity_hover');
		$this->data['text_opacity_help'] = $this->language->get('text_opacity_help');
		
		$this->data['text_heading_search_field'] = $this->language->get('text_heading_search_field');
		$this->data['text_search_field_text_color'] = $this->language->get('text_search_field_text_color');
		$this->data['text_search_field_background'] = $this->language->get('text_search_field_background');
		$this->data['text_search_field_background_hover'] = $this->language->get('text_search_field_background_hover');
		$this->data['text_search_field_icons'] = $this->language->get('text_search_field_icons');
		
		$this->data['text_user_menu_icon'] = $this->language->get('text_user_menu_icon');
		$this->data['text_user_menu_link'] = $this->language->get('text_user_menu_link');
		$this->data['text_user_menu_link_hover'] = $this->language->get('text_user_menu_link_hover');
		$this->data['text_heading_design_main_menu'] = $this->language->get('text_heading_design_main_menu');
		$this->data['text_main_menu_background'] = $this->language->get('text_main_menu_background');
		$this->data['text_main_menu_pattern1'] = $this->language->get('text_main_menu_pattern1');
		$this->data['text_main_menu_pattern2'] = $this->language->get('text_main_menu_pattern2');
		$this->data['text_main_menu_link_color'] = $this->language->get('text_main_menu_link_color');
		$this->data['text_main_menu_link_shadow'] = $this->language->get('text_main_menu_link_shadow');
		$this->data['text_main_menu_icon_style'] = $this->language->get('text_main_menu_icon_style');
		$this->data['text_heading_design_content'] = $this->language->get('text_heading_design_content');
		$this->data['text_primary_color'] = $this->language->get('text_primary_color');
		$this->data['text_secondary_color'] = $this->language->get('text_secondary_color');
		$this->data['text_h1_color'] = $this->language->get('text_h1_color');
		$this->data['text_sub_heading_color'] = $this->language->get('text_sub_heading_color');
		
		$this->data['text_highlight_background_color'] = $this->language->get('text_highlight_background_color');
		$this->data['text_highlight_background_help'] = $this->language->get('text_highlight_background_help');
		$this->data['text_salebadge_background'] = $this->language->get('text_salebadge_background');
		$this->data['text_price_color'] = $this->language->get('text_price_color');
		
		$this->data['text_heading_modules'] = $this->language->get('text_heading_modules');
		$this->data['text_module_heading_background'] = $this->language->get('text_module_heading_background');
		$this->data['text_module_heading_color'] = $this->language->get('text_module_heading_color');
		
		$this->data['text_heading_product_tabs'] = $this->language->get('text_heading_product_tabs');
		$this->data['text_product_tabs_heading'] = $this->language->get('text_product_tabs_heading');
		$this->data['text_product_tabs_content'] = $this->language->get('text_product_tabs_content');
		
		$this->data['text_heading_buttons'] = $this->language->get('text_heading_buttons');
		$this->data['text_button_color'] = $this->language->get('text_button_color');
		$this->data['text_button_background'] = $this->language->get('text_button_background');
		$this->data['text_button_color_hover'] = $this->language->get('text_button_color_hover');
		$this->data['text_button_background_hover'] = $this->language->get('text_button_background_hover');
		$this->data['text_button2_color'] = $this->language->get('text_button2_color');
		$this->data['text_button2_background'] = $this->language->get('text_button2_background');
		
		$this->data['text_heading_icons'] = $this->language->get('text_heading_icons');
		$this->data['text_icons_background'] = $this->language->get('text_icons_background');
		$this->data['text_icons_background_help'] = $this->language->get('text_icons_background_help');
		$this->data['text_icons_background_hover'] = $this->language->get('text_icons_background_hover');
		
		$this->data['text_heading_design_footer'] = $this->language->get('text_heading_design_footer');
		$this->data['text_footer_background'] = $this->language->get('text_footer_background');
		$this->data['text_footer_pattern1'] = $this->language->get('text_footer_pattern1');
		$this->data['text_footer_pattern2'] = $this->language->get('text_footer_pattern2');
		$this->data['text_footer_social_icons_style'] = $this->language->get('text_footer_social_icons_style');
		$this->data['text_footer_social_icons_background'] = $this->language->get('text_footer_social_icons_background');
		$this->data['text_footer_social_icons_hover'] = $this->language->get('text_footer_social_icons_hover');
		$this->data['text_footer_content_background'] = $this->language->get('text_footer_content_background');
		$this->data['text_footer_headings'] = $this->language->get('text_footer_headings');
		$this->data['text_footer_links'] = $this->language->get('text_footer_links');
		$this->data['text_footer_links_hover'] = $this->language->get('text_footer_links_hover');
		$this->data['text_company_info_icons_style'] = $this->language->get('text_company_info_icons_style');
		
		// Custom CSS 
		$this->data['text_use_custom_css'] = $this->language->get('text_use_custom_css');
		$this->data['text_custom_css'] = $this->language->get('text_custom_css');
		$this->data['text_custom_css_help'] = $this->language->get('text_custom_css_help');
		// Language ends
		
		
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
			
			} 
				if (isset($this->session->data['success'])) {
					$this->data['success'] = $this->session->data['success'];
					unset($this->session->data['success']);
				} else {
					$this->data['success'] = '';
					
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
		
		
		$this->data['token'] = $this->session->data['token'];
		
		// Content starts
		// Font settings
		$this->data['cosyone_use_google_fonts_list'] = $this->language->get('cosyone_use_google_fonts_list');
		if (isset($this->request->post['cosyone_use_google_fonts'])) {
			$this->data['cosyone_use_google_fonts'] = $this->request->post['cosyone_use_google_fonts'];
		} else {
			$this->data['cosyone_use_google_fonts'] = $this->config->get('cosyone_use_google_fonts');
		}
		
		$this->data['google_font_family_list'] = $this->language->get('google_font_family_list');
		if (isset($this->request->post['google_font_family'])) {
			$this->data['google_font_family'] = $this->request->post['google_font_family'];
		} else {
			$this->data['google_font_family'] = $this->config->get('google_font_family');
		}
		
		$this->data['google_font_weight_list'] = $this->language->get('google_font_weight_list');
		if (isset($this->request->post['google_font_weight'])) {
			$this->data['google_font_weight'] = $this->request->post['google_font_weight'];
		} else {
			$this->data['google_font_weight'] = $this->config->get('google_font_weight');
		}
		
		$this->data['google_font_latin_extended_list'] = $this->language->get('google_font_latin_extended_list');
		if (isset($this->request->post['google_font_latin_extended'])) {
			$this->data['google_font_latin_extended'] = $this->request->post['google_font_latin_extended'];
		} else {
			$this->data['google_font_latin_extended'] = $this->config->get('google_font_latin_extended');
		}
		
		// General settings
		$this->data['cosyone_max_width_list'] = $this->language->get('cosyone_max_width_list');
		
		if (isset($this->request->post['cosyone_max_width'])) {
			$this->data['cosyone_max_width'] = $this->request->post['cosyone_max_width'];
		} else {
			$this->data['cosyone_max_width'] = $this->config->get('cosyone_max_width');
		}
		
		$this->data['cosyone_container_layout_list'] = $this->language->get('cosyone_container_layout_list');
		if (isset($this->request->post['cosyone_container_layout'])) {
			$this->data['cosyone_container_layout'] = $this->request->post['cosyone_container_layout'];
		} else {
			$this->data['cosyone_container_layout'] = $this->config->get('cosyone_container_layout');
		}
		
		$this->data['cosyone_use_responsive_list'] = $this->language->get('cosyone_use_responsive_list');
		
		if (isset($this->request->post['cosyone_use_responsive'])) {
			$this->data['cosyone_use_responsive'] = $this->request->post['cosyone_use_responsive'];
		} else {
			$this->data['cosyone_use_responsive'] = $this->config->get('cosyone_use_responsive');
		}
		
		$this->data['cosyone_use_breadcrumb_list'] = $this->language->get('cosyone_use_breadcrumb_list');
		
		if (isset($this->request->post['cosyone_use_breadcrumb'])) {
			$this->data['cosyone_use_breadcrumb'] = $this->request->post['cosyone_use_breadcrumb'];
		} else {
			$this->data['cosyone_use_breadcrumb'] = $this->config->get('cosyone_use_breadcrumb');
		}
		
		$this->data['cosyone_use_retina_list'] = $this->language->get('cosyone_use_retina_list');
		
		if (isset($this->request->post['cosyone_use_retina'])) {
			$this->data['cosyone_use_retina'] = $this->request->post['cosyone_use_retina'];
		} else {
			$this->data['cosyone_use_retina'] = $this->config->get('cosyone_use_retina');
		}
		
		
		$languages = $this->model_localisation_language->getLanguages();
		$this->data['languages'] = $languages;
		foreach ($languages as $language) { $top_promo_message = 'cosyone_top_promo_message_' . $language['language_id'];
			if (isset($this->request->post[$top_promo_message])) {
				$this->data[$top_promo_message] = $this->request->post[$top_promo_message];
			} else {
				$this->data[$top_promo_message] = $this->config->get($top_promo_message);
			}
		}
		
		$this->data['cosyone_use_custom_menu_list'] = $this->language->get('cosyone_use_custom_menu_list');
		
		if (isset($this->request->post['cosyone_use_custom_menu'])) {
			$this->data['cosyone_use_custom_menu'] = $this->request->post['cosyone_use_custom_menu'];
		} else {
			$this->data['cosyone_use_custom_menu'] = $this->config->get('cosyone_use_custom_menu');
		}
		
		$this->data['languages'] = $languages;
		foreach ($languages as $language) { $custom_text = 'cosyone_custom_link_text_' . $language['language_id'];
			if (isset($this->request->post[$custom_text])) {
				$this->data[$custom_text] = $this->request->post[$custom_text];
			} else {
				$this->data[$custom_text] = $this->config->get($custom_text);
			}
		}
		
		if (isset($this->request->post['cosyone_user_menu_link_url'])) {
			$this->data['cosyone_user_menu_link_url'] = $this->request->post['cosyone_user_menu_link_url'];
		} else {
			$this->data['cosyone_user_menu_link_url'] = $this->config->get('cosyone_user_menu_link_url');
		}
		
		$this->data['cosyone_show_home_icon_list'] = $this->language->get('cosyone_show_home_icon_list');
		
		if (isset($this->request->post['cosyone_show_home_icon'])) {
			$this->data['cosyone_show_home_icon'] = $this->request->post['cosyone_show_home_icon'];
		} else {
			$this->data['cosyone_show_home_icon'] = $this->config->get('cosyone_show_home_icon');
		}
		
		$this->data['cosyone_menu_border_list'] = $this->language->get('cosyone_menu_border_list');
		
		if (isset($this->request->post['cosyone_menu_border'])) {
			$this->data['cosyone_menu_border'] = $this->request->post['cosyone_menu_border'];
		} else {
			$this->data['cosyone_menu_border'] = $this->config->get('cosyone_menu_border');
		}
		
		$this->data['cosyone_menu_sticky_list'] = $this->language->get('cosyone_menu_sticky_list');
		
		if (isset($this->request->post['cosyone_menu_sticky'])) {
			$this->data['cosyone_menu_sticky'] = $this->request->post['cosyone_menu_sticky'];
		} else {
			$this->data['cosyone_menu_sticky'] = $this->config->get('cosyone_menu_sticky');
		}
		
		
		$this->data['cosyone_menu_mega_second_thumb_list'] = $this->language->get('cosyone_menu_mega_second_thumb_list');
		if (isset($this->request->post['cosyone_menu_mega_second_thumb'])) {
			$this->data['cosyone_menu_mega_second_thumb'] = $this->request->post['cosyone_menu_mega_second_thumb'];
		} else {
			$this->data['cosyone_menu_mega_second_thumb'] = $this->config->get('cosyone_menu_mega_second_thumb');
		}
		
		
		
		if (isset($this->request->post['cosyone_menu_mega_second_image_w'])) {
			$this->data['cosyone_menu_mega_second_image_w'] = $this->request->post['cosyone_menu_mega_second_image_w'];
		} else {
			$this->data['cosyone_menu_mega_second_image_w'] = $this->config->get('cosyone_menu_mega_second_image_w');
		}
		
		if (isset($this->request->post['cosyone_menu_mega_second_image_h'])) {
			$this->data['cosyone_menu_mega_second_image_h'] = $this->request->post['cosyone_menu_mega_second_image_h'];
		} else {
			$this->data['cosyone_menu_mega_second_image_h'] = $this->config->get('cosyone_menu_mega_second_image_h');
		}
		
		
		$this->data['cosyone_category_thumb_list'] = $this->language->get('cosyone_category_thumb_list');
		if (isset($this->request->post['cosyone_category_thumb'])) {
			$this->data['cosyone_category_thumb'] = $this->request->post['cosyone_category_thumb'];
		} else {
			$this->data['cosyone_category_thumb'] = $this->config->get('cosyone_category_thumb');
		}
		
		$this->data['cosyone_custom_menu_link1_list'] = $this->language->get('cosyone_custom_menu_link1_list');
		if (isset($this->request->post['cosyone_custom_menu_link1'])) {
			$this->data['cosyone_custom_menu_link1'] = $this->request->post['cosyone_custom_menu_link1'];
		} else {
			$this->data['cosyone_custom_menu_link1'] = $this->config->get('cosyone_custom_menu_link1');
		}
		
		$this->data['languages'] = $languages;
		foreach ($languages as $language) { $custom_menu_title1 = 'cosyone_custom_menu_title1_' . $language['language_id'];
			if (isset($this->request->post[$custom_menu_title1])) {
				$this->data[$custom_menu_title1] = $this->request->post[$custom_menu_title1];
			} else {
				$this->data[$custom_menu_title1] = $this->config->get($custom_menu_title1);
			}
		}
		
		foreach ($languages as $language) { $cosyone_text_ql = 'cosyone_text_ql_' . $language['language_id'];
			if (isset($this->request->post[$cosyone_text_ql])) {
				$this->data[$cosyone_text_ql] = $this->request->post[$cosyone_text_ql];
			} else {
				$this->data[$cosyone_text_ql] = $this->config->get($cosyone_text_ql);
			}
		}
		
		if (isset($this->request->post['cosyone_custom_menu_url1'])) {
			$this->data['cosyone_custom_menu_url1'] = $this->request->post['cosyone_custom_menu_url1'];
		} else {
			$this->data['cosyone_custom_menu_url1'] = $this->config->get('cosyone_custom_menu_url1');
		}
		
		$this->data['cosyone_custom_menu_link2_list'] = $this->language->get('cosyone_custom_menu_link2_list');
		if (isset($this->request->post['cosyone_custom_menu_link2'])) {
			$this->data['cosyone_custom_menu_link2'] = $this->request->post['cosyone_custom_menu_link2'];
		} else {
			$this->data['cosyone_custom_menu_link2'] = $this->config->get('cosyone_custom_menu_link2');
		}
		
		$this->data['languages'] = $languages;
		foreach ($languages as $language) { $custom_menu_title2 = 'cosyone_custom_menu_title2_' . $language['language_id'];
			if (isset($this->request->post[$custom_menu_title2])) {
				$this->data[$custom_menu_title2] = $this->request->post[$custom_menu_title2];
			} else {
				$this->data[$custom_menu_title2] = $this->config->get($custom_menu_title2);
			}
		}
		
		if (isset($this->request->post['cosyone_custom_menu_url2'])) {
			$this->data['cosyone_custom_menu_url2'] = $this->request->post['cosyone_custom_menu_url2'];
		} else {
			$this->data['cosyone_custom_menu_url2'] = $this->config->get('cosyone_custom_menu_url2');
		}
		
		$this->data['cosyone_custom_menu_block_list'] = $this->language->get('cosyone_custom_menu_block_list');
		if (isset($this->request->post['cosyone_custom_menu_block'])) {
			$this->data['cosyone_custom_menu_block'] = $this->request->post['cosyone_custom_menu_block'];
		} else {
			$this->data['cosyone_custom_menu_block'] = $this->config->get('cosyone_custom_menu_block');
		}
		
		if (isset($this->request->post['cosyone_menu_block_width'])) {
			$this->data['cosyone_menu_block_width'] = $this->request->post['cosyone_menu_block_width'];
		} else {
			$this->data['cosyone_menu_block_width'] = $this->config->get('cosyone_menu_block_width');
		}
		
		$this->data['languages'] = $languages;
		foreach ($languages as $language) { $custom_block_title = 'cosyone_custom_menu_block_title_' . $language['language_id'];
			if (isset($this->request->post[$custom_menu_title2])) {
				$this->data[$custom_block_title] = $this->request->post[$custom_block_title];
			} else {
				$this->data[$custom_block_title] = $this->config->get($custom_block_title);
			}
		}
		
		$this->data['languages'] = $languages;
		foreach ($languages as $language) { $menu_custom_block = 'cosyone_menu_custom_block_' . $language['language_id'];
			if (isset($this->request->post[$menu_custom_block])) {
				$this->data[$menu_custom_block] = $this->request->post[$menu_custom_block];
			} else {
				$this->data[$menu_custom_block] = $this->config->get($menu_custom_block);
			}
		}
		
		
		if (isset($this->request->post['cosyone_google_map'])) {
			$this->data['cosyone_google_map'] = $this->request->post['cosyone_google_map'];
		} else {
			$this->data['cosyone_google_map'] = $this->config->get('cosyone_google_map');
		}
		
		
		$this->data['cosyone_grid_category_list'] = $this->language->get('cosyone_grid_category_list');
		if (isset($this->request->post['cosyone_grid_category'])) {
			$this->data['cosyone_grid_category'] = $this->request->post['cosyone_grid_category'];
		} else {
			$this->data['cosyone_grid_category'] = $this->config->get('cosyone_grid_category');
		}
		
		$this->data['cosyone_grid_related_list'] = $this->language->get('cosyone_grid_related_list');
		if (isset($this->request->post['cosyone_grid_related'])) {
			$this->data['cosyone_grid_related'] = $this->request->post['cosyone_grid_related'];
		} else {
			$this->data['cosyone_grid_related'] = $this->config->get('cosyone_grid_related');
		}
		
		$this->data['cosyone_product_share_list'] = $this->language->get('cosyone_product_share_list');
		if (isset($this->request->post['cosyone_product_share'])) {
			$this->data['cosyone_product_share'] = $this->request->post['cosyone_product_share'];
		} else {
			$this->data['cosyone_product_share'] = $this->config->get('cosyone_product_share');
		}
		
		$this->data['cosyone_product_countdown_list'] = $this->language->get('cosyone_product_countdown_list');
		if (isset($this->request->post['cosyone_product_countdown'])) {
			$this->data['cosyone_product_countdown'] = $this->request->post['cosyone_product_countdown'];
		} else {
			$this->data['cosyone_product_countdown'] = $this->config->get('cosyone_product_countdown');
		}
		
		$this->data['cosyone_product_hurry_list'] = $this->language->get('cosyone_product_hurry_list');
		if (isset($this->request->post['cosyone_product_hurry'])) {
			$this->data['cosyone_product_hurry'] = $this->request->post['cosyone_product_hurry'];
		} else {
			$this->data['cosyone_product_hurry'] = $this->config->get('cosyone_product_hurry');
		}
		
		$this->data['cosyone_product_zoom_list'] = $this->language->get('cosyone_product_zoom_list');
		if (isset($this->request->post['cosyone_product_zoom'])) {
			$this->data['cosyone_product_zoom'] = $this->request->post['cosyone_product_zoom'];
		} else {
			$this->data['cosyone_product_zoom'] = $this->config->get('cosyone_product_zoom');
		}
		
		$this->data['cosyone_image_options_list'] = $this->language->get('cosyone_image_options_list');
		if (isset($this->request->post['cosyone_image_options'])) {
			$this->data['cosyone_image_options'] = $this->request->post['cosyone_image_options'];
		} else {
			$this->data['cosyone_image_options'] = $this->config->get('cosyone_image_options');
		}
		
		$this->data['cosyone_product_break_list'] = $this->language->get('cosyone_product_break_list');
		if (isset($this->request->post['cosyone_product_break'])) {
			$this->data['cosyone_product_break'] = $this->request->post['cosyone_product_break'];
		} else {
			$this->data['cosyone_product_break'] = $this->config->get('cosyone_product_break');
		}
		
		
		
		$this->data['cosyone_product_yousave_list'] = $this->language->get('cosyone_product_yousave_list');
		if (isset($this->request->post['cosyone_product_yousave'])) {
			$this->data['cosyone_product_yousave'] = $this->request->post['cosyone_product_yousave'];
		} else {
			$this->data['cosyone_product_yousave'] = $this->config->get('cosyone_product_yousave');
		}
		
		
		$this->data['cosyone_category_refine_list'] = $this->language->get('cosyone_category_refine_list');
		if (isset($this->request->post['cosyone_category_refine'])) {
			$this->data['cosyone_category_refine'] = $this->request->post['cosyone_category_refine'];
		} else {
			$this->data['cosyone_category_refine'] = $this->config->get('cosyone_category_refine');
		}
		
		$this->data['cosyone_category_per_row_list'] = $this->language->get('cosyone_category_per_row_list');
		if (isset($this->request->post['cosyone_category_per_row'])) {
			$this->data['cosyone_category_per_row'] = $this->request->post['cosyone_category_per_row'];
		} else {
			$this->data['cosyone_category_per_row'] = $this->config->get('cosyone_category_per_row');
		}
		
		if (isset($this->request->post['cosyone_refine_image_w'])) {
			$this->data['cosyone_refine_image_w'] = $this->request->post['cosyone_refine_image_w'];
		} else {
			$this->data['cosyone_refine_image_w'] = $this->config->get('cosyone_refine_image_w');
		}
		
		if (isset($this->request->post['cosyone_refine_image_h'])) {
			$this->data['cosyone_refine_image_h'] = $this->request->post['cosyone_refine_image_h'];
		} else {
			$this->data['cosyone_refine_image_h'] = $this->config->get('cosyone_refine_image_h');
		}
		
		$this->data['cosyone_default_product_style_list'] = $this->language->get('cosyone_default_product_style_list');
		if (isset($this->request->post['cosyone_default_product_style'])) {
			$this->data['cosyone_default_product_style'] = $this->request->post['cosyone_default_product_style'];
		} else {
			$this->data['cosyone_default_product_style'] = $this->config->get('cosyone_default_product_style');
		}
		
		$this->data['cosyone_default_view_list'] = $this->language->get('cosyone_default_view_list');
		if (isset($this->request->post['cosyone_default_view'])) {
			$this->data['cosyone_default_view'] = $this->request->post['cosyone_default_view'];
		} else {
			$this->data['cosyone_default_view'] = $this->config->get('cosyone_default_view');
		}
		
		$this->data['cosyone_rollover_effect_list'] = $this->language->get('cosyone_rollover_effect_list');
		if (isset($this->request->post['cosyone_rollover_effect'])) {
			$this->data['cosyone_rollover_effect'] = $this->request->post['cosyone_rollover_effect'];
		} else {
			$this->data['cosyone_rollover_effect'] = $this->config->get('cosyone_rollover_effect');
		}
		
		$this->data['cosyone_percentage_sale_badge_list'] = $this->language->get('cosyone_percentage_sale_badge_list');
		if (isset($this->request->post['cosyone_percentage_sale_badge'])) {
			$this->data['cosyone_percentage_sale_badge'] = $this->request->post['cosyone_percentage_sale_badge'];
		} else {
			$this->data['cosyone_percentage_sale_badge'] = $this->config->get('cosyone_percentage_sale_badge');
		}
		
		$this->data['cosyone_brand_list'] = $this->language->get('cosyone_brand_list');
		if (isset($this->request->post['cosyone_brand'])) {
			$this->data['cosyone_brand'] = $this->request->post['cosyone_brand'];
		} else {
			$this->data['cosyone_brand'] = $this->config->get('cosyone_brand');
		}
		
		$this->data['cosyone_footer_columns_list'] = $this->language->get('cosyone_footer_columns_list');
		if (isset($this->request->post['cosyone_footer_columns'])) {
			$this->data['cosyone_footer_columns'] = $this->request->post['cosyone_footer_columns'];
		} else {
			$this->data['cosyone_footer_columns'] = $this->config->get('cosyone_footer_columns');
		}
		
		
		
		$this->data['languages'] = $languages;
		foreach ($languages as $language) { $footer_custom_block_title = 'cosyone_footer_custom_block_title_' . $language['language_id'];
			if (isset($this->request->post[$footer_custom_block_title])) {
				$this->data[$footer_custom_block_title] = $this->request->post[$footer_custom_block_title];
			} else {
				$this->data[$footer_custom_block_title] = $this->config->get($footer_custom_block_title);
			}
		}
		
		$this->data['languages'] = $languages;
		foreach ($languages as $language) { $footer_custom_block = 'cosyone_footer_custom_block_' . $language['language_id'];
			if (isset($this->request->post[$footer_custom_block])) {
				$this->data[$footer_custom_block] = $this->request->post[$footer_custom_block];
			} else {
				$this->data[$footer_custom_block] = $this->config->get($footer_custom_block);
			}
		}
		
		$this->load->model('tool/image');
		
		if (isset($this->request->post['cosyone_footer_payment_icon'])) {
			$this->data['cosyone_footer_payment_icon'] = $this->request->post['cosyone_footer_payment_icon'];
		} else {
			$this->data['cosyone_footer_payment_icon'] = $this->config->get('cosyone_footer_payment_icon');			
		}
		
		if ($this->config->get('cosyone_footer_payment_icon') && file_exists(DIR_IMAGE . $this->config->get('cosyone_footer_payment_icon')) && is_file(DIR_IMAGE . $this->config->get('cosyone_footer_payment_icon'))) {
			$this->data['cosyone_footer_payment_thumb'] = $this->model_tool_image->resize($this->config->get('cosyone_footer_payment_icon'), 100, 100);		
		} else {
			$this->data['cosyone_footer_payment_thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}
		
		
		
		
		
		if (isset($this->request->post['cosyone_custom_bg_icon'])) {
			$this->data['cosyone_custom_bg_icon'] = $this->request->post['cosyone_custom_bg_icon'];
		} else {
			$this->data['cosyone_custom_bg_icon'] = $this->config->get('cosyone_custom_bg_icon');			
		}
		
		if ($this->config->get('cosyone_custom_bg_icon') && file_exists(DIR_IMAGE . $this->config->get('cosyone_custom_bg_icon')) && is_file(DIR_IMAGE . $this->config->get('cosyone_custom_bg_icon'))) {
			$this->data['cosyone_custom_bg_thumb'] = $this->model_tool_image->resize($this->config->get('cosyone_custom_bg_icon'), 100, 100);		
		} else {
			$this->data['cosyone_custom_bg_thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}
		
		
		$this->data['cosyone_use_cookie_list'] = $this->language->get('cosyone_use_cookie_list');
		if (isset($this->request->post['cosyone_use_cookie'])) {
			$this->data['cosyone_use_cookie'] = $this->request->post['cosyone_use_cookie'];
		} else {
			$this->data['cosyone_use_cookie'] = $this->config->get('cosyone_use_cookie');
		}
		
		$this->data['languages'] = $languages;
		foreach ($languages as $language) { $cosyone_cookie_text = 'cosyone_cookie_text_' . $language['language_id'];
			if (isset($this->request->post[$cosyone_cookie_text])) {
				$this->data[$cosyone_cookie_text] = $this->request->post[$cosyone_cookie_text];
			} else {
				$this->data[$cosyone_cookie_text] = $this->config->get($cosyone_cookie_text);
			}
		}
		
		if (isset($this->request->post['cosyone_readmore_url'])) {
			$this->data['cosyone_readmore_url'] = $this->request->post['cosyone_readmore_url'];
		} else {
			$this->data['cosyone_readmore_url'] = $this->config->get('cosyone_readmore_url');
		}
		
		$this->data['languages'] = $languages;
		foreach ($languages as $language) { $cosyone_cookie_button_readmore = 'cosyone_cookie_button_readmore_' . $language['language_id'];
			if (isset($this->request->post[$cosyone_cookie_button_readmore])) {
				$this->data[$cosyone_cookie_button_readmore] = $this->request->post[$cosyone_cookie_button_readmore];
			} else {
				$this->data[$cosyone_cookie_button_readmore] = $this->config->get($cosyone_cookie_button_readmore);
			}
		}
		
		$this->data['languages'] = $languages;
		foreach ($languages as $language) { $cosyone_cookie_button_accept = 'cosyone_cookie_button_accept_' . $language['language_id'];
			if (isset($this->request->post[$cosyone_cookie_button_accept])) {
				$this->data[$cosyone_cookie_button_accept] = $this->request->post[$cosyone_cookie_button_accept];
			} else {
				$this->data[$cosyone_cookie_button_accept] = $this->config->get($cosyone_cookie_button_accept);
			}
		}
		
		$this->data['cosyone_use_ie_list'] = $this->language->get('cosyone_use_ie_list');
		if (isset($this->request->post['cosyone_use_ie'])) {
			$this->data['cosyone_use_ie'] = $this->request->post['cosyone_use_ie'];
		} else {
			$this->data['cosyone_use_ie'] = $this->config->get('cosyone_use_ie');
		}
		
		$this->data['languages'] = $languages;
		foreach ($languages as $language) { $cosyone_ie_text = 'cosyone_ie_text_' . $language['language_id'];
			if (isset($this->request->post[$cosyone_ie_text])) {
				$this->data[$cosyone_ie_text] = $this->request->post[$cosyone_ie_text];
			} else {
				$this->data[$cosyone_ie_text] = $this->config->get($cosyone_ie_text);
			}
		}
		
		$this->data['languages'] = $languages;
		foreach ($languages as $language) { $cosyone_ie_update_text = 'cosyone_ie_update_text_' . $language['language_id'];
			if (isset($this->request->post[$cosyone_ie_update_text])) {
				$this->data[$cosyone_ie_update_text] = $this->request->post[$cosyone_ie_update_text];
			} else {
				$this->data[$cosyone_ie_update_text] = $this->config->get($cosyone_ie_update_text);
			}
		}
		
		if (isset($this->request->post['cosyone_ie_url'])) {
			$this->data['cosyone_ie_url'] = $this->request->post['cosyone_ie_url'];
		} else {
			$this->data['cosyone_ie_url'] = $this->config->get('cosyone_ie_url');
		}
		
		// General settings ends
		
		// Design options
		
		$this->data['cosyone_header_style_list'] = $this->language->get('cosyone_header_style_list');
		
		if (isset($this->request->post['cosyone_header_style'])) {
			$this->data['cosyone_header_style'] = $this->request->post['cosyone_header_style'];
		} else {
			$this->data['cosyone_header_style'] = $this->config->get('cosyone_header_style');
		}
		
		$this->data['cosyone_header_login_list'] = $this->language->get('cosyone_header_login_list');
		
		if (isset($this->request->post['cosyone_header_login'])) {
			$this->data['cosyone_header_login'] = $this->request->post['cosyone_header_login'];
		} else {
			$this->data['cosyone_header_login'] = $this->config->get('cosyone_header_login');
		}
		
		$this->data['cosyone_header_wishlist_list'] = $this->language->get('cosyone_header_wishlist_list');
		
		if (isset($this->request->post['cosyone_header_wishlist'])) {
			$this->data['cosyone_header_wishlist'] = $this->request->post['cosyone_header_wishlist'];
		} else {
			$this->data['cosyone_header_wishlist'] = $this->config->get('cosyone_header_wishlist');
		}
		
		$this->data['cosyone_header_compare_list'] = $this->language->get('cosyone_header_compare_list');
		
		if (isset($this->request->post['cosyone_header_compare'])) {
			$this->data['cosyone_header_compare'] = $this->request->post['cosyone_header_compare'];
		} else {
			$this->data['cosyone_header_compare'] = $this->config->get('cosyone_header_compare');
		}
		
		$this->data['cosyone_header_search_list'] = $this->language->get('cosyone_header_search_list');
		
		if (isset($this->request->post['cosyone_header_search'])) {
			$this->data['cosyone_header_search'] = $this->request->post['cosyone_header_search'];
		} else {
			$this->data['cosyone_header_search'] = $this->config->get('cosyone_header_search');
		}
		
		$this->data['cosyone_header_cart_list'] = $this->language->get('cosyone_header_cart_list');
		
		if (isset($this->request->post['cosyone_header_cart'])) {
			$this->data['cosyone_header_cart'] = $this->request->post['cosyone_header_cart'];
		} else {
			$this->data['cosyone_header_cart'] = $this->config->get('cosyone_header_cart');
		}
		
		// Fonts
		$this->data['cosyone_use_custom_font_list'] = $this->language->get('cosyone_use_custom_font_list');
		
		if (isset($this->request->post['cosyone_use_custom_font'])) {
			$this->data['cosyone_use_custom_font'] = $this->request->post['cosyone_use_custom_font'];
		} else {
			$this->data['cosyone_use_custom_font'] = $this->config->get('cosyone_use_custom_font');
		}
		
		if (isset($this->request->post['cosyone_font1_import'])) {
			$this->data['cosyone_font1_import'] = $this->request->post['cosyone_font1_import'];
		} else {
			$this->data['cosyone_font1_import'] = $this->config->get('cosyone_font1_import');
		}
		
		if (isset($this->request->post['cosyone_font1_name'])) {
			$this->data['cosyone_font1_name'] = $this->request->post['cosyone_font1_name'];
		} else {
			$this->data['cosyone_font1_name'] = $this->config->get('cosyone_font1_name');
		}
		
		if (isset($this->request->post['cosyone_font2_import'])) {
			$this->data['cosyone_font2_import'] = $this->request->post['cosyone_font2_import'];
		} else {
			$this->data['cosyone_font2_import'] = $this->config->get('cosyone_font2_import');
		}
		
		if (isset($this->request->post['cosyone_font2_name'])) {
			$this->data['cosyone_font2_name'] = $this->request->post['cosyone_font2_name'];
		} else {
			$this->data['cosyone_font2_name'] = $this->config->get('cosyone_font2_name');
		}
		
		$this->data['cosyone_use_font_light_list'] = $this->language->get('cosyone_use_font_light_list');
		
		if (isset($this->request->post['cosyone_use_font_light'])) {
			$this->data['cosyone_use_font_light'] = $this->request->post['cosyone_use_font_light'];
		} else {
			$this->data['cosyone_use_font_light'] = $this->config->get('cosyone_use_font_light');
		}
		
		$this->data['cosyone_use_font_regular_list'] = $this->language->get('cosyone_use_font_regular_list');
		
		if (isset($this->request->post['cosyone_use_font_regular'])) {
			$this->data['cosyone_use_font_regular'] = $this->request->post['cosyone_use_font_regular'];
		} else {
			$this->data['cosyone_use_font_regular'] = $this->config->get('cosyone_use_font_regular');
		}
		
		$this->data['cosyone_use_font_semibold_list'] = $this->language->get('cosyone_use_font_semibold_list');
		
		if (isset($this->request->post['cosyone_use_font_semibold'])) {
			$this->data['cosyone_use_font_semibold'] = $this->request->post['cosyone_use_font_semibold'];
		} else {
			$this->data['cosyone_use_font_semibold'] = $this->config->get('cosyone_use_font_semibold');
		}
		
		$this->data['cosyone_use_font_bold_list'] = $this->language->get('cosyone_use_font_bold_list');
		
		if (isset($this->request->post['cosyone_use_font_bold'])) {
			$this->data['cosyone_use_font_bold'] = $this->request->post['cosyone_use_font_bold'];
		} else {
			$this->data['cosyone_use_font_bold'] = $this->config->get('cosyone_use_font_bold');
		}
		
		// Fonts
		
		$this->data['cosyone_use_custom_list'] = $this->language->get('cosyone_use_custom_list');
		
		if (isset($this->request->post['cosyone_use_custom'])) {
			$this->data['cosyone_use_custom'] = $this->request->post['cosyone_use_custom'];
		} else {
			$this->data['cosyone_use_custom'] = $this->config->get('cosyone_use_custom');
		}
		
		if (isset($this->request->post['cosyone_body_background'])) {
			$this->data['cosyone_body_background'] = $this->request->post['cosyone_body_background'];
		} else {
			$this->data['cosyone_body_background'] = $this->config->get('cosyone_body_background');
		}
		
		$this->data['cosyone_body_image_list'] = $this->language->get('cosyone_body_image_list');
		if (isset($this->request->post['cosyone_body_image'])) {
			$this->data['cosyone_body_image'] = $this->request->post['cosyone_body_image'];
		} else {
			$this->data['cosyone_body_image'] = $this->config->get('cosyone_body_image');
		}
		
		
		
		if (isset($this->request->post['cosyone_top_border_background'])) {
			$this->data['cosyone_top_border_background'] = $this->request->post['cosyone_top_border_background'];
		} else {
			$this->data['cosyone_top_border_background'] = $this->config->get('cosyone_top_border_background');
		}
		
		if (isset($this->request->post['cosyone_top_border_border'])) {
			$this->data['cosyone_top_border_border'] = $this->request->post['cosyone_top_border_border'];
		} else {
			$this->data['cosyone_top_border_border'] = $this->config->get('cosyone_top_border_border');
		}
		
		if (isset($this->request->post['cosyone_top_border_text'])) {
			$this->data['cosyone_top_border_text'] = $this->request->post['cosyone_top_border_text'];
		} else {
			$this->data['cosyone_top_border_text'] = $this->config->get('cosyone_top_border_text');
		}
		
		if (isset($this->request->post['cosyone_top_border_link'])) {
			$this->data['cosyone_top_border_link'] = $this->request->post['cosyone_top_border_link'];
		} else {
			$this->data['cosyone_top_border_link'] = $this->config->get('cosyone_top_border_link');
		}
		
		if (isset($this->request->post['cosyone_top_border_link_hover'])) {
			$this->data['cosyone_top_border_link_hover'] = $this->request->post['cosyone_top_border_link_hover'];
		} else {
			$this->data['cosyone_top_border_link_hover'] = $this->config->get('cosyone_top_border_link_hover');
		}
		
		$this->data['cosyone_language_currency_list'] = $this->language->get('cosyone_language_currency_list');
		
		if (isset($this->request->post['cosyone_language_currency'])) {
			$this->data['cosyone_language_currency'] = $this->request->post['cosyone_language_currency'];
		} else {
			$this->data['cosyone_language_currency'] = $this->config->get('cosyone_language_currency');
		}		
		
		if (isset($this->request->post['cosyone_header_text'])) {
			$this->data['cosyone_header_text'] = $this->request->post['cosyone_header_text'];
		} else {
			$this->data['cosyone_header_text'] = $this->config->get('cosyone_header_text');
		}
		
		if (isset($this->request->post['cosyone_search_field_text'])) {
			$this->data['cosyone_search_field_text'] = $this->request->post['cosyone_search_field_text'];
		} else {
			$this->data['cosyone_search_field_text'] = $this->config->get('cosyone_search_field_text');
		}
		
		if (isset($this->request->post['cosyone_search_field_background'])) {
			$this->data['cosyone_search_field_background'] = $this->request->post['cosyone_search_field_background'];
		} else {
			$this->data['cosyone_search_field_background'] = $this->config->get('cosyone_search_field_background');
		}
		
		if (isset($this->request->post['cosyone_search_field_background_hover'])) {
			$this->data['cosyone_search_field_background_hover'] = $this->request->post['cosyone_search_field_background_hover'];
		} else {
			$this->data['cosyone_search_field_background_hover'] = $this->config->get('cosyone_search_field_background_hover');
		}
		
		$this->data['cosyone_search_field_icons_list'] = $this->language->get('cosyone_search_field_icons_list');
		if (isset($this->request->post['cosyone_search_field_icons'])) {
			$this->data['cosyone_search_field_icons'] = $this->request->post['cosyone_search_field_icons'];
		} else {
			$this->data['cosyone_search_field_icons'] = $this->config->get('cosyone_search_field_icons');
		}
		
		if (isset($this->request->post['cosyone_user_menu_background'])) {
			$this->data['cosyone_user_menu_background'] = $this->request->post['cosyone_user_menu_background'];
		} else {
			$this->data['cosyone_user_menu_background'] = $this->config->get('cosyone_user_menu_background');
		}
		
		if (isset($this->request->post['cosyone_user_menu_background_opacity'])) {
			$this->data['cosyone_user_menu_background_opacity'] = $this->request->post['cosyone_user_menu_background_opacity'];
		} else {
			$this->data['cosyone_user_menu_background_opacity'] = $this->config->get('cosyone_user_menu_background_opacity');
		}
		
		if (isset($this->request->post['cosyone_user_menu_background_opacity_hover'])) {
			$this->data['cosyone_user_menu_background_opacity_hover'] = $this->request->post['cosyone_user_menu_background_opacity_hover'];
		} else {
			$this->data['cosyone_user_menu_background_opacity_hover'] = $this->config->get('cosyone_user_menu_background_opacity_hover');
		}
		
		$this->data['cosyone_user_menu_icons_list'] = $this->language->get('cosyone_user_menu_icons_list');
		
		if (isset($this->request->post['cosyone_user_menu_icons'])) {
			$this->data['cosyone_user_menu_icons'] = $this->request->post['cosyone_user_menu_icons'];
		} else {
			$this->data['cosyone_user_menu_icons'] = $this->config->get('cosyone_user_menu_icons');
		}
		
		if (isset($this->request->post['cosyone_user_menu_text'])) {
			$this->data['cosyone_user_menu_text'] = $this->request->post['cosyone_user_menu_text'];
		} else {
			$this->data['cosyone_user_menu_text'] = $this->config->get('cosyone_user_menu_text');
		}
		
		if (isset($this->request->post['cosyone_user_menu_text_hover'])) {
			$this->data['cosyone_user_menu_text_hover'] = $this->request->post['cosyone_user_menu_text_hover'];
		} else {
			$this->data['cosyone_user_menu_text_hover'] = $this->config->get('cosyone_user_menu_text_hover');
		}
		
		if (isset($this->request->post['cosyone_menu_background'])) {
			$this->data['cosyone_menu_background'] = $this->request->post['cosyone_menu_background'];
		} else {
			$this->data['cosyone_menu_background'] = $this->config->get('cosyone_menu_background');
		}
		
		$this->data['cosyone_menu_pattern1_list'] = $this->language->get('cosyone_menu_pattern1_list');
		if (isset($this->request->post['cosyone_menu_pattern1'])) {
			$this->data['cosyone_menu_pattern1'] = $this->request->post['cosyone_menu_pattern1'];
		} else {
			$this->data['cosyone_menu_pattern1'] = $this->config->get('cosyone_menu_pattern1');
		}
		
		$this->data['cosyone_menu_pattern2_list'] = $this->language->get('cosyone_menu_pattern2_list');
		if (isset($this->request->post['cosyone_menu_pattern2'])) {
			$this->data['cosyone_menu_pattern2'] = $this->request->post['cosyone_menu_pattern2'];
		} else {
			$this->data['cosyone_menu_pattern2'] = $this->config->get('cosyone_menu_pattern2');
		}
		
		if (isset($this->request->post['cosyone_menu_link_color'])) {
			$this->data['cosyone_menu_link_color'] = $this->request->post['cosyone_menu_link_color'];
		} else {
			$this->data['cosyone_menu_link_color'] = $this->config->get('cosyone_menu_link_color');
		}
		
		if (isset($this->request->post['cosyone_menu_link_color_hover'])) {
			$this->data['cosyone_menu_link_color_hover'] = $this->request->post['cosyone_menu_link_color_hover'];
		} else {
			$this->data['cosyone_menu_link_color_hover'] = $this->config->get('cosyone_menu_link_color_hover');
		}
		
		if (isset($this->request->post['cosyone_menu_link_background_hover'])) {
			$this->data['cosyone_menu_link_background_hover'] = $this->request->post['cosyone_menu_link_background_hover'];
		} else {
			$this->data['cosyone_menu_link_background_hover'] = $this->config->get('cosyone_menu_link_background_hover');
		}
		
		if (isset($this->request->post['cosyone_shortcut_separator'])) {
			$this->data['cosyone_shortcut_separator'] = $this->request->post['cosyone_shortcut_separator'];
		} else {
			$this->data['cosyone_shortcut_separator'] = $this->config->get('cosyone_shortcut_separator');
		}
		
		
		if (isset($this->request->post['cosyone_primary_color'])) {
			$this->data['cosyone_primary_color'] = $this->request->post['cosyone_primary_color'];
		} else {
			$this->data['cosyone_primary_color'] = $this->config->get('cosyone_primary_color');
		}
		
		if (isset($this->request->post['cosyone_secondary_color'])) {
			$this->data['cosyone_secondary_color'] = $this->request->post['cosyone_secondary_color'];
		} else {
			$this->data['cosyone_secondary_color'] = $this->config->get('cosyone_secondary_color');
		}
		
		if (isset($this->request->post['cosyone_link_hover_color'])) {
			$this->data['cosyone_link_hover_color'] = $this->request->post['cosyone_link_hover_color'];
		} else {
			$this->data['cosyone_link_hover_color'] = $this->config->get('cosyone_link_hover_color');
		}
		
		if (isset($this->request->post['cosyone_offer_color'])) {
			$this->data['cosyone_offer_color'] = $this->request->post['cosyone_offer_color'];
		} else {
			$this->data['cosyone_offer_color'] = $this->config->get('cosyone_offer_color');
		}
		
		if (isset($this->request->post['cosyone_h1_color'])) {
			$this->data['cosyone_h1_color'] = $this->request->post['cosyone_h1_color'];
		} else {
			$this->data['cosyone_h1_color'] = $this->config->get('cosyone_h1_color');
		}
		
		if (isset($this->request->post['cosyone_heading_color'])) {
			$this->data['cosyone_heading_color'] = $this->request->post['cosyone_heading_color'];
		} else {
			$this->data['cosyone_heading_color'] = $this->config->get('cosyone_heading_color');
		}
		
		if (isset($this->request->post['cosyone_highlight_background'])) {
			$this->data['cosyone_highlight_background'] = $this->request->post['cosyone_highlight_background'];
		} else {
			$this->data['cosyone_highlight_background'] = $this->config->get('cosyone_highlight_background');
		}
		
		if (isset($this->request->post['cosyone_salebadge_background'])) {
			$this->data['cosyone_salebadge_background'] = $this->request->post['cosyone_salebadge_background'];
		} else {
			$this->data['cosyone_salebadge_background'] = $this->config->get('cosyone_salebadge_background');
		}
		
		if (isset($this->request->post['cosyone_price_color'])) {
			$this->data['cosyone_price_color'] = $this->request->post['cosyone_price_color'];
		} else {
			$this->data['cosyone_price_color'] = $this->config->get('cosyone_price_color');
		}
		
		if (isset($this->request->post['cosyone_module_heading_background'])) {
			$this->data['cosyone_module_heading_background'] = $this->request->post['cosyone_module_heading_background'];
		} else {
			$this->data['cosyone_module_heading_background'] = $this->config->get('cosyone_module_heading_background');
		}
		
		if (isset($this->request->post['cosyone_module_heading_color'])) {
			$this->data['cosyone_module_heading_color'] = $this->request->post['cosyone_module_heading_color'];
		} else {
			$this->data['cosyone_module_heading_color'] = $this->config->get('cosyone_module_heading_color');
		}
		
		if (isset($this->request->post['cosyone_product_tabs_heading'])) {
			$this->data['cosyone_product_tabs_heading'] = $this->request->post['cosyone_product_tabs_heading'];
		} else {
			$this->data['cosyone_product_tabs_heading'] = $this->config->get('cosyone_product_tabs_heading');
		}
		
		if (isset($this->request->post['cosyone_product_tabs_content'])) {
			$this->data['cosyone_product_tabs_content'] = $this->request->post['cosyone_product_tabs_content'];
		} else {
			$this->data['cosyone_product_tabs_content'] = $this->config->get('cosyone_product_tabs_content');
		}
		
		if (isset($this->request->post['cosyone_button_color'])) {
			$this->data['cosyone_button_color'] = $this->request->post['cosyone_button_color'];
		} else {
			$this->data['cosyone_button_color'] = $this->config->get('cosyone_button_color');
		}
		
		if (isset($this->request->post['cosyone_button_background'])) {
			$this->data['cosyone_button_background'] = $this->request->post['cosyone_button_background'];
		} else {
			$this->data['cosyone_button_background'] = $this->config->get('cosyone_button_background');
		}
		
		if (isset($this->request->post['cosyone_button_border'])) {
			$this->data['cosyone_button_border'] = $this->request->post['cosyone_button_border'];
		} else {
			$this->data['cosyone_button_border'] = $this->config->get('cosyone_button_border');
		}
		
		
		
		if (isset($this->request->post['cosyone_button_hover_color'])) {
			$this->data['cosyone_button_hover_color'] = $this->request->post['cosyone_button_hover_color'];
		} else {
			$this->data['cosyone_button_hover_color'] = $this->config->get('cosyone_button_hover_color');
		}
		
		if (isset($this->request->post['cosyone_button_hover_background'])) {
			$this->data['cosyone_button_hover_background'] = $this->request->post['cosyone_button_hover_background'];
		} else {
			$this->data['cosyone_button_hover_background'] = $this->config->get('cosyone_button_hover_background');
		}
		
		if (isset($this->request->post['cosyone_button_hover_border'])) {
			$this->data['cosyone_button_hover_border'] = $this->request->post['cosyone_button_hover_border'];
		} else {
			$this->data['cosyone_button_hover_border'] = $this->config->get('cosyone_button_hover_border');
		}
		
		
		
		if (isset($this->request->post['cosyone_button2_color'])) {
			$this->data['cosyone_button2_color'] = $this->request->post['cosyone_button2_color'];
		} else {
			$this->data['cosyone_button2_color'] = $this->config->get('cosyone_button2_color');
		}
		
		if (isset($this->request->post['cosyone_button2_background'])) {
			$this->data['cosyone_button2_background'] = $this->request->post['cosyone_button2_background'];
		} else {
			$this->data['cosyone_button2_background'] = $this->config->get('cosyone_button2_background');
		}
		
		if (isset($this->request->post['cosyone_button2_border'])) {
			$this->data['cosyone_button2_border'] = $this->request->post['cosyone_button2_border'];
		} else {
			$this->data['cosyone_button2_border'] = $this->config->get('cosyone_button2_border');
		}
		
		
		if (isset($this->request->post['cosyone_button2_hover_color'])) {
			$this->data['cosyone_button2_hover_color'] = $this->request->post['cosyone_button2_hover_color'];
		} else {
			$this->data['cosyone_button2_hover_color'] = $this->config->get('cosyone_button2_hover_color');
		}
		
		if (isset($this->request->post['cosyone_button2_hover_background'])) {
			$this->data['cosyone_button2_hover_background'] = $this->request->post['cosyone_button2_hover_background'];
		} else {
			$this->data['cosyone_button2_hover_background'] = $this->config->get('cosyone_button2_hover_background');
		}
		
		if (isset($this->request->post['cosyone_button2_hover_border'])) {
			$this->data['cosyone_button2_hover_border'] = $this->request->post['cosyone_button2_hover_border'];
		} else {
			$this->data['cosyone_button2_hover_border'] = $this->config->get('cosyone_button2_hover_border');
		}
		
		
		
		if (isset($this->request->post['cosyone_icons_background'])) {
			$this->data['cosyone_icons_background'] = $this->request->post['cosyone_icons_background'];
		} else {
			$this->data['cosyone_icons_background'] = $this->config->get('cosyone_icons_background');
		}
		
		if (isset($this->request->post['cosyone_icons_background_hover'])) {
			$this->data['cosyone_icons_background_hover'] = $this->request->post['cosyone_icons_background_hover'];
		} else {
			$this->data['cosyone_icons_background_hover'] = $this->config->get('cosyone_icons_background_hover');
		}
		
		if (isset($this->request->post['cosyone_footer_background'])) {
			$this->data['cosyone_footer_background'] = $this->request->post['cosyone_footer_background'];
		} else {
			$this->data['cosyone_footer_background'] = $this->config->get('cosyone_footer_background');
		}
		
		$this->data['cosyone_footer_pattern1_list'] = $this->language->get('cosyone_footer_pattern1_list');
		if (isset($this->request->post['cosyone_footer_pattern1'])) {
			$this->data['cosyone_footer_pattern1'] = $this->request->post['cosyone_footer_pattern1'];
		} else {
			$this->data['cosyone_footer_pattern1'] = $this->config->get('cosyone_footer_pattern1');
		}
		
		$this->data['cosyone_footer_pattern2_list'] = $this->language->get('cosyone_footer_pattern2_list');
		if (isset($this->request->post['cosyone_footer_pattern2'])) {
			$this->data['cosyone_footer_pattern2'] = $this->request->post['cosyone_footer_pattern2'];
		} else {
			$this->data['cosyone_footer_pattern2'] = $this->config->get('cosyone_footer_pattern2');
		}
		
		$this->data['cosyone_footer_social_icons_style_list'] = $this->language->get('cosyone_footer_social_icons_style_list');
		if (isset($this->request->post['cosyone_footer_social_icons_style'])) {
			$this->data['cosyone_footer_social_icons_style'] = $this->request->post['cosyone_footer_social_icons_style'];
		} else {
			$this->data['cosyone_footer_social_icons_style'] = $this->config->get('cosyone_footer_social_icons_style');
		}
		
		if (isset($this->request->post['cosyone_footer_social_icons_background'])) {
			$this->data['cosyone_footer_social_icons_background'] = $this->request->post['cosyone_footer_social_icons_background'];
		} else {
			$this->data['cosyone_footer_social_icons_background'] = $this->config->get('cosyone_footer_social_icons_background');
		}
		
		if (isset($this->request->post['cosyone_footer_social_icons_hover'])) {
			$this->data['cosyone_footer_social_icons_hover'] = $this->request->post['cosyone_footer_social_icons_hover'];
		} else {
			$this->data['cosyone_footer_social_icons_hover'] = $this->config->get('cosyone_footer_social_icons_hover');
		}
		
		$this->data['cosyone_footer_content_background_list'] = $this->language->get('cosyone_footer_content_background_list');
		if (isset($this->request->post['cosyone_footer_content_background'])) {
			$this->data['cosyone_footer_content_background'] = $this->request->post['cosyone_footer_content_background'];
		} else {
			$this->data['cosyone_footer_content_background'] = $this->config->get('cosyone_footer_content_background');
		}
		
		if (isset($this->request->post['cosyone_footer_heading'])) {
			$this->data['cosyone_footer_heading'] = $this->request->post['cosyone_footer_heading'];
		} else {
			$this->data['cosyone_footer_heading'] = $this->config->get('cosyone_footer_heading');
		}
		
		if (isset($this->request->post['cosyone_footer_links'])) {
			$this->data['cosyone_footer_links'] = $this->request->post['cosyone_footer_links'];
		} else {
			$this->data['cosyone_footer_links'] = $this->config->get('cosyone_footer_links');
		}
		
		if (isset($this->request->post['cosyone_footer_links_hover'])) {
			$this->data['cosyone_footer_links_hover'] = $this->request->post['cosyone_footer_links_hover'];
		} else {
			$this->data['cosyone_footer_links_hover'] = $this->config->get('cosyone_footer_links_hover');
		}
		
		$this->data['cosyone_company_info_icons_style_list'] = $this->language->get('cosyone_company_info_icons_style_list');
		if (isset($this->request->post['cosyone_company_info_icons_style'])) {
			$this->data['cosyone_company_info_icons_style'] = $this->request->post['cosyone_company_info_icons_style'];
		} else {
			$this->data['cosyone_company_info_icons_style'] = $this->config->get('cosyone_company_info_icons_style');
		}
		
		// Design options ends
		
		// Custom CSS starts
		$this->data['cosyone_use_custom_css_list'] = $this->language->get('cosyone_use_custom_css_list');
		
		if (isset($this->request->post['cosyone_use_custom_css'])) {
			$this->data['cosyone_use_custom_css'] = $this->request->post['cosyone_use_custom_css'];
		} else {
			$this->data['cosyone_use_custom_css'] = $this->config->get('cosyone_use_custom_css');
		}
		
		if (isset($this->request->post['cosyone_custom_css_content'])) {
			$this->data['cosyone_custom_css_content'] = $this->request->post['cosyone_custom_css_content'];
		} else {
			$this->data['cosyone_custom_css_content'] = $this->config->get('cosyone_custom_css_content');
		}
		// Custom CSS ends
		
		// Custom Javascript starts
		$this->data['cosyone_use_custom_javascript_list'] = $this->language->get('cosyone_use_custom_javascript_list');
		
		if (isset($this->request->post['cosyone_use_custom_javascript'])) {
			$this->data['cosyone_use_custom_javascript'] = $this->request->post['cosyone_use_custom_javascript'];
		} else {
			$this->data['cosyone_use_custom_javascript'] = $this->config->get('cosyone_use_custom_javascript');
		}
		
		if (isset($this->request->post['cosyone_custom_javascript_content'])) {
			$this->data['cosyone_custom_javascript_content'] = $this->request->post['cosyone_custom_javascript_content'];
		} else {
			$this->data['cosyone_custom_javascript_content'] = $this->config->get('cosyone_custom_javascript_content');
		}
		// Custom Javascript ends

		// Content ends
		
		
   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/cosyone_panel', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);

		
		$this->data['action'] = $this->url->link('module/cosyone_panel', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->template = 'module/cosyone_panel.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/cosyone_panel')) {
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