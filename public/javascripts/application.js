$.fn.disableOnSubmit = function(disableList){

  if(disableList == null){var $list = 'input[type=submit],input[type=button],input[type=reset],button';}
  else{var $list = disableList;}

  // Makes sure button is enabled at start
  $(this).find($list).removeAttr('disabled');

  $(this).submit(function(){$(this).find($list).attr('disabled','disabled');});
  return this;
};

$(function(){
  $('form').disableOnSubmit(); // 全てのformに作用させる場合
  $("#navi a").tooltip({
    showURL: false
  });
});
