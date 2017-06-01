//= require application
//= require jquery_ujs

$(document).ready(function(){
$('a[rel="overlay"]').overlay({
  mask: "#333",
  onBeforeLoad: function() {
    var oinst, wrap;
    wrap = this.getOverlay();
    wrap.load(this.getTrigger().attr("href"));
    return oinst = this;
  }
});
});