$(document).ready(function() {
	// Tooltip
	$('.tooltip-trigger').hover(function(){
		var title = $(this).attr('title');
		$(this).data('tooltipText', title).removeAttr('title');
		
		$('<p class="tooltip"></p>').html(title).appendTo('body').fadeIn('slow');
	}, function() {
		$(this).attr('title', $(this).data('tooltipText'));
		
		$('.tooltip').remove();
	}).mousemove(function(e) {
		var mousex = e.pageX - 220;
		var mousey = e.pageY + 5;
		
		$('.tooltip').css({ top: mousey, left: mousex })
	});
});