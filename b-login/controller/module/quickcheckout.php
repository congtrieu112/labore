<?php

class ControllerModuleQuickCheckOut extends Controller {

    private $error = array();

    public function index() {
        $this->language->load('module/quickcheckout');

        $this->document->setTitle($this->language->get('text_title'));
        $this->document->addStyle('view/stylesheet/quickcheckout/fontawesome/css/font-awesome.min.css');
        $this->document->addStyle('view/stylesheet/quickcheckout/quickcheckout.css');
        $this->document->addScript('view/stylesheet/quickcheckout/quickcheckout.js');

        $this->load->model('setting/setting');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            $this->model_setting_setting->editSetting('quickcheckout', $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            if (!isset($this->request->get['continue'])) {
                $this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
            } else {
                $this->redirect($this->url->link('module/quickcheckout', 'token=' . $this->session->data['token'], 'SSL'));
            }
        }

        // All fields
        $fields = array(
            'firstname',
            'lastname',
            'email',
            'telephone',
            'fax',
            'company',
            'customer_group',
            'address_1',
            'address_2',
            'city',
            'postcode',
            'country',
            'zone',
            'district',
            'newsletter',
            'register',
            
        );

        $this->data['fields'] = $fields;

        // Heading
        $this->data['heading_title'] = $this->language->get('text_title');

        // Tab
        $this->data['tab_home'] = $this->language->get('tab_home');
        $this->data['tab_general'] = $this->language->get('tab_general');
        $this->data['tab_technical'] = $this->language->get('tab_technical');
        $this->data['tab_field'] = $this->language->get('tab_field');
        $this->data['tab_module'] = $this->language->get('tab_module');
        $this->data['tab_survey'] = $this->language->get('tab_survey');
        $this->data['tab_delivery'] = $this->language->get('tab_delivery');
        $this->data['tab_countdown'] = $this->language->get('tab_countdown');
        $this->data['tab_support'] = $this->language->get('tab_support');

        // Home
        $this->data['text_general'] = $this->language->get('text_general');
        $this->data['text_technical'] = $this->language->get('text_technical');
        $this->data['text_field'] = $this->language->get('text_field');
        $this->data['text_module_home'] = $this->language->get('text_module_home');
        $this->data['text_survey'] = $this->language->get('text_survey');
        $this->data['text_delivery'] = $this->language->get('text_delivery');
        $this->data['text_countdown'] = $this->language->get('text_countdown');
        $this->data['text_support_home'] = $this->language->get('text_support_home');

        // System
        $this->data['text_enabled'] = $this->language->get('text_enabled');
        $this->data['text_disabled'] = $this->language->get('text_disabled');
        $this->data['text_radio_type'] = $this->language->get('text_radio_type');
        $this->data['text_select_type'] = $this->language->get('text_select_type');
        $this->data['text_text_type'] = $this->language->get('text_text_type');
        $this->data['text_select'] = $this->language->get('text_select');
        $this->data['text_none'] = $this->language->get('text_none');
        $this->data['text_one_column'] = $this->language->get('text_one_column');
        $this->data['text_two_column'] = $this->language->get('text_two_column');
        $this->data['text_three_column'] = $this->language->get('text_three_column');
        $this->data['text_estimate'] = $this->language->get('text_estimate');
        $this->data['text_choose'] = $this->language->get('text_choose');
        $this->data['text_day'] = $this->language->get('text_day');
        $this->data['text_specific'] = $this->language->get('text_specific');
        $this->data['text_display'] = $this->language->get('text_display');
        $this->data['text_required'] = $this->language->get('text_required');
        $this->data['text_default'] = $this->language->get('text_default');
        $this->data['text_sort_order'] = $this->language->get('text_sort_order');
        $this->data['text_purchase'] = $this->language->get('text_purchase');
        $this->data['text_review'] = $this->language->get('text_review');
        $this->data['text_support'] = $this->language->get('text_support');

        // General
        $this->data['entry_status'] = $this->language->get('entry_status');
        $this->data['entry_load_screen'] = $this->language->get('entry_load_screen');
        $this->data['entry_payment_logo'] = $this->language->get('entry_payment_logo');
        $this->data['entry_payment'] = $this->language->get('entry_payment');
        $this->data['entry_shipping'] = $this->language->get('entry_shipping');
        $this->data['entry_edit_cart'] = $this->language->get('entry_edit_cart');
        $this->data['entry_highlight_error'] = $this->language->get('entry_highlight_error');
        $this->data['entry_text_error'] = $this->language->get('entry_text_error');
        $this->data['entry_layout'] = $this->language->get('entry_layout');
        $this->data['entry_slide_effect'] = $this->language->get('entry_slide_effect');

        // Technical
        $this->data['entry_debug'] = $this->language->get('entry_debug');
        $this->data['entry_auto_submit'] = $this->language->get('entry_auto_submit');
        $this->data['entry_responsive'] = $this->language->get('entry_responsive');
        $this->data['entry_country_reload'] = $this->language->get('entry_country_reload');
        $this->data['entry_payment_reload'] = $this->language->get('entry_payment_reload');
        $this->data['entry_shipping_reload'] = $this->language->get('entry_shipping_reload');

        // Fields
        foreach ($fields as $field) {
            $this->data['entry_field_' . $field] = $this->language->get('entry_field_' . $field);
        }

        // Modules
        $this->data['entry_voucher'] = $this->language->get('entry_voucher');
        $this->data['entry_coupon'] = $this->language->get('entry_coupon');
        $this->data['entry_reward'] = $this->language->get('entry_reward');
        $this->data['entry_cart'] = $this->language->get('entry_cart');
        $this->data['entry_shipping_module'] = $this->language->get('entry_shipping_module');
        $this->data['entry_payment_module'] = $this->language->get('entry_payment_module');
        $this->data['entry_login_module'] = $this->language->get('entry_login_module');
        $this->data['entry_html_header'] = $this->language->get('entry_html_header');
        $this->data['entry_html_footer'] = $this->language->get('entry_html_footer');

        // Survey
        $this->data['entry_survey'] = $this->language->get('entry_survey');
        $this->data['entry_survey_required'] = $this->language->get('entry_survey_required');
        $this->data['entry_survey_text'] = $this->language->get('entry_survey_text');
        $this->data['entry_survey_type'] = $this->language->get('entry_survey_type');
        $this->data['entry_survey_answer'] = $this->language->get('entry_survey_answer');

        // Delivery
        $this->data['entry_delivery'] = $this->language->get('entry_delivery');
        $this->data['entry_delivery_time'] = $this->language->get('entry_delivery_time');
        $this->data['entry_delivery_required'] = $this->language->get('entry_delivery_required');
        $this->data['entry_delivery_unavailable'] = $this->language->get('entry_delivery_unavailable');
        $this->data['entry_delivery_min'] = $this->language->get('entry_delivery_min');
        $this->data['entry_delivery_max'] = $this->language->get('entry_delivery_max');
        $this->data['entry_delivery_min_hour'] = $this->language->get('entry_delivery_min_hour');
        $this->data['entry_delivery_max_hour'] = $this->language->get('entry_delivery_max_hour');
        $this->data['entry_delivery_times'] = $this->language->get('entry_delivery_times');

        // Countdown
        $this->data['entry_countdown'] = $this->language->get('entry_countdown');
        $this->data['entry_countdown_start'] = $this->language->get('entry_countdown_start');
        $this->data['entry_countdown_date_start'] = $this->language->get('entry_countdown_date_start');
        $this->data['entry_countdown_date_end'] = $this->language->get('entry_countdown_date_end');
        $this->data['entry_countdown_time'] = $this->language->get('entry_countdown_time');
        $this->data['entry_countdown_text'] = $this->language->get('entry_countdown_text');

        // Mail
        $this->data['entry_mail_name'] = $this->language->get('entry_mail_name');
        $this->data['entry_mail_order_id'] = $this->language->get('entry_mail_order_id');
        $this->data['entry_mail_message'] = $this->language->get('entry_mail_message');
        $this->data['entry_mail_email'] = $this->language->get('entry_mail_email');

        // Button
        $this->data['button_save'] = $this->language->get('button_save');
        $this->data['button_continue'] = $this->language->get('button_continue');
        $this->data['button_cancel'] = $this->language->get('button_cancel');
        $this->data['button_mail'] = $this->language->get('button_mail');
        $this->data['button_add'] = $this->language->get('button_add');
        $this->data['button_remove'] = $this->language->get('button_remove');

        $this->data['token'] = $this->session->data['token'];

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

        if (!$this->config->get('quickcheckout_status')) {
            $this->data['text_quick_start'] = sprintf($this->language->get('text_quick_start'), $this->url->link('module/quickcheckout/quick_start', 'token=' . $this->session->data['token'], 'SSL'));
        } else {
            $this->data['text_quick_start'] = '';
        }

        $this->data['breadcrumbs'] = array();

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_module'),
            'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_title'),
            'href' => $this->url->link('module/quickcheckout', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        // General
        if (isset($this->request->post['quickcheckout_status'])) {
            $this->data['quickcheckout_status'] = $this->request->post['quickcheckout_status'];
        } else {
            $this->data['quickcheckout_status'] = $this->config->get('quickcheckout_status');
        }

        if (isset($this->request->post['quickcheckout_load_screen'])) {
            $this->data['quickcheckout_load_screen'] = $this->request->post['quickcheckout_load_screen'];
        } else {
            $this->data['quickcheckout_load_screen'] = $this->config->get('quickcheckout_load_screen');
        }

        if (isset($this->request->post['quickcheckout_payment_logo'])) {
            $this->data['quickcheckout_payment_logo'] = $this->request->post['quickcheckout_payment_logo'];
        } else {
            $this->data['quickcheckout_payment_logo'] = $this->config->get('quickcheckout_payment_logo');
        }

        if (isset($this->request->post['quickcheckout_payment'])) {
            $this->data['quickcheckout_payment'] = $this->request->post['quickcheckout_payment'];
        } else {
            $this->data['quickcheckout_payment'] = $this->config->get('quickcheckout_payment');
        }

        if (isset($this->request->post['quickcheckout_shipping'])) {
            $this->data['quickcheckout_shipping'] = $this->request->post['quickcheckout_shipping'];
        } else {
            $this->data['quickcheckout_shipping'] = $this->config->get('quickcheckout_shipping');
        }

        if (isset($this->request->post['quickcheckout_edit_cart'])) {
            $this->data['quickcheckout_edit_cart'] = $this->request->post['quickcheckout_edit_cart'];
        } else {
            $this->data['quickcheckout_edit_cart'] = $this->config->get('quickcheckout_edit_cart');
        }

        if (isset($this->request->post['quickcheckout_highlight_error'])) {
            $this->data['quickcheckout_highlight_error'] = $this->request->post['quickcheckout_highlight_error'];
        } else {
            $this->data['quickcheckout_highlight_error'] = $this->config->get('quickcheckout_highlight_error');
        }

        if (isset($this->request->post['quickcheckout_text_error'])) {
            $this->data['quickcheckout_text_error'] = $this->request->post['quickcheckout_text_error'];
        } else {
            $this->data['quickcheckout_text_error'] = $this->config->get('quickcheckout_text_error');
        }

        if (isset($this->request->post['quickcheckout_layout'])) {
            $this->data['quickcheckout_layout'] = $this->request->post['quickcheckout_layout'];
        } elseif ($this->config->get('quickcheckout_layout')) {
            $this->data['quickcheckout_layout'] = $this->config->get('quickcheckout_layout');
        } else {
            $this->data['quickcheckout_layout'] = '2';
        }

        if (isset($this->request->post['quickcheckout_slide_effect'])) {
            $this->data['quickcheckout_slide_effect'] = $this->request->post['quickcheckout_slide_effect'];
        } else {
            $this->data['quickcheckout_slide_effect'] = $this->config->get('quickcheckout_slide_effect');
        }

        // Technical
        if (isset($this->request->post['quickcheckout_debug'])) {
            $this->data['quickcheckout_debug'] = $this->request->post['quickcheckout_debug'];
        } else {
            $this->data['quickcheckout_debug'] = $this->config->get('quickcheckout_debug');
        }

        if (isset($this->request->post['quickcheckout_auto_submit'])) {
            $this->data['quickcheckout_auto_submit'] = $this->request->post['quickcheckout_auto_submit'];
        } else {
            $this->data['quickcheckout_auto_submit'] = $this->config->get('quickcheckout_auto_submit');
        }

        if (isset($this->request->post['quickcheckout_responsive'])) {
            $this->data['quickcheckout_responsive'] = $this->request->post['quickcheckout_responsive'];
        } else {
            $this->data['quickcheckout_responsive'] = $this->config->get('quickcheckout_responsive');
        }

        if (isset($this->request->post['quickcheckout_country_reload'])) {
            $this->data['quickcheckout_country_reload'] = $this->request->post['quickcheckout_country_reload'];
        } else {
            $this->data['quickcheckout_country_reload'] = $this->config->get('quickcheckout_country_reload');
        }

        if (isset($this->request->post['quickcheckout_payment_reload'])) {
            $this->data['quickcheckout_payment_reload'] = $this->request->post['quickcheckout_payment_reload'];
        } else {
            $this->data['quickcheckout_payment_reload'] = $this->config->get('quickcheckout_payment_reload');
        }

        if (isset($this->request->post['quickcheckout_shipping_reload'])) {
            $this->data['quickcheckout_shipping_reload'] = $this->request->post['quickcheckout_shipping_reload'];
        } else {
            $this->data['quickcheckout_shipping_reload'] = $this->config->get('quickcheckout_shipping_reload');
        }

        // Fields
        foreach ($fields as $field) {
            if (isset($this->request->post['quickcheckout_field_' . $field])) {
                $this->data['quickcheckout_field_' . $field] = $this->request->post['quickcheckout_field_' . $field];
            } elseif (is_array($this->config->get('quickcheckout_field_' . $field))) {
                $this->data['quickcheckout_field_' . $field] = $this->config->get('quickcheckout_field_' . $field);
            } else {
                $this->data['quickcheckout_field_' . $field] = array();
            }
        }

        // Modules
        if (isset($this->request->post['quickcheckout_coupon'])) {
            $this->data['quickcheckout_coupon'] = $this->request->post['quickcheckout_coupon'];
        } else {
            $this->data['quickcheckout_coupon'] = $this->config->get('quickcheckout_coupon');
        }

        if (isset($this->request->post['quickcheckout_voucher'])) {
            $this->data['quickcheckout_voucher'] = $this->request->post['quickcheckout_voucher'];
        } else {
            $this->data['quickcheckout_voucher'] = $this->config->get('quickcheckout_voucher');
        }

        if (isset($this->request->post['quickcheckout_reward'])) {
            $this->data['quickcheckout_reward'] = $this->request->post['quickcheckout_reward'];
        } else {
            $this->data['quickcheckout_reward'] = $this->config->get('quickcheckout_reward');
        }

        if (isset($this->request->post['quickcheckout_cart'])) {
            $this->data['quickcheckout_cart'] = $this->request->post['quickcheckout_cart'];
        } else {
            $this->data['quickcheckout_cart'] = $this->config->get('quickcheckout_cart');
        }

        if (isset($this->request->post['quickcheckout_shipping_module'])) {
            $this->data['quickcheckout_shipping_module'] = $this->request->post['quickcheckout_shipping_module'];
        } else {
            $this->data['quickcheckout_shipping_module'] = $this->config->get('quickcheckout_shipping_module');
        }

        if (isset($this->request->post['quickcheckout_payment_module'])) {
            $this->data['quickcheckout_payment_module'] = $this->request->post['quickcheckout_payment_module'];
        } else {
            $this->data['quickcheckout_payment_module'] = $this->config->get('quickcheckout_payment_module');
        }

        if (isset($this->request->post['quickcheckout_login_module'])) {
            $this->data['quickcheckout_login_module'] = $this->request->post['quickcheckout_login_module'];
        } else {
            $this->data['quickcheckout_login_module'] = $this->config->get('quickcheckout_login_module');
        }

        if (isset($this->request->post['quickcheckout_html_header'])) {
            $this->data['quickcheckout_html_header'] = $this->request->post['quickcheckout_html_header'];
        } elseif ($this->config->get('quickcheckout_html_header')) {
            $this->data['quickcheckout_html_header'] = $this->config->get('quickcheckout_html_header');
        } else {
            $this->data['quickcheckout_html_header'] = array();
        }

        if (isset($this->request->post['quickcheckout_html_footer'])) {
            $this->data['quickcheckout_html_footer'] = $this->request->post['quickcheckout_html_footer'];
        } elseif ($this->config->get('quickcheckout_html_footer')) {
            $this->data['quickcheckout_html_footer'] = $this->config->get('quickcheckout_html_footer');
        } else {
            $this->data['quickcheckout_html_footer'] = array();
        }

        // Survey
        if (isset($this->request->post['quickcheckout_survey'])) {
            $this->data['quickcheckout_survey'] = $this->request->post['quickcheckout_survey'];
        } else {
            $this->data['quickcheckout_survey'] = $this->config->get('quickcheckout_survey');
        }

        if (isset($this->request->post['quickcheckout_survey_required'])) {
            $this->data['quickcheckout_survey_required'] = $this->request->post['quickcheckout_survey_required'];
        } else {
            $this->data['quickcheckout_survey_required'] = $this->config->get('quickcheckout_survey_required');
        }

        if (isset($this->request->post['quickcheckout_survey_text'])) {
            $this->data['quickcheckout_survey_text'] = $this->request->post['quickcheckout_survey_text'];
        } elseif ($this->config->get('quickcheckout_survey_text')) {
            $this->data['quickcheckout_survey_text'] = $this->config->get('quickcheckout_survey_text');
        } else {
            $this->data['quickcheckout_survey_text'] = array();
        }

        if (isset($this->request->post['quickcheckout_survey_type'])) {
            $this->data['quickcheckout_survey_type'] = $this->request->post['quickcheckout_survey_type'];
        } else {
            $this->data['quickcheckout_survey_type'] = $this->config->get('quickcheckout_survey_type');
        }

        if (isset($this->request->post['quickcheckout_survey_answers'])) {
            $this->data['quickcheckout_survey_answers'] = $this->request->post['quickcheckout_survey_answers'];
        } elseif ($this->config->get('quickcheckout_survey_answers')) {
            $this->data['quickcheckout_survey_answers'] = $this->config->get('quickcheckout_survey_answers');
        } else {
            $this->data['quickcheckout_survey_answers'] = array();
        }

        // Delivery
        if (isset($this->request->post['quickcheckout_delivery'])) {
            $this->data['quickcheckout_delivery'] = $this->request->post['quickcheckout_delivery'];
        } else {
            $this->data['quickcheckout_delivery'] = $this->config->get('quickcheckout_delivery');
        }

        if (isset($this->request->post['quickcheckout_delivery_time'])) {
            $this->data['quickcheckout_delivery_time'] = $this->request->post['quickcheckout_delivery_time'];
        } else {
            $this->data['quickcheckout_delivery_time'] = $this->config->get('quickcheckout_delivery_time');
        }

        if (isset($this->request->post['quickcheckout_delivery_required'])) {
            $this->data['quickcheckout_delivery_required'] = $this->request->post['quickcheckout_delivery_required'];
        } else {
            $this->data['quickcheckout_delivery_required'] = $this->config->get('quickcheckout_delivery_required');
        }

        if (isset($this->request->post['quickcheckout_delivery_unavailable'])) {
            $this->data['quickcheckout_delivery_unavailable'] = $this->request->post['quickcheckout_delivery_unavailable'];
        } elseif ($this->config->get('quickcheckout_delivery_unavailable')) {
            $this->data['quickcheckout_delivery_unavailable'] = $this->config->get('quickcheckout_delivery_unavailable');
        } else {
            $this->data['quickcheckout_delivery_unavailable'] = '"6-3-2013", "7-3-2013", "8-3-2013"';
        }

        if (isset($this->request->post['quickcheckout_delivery_min'])) {
            $this->data['quickcheckout_delivery_min'] = $this->request->post['quickcheckout_delivery_min'];
        } elseif ($this->config->get('quickcheckout_delivery_min')) {
            $this->data['quickcheckout_delivery_min'] = (int) $this->config->get('quickcheckout_delivery_min');
        } else {
            $this->data['quickcheckout_delivery_min'] = 1;
        }

        if (isset($this->request->post['quickcheckout_delivery_max'])) {
            $this->data['quickcheckout_delivery_max'] = $this->request->post['quickcheckout_delivery_max'];
        } elseif ($this->config->get('quickcheckout_delivery_max')) {
            $this->data['quickcheckout_delivery_max'] = (int) $this->config->get('quickcheckout_delivery_max');
        } else {
            $this->data['quickcheckout_delivery_max'] = 30;
        }

        if (isset($this->request->post['quickcheckout_delivery_min_hour'])) {
            $this->data['quickcheckout_delivery_min_hour'] = $this->request->post['quickcheckout_delivery_min_hour'];
        } elseif ($this->config->get('quickcheckout_delivery_min_hour')) {
            $this->data['quickcheckout_delivery_min_hour'] = $this->config->get('quickcheckout_delivery_min_hour');
        } else {
            $this->data['quickcheckout_delivery_min_hour'] = 9;
        }

        if (isset($this->request->post['quickcheckout_delivery_max_hour'])) {
            $this->data['quickcheckout_delivery_max_hour'] = $this->request->post['quickcheckout_delivery_max_hour'];
        } elseif ($this->config->get('quickcheckout_delivery_max_hour')) {
            $this->data['quickcheckout_delivery_max_hour'] = $this->config->get('quickcheckout_delivery_max_hour');
        } else {
            $this->data['quickcheckout_delivery_max_hour'] = 17;
        }

        if (isset($this->request->post['quickcheckout_delivery_times'])) {
            $this->data['quickcheckout_delivery_times'] = $this->request->post['quickcheckout_delivery_times'];
        } elseif ($this->config->get('quickcheckout_delivery_times')) {
            $this->data['quickcheckout_delivery_times'] = $this->config->get('quickcheckout_delivery_times');
        } else {
            $this->data['quickcheckout_delivery_times'] = array();
        }

        // Countdown
        if (isset($this->request->post['quickcheckout_countdown'])) {
            $this->data['quickcheckout_countdown'] = $this->request->post['quickcheckout_countdown'];
        } else {
            $this->data['quickcheckout_countdown'] = $this->config->get('quickcheckout_countdown');
        }

        if (isset($this->request->post['quickcheckout_countdown_start'])) {
            $this->data['quickcheckout_countdown_start'] = $this->request->post['quickcheckout_countdown_start'];
        } else {
            $this->data['quickcheckout_countdown_start'] = $this->config->get('quickcheckout_countdown_start');
        }

        if (isset($this->request->post['quickcheckout_countdown_date_start'])) {
            $this->data['quickcheckout_countdown_date_start'] = $this->request->post['quickcheckout_countdown_date_start'];
        } else {
            $this->data['quickcheckout_countdown_date_start'] = $this->config->get('quickcheckout_countdown_date_start');
        }

        if (isset($this->request->post['quickcheckout_countdown_date_end'])) {
            $this->data['quickcheckout_countdown_date_end'] = $this->request->post['quickcheckout_countdown_date_end'];
        } else {
            $this->data['quickcheckout_countdown_date_end'] = $this->config->get('quickcheckout_countdown_date_end');
        }

        if (isset($this->request->post['quickcheckout_countdown_time'])) {
            $this->data['quickcheckout_countdown_time'] = $this->request->post['quickcheckout_countdown_time'];
        } else {
            $this->data['quickcheckout_countdown_time'] = $this->config->get('quickcheckout_countdown_time');
        }

        if (isset($this->request->post['quickcheckout_countdown_text'])) {
            $this->data['quickcheckout_countdown_text'] = $this->request->post['quickcheckout_countdown_text'];
        } else {
            $this->data['quickcheckout_countdown_text'] = $this->config->get('quickcheckout_countdown_text');
        }

        $this->load->model('localisation/language');

        $this->data['languages'] = $this->model_localisation_language->getLanguages();

        $this->load->model('localisation/country');

        $this->data['countries'] = $this->model_localisation_country->getCountries();

        $this->data['action'] = $this->url->link('module/quickcheckout', 'token=' . $this->session->data['token'], 'SSL');
        $this->data['continue'] = $this->url->link('module/quickcheckout', 'token=' . $this->session->data['token'] . '&continue=1', 'SSL');

        $this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

        $this->template = 'module/quickcheckout.tpl';

        $this->children = array(
            'common/header',
            'common/footer',
        );

        $this->response->setOutput($this->render());
    }

