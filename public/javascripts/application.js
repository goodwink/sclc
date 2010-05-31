// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function select_invite() {
  $('#selection').css('visibility', 'visible');
  $('#selection').css('left', '215px');
}

function select_tunein() {
  $('#selection').css('visibility', 'visible');
  $('#selection').css('left', '415px');
}

function select_showup() {
  $('#selection').css('visibility', 'visible');
  $('#selection').css('left', '615px');
}

function select_find() {
  $('#selection').css('visibility', 'visible');
  $('#selection').css('left', '815px');
}

$(document).ready(function() {
  if (document.URL.match(/invitations/)) {
    select_invite();
  }
  
  if (document.URL.match(/subscriptions/)) {
    select_tunein();
  }
  
  $('#invite').bind('click', select_invite);
  $('#tunein').bind('click', select_tunein);
  $('#showup').bind('click', select_showup);
  $('#find').bind('click', select_find); 
});
