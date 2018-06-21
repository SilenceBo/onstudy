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
<link rel="stylesheet" type="text/css"
	href="${APP_PATH }/front/css/public.css" />
<link rel="stylesheet" type="text/css"
	href="${APP_PATH }/front/css/style.css" />

<link rel="stylesheet" type="text/css" href="${APP_PATH}/front/bootstrap/bootstrap.min.css" />

<script type="text/javascript" src="${APP_PATH}/front/js/jquery-1.12.4.js"></script>
<script src="${APP_PATH}/front/bootstrap/bootstrap.min.js"></script>

<script type="text/javascript"
	src="${APP_PATH }/front/js/myfocus-2.0.1.min.js"></script>
</head>
<body>
	<!--logo部分-->
	<div class="top">
		<div class="comWidth">
			<div class="logoLeft" >
				<a href="${APP_PATH}/front/index.jsp"><img
					src="${APP_PATH }/front/images/logo1.png" alt="" style="width:180px;"/></a>
					<span>
					<a href="${APP_PATH}/course/findAllFront.action" id="course" style="margin-left:80px;">课程</a>
					<a href="${APP_PATH }/question/findAllByFront.action?way=time"
					id="queAw">问答</a> </span>
			</div>

			<div id="loginDiv" class="clearfix">
				<c:choose>
					<c:when test="${!empty user_student}">
						<div class="logoRight">
							<span>${user_student.sname} </span><span>|</span><a
								id="studentLogoRight"
								href="${APP_PATH }/StudentInformationCntroller/home.action">个人中心</a>
							&nbsp;&nbsp; <a href="${APP_PATH }/student/signOut.action">退出登录</a>
						</div>
					</c:when>
					<c:when test="${!empty user_teacher}">
						<div class="logoRight">
							<span>${user_teacher.username}</span> <span>|</span> <a
								id="teacherLogoRight"
								href="${APP_PATH }/teacherInformationController/home.action">个人中心</a>
								&nbsp;&nbsp;
								<a	href="${APP_PATH }/student/signOut.action">退出登录</a>
						</div>
					</c:when>
					<c:otherwise>
						<div class="logoRight">
							<a href="javascript: ;" data-toggle="modal"
								data-target="#myModal1">登录</a>
								 <span>|</span>  <a href="javascript: ;" id="regist_add_modal_btn">注册</a>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>

	<!--模态框（Modal）-->
	<!--登录-->
	<div class="modal fade" id="myModal1" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<form class="form-horizontal formSred" id="loginFrom" method="post">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h3 class="modal-title" id="myModalLabel1">欢迎登录</h3>
					</div>
					<div class="modal-body">
						
							<div class="form-group">
								<label class="col-sm-3 control-label">账户：</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" placeholder="学号/工号(教师)" id="loginaccount" name="account" />
									<span  style="font-size: 20px;color: red;" id="accountMsg"></span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">密码：</label>
								<div class="col-sm-6">
									<input type="password" placeholder="密码" class="form-control" id="pwdLogin" name="pwd" />
									<span  style="font-size: 20px;color: red;" id="passwordMsg"></span>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-5 col-sm-offset-3">
									<label class="radio-inline"> 
										<input type="radio" name="sfradio" id="studentLogin" value="1" checked="checked">
										<label for="studentLogin">学生登录</label>
									</label> 
									<label class="radio-inline"> 
										<input type="radio" name="sfradio" id="teacherLogin" value="0">
										<label for="teacherLogin">教师登录</label>
									</label>
								</div>
							</div>
							<a href="${APP_PATH }/front/findPass.jsp" id="findPass">找回密码</a><br>
						
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" onclick="login();" class="button btn btn-primary" id="btnSign">登录</button>
					</div>
				</form>	
			</div>
		</div>
	</div>

	<!-- 注册,模态 -->
	<div class="modal fade" id="registModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">注册</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal formSred">
						<div class="form-group">
							<label class="col-sm-2 control-label">学号</label>
							<div class="col-sm-10">
								<input type="text" name="account" class="form-control"
									id="account_add_input" placeholder="account"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">姓名</label>
							<div class="col-sm-10">
								<input type="text" name="sname" class="form-control"
									id="sname_add_input" placeholder="name"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">密码</label>
							<div class="col-sm-10">
								<input type="password" name="pwd" class="form-control"
									id="pwd_add_input" placeholder="password"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">重复密码</label>
							<div class="col-sm-10">
								<input type="password" name="repwd" class="form-control"
									id="repwd_add_input" placeholder="repwd"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">email</label>
							<div class="col-sm-10">
								<input type="text" name="e_mail" class="form-control"
									id="email_add_input"> <span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">性别</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio"
									name="sex" id="sex1_add_input" value="男" checked="checked">
									<!-- values指定提交值 --> 男 </label> <label class="radio-inline"> <input
									type="radio" name="sex" id="sex2_add_input" value="女">
									女 </label>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">班级</label>
							<!-- 部门提交部门id即可 -->
							<div class="col-sm-4">
								<!-- 变成4列 -->
								<select class="form-control" name="classId"
									id="registModal_select">
								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="regist_save_btn">保存</button>
				</div>
			</div>
		</div>
	</div>





	<!-- 登录 -->
	<script type="text/javascript">
		function login() {
			var from = document.getElementById("loginFrom");
			var radio = $('input:radio[name="sfradio"]:checked').val();
			//alert();
			//alert();
			document.getElementById("passwordMsg").innerHTML="";
			document.getElementById("accountMsg").innerHTML="";
			if($("#pwdLogin").val()==null||$("#pwdLogin").val()==""){
				document.getElementById("passwordMsg").innerHTML="密码不能为空";
				return ;
			}
			if($("#loginaccount").val()==null||$("#loginaccount").val()==""){
				document.getElementById("accountMsg").innerHTML="账号不能为空";
				return ;
			}
			if (radio == 0) {
				from.action = "${pageContext.request.contextPath}/teacher/login.action";
				from.submit();
			} else if (radio == 1) {
				from.action = "${pageContext.request.contextPath}/student/login.action";
				from.submit();
			} else {
				alert("请选择你的身份");
			}
			//alert("${msg }");
		}
		window.onload = function() {
			if ("${msg}" != "" && "${msg}" != "ok") {
				alert("${msg}");
				if ("${msg}" != "您的账户没有激活，请前往邮箱激活") {
					$("#myModal1").modal({});
				}
			}
				if ("${!empty user_student}") {
					$.ajax({
							url : "${APP_PATH}/StudentInformationCntroller/myInformation.action",
							type : "GET",
							success : function(result) {
								console.log(result);
								$("#studentLogoRight").after(
										$("<span>"+ result.data+ "</span>").addClass("badge active")
														.attr("style","background-color: red"));
							}
						});
				}
				if ("${!empty user_teacher}") {
					$.ajax({
						url : "${APP_PATH}/teacherInformationController/myInformation.action",
						type : "GET",
						success : function(result) {
							console.log(result);
							$("#teacherLogoRight").after($("<span>"
									+ result.data+ "</span>").addClass("badge active")
									.attr("style","background-color: red"));
						}
					});
				}
			}
	</script>
	<script type="text/javascript">
		$("#regist_add_modal_btn").click(function() {
			$("#registModal").modal();
		});

		function reset_form(ele) {
			$(ele)[0].reset;
			//清空表单样式
			$(ele).find("*").removeClass("has-error has-success");
			$(ele).find(".help-block").text("");
		}

		$("#regist_add_modal_btn").click(function() {
			//清除表单数据(表单完整重置(表单的数据，表单的样式))
			reset_form("#registModal form");
			$("#registModal form")[0].reset();
			//发送ajax请求，查出班级信息，显示在下拉列表中
			getDepts("#registModal select");
			//弹出模态框
			/* 		$("#registModal").modal({ //利用js创建模态框
			 backdrop : "static"
			 }); */
		});

		//查出所有的班级信息并显示在下拉列表中
		function getDepts(ele) {
			//清空之前下拉列表的值
			$(ele).empty();
			$.ajax({
				url : "${APP_PATH}/classname/findAllClass.action",
				type : "GET",
				success : function(result) {
					console.log(result);
					//显示班级信息在下拉列表中
					$.each(result.data, function() {
						var optionEle = $("<option ></option>").append(
								this.name).attr("value", this.classId);
						optionEle.appendTo(ele);
					})

				}
			});
		};

		//校验用户名是否可用
		$("#account_add_input").change(
				function() {
					//发送ajax请求校验用户名是否可用
					var account = this.value;
					$.ajax({
						url : "${APP_PATH}/student/checkUpAccount.action",
						data : "account=" + account,
						type : "POST",
						success : function(result) {
							if (result.status == 200) {
								show_validate_msg("#account_add_input",
										"success", "学号可用");
								$("#regist_save_btn")
										.attr("ajax_va", "success"); //给按钮添加一个属性 内容为success
							} else {
								show_validate_msg("#account_add_input",
										"error", result.msg);
								$("#regist_save_btn").attr("ajax_va", "error");
							}
						}
					});
				});

		function show_validate_msg(ele, status, msg) {
			//清除当前元素的检验状态
			$(ele).parent().removeClass("has-success has-error");
			$(ele).next("span").text(" ");
			if ("success" == status) {
				$(ele).parent().addClass("has-success");
				$(ele).next("span").text(msg);

			} else if ("error" == status) {
				$(ele).parent().addClass("has-error");
				$(ele).next("span").text(msg);
			}
		}

		function validate_add_form() {
			//1.拿到要校验的数据.使用正则表达式
			var account = $("#account_add_input").val();
			var regAccount = /([0-9]{10})/;
			//小写或者大写的a-z或者0-9   或者_或者-  3到16位  或者中文2到5位
			if (!regAccount.test(account)) {
				//alert("用户名可以是2-5位中文或者6-16位英文和数字的组合");
				show_validate_msg("#account_add_input", "error",
						"学号只可以是十位的数字");
				return false;
			} else {
				show_validate_msg("#account_add_input", "success", " ");
			}
			//2.校验两次密码是否一致
			var pwd = $("#pwd_add_input").val();
			var repwd = $("#repwd_add_input").val();
			if (pwd != repwd) {
				//	alert("邮箱格式不正确");
				//应该清空这个元素之前的样式
				show_validate_msg("#pwd_add_input", "error", "两次密码输入不一致");
				return false;
			} else {
				show_validate_msg("#pwd_add_input", "success", " ");
			}
			//3.校验邮箱信息
			var email = $("#email_add_input").val(); //拿到email的值 
			var regemail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if (!regemail.test(email)) {
				//	alert("邮箱格式不正确");
				//应该清空这个元素之前的样式
				show_validate_msg("#email_add_input", "error", "邮箱格式不正确");
				return false;
			} else {
				show_validate_msg("#email_add_input", "success", " ");
				return true;
			}
			return true;
		};
		//点击保存，保存学生.
		var flag = true;
		$("#regist_save_btn").click(
				function() {
					if (flag) {
						flag = false;
						$("#regist_save_btn").attr("disabled", "disabled");

						//1.模态框中填写的表单数据提交给服务器进行保存
						//2.现对要提交给服务器的数据进行校验
						if (!validate_add_form()) {
							flag = true;
							$("#regist_save_btn").removeAttr("disabled");
							return false;
						}
						//3.判断之前的ajax用户名校验是否成功，如果成功
						if ($(this).attr("ajax_va") == "error") {
							flag = true;
							$("#regist_save_btn").removeAttr("disabled");
							alert("学号不可用");
							return false;
						}
						//4.注冊 
						//alert($("#empAddModal form").serialize());序列化
						//alert("注册需要一点时间，请您耐心等待,点击确定后将为您发送邮件！");
						$.ajax({
							url : "${APP_PATH}/student/regist.action",
							type : "POST",
							async: false,
							data : $("#registModal form").serialize(),
							success : function(result) {
								console.log(result);
								if (result.status == 200) {
									//1.关闭模态框
									$("#registModal").modal("hide");
									alert("注册成功，请前往邮箱激活");
									flag = true;
									$("#regist_save_btn")
											.removeAttr("disabled");
								} else if(result.status == 205) {
									alert(result.msg);
									flag = true;
									$("#regist_save_btn")
											.removeAttr("disabled");
								} else {
									//显示失败信息
									if (undefined != result.data.email) {
										//显示邮箱错误信息
										show_validate_msg("#email_add_input",
												"error", result.data.email);
									}
									if (undefined != result.data.pwd) {
										//显示邮箱错误信息
										show_validate_msg("#pwd_add_input",
												"error", result.data.pwd);
									}
									if (undefined != result.data.account) {
										//显示员工名字的错误信息
										show_validate_msg("#account_add_input",
												"error", result.data.account);
									}
									flag = true;
									$("#regist_save_btn")
											.removeAttr("disabled");
								}
							}
						});
					}
				});
	</script>
</body>
</html>
