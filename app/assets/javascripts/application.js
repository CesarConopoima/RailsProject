// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery.ui.all
//= require jquery_ujs
//= require turbolinks
//= require_tree .


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
	$(this).attr('src','/assets/COMPRESORES/York_logo.jpg');
	});
	$('[class="imgComp4"]').mouseleave(function() {
	$(this).attr('src', '/assets/COMPRESORES/York.jpg');
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
	$('.servicio img').click(function() {
		var clase = $(this).attr('class').replace("img","");
		$('[class="default"]').hide(600,"easeInExpo");
		$('[class="'+clase+'"]').show(1000,"easeInExpo");
	});
	$('[class="button"]').click(function(){
		var clase = $(this).parent().prop('className');
		$('[class="'+clase+'"]').hide(600,"easeInExpo");
	});
};

$(document).ready(ready);
$(document).on('page:load', ready);