    private function validate() {
        if (!$this->user->hasPermission('modify', 'module/quickcheckout')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }

    public function mail() {
        $this->language->load('module/quickcheckout');

        $json = array();

        if ($this->validate()) {
            if (strlen($this->request->post['mail_name']) < 5 || strlen($this->request->post['mail_name']) > 32) {
                $json['error']['name'] = $this->language->get('mail_error_name');
            }

            if ((strlen($this->request->post['mail_email']) > 96) || !preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $this->request->post['mail_email'])) {
                $json['error']['email'] = $this->language->get('mail_error_email');
            }

            if (strlen($this->request->post['mail_order_id']) < 3 || (int) $this->request->post['mail_order_id'] == 0) {
                $json['error']['order_id'] = $this->language->get('mail_error_order_id');
            }

            if (strlen($this->request->post['mail_message']) < 20 || strlen($this->request->post['mail_message']) > 2400) {
                $json['error']['message'] = $this->language->get('mail_error_message');
            }

            if (!$json) {
                $subject = '[Quick Checkout] Support ' . $this->request->post['mail_name'];

                $message = 'Order ID: ' . $this->request->post['mail_order_id'] . "\n\n";
                $message .= $this->request->post['mail_message'];

                $mail = new Mail();
                $mail->protocol = $this->config->get('config_mail_protocol');
                $mail->parameter = $this->config->get('config_mail_parameter');
                $mail->hostname = $this->config->get('config_smtp_host');
                $mail->username = $this->config->get('config_smtp_username');
                $mail->password = $this->config->get('config_smtp_password');
                $mail->port = $this->config->get('config_smtp_port');
                $mail->timeout = $this->config->get('config_smtp_timeout');
                $mail->setTo('support@marketinsg.com');
                $mail->setFrom($this->request->post['mail_email']);
                $mail->setSender($this->request->post['mail_name']);
                $mail->setSubject(html_entity_decode($subject, ENT_QUOTES, 'UTF-8'));
                $mail->setText(html_entity_decode($message, ENT_QUOTES, 'UTF-8'));
                $mail->send();

                $json['success'] = $this->language->get('mail_success');
            }
        } else {
            $json['error']['warning'] = $this->error['warning'];
        }

        $this->response->setOutput(json_encode($json));
    }

