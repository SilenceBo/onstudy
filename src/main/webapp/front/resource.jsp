<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv=X-UA-Compatible content="IE=edge,chrome=1">
<meta content=always name=referrer>
<meta name="renderer" content="webkit">
<title>信息工程学院-视频学习网站</title>
</head>
<style>
</style>
<!--导入的css样式-->
<link rel="stylesheet" type="text/css" href="../front/css/public.css" />
<link rel="stylesheet" type="text/css" href="../front/css/style.css" />
<link rel="stylesheet" type="text/css" href="../front/css/qusetion.css" />
<link rel="stylesheet" href="${APP_PATH}/front/css/palyer.css" />

<link rel="stylesheet" type="text/css" href="${APP_PATH}/front/bootstrap/bootstrap.min.css" />

<script type="text/javascript" src="${APP_PATH}/front/js/jquery-1.12.4.js"></script>
<script src="${APP_PATH}/front/bootstrap/bootstrap.min.js"></script>

<script type="text/javascript"
	src="${APP_PATH}/front/js/myfocus-2.0.1.min.js"></script>
<script type="text/javascript"
	src="${APP_PATH}/front/js/jquerysession.js"></script>
<body>
	<div class="top">
		<div class="comWidth">
			<div class="logoLeft radio_logo" style="margin-left:-154px">
				<a href="${APP_PATH}/front/index.jsp"><img
					src="../front/images/logo.png" alt="" /> </a> <span> <a
					href="${APP_PATH}/course/findAllFront.action" id="course">课程</a> <a
					href="${APP_PATH }/question/findAllByFront.action?way=time"
					id="queAw">问答</a> </span>

			</div>
			<div id="loginDiv">
				<c:choose>
					<c:when test="${!empty user_student}">
						<div class="logoRight">
							<a>${user_student.sname}</a> <span>|</span> <a
								id="studentLogoRight"
								href="${APP_PATH }/StudentInformationCntroller/home.action">个人中心</a><a
								href="${APP_PATH }/student/signOut.action">退出登录</a>
						</div>
					</c:when>
					<c:when test="${!empty user_teacher}">
						<div class="logoRight">
							<a>${user_teacher.username}</a> <span>|</span> <a
								id="teacherLogoRight"
								href="${APP_PATH }/teacherInformationController/home.action">个人中心</a><a
								href="${APP_PATH }/student/signOut.action">退出登录</a>
						</div>
					</c:when>
					<c:otherwise>
						<div class="logoRight">
							<a href="javascript: ;" data-toggle="modal"
								data-target="#myModal1">登录</a> <span>|</span> <a
								href="javascript: ;" id="regist_add_modal_btn">注册</a>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<div id="det_all">
		<p class="det_title">
			<a href="${APP_PATH}/front/index.jsp">学院首页</a> &gt; <a
				href="${APP_PATH}/course/findAllFront.action">课程列表</a> &gt; <span>课程目录</span>
			<span class="favor"></span>
		</p>
		<!--http://www.jplayer.org/video/m4v/Finding_Nemo_Teaser_640x352_h264aac.m4v-->
		<div class="box_one" class="view_box view_box_max"
			style="background-color: #ffffff;">
			<div id="viewBox">
				<video id="video" controls width="77%" height="60%" controls
					poster="${APP_PATH}/front/images/bg.jpg"
					style="background-color:#535353" type="video/mp4">
					<img src="${APP_PATH}/front/images/bg.jpg"  width="100%" height="100%" alt=""
						data-bd-imgshare-binded="1" />
				</video>
			</div>

		</div>
	</div>
	<!-- 课程介绍 -->
	<div class="box_two clearfix" id="boxTwo">
		<div class="box_two_l">
			<div class="xie_tab">
				<div class="tab_box">

					<a tid="mu_itu" href="#boxTwo" class="on" id="1">课程内容</a> <a
						tid="mulu" href="#boxTwo">课堂练习</a> <a tid="tiwen" href="#boxTwo"><i></i><span>提问</span>
					</a>
					<!-- href="javascript:showQuestionModel()" -->
				</div>
			</div>
			<div class="kec_dag">

				<!-- 1. 课程介绍 -->
				<div class="tab_a on" id="mu_itu">
					<div class="two_int">
						<h6>
							<i></i>课程介绍
						</h6>
						<p class="two_text"></p>
						<p>
							<span
								style="color:#424242;font-family:&quot; font-size:16px;background-color:#FFFFFF;width: 650px;"><pre>${courseCustomer.redesc } </pre>
							</span><span style="font-size:16px;"></span>
						</p>
						<p></p>
					</div>
					<h6>
						<i></i>目录
					</h6>
					<div class="two_int_a">
						<i class="two_icon"></i>
						<div class="two_int_con active">
							<div class="two_det_o">
								<c:set var="index" value="0" />
								<c:forEach items="${listR }" var="resource">
									<c:if test="${resource.resourceType eq 1 }">
										<c:set var="index" value="${index+1}" />
										<p>
											<em>${index}<strong>.</strong></em> <span title="课程目录一" class="periodsName">${resource.resourceName
												}</span> <span class="viewUrl" style="display:none"></span> <input
												title="${resource.rid }" onclick="play(this)"
												class="view_btn goStudyFlag" type="button"> <a href="#"><span title="${resource.rid }" onclick="play(this)"
												class="l_time">点击观看</span></a>
										</p>
									</c:if>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
				<!-- 2.课堂练习 -->
				<div class="tab_a" id="mulu">
					<div class="two_int_con active">
						<div class="two_det_n">
							<!--题目部分-->
							<iframe src="" id="frame" width="100%" height="600"></iframe>
							<!--<a href="file/pfdf.pdf" target="_self">点击下载 文件名.pdf</a>-->
						</div>
						<div id='answerDiv' class='two_det_r'></div>
						<button id='Submit' class="btn btn-primary">提交</button>

					</div>
				</div>
				<!-- 3.提问 -->
				<div class="tab_a" id="tiwen">
					<div class="sTiwen_text">
						<form class="form">
							<textarea rows="10" id="questionText" name="text"
								class="form-control"></textarea>
							<button type="button" onclick="questionsToTeacher();"
								class="btn btn-primary" id="btnSign">提问</button>
						</form>
					</div>
				</div>
			</div>
		</div>


	</div>

	<div class="copy">
		<p>Copyright &copy; 2016-2017 西安市西安文理学院信息工程学院电子商务实验室</p>
	</div>

