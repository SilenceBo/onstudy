<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv=X-UA-Compatible content="IE=edge,chrome=1">
<meta content=always name=referrer>
<meta name="renderer" content="webkit">
<title>信息工程学院-视频学习网站</title>
<!--导入的css样式-->
<link rel="stylesheet" type="text/css" href="../front/css/public.css" />
<link rel="stylesheet" type="text/css" href="../front/css/style.css" />
<link rel="stylesheet" type="text/css" href="../front/css/qusetion.css" />
<link rel="stylesheet" type="text/css" href="../front/css/pass.css" />
<link rel="stylesheet" type="text/css" href="${APP_PATH}/front/bootstrap/bootstrap.min.css" />

<script type="text/javascript" src="${APP_PATH}/front/js/jquery-1.12.4.js"></script>
<!--导入的js文件-->
<script src="${APP_PATH}/front/js/jquery-1.8.3.min.js"></script>

<link rel="stylesheet" type="text/css" href="${APP_PATH}/front/bootstrap/bootstrap.min.css" />
<script src="${APP_PATH}/front/bootstrap/bootstrap.min.js"></script>

</head>
<body>

	<c:import url="header.jsp" />

	<div class="pass_text">
		<h3>重置密码</h3>
		<span style='padding-top: 10px; color: red;'>重置前请先绑定邮箱</span>
		<!-- <span>没有账号？<a href="##" id="zhuce">立即注册</a>
		</span> -->
	</div>
	<div class="find_pass">
		<form class="from">
			<table>
				<tr>
					<td width=100><label>学 号：</label>
					</td>
					<td width=400><input type="text" name="account" id="account"
						class="form-control" />
					</td>
				</tr>
				<tr>
					<td width=120><label>邮箱：</label>
					</td>
					<td width=400><input type="text" name="email" id="email"
						class="form-control" />
					</td>
				</tr>
				<tr>
					<td></td>
					<td><button type="button" id="sub">提交</button>
					</td>
				</tr>
			</table>
		</form>
	</div>


	<!-- 页脚 -->
	<c:import url="footer.jsp" />
</body>
<script type="text/javascript">
	var flag = true;
	$("#sub").click(function() {
		if (flag) {
			flag = false;
			$("#sub").attr("disabled", "disabled");
			var account = $("#account").val();
			var email = $("#email").val();
			alert("发送邮件需要一点时间，请您耐心等待,点击确定后将为您发送邮件！");
			$.ajax({
				url : "${APP_PATH }/student/findPass.action",
				type : "POST",
				data : "account=" + account + "&email=" + email,
				success : function(result) {
					if (result.status == 200) {
						alert("邮件发送成功，请前往邮箱修改密码");
						flag = true;
						$("#sub").removeAttr("disabled");
					}
					if (result.status == 500) {
						alert(result.msg);
						flag = true;
						$("#sub").removeAttr("disabled");
					}
				}
			});
		}
	});

	$("#zhuce").click(function() {
		$("#registModal").modal();
	});
</script>
</html>