    private function getlayoutid() {
        $this->load->model('design/layout');

        $layouts = $this->model_design_layout->getLayouts();

        foreach ($layouts as $layout) {
            if ($layout['name'] == 'Quick Checkout') {
                return $layout['layout_id'];
            }
        }

        return false;
    }

    public function install() {
        $layout_id = $this->getlayoutid();

        if (!$layout_id) {
            $layout_data = array();
            $layout_data['name'] = 'Quick Checkout';
            $layout_data['layout_route'][1] = array(
                'store_id' => '0',
                'route' => 'quickcheckout/'
            );

            $this->load->model('design/layout');

            $this->model_design_layout->addLayout($layout_data);
        }
    }

    public function uninstall() {
        $layout_id = $this->getlayoutid();

        if ($layout_id) {
            $this->load->model('design/layout');

            $this->model_design_layout->deleteLayout($layout_id);
        }
    }

    public function quick_start() {
        $this->language->load('module/quickcheckout');

        $this->load->model('setting/setting');

        $data = array(
            'quickcheckout_status' => '1',
            'quickcheckout_load_screen' => '1',
            'quickcheckout_payment_logo' => '1',
            'quickcheckout_payment' => '1',
            'quickcheckout_shipping' => '1',
            'quickcheckout_edit_cart' => '1',
            'quickcheckout_highlight_error' => '1',
            'quickcheckout_text_error' => '1',
            'quickcheckout_layout' => '2',
            'quickcheckout_slide_effect' => '0',
            'quickcheckout_debug' => '0',
            'quickcheckout_auto_submit' => '0',
            'quickcheckout_responsive' => '0',
            'quickcheckout_country_reload' => '0',
            'quickcheckout_payment_reload' => '0',
            'quickcheckout_shipping_reload' => '0',
            'quickcheckout_field_firstname' => array(
                'display' => '1',
                'required' => '1',
                'default' => '',
                'sort_order' => '1'
            ),
            'quickcheckout_field_lastname' => array(
                'display' => '1',
                'required' => '1',
                'default' => '',
                'sort_order' => '2'
            ),
            'quickcheckout_field_email' => array(
                'display' => '1',
                'required' => '1',
                'default' => '',
                'sort_order' => '3'
            ),
            'quickcheckout_field_telephone' => array(
                'display' => '1',
                'required' => '1',
                'default' => '',
                'sort_order' => '4'
            ),
            'quickcheckout_field_fax' => array(
                'display' => '0',
                'required' => '0',
                'default' => '',
                'sort_order' => '7'
            ),
            'quickcheckout_field_company' => array(
                'display' => '1',
                'required' => '0',
                'default' => '',
                'sort_order' => '8'
            ),
            'quickcheckout_field_customer_group' => array(
                'display' => '1',
                'required' => '',
                'default' => '',
                'sort_order' => '9'
            ),
            'quickcheckout_field_address_1' => array(
                'display' => '1',
                'required' => '1',
                'default' => '',
                'sort_order' => '10'
            ),
            'quickcheckout_field_address_2' => array(
                'display' => '0',
                'required' => '0',
                'default' => '',
                'sort_order' => '11'
            ),
            'quickcheckout_field_city' => array(
                'display' => '1',
                'required' => '1',
                'default' => '',
                'sort_order' => '12'
            ),
            'quickcheckout_field_postcode' => array(
                'display' => '1',
                'required' => '0',
                'default' => '',
                'sort_order' => '13'
            ),
            'quickcheckout_field_country' => array(
                'display' => '1',
                'required' => '1',
                'default' => '1',
                'sort_order' => '14'
            ),
            'quickcheckout_field_zone' => array(
                'display' => '1',
                'required' => '0',
                'default' => '1',
                'sort_order' => '15'
            ),
            'quickcheckout_field_zone_district' => array(
                'display' => '1',
                'required' => '0',
                'default' => '',
                'sort_order' => '16'
            ),
            'quickcheckout_field_newsletter' => array(
                'display' => '1',
                'required' => '0',
                'default' => '1',
                'sort_order' => ''
            ),
            'quickcheckout_field_register' => array(
                'display' => '1',
                'required' => '0',
                'default' => '',
                'sort_order' => ''
            ),
            'quickcheckout_coupon' => '1',
            'quickcheckout_voucher' => '1',
            'quickcheckout_reward' => '1',
            'quickcheckout_cart' => '1',
            'quickcheckout_shipping_module' => '1',
            'quickcheckout_payment_module' => '1',
            'quickcheckout_login_module' => '1',
            'quickcheckout_html_header' => array(),
            'quickcheckout_html_footer' => array(),
            'quickcheckout_survey' => '0',
            'quickcheckout_survey_required' => '0',
            'quickcheckout_survey_text' => array(),
            'quickcheckout_delivery' => '0',
            'quickcheckout_delivery_time' => '0',
            'quickcheckout_delivery_required' => '0',
            'quickcheckout_delivery_unavailable' => '"6-3-2013", "7-3-2013", "8-3-2013"',
            'quickcheckout_delivery_min' => '1',
            'quickcheckout_delivery_max' => '30',
            'quickcheckout_delivery_min_hour' => '9',
            'quickcheckout_delivery_max_hour' => '17',
            
        );

        $this->model_setting_setting->editSetting('quickcheckout', $data);

        $this->session->data['success'] = $this->language->get('text_success');

        $this->redirect($this->url->link('module/quickcheckout', 'token=' . $this->session->data['token'], 'SSL'));
    }

