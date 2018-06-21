<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv=X-UA-Compatible content="IE=edge,chrome=1">
<meta content=always name=referrer>
<meta name="renderer" content="webkit">
<title>信息工程学院视频网站</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<style type="text/css">
/* 登录表单 */
.sSign_form {
	width: 420px;
	margin: 0 auto;
	background: #eee;
	padding: 20px;
	margin-top: 10%;
}

.sSign_form>h3 {
	margin: 20px 0 20px 35%;
}

.sSign_form p {
	height: 50px;
	line-height: 50px;
}

.sSign_form p>input {
	margin-left: 60px;
	margin-top: -45px;
	width: 270px;
}

.sSign_form p>label {
	font-size: 16px;
}

.sSign_form #sSign_btn {
	width: 220px;
	text-align: center;
	font-size: 16px;
	font-weight: bold;
	margin-left: 21%;
	margin-top: 5px;
}
</style>

<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body style="background:#f8f3f3;">
	<div class="sSign">
		<!-- <div class="sLogo">
	        <a href="#"><img src="../admin/img/logo.png" /></a>
	    </div> -->
		<div class="sSign_form">
			<h3>管理员登录</h3>
			<form class="form" id="adminForm">
				<p>
					<label>用户名:</label> <input type="text" class="form-control"
						name="uname" placeholder="用户名" id="uname" />
				</p>
				<p>
					<label>密 码:</label> <input type="password" name="pwd"
						class="form-control" placeholder="密码" id="pwd" />
				</p>
			</form>
			<button type="button" class="btn btn-info" id="sSign_btn">登
				录</button>
		</div>
	</div>
	<script type="text/javascript">
		$("#sSign_btn").click(function() {
			if ($("#uname").val() == "" || $("#pwd").val() == "") {
				alert("用户名或密码不能为空");
				return false;
			}
			$.ajax({
				url : "${APP_PATH }/admin/login.action",
				type : "POST",
				data : $("#adminForm").serialize(),
				success : function(data) {
					if (data.status == 200) {
						alert("登录成功");
						window.location.href = "${APP_PATH}/admin/index.jsp";
					} else {
						alert(data.msg);
					}
				},
			});
		});
	</script>
</body>
</html>
