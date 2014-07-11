var ready = function() {$( "#menu" ).menu();};
$(document).ready(ready);
$(document).on('page:load', ready);

var ready =function () {  
// Search form.  
  $('#productos_search input').keyup(function () {  
  $.get($('#productos_search').attr('action'),   
    $('#productos_search').serialize(), null, 'script');  
  return false;  
});   
};

$(document).ready(ready);
$(document).on('page:load', ready);

var ready = function() {
	$('[class="Proc1"]').hide();
	$('[class="Proc2"]').hide();
	$('[class="Proc3"]').hide();
	$('[class="Proc4"]').hide();
	$('[class="Proc5"]').hide();
	$('[class="Proc6"]').hide();
	$('[class="Proc7"]').hide();
	$('[class="Proc8"]').hide();
	$('.servicio h3').click(function() {
	$('[class="Proc1"]').hide(1000,"easeInExpo");
	$('[class="Proc2"]').hide(1000,"easeInExpo");
	$('[class="Proc3"]').hide(1000,"easeInExpo");
	$('[class="Proc4"]').hide(1000,"easeInExpo");
	$('[class="Proc5"]').hide(1000,"easeInExpo");
	$('[class="Proc6"]').hide(1000,"easeInExpo");
	$('[class="Proc7"]').hide(1000,"easeInExpo");
	$('[class="Proc8"]').hide(1000,"easeInExpo");
		var clase = $(this).attr('class').replace("Tit","");
		$('[class="'+clase+'"]').show(1000,"easeInExpo");
	});
	$('[class="button"]').click(function() {
		var clase = $(this).parent().prop('className');
		$('[class="'+clase+'"]').hide(1000,"easeInExpo");
	});
};

$(document).ready(ready);
$(document).on('page:load', ready);
