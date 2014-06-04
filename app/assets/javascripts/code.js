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


var ready = function() {
	$('[class="imgComp1"]').mouseenter(function() {
	$(this).attr('src','/assets/COMPRESORES/Carrier_logo.jpg');
	});
	$('[class="imgComp1"]').mouseleave(function() {
	$(this).attr('src', '/assets/COMPRESORES/Carrier.jpg');
	});
	$('[class="imgComp2"]').mouseenter(function() {
	$(this).attr('src','/assets/COMPRESORES/Copeland_logo.jpg');
	});
	$('[class="imgComp2"]').mouseleave(function() {
	$(this).attr('src', '/assets/COMPRESORES/Copeland.jpg');
	});
	$('[class="imgComp3"]').mouseenter(function() {
	$(this).attr('src','/assets/COMPRESORES/Trane_logo.jpg');
	});
	$('[class="imgComp3"]').mouseleave(function() {
	$(this).attr('src', '/assets/COMPRESORES/Trane.jpg');
	});
	$('[class="imgComp4"]').mouseenter(function() {
	$(this).attr('src','/assets/COMPRESORES/Bitzer_logo.jpg');
	});
	$('[class="imgComp4"]').mouseleave(function() {
	$(this).attr('src', '/assets/COMPRESORES/Bitzer2.jpg');
	});
};

$(document).ready(ready);
$(document).on('page:load', ready);