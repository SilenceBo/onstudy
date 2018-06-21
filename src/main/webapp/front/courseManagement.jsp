<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv=X-UA-Compatible content="IE=edge,chrome=1">
<meta content=always name=referrer>
<meta name="renderer" content="webkit">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title>课程管理</title>
<link rel="stylesheet" href="${APP_PATH }/front/css/pintuer.css">
<link rel="stylesheet" href="${APP_PATH }/front/css/admin.css">
<script src="${APP_PATH }/front/js/jquery.js"></script>
</head>
<body style="background-color:#f2f9fd;">

	<div class="leftnav">
		<div class="leftnav-title">
			<span class="icon-list"><a href="${APP_PATH}/front/index.jsp">回到主页</a>
			</span> <a id="teacherLogoRight"
				href="${APP_PATH }/teacherInformationController/home.action">个人中心</a>
		</div>

		<h2>
			<span class="icon-pencil-square-o"></span>菜单列表
		</h2>
		<ul style="display:block">
			<li><a
				href="${APP_PATH}/resource/findAllTeacher.action?cid=${cid}"
				target="right"><span class="icon-caret-right"></span>资源管理</a>
			</li>
			<li><a
				href="${APP_PATH }/front/coursemanagement_work.jsp?cid=${cid}"
				target="right"><span class="icon-caret-right"></span>作业管理</a>
			</li>
			<li><a
				href="${APP_PATH }/CourseAndClass/findCourseById.action?courseId=${cid}"
				target="right"><span class="icon-caret-right"></span>班级管理</a>
			</li>
			<li><a href="${APP_PATH }/front/courseManagement_answer.jsp"
				target="right"><span class="icon-caret-right"></span>问答管理</a>
			</li>
			<li><a href="${APP_PATH }/CourseClickLog/findAllCourseClicklogsPage.action?courseId=${cid}"
				target="right"><span class="icon-caret-right"></span>课程浏览信息</a>
			</li>

		</ul>
	</div>
	<script type="text/javascript">
		$(function() {
			$(".leftnav h2").click(function() {
				$(this).next().slideToggle(200);
				$(this).toggleClass("on");
			})
			$(".leftnav ul li a").click(function() {
				$("#a_leader_txt").text($(this).text());
				$(".leftnav ul li a").removeClass("on");
				$(this).addClass("on");
			})
		});
	</script>
	<div class="admin">
		<iframe scrolling="auto" rameborder="0"
			src="${APP_PATH}/resource/findAllTeacher.action?cid=${cid}"
			name="right" width="100%" height="100%"></iframe>
	</div>
	<div style="text-align:center;"></div>
</body>
</html>