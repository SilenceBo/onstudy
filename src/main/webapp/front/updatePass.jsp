<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv=X-UA-Compatible content="IE=edge,chrome=1">
<meta content=always name=referrer>
<meta name="renderer" content="webkit">
<title>修改密码</title>
<link rel="stylesheet" type="text/css" href="../front/css/public.css" />
<link rel="stylesheet" type="text/css" href="../front/css/style.css" />
<link rel="stylesheet" type="text/css" href="../front/css/qusetion.css" />
<link rel="stylesheet" type="text/css" href="../front/css/pass.css" />
<!--导入的js文件-->

<link rel="stylesheet" type="text/css" href="${APP_PATH}/front/bootstrap/bootstrap.min.css" />
<script type="text/javascript" src="${APP_PATH}/front/js/jquery-1.12.4.js"></script>
<script src="${APP_PATH}/front/bootstrap/bootstrap.min.js"></script>

<script src="${APP_PATH}/front/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="../front/js/myfocus-2.0.1.min.js"></script>
</head>

<body>
	<!-- logo部分 -->
	<c:import url="header.jsp" />


	<div class="pass_text">
		<h3>修改密码</h3>
		<!-- <span>没有账号？<a href="##" id="zhuce">立即注册</a>
		</span> -->
	</div>
	<div class="find_pass">
		<form class="from">
			<table>
				<tr>
					<td width=100><label>密码：</label>
					</td>
					<td width=400><input type="password" name="pwd" id="pwd"
						class="form-control" />
					</td>
				</tr>
				<tr>
					<td width=120><label>确认密码：</label>
					</td>
					<td><input type="password" name="repwd" id="repwd"
						class="form-control" />
					</td>
				</tr>
				<tr>
					<td></td>
					<td><button type="button" id="subm">提交</button>
					</td>
				</tr>
			</table>
		</form>
	</div>


	<!-- 页脚 -->
	<c:import url="footer.jsp" />
</body>
<script type="text/javascript">
	$("#subm").click(function() {
		var account = "${account }";
		var pwd = $("#pwd").val();
		var repwd = $("#repwd").val();
		if(pwd == "" || repwd==""){
			alert("密码不能为空！");
			return false;
		}
		if (pwd != repwd) {
			//	alert("邮箱格式不正确");
			//应该清空这个元素之前的样式
			alert("俩次密码不一致");
			return false;
		}
		$.ajax({
			url : "${APP_PATH }/student/updatePass.action",
			type : "POST",
			data : "account=" + account + "&pwd=" + pwd,
			success : function(result) {
				if (result.status == 200) {
					alert("修改成功");
					window.location = "${APP_PATH}/front/index.jsp";
				}
				if (result.status == 500) {
					alert(result.msg);
				}
			}
		});
	});
	
	$("#zhuce").click(function() {
		$("#registModal").modal();
	});
</script>
</html>
