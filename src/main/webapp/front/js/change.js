function() {
  $(".player_panel").toggleClass("on"), $(this).toggleClass("on"), player.j2s_pauseVideo()
}
function() {
  var e = $(this).attr("tid");
  $("#" + e).addClass("on").siblings(".tab_a").removeClass("on"), $(this).addClass("on").siblings().removeClass("on")
}
