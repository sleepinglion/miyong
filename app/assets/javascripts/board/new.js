//= require application
//= require ckeditor/init

$(document).ready(function(){
  CKEDITOR.replace("sl_content", {
    fullPage: true,
    allowedContent: true
  });
});