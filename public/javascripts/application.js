// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function(){

  $('html').live('ajax:before', function(event, xhr){
    $(event.target).find('input.delete').addClass('waiting');
  });

  $.jGrowl.defaults.position = 'bottom-right';
  $.facebox.settings.opacity = 0.5;
  $.facebox.settings.overlay = false;

  $('body').addClass('js');

//  $('a[rel*=facebox]').live('', function(){
//    $(this).facebox();
//  });

//  $('a[data-display=popup]').fancybox({
//    autoScale: false,
//    autoDimensions: true,
//    showCloseButton: true,
//    hideOnOverlayClick: false,
//    transitionIn: 'elastic'
//  });

  $('a.bigpic').live('click', function(){
    $(this).addClass('waiting');
  });

  $('td .info').hover(
    function(){
      $(this).siblings().fadeIn();
    },
    function(){
      $(this).siblings().fadeOut();
    }
  );

});

function fade_and_remove(id){
  $(id).fadeOut('800 ', function(){
    $(this).remove();
  });
}

function highlight_alt_rows(id){
  $(id + ' tr.highlight').removeClass('highlight');
  $(id + ' tr:even').addClass('highlight');
}