</body>
<script>
	$(".tab_box").on("click", "a", function() {
		$(".tab_box>a").removeClass();
		$(this).addClass("on");
		$(".tab_a").removeClass("on");
		var as = $(this).attr("tid");
		//var bs=$("#"+as).attr("class");alert(bs);
		$("#" + as).addClass("on");
	});
	$(".op_chapter").toggle(function() {
		$(".nav_a").css("display", "none");
		$(".chapter_panel").css("background-color", "#FFFFFF");
	}, function() {
		$(".chapter_panel").css("background-color", "#000000");
		$(".nav_a").css("display", "block");
	}

	);
	window.onload=function (){
		var video = document.getElementById("video");
		var frame = document.getElementById("frame");
		var answerDiv = document.getElementById("answerDiv");
		$.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/resourceLogs/play.action",
					data : {
						"rid" : "${rid}"
					},
					dataType : "json",
					success : function(data) {
						if (data.status == 200) {
							ordery = data.data.ordery;
							video.src = "${pageContext.request.contextPath }/resource/"
									+ data.data.Src;
							video.load();
							if (data.data.answerSrc != null) {
								frame.src = "${pageContext.request.contextPath }/resource/"
										+ data.data.answerSrc;
							}
							$(".xla_k").remove();
							document.getElementById("answerDiv").innerHTML = "";
							for ( var i = 0; i < data.data.answerNum; i++) {
								var ul = $("<select name='select' class='xla_k' value='请选择' class='form-control'></select>");
								ul.html("<option value='' class='chooes'>选择</option>"
												+ "<option value='A' class='xzt'>A</option>"
												+ "<option value='B' class='xzt'>B</option>"
												+ "<option value='C' class='xzt'>C</option>"
												+ "<option value='D' class='xzt'>D</option>");

								$("#answerDiv").append(
										$("<span>" + (1 + i) + ". </span>"))
										.append(ul);
							}
						} else {
							alert(data.msg);
						}
					}

				});
	}
	function play(resource) {
		var res = resource.title;
		var video = document.getElementById("video");
		var frame = document.getElementById("frame");
		var answerDiv = document.getElementById("answerDiv");
		$
				.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/resourceLogs/play.action",
					data : {
						"rid" : resource.title
					},
					dataType : "json",
					success : function(data) {
						if (data.status == 200) {
							ordery = data.data.ordery;
							video.src = "${pageContext.request.contextPath }/resource/"
									+ data.data.Src;
							video.load();
							video.play();
							if (data.data.answerSrc != null) {
								frame.src = "${pageContext.request.contextPath }/resource/"
										+ data.data.answerSrc;
							}
							$(".xla_k").remove();
							document.getElementById("answerDiv").innerHTML = "";
							for ( var i = 0; i < data.data.answerNum; i++) {
								var ul = $("<select name='select' class='xla_k' value='请选择' class='form-control'></select>");
								ul
										.html("<option value='' class='chooes'>选择</option>"
												+ "<option value='A' class='xzt'>A</option>"
												+ "<option value='B' class='xzt'>B</option>"
												+ "<option value='C' class='xzt'>C</option>"
												+ "<option value='D' class='xzt'>D</option>");

								$("#answerDiv").append(
										$("<span>" + (1 + i) + ". </span>"))
										.append(ul);
							}
						} else {
							alert(data.msg);
						}
					}

				});

	}
	//提交判断
	$(function() {
		var flag = true;
		var answer = "";
		$("#Submit")
				.click(
						function() {
							$("select option:checked").each(function() {
								var val = $(this).val();
								if (val == null || val == "") {
									flag = false;
								}
							});
							if (!flag) {
								alert("请做完所有题再提交答案。");
								flag = true;

							} else {
								$("select option:checked").each(function() {
									var val = $(this).val();
									answer += val + ",";
								});
								$
										.ajax({
											type : "post",
											url : "${pageContext.request.contextPath}/resourceLogs/answer.action",
											data : {
												"answer" : answer,
												"ordery" : ordery,
												"cid" : "${cid}"
											},
											dataType : "json",
											success : function(data) {
												alert(data.msg);
											}
										});

							}
							answer = "";
						});
	});
	function questionsToTeacher() {
		$
				.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/qanda/questionsToTeacher.action",
					data : {
						"cid" : "${cid}",
						"text" : $("#questionText").val(),
					},
					dataType : "json",
					success : function(data) {
						if (data.status == 200) {
							alert("已将你的信息反馈给教师");
							$("#questionModal").modal("hide");
						} else {
							alert(data.msg);
						}
					}
				});
	}
</script>
</html>
