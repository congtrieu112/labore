<?php
class ControllerPaymentNganLuong extends Controller {
/*protected function index() {
		$this->data['button_confirm'] = $this->language->get('button_confirm');
		$this->data['continue'] = $this->url->link('checkout/success');

		$this->load->model('checkout/order');
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/nganluong.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/payment/nganluong.tpl';
		} else {
			$this->template = 'cosyone/template/payment/nganluong.tpl';
		}	
		$this->load->model('payment/nganluong');

		$receiver=$this->config->get('nganluong_receiver');	
		if($this->config->get('config_currency')=="USD"){$currency = 'usd';}
		else{$currency = 'vnd';}
		$order_code=$this->session->data['order_id'];
		$price=$this->currency->format($order_info['total'], $order_info['currency'], $order_info['value'], FALSE);//Giá
		$price = preg_replace('/[\D]+/','',$price);

		$_SESSION['link_pay'] = "https://www.nganluong.vn/button_payment.php?receiver=".$receiver."&product_name=MaDH: ".$order_code." Mua hàng tại website ".str_replace("www.","",$_SERVER['HTTP_HOST'])." (".date("d/m/Y").")&price=".$price."&return_url=".str_replace("www.","",$_SERVER['HTTP_HOST'])."&currency=".$currency;
	  		
		$this->render();
	}
		public function confirm() {
		$this->load->model('checkout/order');
		
		$this->model_checkout_order->confirm($this->session->data['order_id'], $this->config->get('nganluong_order_status_id'));
	}
*/

protected function index() {
		
    	$this->data['button_confirm'] = $this->language->get('button_confirm');
		$this->load->model('checkout/order');
		
		$order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);
		
		$this->load->library('encryption');
		
		
		$receiver=$this->config->get('nganluong_receiver');	
		$order_code=$this->session->data['order_id'];
		$price=$this->currency->format($order_info['total'], $order_info['currency_code'], $order_info['currency_value'], false);
		//$price = preg_replace('/[\D]+/','',$price);
		
		$_SESSION['link_pay'] = 'https://www.nganluong.vn/button_payment.php?receiver='.$receiver.'&product_name=MãĐH: '.$order_code.' - Tại '.str_replace('www.','',$_SERVER['HTTP_HOST']).' ('.date('d/m/Y').')&price='.$price.'&return_url=http://'.$_SERVER['HTTP_HOST'].'&currency=vnd';
		
		$this->data['continue'] = $this->url->link('checkout/success');
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/nganluong.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/payment/nganluong.tpl';
		} else {
			$this->template = 'cosyone/template/payment/nganluong.tpl';
		}
		
		$this->render();
	}
	
	public function confirm() {
		$this->load->model('checkout/order');
		
		$this->model_checkout_order->confirm($this->session->data['order_id'], $this->config->get('nganluong_order_status_id'));
	}
}
?>