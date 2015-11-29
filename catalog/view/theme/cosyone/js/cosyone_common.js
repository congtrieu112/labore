$(window).resize(function(){
// Hide mobile menu etc on window resize
 	if ($(window).width() > 960) {
       $('.mobile_menu_wrapper').hide();
 	}
	var scroll_right = $(".inner_container").offset().left;
	$(".scroll_top").css('right', (scroll_right - 100) + 'px');
});

$(document).ready(function() {

// Pick out main categories with subs  //
			$("#menu >ul >li").has("li").addClass("withsubs");
			$("#menu > ul > li > div > .wrapper > ul > li").has("li").addClass("hasthird");
			
/* Mega Menu */

	$('#menu .menu_drop_down').each(function() {
		var menu = $('#menu').offset();
		var dropdown = $(this).parent().offset();

		var i = (dropdown.left + $(this).outerWidth()) - (menu.left + $('#menu').outerWidth());

		if (i > 0) {
			$(this).css('margin-left', '-' + i + 'px');
		}
	});
	
	
// Image thumb swipe  //
   $(".product-list .item, .product-grid .item").hover(function() {
         $(this).find(".image_hover").stop(true).fadeTo(600,1);
   }, function() {
         $(this).find(".image_hover").stop(true).fadeTo(300,0);
   });
   

// Move breadcrumb to header //
			$('.breadcrumb').appendTo($('.breadcrumb_wrapper'));
			
// Fix for the header login/search field
			$('.login_input').focus(function( ){
    		$('.login_drop_heading').stop(true,true).addClass('active');
  			});
			$('.login_input').focusout(function( ){
    		$('.login_drop_heading').stop(true,true).removeClass('active');
  			});
			
			$('.search_input').focus(function( ){
    		$('#search').stop(true,true).addClass('active');
  			});
			$('.search_input').focusout(function( ){
    		$('#search').stop(true,true).removeClass('active');
			$('#ajax_search_results').hide(200);
			
  			});
    		
// Open external links in new tab //
	$('a.external').on('click',function(e){
        e.preventDefault();
        window.open($(this).attr('href'));
    });

// Mobile main navigation  //
		
			$('.mobile_menu_trigger').click(function() {
  			$('.mobile_menu_wrapper').slideToggle(500, "easeInCubic")
        	});           

            $('.mobile_menu li').bind().click(function(e) {
			$(this).toggleClass("open").find('>ul').stop(true, true).slideToggle(500)
            .end().siblings().find('>ul').slideUp().parent().removeClass("open");
            e.stopPropagation();
			});
			
			$('.mobile_menu li a').click(function(e) {
            e.stopPropagation();
            });
// Sticky menu preparation
			var $document = $(document),
    		$element = $('.header_wrapper')

			$document.scroll(function() {
  			$element.toggleClass('sticky', $document.scrollTop() >= 210);
			});
			
// Show special countdown on hover
			$('.product-list .item, .product-grid .item').mousemove(function(e) {
   			 $(this).find('.offer_popup').stop(true, true).fadeIn();
    		$(this).find('.offer_popup').offset({
        	top: e.pageY + 50,
        	left: e.pageX + 50
    		});
			}).mouseleave(function() {
   			 $('.offer_popup').fadeOut();
			});

// Scroll to top button //
			var scroll_right = $(".inner_container").offset().left;
			$(".scroll_top").css('right', (scroll_right - 100) + 'px');
	
			var windowScroll_t;
			$(window).scroll(function(){
			clearTimeout(windowScroll_t);
			windowScroll_t = setTimeout(function() {
										
				if ($(this).scrollTop() > 100)
				{ $('.scroll_top').addClass('active'); }
				else
				{ $('.scroll_top').removeClass('active'); }
			}, 200);
		});
		
			$('.scroll_top').click(function(){
			$("html, body").animate({scrollTop: 0}, 1000, "easeOutCubic");
			return false;
		});

// Add contrast to footer  //
			$(".footer_modules").has(".box").addClass("contrast");
		
// Assign placeholder to older internet explorer versions
	$('input[placeholder]').each(function(){  
    	var input = $(this);        
    	$(input).val(input.attr('placeholder'));
                
    	$(input).focus(function(){
        	if (input.val() == input.attr('placeholder')) {
           	input.val('');
        	}
    	});
        
    	$(input).blur(function(){
       		if (input.val() == '' || input.val() == input.attr('placeholder')) {
           input.val(input.attr('placeholder'));
       	}
    	});
	});
		
	/* Search 155 */
	$('.button-search').bind('click', function() {
		url = $('base').attr('href') + 'index.php?route=product/search';
				 
		var search = $('input[name=\'search\']').attr('value');
		
		if (search) {
			url += '&search=' + encodeURIComponent(search);
		}
		
		location = url;
	});
	
	$('input[name=\'search\']').bind('keydown', function(e) {
		if (e.keyCode == 13) {
			url = $('base').attr('href') + 'index.php?route=product/search';
			 
			var search = $('input[name=\'search\']').attr('value');
			
			if (search) {
				url += '&search=' + encodeURIComponent(search);
			}
			
			location = url;
		}
	});
	
	/* Ajax Cart */
	$('#cart > .heading a').live('click', function() {
		$('#cart').addClass('active');
		
		$('#cart').load('index.php?route=module/cart #cart > *');
		
		$('#cart').live('mouseleave', function() {
			$(this).removeClass('active');
		});
	});
	

	// IE6 & IE7 Fixes
	if ($.browser.msie) {
		if ($.browser.version <= 6) {
			$('#column-left + #column-right + #content, #column-left + #content').css('margin-left', '195px');
			
			$('#column-right + #content').css('margin-right', '195px');
		
			$('.box-category ul li a.active + ul').css('display', 'block');	
		}
		
		if ($.browser.version <= 7) {
	
			$('#menu > ul > li').bind('mouseover', function() {
				$(this).addClass('active');
			});
				
			$('#menu > ul > li').bind('mouseout', function() {
				$(this).removeClass('active');
			});	
		}
	}
	
	
	$('.success .fa, .warning .fa, .attention .fa, .information .fa').live('click', function() {
		$(this).parent().fadeOut('slow', function() {
			$(this).remove();
		});
	});	
});

