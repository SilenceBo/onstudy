<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv=X-UA-Compatible content="IE=edge,chrome=1">
<meta content=always name=referrer>
<meta name="renderer" content="webkit">
<title>信息工程学院-视频学习网站</title>

<link rel="stylesheet" href="css/plyr.css">

<script src="js/plyr.js"></script>
<script type="text/javascript" src="js/ckplayer.js" charset="utf-8"></script>
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<style>
body {
	background-color: #262626
}

.m {
	margin-left: auto;
	margin-right: auto;
	width: 90%;
	margin-top: 100px;
}
</style>

</head>
<body>
	<button onclick="onBack()"
		style="border-radius:5px;display: inline-block;
padding: 4px 12px;
margin-bottom: 0;
font-size: 14px;
font-weight: 400;
line-height: 1.42857143;
text-align: center;
white-space: nowrap;
vertical-align: middle;
-ms-touch-action: manipulation;
touch-action: manipulation;
cursor: pointer;
-webkit-user-select: none;
-moz-user-select: none;
-ms-user-select: none;
user-select: none;
background-image: none;
border: 1px solid transparent;"
		value="返回">返回</button>
	<!-- <div class="m">
		<video id="video" poster="vs.png" controls>
			<source src="http://www.jplayer.org/video/m4v/Incredibles_Teaser.m4v"
				type="video/mp4"> <source src="path/to/video.webm" type="video/webm">
		Captions are optional
		</video>
		<script>
			plyr.setup();
		</script>
	</div> -->
	<div id="a1"></div>
	<script type="text/javascript">
		/* $(function() {
			var video = document.getElementById("video");
			var url = window.location.href;
			var index = url.substring(url.lastIndexOf('=') + 1);
			$("#video").attr("src", index);
			video.load();
			video.play();
		}); */
		var url = window.location.href;
		var index = url.substring(url.lastIndexOf('=') + 1);
		var flashvars = {
			f : index,
			c : 0
		};
		var params = {
			bgcolor : '#FFF',
			allowFullScreen : true,
			allowScriptAccess : 'always',
			wmode : 'transparent'
		};
		var video = [ index ];
		CKobject.embed('/ckplayer/ckplayer.swf', 'a1', 'ckplayer_a1', '100%',
				'100%', true, flashvars, video, params);
	</script>

	<div
		style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';color:#ffffff">
	</div>
	<script type="text/javascript">
		
	</script>
</body>
<script type="text/javascript">
	function onBack() {
		window.history.back(-1);
	}
</script>
</html>

<!-- 
 -->

