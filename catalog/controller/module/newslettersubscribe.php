<?php  
class ControllerModuleNewslettersubscribe extends Controller {
  	private $error = array();
	
	public function index($setting) {
	
		//Cosyone start + setting above
		static $module = 0;
		$this->data['module'] = $module++;
		$this->data['style'] = $setting['style'];
		$this->data['popup_delay_time'] = $this->config->get('popup_delay_time');
		$this->data['popup_only_show_once'] = $this->config->get('popup_only_show_once');
		$this->data['custom_block'] = html_entity_decode($this->config->get('popup_custom_block_' . $this->config->get('config_language_id'), ENT_QUOTES, 'UTF-8'));
		
		//Cosyone ends

		$this->loadmodule();
	    $this->load->model('account/newslettersubscribe');

	   	
	   	//check db
	   	$this->model_account_newslettersubscribe->check_db();
		
	}
	
	
	
	public function subscribe() {
	
	
	
		if ($this->config->get('newslettersubscribe_thickbox')) {
		  $prefix_eval = "";
		} else {
		  $prefix_eval = "";
		}
	  
		$this->language->load('module/newslettersubscribe');
	 
		$this->load->model('account/newslettersubscribe');
	  
		if (isset($this->request->post['subscribe_email']) and filter_var($this->request->post['subscribe_email'],FILTER_VALIDATE_EMAIL)) {
			   
			   if ($this->config->get('newslettersubscribe_registered') and $this->model_account_newslettersubscribe->checkRegisteredUser($this->request->post)) {
				   
					$this->model_account_newslettersubscribe->UpdateRegisterUsers($this->request->post,1);
					
					echo('$("'.$prefix_eval.' #success_notification.active.active").html("<div class=\"success\"> '.$this->language->get('subscribe').'<i class=\"fa fa-times\"></i></div>");$("'.$prefix_eval.' #subscribe")[0].reset();');
				   
				
			   } else if (!$this->model_account_newslettersubscribe->checkmailid($this->request->post)) {
				 
					$this->model_account_newslettersubscribe->subscribe($this->request->post);
					
					echo('$("'.$prefix_eval.' #success_notification.active").html("<div class=\"success\"> '.$this->language->get('subscribe').'<i class=\"fa fa-times\"></i></div>");$("'.$prefix_eval.' #subscribe")[0].reset();');
				 
					if ($this->config->get('newslettersubscribe_mail_status')) {
				   
						$subject = $this->language->get('mail_subject');	
						
						$message = '<table width="60%" cellpadding="2"  cellspacing="1" border="0"> 
									 <tr>
									   <td> Email Id </td>
									   <td> '.$this->request->post['subscribe_email'].' </td>
									 </tr>
									 <tr>
									   <td> Name  </td>
									   <td> '.$this->request->post['subscribe_name'].' </td>
									 </tr>';
						$message .= '</table>';
			 
						$mail = new Mail();
						$mail->protocol = $this->config->get('config_mail_protocol');
						$mail->parameter = $this->config->get('config_mail_parameter');
						$mail->hostname = $this->config->get('config_smtp_host');
						$mail->username = $this->config->get('config_smtp_username');
						$mail->password = $this->config->get('config_smtp_password');
						$mail->port = $this->config->get('config_smtp_port');
						$mail->timeout = $this->config->get('config_smtp_timeout');				
						$mail->setTo($this->config->get('config_email'));
						$mail->setFrom($this->config->get('config_email'));
						$mail->setSender($this->config->get('config_name'));
						$mail->setSubject($subject);
						$mail->setHtml($message);
						$mail->send();
					}
				 
				} else {
					  
					  echo('$("'.$prefix_eval.' #success_notification.active").html("<div class=\"warning\"> '.$this->language->get('alreadyexist').'<i class=\"fa fa-times\"></i></div>");$("'.$prefix_eval.' #subscribe")[0].reset();');
					  
				}
			   
			} else {
				
				echo('$("#success_notification.active").html("<div class=\"warning\"> '.$this->language->get('error_invalid').'<i class=\"fa fa-times\"></i></div>")');
				
			}
	  
	}

	public function unsubscribe(){
	  
		if ($this->config->get('newslettersubscribe_thickbox')) {
			  $prefix_eval = "";
		} else {
			  $prefix_eval = "";
		}
	  
		$this->language->load('module/newslettersubscribe');
	 
		$this->load->model('account/newslettersubscribe');
	  
		if (isset($this->request->post['subscribe_email']) and filter_var($this->request->post['subscribe_email'],FILTER_VALIDATE_EMAIL)) {
				
			if ($this->config->get('newslettersubscribe_registered') and $this->model_account_newslettersubscribe->checkRegisteredUser($this->request->post)) {
				   
					$this->model_account_newslettersubscribe->UpdateRegisterUsers($this->request->post,0);
					
					echo('$("'.$prefix_eval.' #success_notification.active").html("<div class=\"success\"> '.$this->language->get('unsubscribe').'<i class=\"fa fa-times\"></i></div>");$("'.$prefix_eval.' #subscribe")[0].reset();');
				   
				
			} else if (!$this->model_account_newslettersubscribe->checkmailid($this->request->post)) {
				 
					echo('$("'.$prefix_eval.' #success_notification.active").html("<div class=\"warning\"> '.$this->language->get('notexist').'<i class=\"fa fa-times\"></i></div>");$("'.$prefix_eval.' #subscribe")[0].reset();');
				 
			} else {
				   
					if ($this->config->get('option_unsubscribe')) {
						
					 $this->model_account_newslettersubscribe->unsubscribe($this->request->post);
					 
					 echo('$("'.$prefix_eval.' #success_notification.active").html("<div class=\"success\"> '.$this->language->get('unsubscribe').'<i class=\"fa fa-times\"></i></div>");$("'.$prefix_eval.' #subscribe")[0].reset();');
					 
					}
			}
			   
		} else {
			
				echo('$("'.$prefix_eval.' #success_notification.active").html("<div class=\"warning\"> '.$this->language->get('error_invalid').'<i class=\"fa fa-times\"></i></div>")');
				
		}
	  
	}
	
	
		

	protected function loadmodule() {
		$this->language->load('module/newslettersubscribe');

      	$this->data['heading_title'] = $this->language->get('heading_title');	
		$this->data['heading_welcome'] = $this->language->get('heading_welcome');
      	$this->data['entry_name'] = $this->language->get('entry_name');	
      	$this->data['entry_email'] = $this->language->get('entry_email');	
		$this->data['entry_button'] = $this->language->get('entry_button');	
		$this->data['entry_unbutton'] = $this->language->get('entry_unbutton');	
		$this->data['option_unsubscribe'] = $this->config->get('option_unsubscribe');	
		$this->data['thickbox'] = $this->config->get('newslettersubscribe_thickbox');
		
		
		
		
		
		$this->data['text_subscribe'] = $this->language->get('text_subscribe');	
		
		$this->id = 'newslettersubscribe';

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/newslettersubscribe.tpl')) {
		
			$this->template = $this->config->get('config_template') . '/template/module/newslettersubscribe.tpl';
			
		} else {
			
			$this->template = 'cosyone/template/module/newslettersubscribe.tpl';
			
		}
		
		$this->render();
	}
}
?>