// 155 function
function getURLVar(key) {
	var value = [];
	
	var query = String(document.location).split('?');
	
	if (query[1]) {
		var part = query[1].split('&');

		for (i = 0; i < part.length; i++) {
			var data = part[i].split('=');
			
			if (data[0] && data[1]) {
				value[data[0]] = data[1];
			}
		}
		
		if (value[key]) {
			return value[key];
		} else {
			return '';
		}
	}
} 

function addToCart(product_id, quantity) {
	quantity = typeof(quantity) != 'undefined' ? quantity : 1;

	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: 'product_id=' + product_id + '&quantity=' + quantity,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, .information, .error').remove();
			
			if (json['redirect']) {
				location = json['redirect'];
			}
			
			if (json['success']) {
				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<i class="fa fa-times"></i></div>');
				
				$('.success').fadeIn('slow');
				
				$('#cart-total').html(json['total']);
				
				$('html, body').animate({ scrollTop: 0 }, 'slow');
				
				$('#cart').load('index.php?route=module/cart #cart > *'); //Added
				
			}	
		}
	});
}
function addToWishList(product_id) {
	$.ajax({
		url: 'index.php?route=account/wishlist/add',
		type: 'post',
		data: 'product_id=' + product_id,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, .information').remove();
						
			if (json['success']) {
				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<i class="fa fa-times"></i></div>');
				
				$('.success').fadeIn('slow');
				$('#notification a').attr('target','_top');
				$('#wishlist-total').html(json['total']);
				$('#header_wishlist').html(json['wishlist_total']);
				
				$('html, body').animate({ scrollTop: 0 }, 'slow');
			}	
		}
	});
}

function addToCompare(product_id) { 
	$.ajax({
		url: 'index.php?route=product/compare/add',
		type: 'post',
		data: 'product_id=' + product_id,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, .information').remove();
						
			if (json['success']) {
				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<i class="fa fa-times"></i></div>');
				
				$('.success').fadeIn('slow');
				$('#notification a').attr('target','_top');
				$('#compare-total').html(json['total']);
				$('#header_compare').html(json['compare_total']);
				
				$('html, body').animate({ scrollTop: 0 }, 'slow'); 
				
			}	
		}
	});
}