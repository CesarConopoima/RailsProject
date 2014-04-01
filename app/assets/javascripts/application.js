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

$(document).ready(function(){
  var w1 = $( "img.catalogo" ).width();
  var h1 = $( "img.catalogo" ).height();
  $("img.catalogo").click(function(){
    if (w1 != $( "img.catalogo" ).width() )
    {
 	$(this).width( w1 );
    $(this).height( h1 );
    }
  	else{$(this).animate({width:'150px',height:'125px'},"slow");}
  });
});

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