    public function country() {
        $json = array();

        $this->load->model('localisation/country');

        $country_info = $this->model_localisation_country->getCountry($this->request->get['country_id']);

        if ($country_info) {
            $this->load->model('localisation/zone');

            $json = array(
                'country_id' => $country_info['country_id'],
                'name' => $country_info['name'],
                'iso_code_2' => $country_info['iso_code_2'],
                'iso_code_3' => $country_info['iso_code_3'],
                'address_format' => $country_info['address_format'],
                'postcode_required' => $country_info['postcode_required'],
                'zone' => $this->model_localisation_zone->getZonesByCountryId($this->request->get['country_id']),
                'status' => $country_info['status']
            );
        }

        $this->response->setOutput(json_encode($json));
    }
    public function district() {
        $json = array();

        $this->load->model('localisation/country');

        $country_info = $this->model_localisation_country->getDistrict();

        if ($country_info) {
//            $this->load->model('localisation/zone');
            $json = $country_info;

//            $json = array(
//                'country_id' => $country_info['country_id'],
//                'name' => $country_info['name'],
//                'iso_code_2' => $country_info['iso_code_2'],
//                'iso_code_3' => $country_info['iso_code_3'],
//                'address_format' => $country_info['address_format'],
//                'postcode_required' => $country_info['postcode_required'],
//                'zone' => 123,//$this->model_localisation_zone->getZonesByCountryId($this->request->get['country_id']),
//                'status' => $country_info['status']
//            );
        }

        $this->response->setOutput(json_encode($json));
    }

}

?>