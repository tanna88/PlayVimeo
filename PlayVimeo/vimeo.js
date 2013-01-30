var player = document.querySelector(".player").getAttribute("id");
player = eval (player.replace ("player_", "clip"));
var time = player.config.request.timestamp;
var sig = player.config.request.signature;
var clip_id = window.location.href.substring(17);

var url = "http://player.vimeo.com/play_redirect" +
"?clip_id=" + clip_id +
"&sig=" + sig +
"&time=" + time;

window.vimeourl = url;
window.location.href = url;