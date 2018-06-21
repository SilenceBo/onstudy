<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>

<meta charset="utf-8">
<meta http-equiv=X-UA-Compatible content="IE=edge,chrome=1">
<meta content=always name=referrer>
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>H+ 后台主题UI框架 - 日期选择器layerDate</title>
<meta name="keywords" content="">
<meta name="description" content="">
<link rel="shortcut icon" href="favicon.ico">
<link href="${APP_PATH }/admin/css/bootstrap.min.css" rel="stylesheet">
<link href="${APP_PATH }/admin/css/font-awesome.css" rel="stylesheet">

<!--下拉框-->
<link href="${APP_PATH }/admin/css/plugins/chosen/chosen.css"
	rel="stylesheet">
<!--radio属性-->
<link
	href="${APP_PATH }/admin/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"
	rel="stylesheet">

<link href="${APP_PATH }/admin/css/animate.css" rel="stylesheet">
<link href="${APP_PATH }/admin/css/style.css" rel="stylesheet">


</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeIn">
		<div class="row">
			<div class="col-sm-12">
				<div class="row">
					<div class="col-sm-6">
						<form id="sendForm" class="form-horizontal m-t">
							<div class="form-group">
								<label class="col-sm-2 control-label" for="title">标题：</label>
								<div class="col-sm-10">
									<input id="title" name="title" type="text" class="form-control"
										placeholder="请输入标题...">
								</div>
							</div>
							<div class="form-group">
								<label for="message" class="col-sm-2 control-label">消息：</label>
								<div class="col-sm-10">
									<textarea name="text" class="form-control" id="message"
										rows="8" placeholder="请输入消息..."></textarea>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">接收人群：</label>
								<div class="input-group col-sm-10">
									<select name="notivetype" data-placeholder="选择班级"
										class="chosen-select col-sm-6" tabindex="2">
										<option value="0" hassubinfo="true">仅学生</option>
										<option value="1" hassubinfo="true">仅教师</option>
										<option value="2" hassubinfo="true">全体师生</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">方式：</label>
								<div class="col-sm-10">
									<div class="radio"
										style="display:inline-block;margin-right:20px">
										<input name="isittimed" value="0" type="radio"
											checked="checked"> <label for="man">及时发送</label>
									</div>
									<div class="radio" style="display:inline-block;">
										<input value="1" name="isittimed" type="radio"> <label
											for="woman">定时发送</label>
									</div>
								</div>
							</div>
							<div id="sendTime" class="form-group">
								<label class="col-sm-2 control-label">时间：</label>
								<div class="col-sm-10">
									<input name="time" class="form-control layer-date laydate-icon"
										id="hello" placeholder="YYYY-MM-DD hh:mm:ss">
								</div>
								<input class="times" type="hidden">
							</div>
							<div class="control-label">
								<div class="col-sm-4 control-label">
									<button id="sendButton" type="button" class="btn btn-primary">提交</button>
								</div>
							</div>

						</form>
						<hr>
						<!--  <p>日期选择器时，请给input添加<code>class="form-control layer-date"</code>，否则可能出现错位的情况。</p> -->
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- 全局js -->
	<script src="${APP_PATH }/admin/js/jquery.min.js?v=2.1.4"></script>
	<script src="${APP_PATH }/admin/js/bootstrap.min.js?v=3.3.6"></script>


	<!-- 自定义js -->
	<script src="${APP_PATH }/admin/js/content.js?v=1.0.0"></script>

	<!-- Chosen -->
	<script src="${APP_PATH }/admin/js/plugins/chosen/chosen.jquery.js"></script>
	<script src="${APP_PATH }/admin/js/demo/form-advanced-demo.js"></script>


	<!-- layerDate plugin javascript -->
	<script src="${APP_PATH }/admin/js/plugins/layer/laydate/laydate.js"></script>
	<script>
		laydate({
			elem : '#hello',
			istime : true, //开启时间选择
			istoday : true,//显示今天
			festival : true,//显示节日
			format : 'YYYY-MM-DD hh:mm:ss',
			choose : function(datas) {
				$('.times').html(datas);
			}
		})

		$("#sendButton").click(function() {
			$.ajax({
				url : "${APP_PATH}/adminNotice/sendNotice.action",
				type : "POST",
				data : $("#sendForm").serialize(),
				success : function(result) {
					if (result.status == 200) {
						alert("发布成功");
					}
				}
			});
		});

		window.onload = function() {
			showTime();
			$("input[name=isittimed]").click(function() {
				showTime();
			});
		}
		function showTime() {
			switch ($("input[name=isittimed]:checked").attr("value")) {
			case "0":
				$("#sendTime").hide();
				break;
			case "1":
				$("#sendTime").show();
				break;
			}
		}
	</script>
</body>

</html>

