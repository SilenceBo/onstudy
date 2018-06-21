<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

<title>信息工程学院视频学习网站</title>
<!--css样式-->
<link rel="stylesheet" type="text/css" href="${APP_PATH }/front/css/public.css" />
<link rel="stylesheet" type="text/css" href="${APP_PATH }/front/css/style.css" />


<link rel="stylesheet" type="text/css" href="${APP_PATH}/front/bootstrap/bootstrap.min.css" />

<link rel="stylesheet" href="${APP_PATH }/front/css/teach.css" />


<!--js样式-->
<script type="text/javascript" src="${APP_PATH}/front/js/jquery-1.12.4.js"></script>
<script src="${APP_PATH}/front/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${APP_PATH }/front/jedate/jquery.jedate.js"></script>

<link type="text/css" rel="stylesheet"
	href="${APP_PATH }/front/jedate/skin/jedate.css">
</head>
<body>
	<!--logo部分-->
	<div class="top">
		<div class="comWidth">
			<div class="logoLeft">
				<a href="${APP_PATH}/front/index.jsp"><img
					src="${APP_PATH}/front/images/logo1.png" alt="" style="width:180px;" /> </a> <span> <a
					href="${APP_PATH}/course/findAllFront.action" id="course">课程</a> <a
					href="${APP_PATH }/question/findAllByFront.action?way=time"
					id="queAw">问答</a> </span>

			</div>
			<div id="loginDiv">
				<c:choose>
					<c:when test="${!empty user_student}">
						<div class="logoRight">
							<span>${user_student.sname}</span>
							<span>|</span> <a id="studentLogoRight" href="${APP_PATH }/StudentInformationCntroller/home.action">个人中心</a><a
								href="${APP_PATH }/student/signOut.action">退出登录</a>
						</div>
					</c:when>
					<c:when test="${!empty user_teacher}">
						<div class="logoRight">
							<a href="${APP_PATH }/front/index.jsp">主页</a> <span>|</span> <a
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

	<!--模态框（Modal）-->
	<!--登录-->
	<div class="modal fade" id="myModal1" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true" id="myModal1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<!--关闭按钮-->
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h3 class="modal-title" id="myModalLabel1">欢迎登录</h3>
				</div>
				<div class="modal-body modal_sign">
					<form id="loginFrom" method="post">
						<table>
							<tr>
								<td><span>账户：</span>
								</td>
								<td width="80"><input type="text" placeholder="学号/手机号"
									name="account" />
								</td>
								<td id="valiAccount"></td>
							</tr>
							<tr>
								<td><span>密码：</span>
								</td>
								<td><input type="password" placeholder="密码" name="pwd" />
								</td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td>
									<div class="radio"
										style="display:inline-block;margin-right:20px">
										<input name="sfradio" id="studentLogin" value="1" type="radio">
										<label for="aa">学生登录</label>
									</div>
									<div class="radio" style="display:inline-block;">
										<input name="sfradio" id="teacherLogin" type="radio" value="0">
										<label for="xx">教师登录</label>
									</div></td>
							</tr>
							<tr>
								<td></td>
								<td><a href="${APP_PATH }/front/findPass.jsp" id="findPass">找回密码</a><br>
									<button type="button" onclick="login();" class="button"
										id="btnSign">登录</button>
								</td>

							</tr>
						</table>
					</form>
				</div>
				<div class="modal-footer modal_btn">
					<button type="button" data-dismiss="modal">关闭</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
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
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">账号</label>
							<div class="col-sm-10">
								<input type="text" name="account" class="form-control"
									id="account_add_input" placeholder="account"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">昵称</label>
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
									id="email_add_input" placeholder="447332241@qq.com"> <span
									class="help-block"></span>
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


	<!-- Modal zb-->
	<div class="modal fade" id="myModalCourse" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
					</button>
					<h4 class="modal-title">查看课程</h4>
					<small class="font-bold"></small>
				</div>

				<div class="modal-body correntInfo">
					<form action="<c:url value='/course/updateCourseJson.action'/>"
						class="form-horizontal m-t " id="signupForm" method="post"
						enctype="multipart/form-data">
						<input type="hidden" name="cid" value="" class="cid" id="edit_cid">
						<input type="hidden" name="tid" value="${user_teacher.tid}"
							class="tid">
						<div class="form-group">
							<label class="col-sm-3 control-label">课程名：</label>
							<div class="col-sm-6" id="sKecheng2">
								<input type="text" name="cname" id="coursecname"
									class="form-control coursename" placeholder="请输入文本" value="">
								<i class='sBitian'></i>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">所属年级：</label>
							<div class="col-sm-6">
								<select class="form-control" name="grade" id="grade_update">
									<option value="">===请选择===</option>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">所属专业：</label>
							<div class="col-sm-6" id="szhuangye2">
								<select class="form-control" name="mid" id="mid_update">
									<option value="">===请选择===</option>
								</select> <i class='sBitian'></i>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">所属兴趣：</label>
							<div class="col-sm-6">
								<select class="form-control" name="iid" id="iidtwo">
									<option value="" id="iidtwoOption">===请选择===</option>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">所属方向：</label>
							<div class="col-sm-6">
								<select class="form-control" name="fid" id="fidtwo">
									<option value="">===请选择===</option>
								</select>
							</div>
						</div>

						<!-- <div class="form-group">
							<label class="col-sm-3 control-label"> 是否加锁：</label>
							<div class="col-sm-6 courseRadio">
								<label> <input type="radio" name="iorder"
									id="courseiorder" value="true" class="courseiorder">是 </label>
								<label> <input type="radio" name="iorder"
									id="courseiorder2" value="false" class="courseiorder">否
								</label>
							</div>
						</div> -->

						<div class="form-group">
							<label class="col-sm-3 control-label">课程简介：</label>
							<div class="col-sm-6" id="sBrief2">
								<textarea class="form-control courseredesc" id="courseredesc"
									type="3" name="redesc"></textarea>
								<i class='sBitian'></i>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">课程图片：</label>
							<div class="col-sm-6" id="sPhoto2">
								<input type="file" name="file" id="courseimage"
									class="form-control"><span style="color:red">建议图片比例4:3</span>
							</div>
						</div>
					</form>
					<input type="submit" class="btn btn-primary" value="修改"
						style="margin-left:400px" id="edit_btn" />
					<button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 添加课程 zb -->
	<div class="modal inmodal" id="myModalAdd" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content animated bounceInRight">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
					</button>

					<h4 class="modal-title">添加课程</h4>
					<small class="font-bold"></small>
				</div>

				<div class="modal-body">
					<form action="<c:url value='/course/addCourse.action'/>"
						class="form-horizontal m-t " id="signupForm" method="post"
						enctype="multipart/form-data">
						<input type="hidden" name="tid" value="${user_teacher.tid}"
							class="tid">
						<div class="form-group">
							<label class="col-sm-3 control-label">课程名：</label>
							<div class="col-sm-6" id="sKecheng">
								<input type="text" name="cname" class="form-control" value=""
									placeholder="请输入文本"> <i class='sBitian'></i>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">所属年级：</label>
							<div class="col-sm-6">
								<select class="form-control" name="grade" id="grade1">

								</select>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">所属专业：</label>
							<div class="col-sm-6" id="szhuangye">
								<select class="form-control" name="mid" id="mid">
									<option value="">===请选择===</option>
								</select> <i class='sBitian'></i>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">所属兴趣：</label>
							<div class="col-sm-6">
								<select class="form-control" name="iid" id="iid">
									<option value="" id="iidOption">===请选择===</option>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">所属方向：</label>
							<div class="col-sm-6">
								<select class="form-control" name="fid" id="fid">
									<option value="">===请选择===</option>
								</select>
							</div>
						</div>

						<!-- <div class="form-group">
							<label class="col-sm-3 control-label"> 是否加锁：</label>
							<div class="col-sm-6">
								<label> <input type="radio" name="iorder" value=1>是
								</label> <label> <input type="radio" name="iorder" value=0
									checked>否 </label>
							</div>
						</div> -->

						<div class="form-group">
							<label class="col-sm-3 control-label">课程简介：</label>
							<div class="col-sm-6" id="sBrief">
								<textarea class="form-control" type="3" name="redesc"></textarea>
								<i class='sBitian'></i>
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-3 control-label">课程图片：</label>
							<div class="col-sm-6" id="sPhoto">
								<input type="file" name="file" class="form-control"> <i
									class='sBitian'></i><span style="color:red">建议图片比例4:3</span>
							</div>
						</div>

					</form>
					<input type="submit" class="btn btn-primary" value="添加"
						style="margin-left:400px" id="course_add" />
					<button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>

	<!--主体部分信息-->
	<div class="mainbd">
		<ul class="nav nav-tabs navbar">
			<li class="active"><a href="#main1" data-toggle="tab"
				style="padding:15px 30px">信息管理</a></li>
			<li><a href="#main2" data-toggle="tab" style="padding:15px 30px"
				id="myInfo">我的消息</a></li>
			<li><a href="#main3" data-toggle="tab" style="padding:15px 30px"
				id="myCourse">我的课程</a></li>
			<li><a href="#main4" data-toggle="tab" style="padding:15px 30px"
				id="MyQuestion">我的私信</a></li>
			<li><a href="#main5" data-toggle="tab" style="padding:15px 30px"
				id="adminNotice">通知管理</a></li>
			<li><a href="#main6" id="sendNotice" data-toggle="tab"
				style="padding:15px 30px">发布通知</a></li>
			<li><a href="#main7" id="question" data-toggle="tab"
				style="padding:15px 30px">我的问答</a></li>
		</ul>
	</div>
	<div class="tab-content mainnr" style="padding: 30px;">
		<div class="tab-pane active" id="main1">
			<div class="basicInfo">
				<p>
					<a href="#" style="color: #000000;" tid="info1">基本信息</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
						href="#" tid="info2" style="color: #000000;">修改密码</a>
				</p>
			</div>

			<!--基本信息 zb-->
			<div class="info1">
				<form action="" id="myInfo">
					<ol class="BI-li">
						<li class="form_info">
							<div class="form-group-sm">
								<label>昵称</label> <input name="username" data-validate="nick"
									autocomplete="off" class="form-control" placeholder="请输入昵称"
									id="nickname" type="text">
							</div>
						</li>

						<li class="form_info">
							<div class="form-group-sm">
								<label>邮箱</label> <input name="e_mail" class="form-control"
									id="e_mail" value="把对应值传进来" type="text"> <span
									class="help-block"></span>
							</div>
						</li>

						<li class="form_info">
							<div class="form-group-sm">
								<label>电话</label> <input name="phone" id="datepicker"
									class="form-control" placeholder="请输入手机号码" value="" type="text">
								<span class="help-block"></span>
							</div>
						</li>
						<li class="form_info">
							<div class="form-group-sm">
								<label>QQ</label> <input name="qq" class="form-control" id="qq"
									placeholder="请输入QQ号码" type="text"> <span
									class="help-block"></span>
							</div>
						</li>
						<li class="form_info">
							<div class="form-group-sm">
								<label>个人介绍</label>
								<textarea class="form-control" rows="3" placeholder="请输入您的个人资料！"
									id="redesc" name=redesc></textarea>
							</div>
						</li>
					</ol>
					<center></center>
				</form>
				<button class="btn btn-default" id="update_Info"
					style="margin-left: 130px;">更新</button>
			</div>
			<!--修改密码-->
			<div class="info2">
				<form action="" id="updataPWD">
					<ol class="BI-li">
						<li class="form_info">
							<div class="form-group-sm">
								<label>旧密码</label> <input name="oldpassword"
									class="form-control" placeholder="请输入旧密码" value=""
									id="oldpassword" type="password">
							</div>
						</li>
						<li class="form_info">
							<div class="form-group-sm">
								<label>新密码</label> <input name="password" class="form-control"
									id="newpassword" placeholder="请输入新密码" value="" type="password">
							</div>
						</li>
						<li style="margin-bottom:30px;" class="form_info">
							<div class="form-group-sm">
								<label>确认密码</label> <input name="notpassword"
									class="form-control" placeholder="请再次输入新密码" value=""
									id="againpassword" type="password">
							</div>
						</li>
					</ol>
				</form>
				<button class="btn btn-default" style="margin-left: 130px;"
					id="update_pwd">修改</button>
			</div>
		</div>
		<div class="tab-pane" id="main2">
			<div class="event_main">
				<!--   <div class="addMain">
		            <div class="addMain_left btn-group fl">
				         <button class="btn btn-default"><a href="@@" class="glyphicon glyphicon-trash"></a></button>
			        </div>
		        </div> -->
				<!-- 列出表格 -->
				<div class="addMain_table addMain_table2">
					<table id="InfoTable"
						class="table table-hover table-bordered table-striped">
						<tr>
							<th>来源</th>
							<th>标题</th>
							<th>时间</th>
							<th>操作</th>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<!-- 课程部分  zb-->
		<div class="tab-pane" id="main3">
			<div class="event_main">
				<div id="exampleTableEventsToolbar" role="group">
					<button type="button" class="btn btn-default" data-toggle="modal"
						data-target="#myModalAdd" id="add_btn" onclick="emptyAdd()">
						<i class="glyphicon glyphicon-plus" aria-hidden="true"></i>添加课程
					</button>
				</div>
				<div id="showCourse">
					<ul>

					</ul>
				</div>
			</div>
		</div>

		<div class="tab-pane" id="main4">
			<div class="addMain">
				<div class="addMain_left btn-group fl">
					<button onclick="deletebatch();" class="btn btn-default">
						<a href="@@" class="glyphicon glyphicon-trash"></a>
					</button>
				</div>
			</div>
			<div class="addMain_table">
				<table id="myQuestionTable"
					class="table table-hover table-bordered table-striped">
					<thead>
						<th width=70><input type="checkbox" id="sixinChox" />
						</th>
						<th>来源</th>
						<th>学生姓名</th>
						<th width=20%>时间</th>
						<th width=30%>操作</th>
					</thead>
				</table>
			</div>
			<div class="addMain_page" id="sixinShowPageDiv"></div>

		</div>

		<div class="tab-pane" id="main5">
			<!-- 主体部分 -->
			<div class="event_main">
				<div class="addMain">
					<div class="addMain_left btn-group fl">
						<button class="btn btn-default" onclick="check()">
							<a href="@@" class="glyphicon glyphicon-trash"></a>
						</button>
					</div>

				</div>
				<!-- 列出表格 -->
				<div class="addMain_table">
					<table id="adminNoticeTable"
						class="table table-hover table-bordered table-striped">
						<tr>
							<th width=70><input type="checkbox" name="duoxuan"
								id="selectAll" onclick="selectAll()" />
							</th>
							<th>标题</th>
							<th>课程</th>
							<th>时间</th>
							<th>发送状态</th>
							<th>操作</th>
						</tr>
					</table>
				</div>
				<div class="addMain_page" id="NoticeShowPageDiv"></div>
			</div>
		</div>

		<div class="tab-pane" id="main6" style="margin-left: 120px;">
			<form id="sendNoticeForm" class="form">
				<input type="text" class="form-control" name="title"
					placeholder="通知标题" />
				<!-- 发布的内容 -->
				<textarea placeholder="发布的内容" name="text" class="form-control"></textarea>
				<select name="cname" class="form-control input-sm" id="courseSelect">
					<option>选择接受消息的班级</option>
				</select><span>选择接受内容的课程</span>
				<div class="form-group main6_in">
					<label>定时发送</label><input id="dsradio" type="radio"
						name="isittimed" value="1" /> </span> <span><label>及时发送</label><input
						type="radio" name="isittimed" value="0" checked="checked" /> </span>
				</div>
				<div class="main6_time">

					<input class="form-control" id="date01" type="text"
						placeholder="YYYY-MM-DD hh:mm:ss" name="time" readonly="true"
						style="width: 200">


				</div>
			</form>
			<button id="sendNoticeButton" class="btn btn-primary fr"
				style="margin: 20px 220px 0 0;">提交</button>
		</div>
		<div class="tab-pane" id="main7" style="margin-left: 120px;">
			<div class="basicInfo">
				<p>
					<a href="javascript:;" style="color: #000000;" tid="info1">我的提问</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="javascript:;" tid="info2" style="color: #000000;">我参与的问题</a>
				</p>
			</div>
			<div class="info1 container">
				<div id="myHaveQuestion">
					<ul>
					</ul>
				</div>
				<div class="row">
					<div class="col-md-6" id="zb_page_info_area"></div>
					<div class="col-md-6" id="zb_page_nav_area"></div>
				</div>
			</div>
			<div class="info2">
				<div id="aboutHaveQuestion">
					<ul>
					</ul>
				</div>
				<div class="row">
					<div class="col-md-6" id="zb_page_info_area2"></div>
					<div class="col-md-6" id="zb_page_nav_area2"></div>
				</div>
			</div>
		</div>

		<!-- question模态框 -->
		<div class="modal fade" id="questionModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body" id="questionModalText"></div>
					<textarea rows="5" cols="80" name="questionModalText2"
						id="questionModalText2"></textarea>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" onclick="reply()" class="btn btn-primary">回复</button>
					</div>
				</div>
			</div>
		</div>
		<!-- checkquestion模态框 -->
		<div class="modal fade" id="checkquestion" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<h4 id="questionTitle">标题</h4>
					<div class="modal-body" id="questionlavle"></div>
					<p style="width: 600px;padding:30px" id="questionText"></p>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 模态框 -->
		<div class="modal fade" id="findNotice" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">查看</h4>
					</div>
					<div class="modal-body">
						<div class="tab-pane" id="main6" style="margin-left: 50px;">
							<form id="updataNoticeForm" class="form">
								<!-- 		        <input class='updataInput' type='hidden' name='isittimed' vale='"+result.data.isittimed+"'></input>
				<input class='updataInput' type='hidden' name='cnid' vale='"+$(but).attr("cnid")+"'></input> -->
								<input type="text" id="updatatitle" class="form-control"
									name="title" placeholder="通知标题" style="width:450px" />
								<!-- 发布的内容 -->
								<textarea placeholder="发布的内容" id="updataText" name="text"
									class="form-control" style="width:450px"></textarea>
								<span>选择接受内容的课程</span> <select name="cname"
									class="form-control input-sm" id="updatacourseSelect">
									<option>选择接受消息的班级</option>
								</select>
								<div id="Issendnotice">
									定时发送可修改发送时间
									<div class="main6_time">

										<input class="form-control" id="date02" type="text"
											placeholder="YYYY-MM-DD hh:mm:ss" name="time" readonly="true"
											style="width: 200">
									</div>
								</div>
								<div id="Nosendnotice">
									发送时间 : <label id="noticeLable" class="form-control"
										style="width: 200"></label>
								</div>
							</form>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭
						</button>
						<button id="updataNoticeBut" type="button" class="btn btn-primary">
							提交更改</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
		</div>
	</div>

		<!--页脚部分-->
		<div class="copy">
			<p>Copyright &copy; 2016-2017 西安市西安文理学院信息工程学院电子商务实验室</p>
		</div>
		<!-- -->
</body>
</html>
<script type="text/javascript"
	src="${APP_PATH }/front/js/footer.js"></script>	
<script>
	$(".mainLeft").on("click", "p", function() {
		var a1 = $(this).attr("tid");
		$(".totally").removeClass("oon");
		$("#" + a1).addClass("oon");
		//		alert(a1);
	})

	$(".basicInfo").on("click", "a", function() {
		var infoo = $(this).attr("tid");
		//		alert(infoo);
		$(".info1").css("display", "none");
		$(".info2").css("display", "none");
		$("." + infoo).css("display", "block");
	})

	$("#sendNotice")
			.click(
					function() {
						showCont();
						$("input[name=isittimed]").click(function() {
							showCont();
						});
						$(".inputClass").remove();
						$
								.ajax({
									url : "${APP_PATH}/course/SelectCourseBytid.action",
									type : "POST",
									success : function(result) {
										if (result.status == 200) {
											var select = $("#courseSelect");
											select.empty();
											$
													.each(
															result.data,
															function() {
																var optionEle = $(
																		"<option class='selectedClass'></option>")
																		.append(
																				this.cname)
																		.attr(
																				"value",
																				this.cname
																						+ ","
																						+ this.cid)
																		.attr(
																				"cid",
																				this.cid);
																optionEle
																		.appendTo(select);
															});
										}
									}
								});
					});
	$("#sendNoticeButton").click(function() {
		$.ajax({
			url : "${APP_PATH}/teacherInformationController/sendNotice.action",
			type : "POST",
			data : $("#sendNoticeForm").serialize(),
			success : function(result) {
				if (result.status == 200) {
					alert("发布成功");
				} else {
					alert(result.msg);
				}
			}
		});
	});
	function showCont() {
		switch ($("input[name=isittimed]:checked").attr("value")) {
		case "1":
			//alert("one");
			$("#date01").show();
			break;
		case "0":
			$("#date01").hide();
			break;
		default:
			break;
		}
	}

	$("#adminNotice").click(function() {
		$(".adminNoticte").remove();
		adminNoticeToPage(1);
	});

	function showPage(ele, fun, data) {
		var div = $("#" + ele);
		document.getElementById(ele).innerHTML = "";
		document.getElementById(ele).innerHTML = "<p class='fl'>共<span id='AdminNoticeNumber'>"
				+ data.total + "</span>条记录</p>";
		var p = $("<p class='fr  addPage'></p>");
		thisPage = data.pageNum;
		if (!data.isFirstPage) {
			var a = $("<button>上一页</button>").attr("onclick",
					fun + "(" + data.prePage + ")");
			a.appendTo(p);
		}
		$.each(data.navigatepageNums, function() {
			var a = $("<a>" + this + "</a>").attr("href",
					"javascript:" + fun + "(" + this + ")");
			a.appendTo(p);
		});
		if (!data.isLastPage) {
			var a = $("<button>下一页</button>").attr("onclick",
					fun + "(" + data.nextPage + ")");
			a.appendTo(p);
		}
		p.appendTo(div);
	}
	function adminNoticeToPage(pn) {
		$
				.ajax({
					url : "${APP_PATH}/courseNotice/findByTid.action",
					type : "POST",
					data : {
						"pn" : pn
					},
					success : function(result) {
						console.log(result);
						if (result.status == 200) {
							var table = $("#adminNoticeTable");
							$(".noticeTr").remove();
							showPage("NoticeShowPageDiv", "adminNoticeToPage",
									result.data);
							$
									.each(
											result.data.list,
											function() {
												var tr = $(
														"<tr class='noticeTr'></tr>")
														.addClass(
																"adminNoticte");
												tr
														.append(
																$("<td><input type='checkbox' name='duoxuan' value='"+this.cnid+"'></td>"))
														.append(
																$("<td></td>")
																		.append(
																				this.title))
														.append(
																$("<td></td>")
																		.append(
																				this.cname))
														.append(
																$("<td></td>")
																		.append(
																				this.time));
												if (this.isittimed) {
													tr.append($("<td></td>")
															.append("未发送"));
												} else {
													tr.append($("<td></td>")
															.append("已发送"));
												}
												var td = $("<td></td>")
														.append(
																"<button onclick='findNotice(this)' cnid="
																		+ this.cnid
																		+ " class='btn btn-default'><i class='glyphicon glyphicon-edit'></i>查看</button>")
														.append(
																"<button onclick='deleteNotice(this)' cnid="
																		+ this.cnid
																		+ " class='btn btn-primary'><i class='glyphicon glyphicon-trash'></i>删除</button>");
												tr.append(td);
												tr.appendTo(table);
											});
						}
					}
				});
	}

	function deleteNotice(but) {
		if (confirm("您确定要删除吗?")) {
			$.ajax({
				url : "${APP_PATH}/courseNotice/deleteByCnid.action",
				type : "POST",
				data : {
					"cnid" : $(but).attr("cnid")
				},
				success : function(result) {
					if (result.status == 200) {
						alert("删除成功");
						$(but).parent().parent().hide();
					} else {
						alert(result.msg);
					}
				}
			});
		}
	}

	/* 批量删除 */
	function check() {
		var msg = "您真的确定要删除吗？";
		if (confirm(msg) == true) {
			var becheckbox = "";

			$("input[name=duoxuan]:checked").each(function() { //遍历table里的全部checkbox
				becheckbox += $(this).val() + ","; //获取所有checkbox的值	
			});

			if (becheckbox.length > 0) { //如果获取到
				becheckbox = becheckbox.substring(0, becheckbox.length - 1); //把最后一个逗号去掉
				$.ajax({
					url : "${APP_PATH}/courseNotice/deleteByids.action?ids="
							+ becheckbox,
					type : "GET",
					success : function(result) {
						if (result.status == 200) {
							alert("删除成功");
							adminNoticeToPage(1);
						} else {
							alert(result.msg);
						}
					},
				});

				return false;
			} else {
				return false;
			}
		}
	}

	/* 全选或清空 */
	var i = 0;
	function selectAll() {
		var chkbox = document.getElementById("selectAll");
		i++;
		if (i % 2 != 0) {
			$("input[name=duoxuan]").each(function() {
				this.checked = true;
			});
		} else {
			$("input[name=duoxuan]").each(function() {
				this.checked = false;
			});
		}
	}

	var cname;
	function findNotice(but) {
		$
				.ajax({
					url : "${APP_PATH}/courseNotice/findByCnid.action",
					type : "POST",
					data : {
						"cnid" : $(but).attr("cnid")
					},
					success : function(result) {
						if (result.status == 200) {
							$(".updataInput").remove();
							$("#updataNoticeForm")
									.append(
											$("<input class='updataInput' type='hidden' name='isittimed' value='"+result.data.isittimed+"'></input>"));
							$("#updataNoticeForm")
									.append(
											$("<input class='updataInput' type='hidden' name='cnid' value='"
													+ $(but).attr("cnid")
													+ "'></input>"))
							console.log(result);
							cname = result.data.cname;
							$("#updatatitle").val(result.data.title);
							$("#updataText").val(result.data.text);
							if (result.data.issendout == true) {
								$("#Issendnotice").hide();
								$("#Nosendnotice").show();
								document.getElementById("noticeLable").innerHTML = result.data.time;
								$("#noticeLable").val(result.data.time);
							} else {
								$("#Issendnotice").show();
								$("#Nosendnotice").hide();
								document.getElementById("date02").innerHTML = result.data.time;
							}
						}
					}
				});
		for ( var i = 0; i < 1000; i++) {

		}
		$.ajax({
			url : "${APP_PATH}/course/SelectCourseBytid.action",
			type : "POST",
			success : function(result) {
				if (result.status == 200) {
					var select = $("#updatacourseSelect");
					select.empty();
					$.each(result.data, function() {
						if (this.cname == cname) {
							var optionEle = $("<option ></option>").append(
									this.cname).attr("value",
									this.cname + "," + this.cid).attr(
									"selected", "selected");
						} else {
							var optionEle = $("<option ></option>").append(
									this.cname).attr("value",
									this.cname + "," + this.cid);
						}
						optionEle.appendTo(select);
					});
				}
			}
		});
		$("#findNotice").modal();
	}

	$("#updataNoticeBut")
			.click(
					function() {
						$
								.ajax({
									type : "post",
									url : "${pageContext.request.contextPath}/courseNotice/updataNotice.action",
									data : $("#updataNoticeForm").serialize(),
									dataType : "json",
									success : function(data) {
										if (data.status == 200) {
											alert("修改成功");
											$("#findNotice").modal("hide");
										} else {
											alert(data.msg);
										}
									},
								});
					});
	$("#myInfo")
			.click(
					function() {
						$(".InfoTr").remove();
						$
								.ajax({
									url : "${APP_PATH}/adminNotice/findTeacherNotice.action",
									type : "POST",
									success : function(result) {
										if (result.status == 200) {
											var table = $("#InfoTable");
											$
													.each(
															result.data,
															function() {
																var tr = $(
																		"<tr></tr>")
																		.addClass(
																				"InfoTr");
																tr
																		.append(
																				$(
																						"<td></td>")
																						.append(
																								"管理员"))
																		.append(
																				$(
																						"<td></td>")
																						.append(
																								this.title))
																		.append(
																				$(
																						"<td></td>")
																						.append(
																								this.time));
																var td = $(
																		"<td></td>")
																		.append(
																				"<button onclick='findNews(this)' anid="
																						+ this.anid
																						+ " class='btn btn-default'><i class='glyphicon glyphicon-edit'></i>查看</button>")
																		.append(
																				"<button onclick='deleteNews(this)' anid="
																						+ this.anid
																						+ " class='btn btn-primary'><i class='glyphicon glyphicon-trash'></i>删除</button>");
																tr.append(td);
																tr
																		.appendTo(table);
															});
										}
									}
								});
					});
	function deleteNews(but) {
		if (confirm("您确定要删除吗?")) {
			$
					.ajax({
						type : "post",
						url : "${pageContext.request.contextPath}/adminNotice/deleteByid.action",
						dataType : "json",
						data : {
							"anid" : $(but).attr("anid")
						},
						success : function(data) {
							if (data.satus = 200) {
								alert("删除成功");
								$(but).parent().parent().hide();
								console.log(data);
							} else {
								alert(data.msg);
							}
						}
					});
		}
	}
	function findNews(but) {
		$
				.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/adminNotice/findByAnid.action",
					dataType : "json",
					data : {
						"anid" : $(but).attr("anid")
					},
					success : function(data) {
						if (data.satus = 200) {
							console.log(data);
							document.getElementById("questionTitle").innerHTML = data.data.title;
							document.getElementById("questionText").innerHTML = data.data.text;
							$("#checkquestion").modal();
						} else {
							alert(data.msg);
						}
					}
				});
	}
	var thisPage = 0;
	$("#MyQuestion").click(function() {
		$(".MyQuestionTr").remove();
		thisPage = 0;
		toPage(1);
	});

	function toPage(pn) {
		$
				.ajax({
					url : "${APP_PATH}/qanda/findByTid.action",
					type : "POST",
					data : {
						"page" : pn
					},
					success : function(result) {
						if (result.status == 200) {
							console.log(result);
							$(".MyQuestionTr").remove();
							var table = $("#myQuestionTable");
							$
									.each(
											result.data.list,
											function() {
												var tr = $("<tr></tr>")
														.addClass(
																"MyQuestionTr");
												tr
														.append(
																$("<td><input type='checkbox' value='"+ this.qid +"' name='sixinChk'></td>"))
														.append(
																$("<td></td>")
																		.append(
																				this.cname))
														.append(
																$("<td></td>")
																		.append(
																				this.osname))
														.append(
																$("<td></td>")
																		.append(
																				this.time));
												var td = $("<td></td>")
														.append(
																"<button onclick='findQuestion(this)' qid="
																		+ this.qid
																		+ " class='btn btn-default'><i class='glyphicon glyphicon-edit'></i>查看</button>")
														.append(
																"<button onclick='deleteQuestion(this)' qid="
																		+ this.qid
																		+ " class='btn btn-primary'><i class='glyphicon glyphicon-trash'></i>删除</button>");
												tr.append(td);
												tr.appendTo(table);
											});
							showPage("sixinShowPageDiv", "toPage", result.data);
						}
					}
				});
	}

	$("#sixinChox").click(
			function() {
				$("input[type=checkbox][name=sixinChk]").prop("checked",
						$(this).prop("checked"));
			});
	$(document)
			.on(
					"click",
					"input[type=checkbox][name=sixinChk]",
					function() {
						var flag = $("input[type=checkbox][name=sixinChk]:checked").length == $("input[type=checkbox][name=sixinChk]").length;
						$("#sixinChox").prop("checked", flag);

					});
	function deletebatch() {
		var str = "";
		var i = 0;
		$.each($("input[type=checkbox][name=sixinChk]"), function() {
			if ($(this).prop("checked")) {
				i++;
				str += $(this).prop("value") + ",";
			}
		});
		if (str == "") {
			alert("您还没有选择要删除的数据");
			return;
		}
		if (confirm("您确定要删除选中这" + i + "条数据吗?")) {
			$
					.ajax({
						type : "post",
						url : "${pageContext.request.contextPath}/qanda/deleteByListQid.action",
						data : {
							"qids" : str,
						},
						dataType : "json",
						success : function(data) {
							alert("删除成功");
							toPage(thisPage);
						}
					});
		}
	}

	var qid;
	function findQuestion(but) {
		qid = $(but).attr("qid");
		$
				.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/qanda/findByQid.action",
					dataType : "json",
					data : {
						"qid" : $(but).attr("qid")
					},
					success : function(data) {
						if (data.satus = 200) {
							document.getElementById("questionModalText").innerHTML = data.data[0].osname
									+ ":" + data.data[0].text;
							$
									.ajax({
										type : "post",
										url : "${pageContext.request.contextPath}/qanda/findAllAnswer.action",
										dataType : "json",
										data : {
											"qid" : $(but).attr("qid")
										},
										success : function(data) {
											if (data.satus = 200) {
												$
														.each(
																data.data,
																function() {
																	console
																			.log(this);
																	if (this.typea == "0") {
																		document
																				.getElementById("questionModalText").innerHTML += "<br>"
																				+ this.osname
																				+ ":"
																				+ this.text;
																		$(
																				"#questionModalText")
																				.append(
																						$("<i class='timeSpan'>"
																								+ this.time
																								+ "</i>"));
																	} else {
																		document
																				.getElementById("questionModalText").innerHTML += "<br>"
																				+ "我:"
																				+ this.text;
																		$(
																				"#questionModalText")
																				.append(
																						$("<i class='timeSpan'>"
																								+ this.time
																								+ "</i>"));
																	}
																});
											}
										}
									});
							$("#questionModal").modal();
							console.log(data);
						} else {
							alert(data.msg);
						}
					}
				});
	}
	function deleteQuestion(but) {
		if (confirm("您确定要删除吗?")) {
			$
					.ajax({
						type : "post",
						url : "${pageContext.request.contextPath}/qanda/deleteByQid.action",
						dataType : "json",
						data : {
							"qid" : $(but).attr("qid")
						},
						success : function(data) {
							if (data.satus = 200) {
								alert("删除成功");
								$(but).parent().parent().hide();
								console.log(data);
							} else {
								alert(data.msg);
							}
						}
					});
		}
	}

	function reply() {
		$
				.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/qanda/addTeacherReply.action",
					dataType : "json",
					data : {
						"qid" : qid,
						"text" : $("textarea[name=questionModalText2]").val(),
					},
					success : function(data) {
						if (data.satus = 200) {
							console.log(data);
							document.getElementById("questionModalText").innerHTML += "<br>"
									+ "我:"
									+ $("textarea[name=questionModalText2]")
											.val();
							$("textarea[name=questionModalText2]").val("");
							alert("回复成功");
						} else {
							alert(data.msg);
						}
					}
				});
	}
</script>
<!-- 日期选择器 -->
<script type="text/javascript">
	$("#datefix").jeDate({
		fixedCell : "refix",
		hmsSetVal : {
			hh : 00,
			mm : 00,
			ss : 00
		},
		initAddVal : {
			MM : "+3",
			DD : "+2"
		},
		minDate : '2016-06-16',
		maxDate : '2025-06-16',
		format : "YYYY-MM-DD hh:mm:ss",
		zIndex : 3000,
		choosefun : function(elem, val, date) {
			console.log(val)
			console.log(date)
		},
		okfun : function(elem, val, date) {
			console.log(val)
			console.log(date)
		}
	})
	console.log($.timeStampDate("2017-11-16 10:35:22", false))
	console.log($.timeStampDate("1513391722", true))
	var cancel = {
		minDate : '2015-06-16',
		maxDate : '2017-12-16'
	}
	var opts = $.extend({
		type : "je",
		minDate : undefined,
		maxDate : undefined
	}, cancel);
	if (opts.type == "je") {
		$("#optsdate").jeDate({
			isinitVal : true,
			festival : true,
			trigger : "click mouseenter focus",
			isTime : false,
			ishmsVal : false,
			minDate : opts.minDate,
			maxDate : opts.maxDate,
			format : "YYYY-MM-DD hh:mm",
			zIndex : 3000,
			okfun : function(elem, val) {
				alert(elem)
			}
		})
	}

	//实现日期选择联动
	var start = {
		format : 'YYYY-MM-DD',
		minDate : '2014-06-16 23:59:59', //设定最小日期为当前日期
		//festival:true,
		maxDate : $.nowDate({
			DD : 0
		}), //最大日期
		choosefun : function(elem, datas) {
			end.minDate = datas; //开始日选好后，重置结束日的最小日期
			endDates();
		},
		okfun : function(elem, datas) {
			alert(datas)
		}
	};
	var end = {
		format : 'YYYY年MM月DD日',
		minDate : $.nowDate({
			DD : 0
		}), //设定最小日期为当前日期
		//festival:true,
		maxDate : '2099-06-16 23:59:59', //最大日期
		choosefun : function(elem, datas) {
			start.maxDate = datas; //将结束日的初始值设定为开始日的最大日期
		}
	};
	function endDates() {
		end.trigger = false;
		$("#inpend").jeDate(end);
	}
	$("#inpstart").jeDate(start);
	$("#inpend").jeDate(end);

	$("#date01").jeDate({
		isinitVal : true,
		//festival:true,
		ishmsVal : false,
		minDate : '2016-06-16 23:59:59',
		maxDate : $.nowDate({
			DD : 100
		}),
		format : "YYYY-MM-DD hh:mm:ss",
		zIndex : 3000,
	})
	$("#date02").jeDate({
		isinitVal : true,
		isClear : true,
		//festival:true,
		ishmsVal : false,
		minDate : '2016-06-16 23:59:59',
		maxDate : $.nowDate({
			DD : 100
		}),
		format : "YYYY-MM-DD hh:mm:ss",
		zIndex : 3000,
	})
</script>

<!-- 信息管理zb -->
<script type="text/javascript">
	/* 基本信息 */
	var tid = "${user_teacher.tid}";
	//alert(tid);
	/* 回写 */
	$.ajax({
		type : "GET",
		dataType : 'json',
		url : "${APP_PATH}/teacher/selectByPrimaryKeyJson.action?tid=" + tid,
		success : function(data) {
			if (data.status == 200) {
				//alert("成功");
				console.log(data);
				$("#nickname").val(data.data.username);
				$("#e_mail").val(data.data.email);
				$("#datepicker").val(data.data.phone);
				if(data.data.qq == 0){
					$("#qq").val("");
				}else{
					$("#qq").val(data.data.qq);
				}
				$("#redesc").val(data.data.redesc);
			}
		},
	});

	/* 修改 */
	$("#update_Info").click(function() {
		if($("#nickname").val() == ""){
			alert("姓名不能为空");
			return false;
		}
		//alert($("#myInfo").serialize());
		$.ajax({
			type : "POST",
			url : "${APP_PATH}/teacher/updateByPrimaryKeyJson.action",
			data : {
				tid : tid,
				username : $("#nickname").val(),
				email : $("#e_mail").val(),
				phone : $("#datepicker").val(),
				qq : $("#qq").val(),
				redesc : $("#redesc").val()
			},
			success : function(data) {
				if (data.status == 200) {
					alert("更新成功");
				} else {
					alert(data.msg);
				}
			},
			error : function() {
				alert("error");
			}
		});
	});
	
	//alert($("#e_mail").val());
	if($("#e_mail").val() != ""){
		$("#e_mail").change(function() {
			var email = $("#e_mail").val();
			var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if (!regEmail.test(email)) {
				//alert("邮箱格式不正确");
				show_validate_msg("#e_mail", "error", "邮箱格式不正确");
				return false;
			} else {
				show_validate_msg("#e_mail", "success", "");
			}
			;
		});
	}
	if($("#datepicker").val() != ""){
		$("#datepicker").change(function() {
			var phone = $("#datepicker").val();
			var regphone = /^1[34578]\d{9}$/;
			if (!regphone.test(phone)) {
				//alert("邮箱格式不正确");
				show_validate_msg("#datepicker", "error", "手机号码格式不正确");
				return false;
			} else {
				show_validate_msg("#datepicker", "success", "");
			}
			;
		});
	}
	if($("#qq").val() != ""){
		$("#qq").change(function() {
			var qq = $("#qq").val();
			var regqq = /^[1-9][0-9]{4,9}$/;
			if (!regqq.test(qq)) {
				//alert("邮箱格式不正确");
				show_validate_msg("#qq", "error", "QQ号码格式不正确");
				return false;
			} else {
				show_validate_msg("#qq", "success", "");
			}
			;
		});
	}
	//显示校验信息
	function show_validate_msg(ele, status, msg) {
		//清除校验状态
		$(ele).parent().removeClass("has-success has-error");
		$(ele).next("span").text("");
		if ("success" == status) {
			$(ele).parent().addClass("has-success");
			$(ele).next("span").text(msg);
		} else if ("error" == status) {
			$(ele).parent().addClass("has-error");
			$(ele).next("span").text(msg);
		}
	}

	/* 修改密码 */
	$("#update_pwd").click(function() {
		updatePass();
	});	
	
	function updatePass() {
		if ($("#newpassword").val() == ""
				|| $("#againpassword").val() == "") {
			alert("密码不能为空");
			return false;
		}
		if ($("#newpassword").val() != $("#againpassword").val()) {
			alert("俩次密码不一致");
			return false;
		}
		
		
		$.ajax({
			type : "GET",
			url : "${APP_PATH}/teacher/selectByPrimaryKeyJson.action?tid="
					+ tid,
			success : function(data) {
				if (data.status == 200) {
					if (data.data.pwd != $(
							"#oldpassword").val()) {
						alert("旧密码错误");
					} else {
						$.ajax({
							type : "POST",
							url : "${APP_PATH}/teacher/updatePassJson.action",
							data : {
								tid : tid,
								pwd : $("#newpassword").val()
							},
							success : function(data) {
								if (data.status == 200) {
									alert("修改成功，请重新登录！");
									window.location.href = "${APP_PATH}/front/index.jsp";
								} else {
									alert(data.msg);
								}
							},
							error : function() {
								alert("error");
							}
						});
					}
				}
			},
			error : function() {
				alert("error");
			}
		});
	}
</script>


<!-- 我的课程 zb -->
<script type="text/javascript">
	/*显示课程  */
	showMyCourse();
	function showMyCourse() {

		$("#myCourse")
				.click(
						function() {
							$
									.ajax({
										url : "${APP_PATH}/course/SelectCourseBytid.action",
										type : "POST",
										success : function(data) {
											if (data.status == 200) {
												if (data.data == "") {
													var ele2 = $("#showCourse ul");
													ele2.empty();
													$("#showCourse ul p")
															.remove();
													$("#showCourse ul")
															.append(
																	"<p class='pstyle'>还没有自己的课程，快去添加课程！</p>");
													return false;
												}
												var ele = $("#showCourse ul");
												ele.empty();
												$.each(data.data,function() {
													var img = this.image;								
													if(img.indexOf(".")>0){
														/* var img=$("<i>"+this.cname+"</i>");  */
														var img = $("<img></img>").attr("src","${APP_PATH}"+ this.image); 	
													}else{
														 /* var img = $("<img></img>").attr("src","${APP_PATH}"+ this.image); */   
														  var img=$("<span>"+this.cname+"</span>");  	   
													}	
														var a1 = $("<a class='showCourse_sImg'></a>");
														var a2 = $("<a class='aH'></a>").attr("href","${APP_PATH}/resource/showCourse.action?cid="+ this.cid);
														var h4 = $("<h4 style='margin-bottom: 0px;'></h4>").append(this.cname).append("<br>"+this.dbMajor.mname);
														/* 图片上层 */
														var span = $("<span class='hide'></span>"), p = $("<p cid="+this.cid+" class='hide'><button class='btn btn-success edit' id=edit"+this.cid+">编辑</button>"
															+ "<button class='btn btn-warning bbb manage' id=manage"+this.cid+">管理</button>"
															+ "<button class='btn btn-danger ccc delete' id=delete"+this.cid+">删除</button></p>");
														var li = $("<li></li>");
															a1.append(img);
															li.append(a1).append(a2.append(h4)).append(span).append(p);
															li.appendTo(ele);
												});

												//鼠标移上去的操作
												$("#showCourse ul li").each(function() {
													$(this).on('mouseover',function() {
														$(this).children("span").removeClass("hide");
														$(this)	.children("p").removeClass("hide");
													});
													$(this).on('mouseout',function() {
														$(this).children("span").addClass("hide");
														$(this).children("p").addClass("hide");
													});
												});

											} else {
												alert(data.msg);
											}
										}
									});
						});
	}

	/* 回写课程 */
	function findCourse(cid) {
		var b = $("#fidtwo option:first").text();
		$("#fidtwo").html('<option>' + b + '</option>');
		$.ajax({
			type : "post",
			dataType : 'json',
			url : "${APP_PATH}/course/SelectCourseJsonByCid.action",
			data : {
				cid : cid
			},
			success : function(data) {
				//console.log(data);
				$("#coursecname").val(data.cname);
				$("#iidtwo option:selected").text(data.dbInterest.iname);
				$("#iidtwo option:selected").val(data.dbInterest.iid);
				$("#fidtwo option:selected").text(data.dbFangxiang.fname);
				$("#fidtwo option:selected").val(data.dbFangxiang.fid);
				$("#courseredesc").text(data.redesc);
				/* $("#coursetid").val(data.dbTeacher.tid); */
				$("#grade_update option:selected").text(data.grade);
				$("#grade_update option:selected").val(data.grade);
				$("#mid_update option:selected").text(data.dbMajor.mname);
				$("#mid_update option:selected").val(data.dbMajor.mid);
				var dataorder = data.iorder;
				function getSex() {
					var sex = $(".courseRadio input");
					//console.log(sex);
					for ( var i = 0; i < sex.length; i++) {
						var r = sex[i];
						if (r.value == data.iorder.toString()) {
							r.checked = true;
							break;
						}
					}
				}
				getSex();
				$(".cid").val(data.cid);
				//console.log($(".cid").val()); 		            		            
			},
			error : function() {
				alert("error");
			}

		});

		/* 显示专业 */
		$.ajax({
			type : "POST",
			dataType : 'json',
			url : "${APP_PATH}/major/findAllJson.action",
			success : function(data) {
				if (data.status == 200) {
					var citySelect = document.getElementById("mid_update");
					// 获取select中的所有子元素
					var cityOptionArray = citySelect
							.getElementsByTagName("option");
					while (cityOptionArray.length > 1) {//这里只控制循环的次数
						citySelect.removeChild(cityOptionArray[1]);//只删除1下标，不会删除0
					}

					$.each(data.data, function() {
						var optionEle = $("<option></option>").append(
								this.mname).attr("value", this.mid);
						optionEle.appendTo("#mid_update");
					});
				}
				return false;
			},
		});

		$('#myModalCourse').modal();
		//console.log(cid);
	}

	/* 修改课程 */
	$("#edit_btn").click(function() {
		if (jiaoyan2() == false) {
			return false;
		}
		//alert($("#myModalCourse form").serialize());
		var str = "#myModalCourse form";
		var format = new FormData($(str)[0]);
		//alert(format);
		$.ajax({
			type : "POST",
			dataType : 'json',
			url : "${APP_PATH}/course/updateCourseJson.action",
			processData : false,
			contentType : false,
			data : format,
			success : function(data) {
				if (data.status == 200) {
					$('#myModalCourse').modal('hide');
					alert("修改成功");
					showMyCourse();
					$('#myCourse').trigger("click");
					reset_form("#myModalCourse form");
				}else if(data.status == 502){
					alert(data.msg);
				}
				return false;
			},
		});
	});

	function jiaoyan2() {
		var flag = true;
		$(".sBitian").text("");
		var kecheng = $("#sKecheng2 input").val();
		var zhuangye = $("#szhuangye2 select").val();
		var brief = $("#sBrief2 textarea").val();
		var photo = $("#sPhoto2 input").val();

		if (kecheng == "" || kecheng == null) {
			$("#sKecheng2 i").text("必填");
			flag = false;
		}
		if (zhuangye == "" || zhuangye == null) {
			$("#szhuangye2 i").append("必填");
			flag = false;
		}
		if (brief == "" || brief == null) {
			$("#sBrief2 i").append("必填");
			flag = false;
		}
		if (photo != "") {
			if (!/\.(gif|jpg|jpeg|bmp|png)$/.test(photo)) {
				alert("图片类型必须是.gif,jpeg,jpg,bmp,png中的一种");
				return false;
			}
		}
		return flag;
	}

	/* ajax显示信息 */
	var mydate = new Date();
	var y = mydate.getFullYear();
	var m = mydate.getMonth() + 1;
	//alert(y+"年"+m+"月");
	if (m >= 7) {
		for ( var i = 0; i < 4; i++) {
			var option = $("<option></option>").attr("value", y - i).append(
					y - i);
			option.appendTo("#grade1");
		}
	} else {
		for ( var i = 1; i <= 4; i++) {
			var option = $("<option></option>").attr("value", y - i).append(
					y - i);
			option.appendTo("#grade1");
		}
	}

	if (m >= 7) {
		for ( var i = 0; i < 4; i++) {
			var option = $("<option></option>").attr("value", y - i).append(
					y - i);
			option.appendTo("#grade_update");
		}
	} else {
		for ( var i = 1; i <= 4; i++) {
			var option = $("<option></option>").attr("value", y - i).append(
					y - i);
			option.appendTo("#grade_update");
		}
	}

	/* 显示专业 */
	$("#add_btn").click(
			function() {
				/* $("#mid").empty(); */

				$.ajax({
					type : "POST",
					dataType : 'json',
					url : "${APP_PATH}/major/findAllJson.action",
					success : function(data) {
						if (data.status == 200) {
							var citySelect = document.getElementById("mid");
							// 获取select中的所有子元素
							var cityOptionArray = citySelect
									.getElementsByTagName("option");
							while (cityOptionArray.length > 1) {//这里只控制循环的次数
								citySelect.removeChild(cityOptionArray[1]);//只删除1下标，不会删除0
							}

							$.each(data.data, function() {
								var optionEle = $("<option></option>").append(
										this.mname).attr("value", this.mid);
								optionEle.appendTo("#mid");
							});
						}
						return false;
					},
				});
			});

	//表单完整重置方法 
	function reset_form(ele) {
		//去除文本中的内容
		$(ele)[0].reset();
	}

	function emptyAdd() {
		$("#sPhoto input").val("");
		$(".sBitian").text("");
	}
	/* 添加课程 */
	var flag = true;
	$("#course_add").click(function() {
		if (flag) {
			flag = false;
			$("#course_add").attr("disabled", "disabled");
		
			if (jiaoyan() == false) {
				flag = true;
				$("#course_add").removeAttr("disabled");
				return false;
			}
			//alert("wancheng");
	
			//alert($("#myModalCourse form").serialize());
			var str = "#myModalAdd form";
			var format = new FormData($(str)[0]);
			//alert(format);
			$.ajax({
				type : "POST",
				dataType : 'json',
				url : "${APP_PATH}/course/insertCourseJson.action",
				processData : false,
				contentType : false,
				data : format,
				success : function(data) {
					if (data.status == 200) {
						flag = true;
						$("#course_add").removeAttr("disabled");
						
						$('#myModalAdd').modal('hide');
						alert("添加成功");
						showMyCourse();
						$('#myCourse').trigger("click");
						reset_form("#myModalAdd form");							
					}else if(data.status == 502){
						alert(data.msg);
						flag = true;
						$("#course_add").removeAttr("disabled");
					}else{
						alert("出了点问题，请重试！");
						flag = true;
						$("#course_add").removeAttr("disabled");
					}
					//return false;
				},
			});
		}
	});

	function jiaoyan() {
		var flag = true;
		$(".sBitian").text("");
		var kecheng = $("#sKecheng input").val();
		var zhuangye = $("#szhuangye select").val();
		var brief = $("#sBrief textarea").val();
		var photo = $("#sPhoto input").val();

		if (kecheng == "" || kecheng == null) {
			$("#sKecheng i").text("必填");
			flag = false;
		}
		if (zhuangye == "" || zhuangye == null) {
			$("#szhuangye i").append("必填");
			flag = false;
		}
		if (brief == "" || brief == null) {
			$("#sBrief i").append("必填");
			flag = false;
		}
		/* if (photo == "" || photo == null) {
			$("#sPhoto i").append("必填");
			flag = false;
		} */
		if (photo != "") {
			//判断图片类型
			if (!/\.(gif|jpg|jpeg|bmp|png)$/.test(photo)) {
				alert("图片类型必须是.gif,jpeg,jpg,bmp,png中的一种");
				return false;
			}
			/* alert(photo);
			var img=new Image();
  			img.src=photo;
  			console.log(img);
  			var filesize = img.filesize; 
  			img.onload = function(){filesize=this.filesize;}; 
			alert(img.filesize);
			if(img.filesize>60){
			    alert("图片不大于60");
			} */
		}
		return flag;
	}

	$(document).on("click", ".edit", function() {
		var count = 0;
		$("#iidtwo").click(function() {
			count = 1;
		});
		$("#fidtwo").click(function() {
			if (count == 0) {
				alert("请先选择兴趣！");
			}
		});
		emptyAdd();
		$("#sPhoto2 input").val("");
		var cid = $(this).parent().attr("cid");
		findCourse(cid);
	});

	/*删除课程  */
	$(document).on("click", ".delete", function() {
		var ids = $(this).parent().attr("cid");
		var msg = "您确定要删除吗？";
		if (confirm(msg) == true) {
			$.ajax({
				type : "GET",
				dataType : 'json',
				url : "${APP_PATH}/course/deleteCourseJson.action?ids=" + ids,
				success : function(data) {
					if (data.status == 200) {
						$('#myModalCourse').modal('hide');
						alert("删除成功");
						showMyCourse();
						$('#myCourse').trigger("click");
						/* reset_form("#myModalAdd form"); */
					}
					return false;
				},
			});
		}
	});

	/* 管理按钮 */
	$(document)
			.on(
					"click",
					".manage",
					function() {
						var cid = $(this).parent().attr("cid");
						window.location.href = "${APP_PATH}/resource/Management.action?cid="
								+ cid;
					});

	$("#fid").click(function() {
		if ($("#iidOption").is(":selected")) {
			alert("请先选择兴趣！");
		}
	});
</script>




<!-- 添加部分--省市联动 -->
<script type="text/javascript">
	function createXMLHttpRequest() {
		try {
			return new XMLHttpRequest();
		} catch (e) {
			try {
				return new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				return new ActiveXObject("Micorsoft.XMLHTTP");
			}
		}
	}
	window.onload = function() {

		// 得到核心对象
		var xmlHttp = createXMLHttpRequest();
		//打开链接
		xmlHttp.open("GET", "<c:url value='/interest/findAllJson.action'/>",
				true);
		//发送
		xmlHttp.send(null);
		//添加监听
		xmlHttp.onreadystatechange = function() {
			if (xmlHttp.readyState == 4) {
				if (xmlHttp.status == 200) {
					// 执行服务器发送过来的json字符串，得到js的对象
					var proArray = eval("(" + xmlHttp.responseText + ")");
					for ( var i = 0; i < proArray.length; i++) {
						var pro = proArray[i];//得到每个pro对象
						//创建<option>元素
						var optionEle = document.createElement("option");
						// 给<option>元素的value属性赋值
						optionEle.value = pro.iid;//给<option>的实际值赋为pid，而不是name
						var textNode = document.createTextNode(pro.iname);//使用省名称来创建textNode
						optionEle.appendChild(textNode);//把textNode添加到option元素中

						//使用省名称来创建textNode
						document.getElementById("iid").appendChild(optionEle);
					}
				}
			}
		};

		/*
		2. 给<select id="pronvine">添加onchange监听
		 */
		document.getElementById("iid").onchange = function() {
			/*
			异步请求服务器，得到选择的省下所有市
			 */
			var xmlHttp = createXMLHttpRequest();
			xmlHttp
					.open(
							"POST",
							"<c:url value='/fangxiang/selectFangxiangJsonByiid.action'/>",
							true);
			// 设置请求头
			xmlHttp.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded");
			// 发送
			xmlHttp.send("iid=" + this.value);//用户选择的省
			// 添加监听
			xmlHttp.onreadystatechange = function() {
				if (xmlHttp.readyState == 4) {
					if (xmlHttp.status == 200) {
						/*
						清空<select id="city">中的选项
						 */
						var citySelect = document.getElementById("fid");
						// 获取select中的所有子元素
						var cityOptionArray = citySelect
								.getElementsByTagName("option");
						while (cityOptionArray.length > 1) {//这里只控制循环的次数
							citySelect.removeChild(cityOptionArray[1]);//只删除1下标，不会删除0
						}

						/*
						得到服务器发送过来的所有市
						 */
						var cityArray = eval("(" + xmlHttp.responseText + ")");
						// 循环遍历每个city对象，用来生成<option>元素添加到<select id="city">中
						for ( var i = 0; i < cityArray.length; i++) {
							var city = cityArray[i];//得到每个city对象
							// 创建<option>元素
							var optionEle = document.createElement("option");
							// 给<option>元素的value属性赋值
							optionEle.value = city.fid;//给<option>的实际值赋为cid，而不是name
							var textNode = document.createTextNode(city.fname);//使用省名称来创建textNode
							optionEle.appendChild(textNode);//把textNode添加到option元素中	
							// 把option元素添加到select元素中
							citySelect.appendChild(optionEle);
						}
					}
				}
			};
		};
	};
</script>
<!-- 修改部分--省市联动 -->
<script type="text/javascript">
	function createXMLHttpRequest() {
		try {
			return new XMLHttpRequest();
		} catch (e) {
			try {
				return new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				return new ActiveXObject("Micorsoft.XMLHTTP");
			}
		}
	}

	document.getElementById("iidtwo").onclick = function() {
		var obj = document.getElementById("iidtwo");
		for ( var i = obj.options.length - 1; i > 0; i--) {
			obj.options.remove(i);
		}
		//obj.options.length=0;                      	                       	            
		// 得到核心对象
		var xmlHttp = createXMLHttpRequest();
		//打开链接
		xmlHttp.open("GET", "<c:url value='/interest/findAllJson.action'/>",
				true);
		//发送
		xmlHttp.send(null);
		//添加监听
		xmlHttp.onreadystatechange = function() {
			if (xmlHttp.readyState == 4) {
				if (xmlHttp.status == 200) {
					// 执行服务器发送过来的json字符串，得到js的对象
					var proArray = eval("(" + xmlHttp.responseText + ")");
					for ( var i = 0; i < proArray.length; i++) {
						var pro = proArray[i];//得到每个pro对象
						//创建<option>元素
						var optionEle = document.createElement("option");
						// 给<option>元素的value属性赋值
						optionEle.value = pro.iid;//给<option>的实际值赋为pid，而不是name
						var textNode = document.createTextNode(pro.iname);//使用省名称来创建textNode
						optionEle.appendChild(textNode);//把textNode添加到option元素中

						//使用省名称来创建textNode
						document.getElementById("iidtwo")
								.appendChild(optionEle);
					}
				}
			}
		};

		/*
		2. 给<select id="pronvine">添加onchange监听
		 */
		document.getElementById("iidtwo").onclick = function() {
			var fidtwo = document.getElementById("fidtwo").options.length = 0;
			var xmlHttp = createXMLHttpRequest();
			xmlHttp
					.open(
							"POST",
							"<c:url value='/fangxiang/selectFangxiangJsonByiid.action'/>",
							true);
			// 设置请求头
			xmlHttp.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded");
			// 发送
			xmlHttp.send("iid=" + this.value);//用户选择的省

			// 添加监听
			xmlHttp.onreadystatechange = function() {
				if (xmlHttp.readyState == 4) {
					if (xmlHttp.status == 200) {
						/*
						清空<select id="city">中的选项
						 */
						var citySelect = document.getElementById("fidtwo");
						// 获取select中的所有子元素
						var cityOptionArray = citySelect
								.getElementsByTagName("option");
						while (cityOptionArray.length > 1) {//这里只控制循环的次数
							citySelect.removeChild(cityOptionArray[1]);//只删除1下标，不会删除0
						}

						/*
						得到服务器发送过来的所有市
						 */
						var cityArray = eval("(" + xmlHttp.responseText + ")");
						// 循环遍历每个city对象，用来生成<option>元素添加到<select id="city">中
						for ( var i = 0; i < cityArray.length; i++) {
							var city = cityArray[i];//得到每个city对象
							// 创建<option>元素
							var optionEle = document.createElement("option");
							// 给<option>元素的value属性赋值
							optionEle.value = city.fid;//给<option>的实际值赋为cid，而不是name
							var textNode = document.createTextNode(city.fname);//使用省名称来创建textNode
							optionEle.appendChild(textNode);//把textNode添加到option元素中

							// 把option元素添加到select元素中
							citySelect.appendChild(optionEle);
						}
					}
				}
			};
		};
	};
</script>

<script type="text/javascript">
	//全局总记录数，去最后一页
	var totalRecord, currentPage;

	$("#question").click(function() {
		//去首页
		to_page(1);
		to_page2(1);
	});

	//分页跳转
	function to_page(pn) {
		$
				.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/question/findQuestionByidJson.action",
					dataType : "json",
					data : {
						"id" : "${user_teacher.tid}",
						"page" : pn
					},
					success : function(data) {
						//console.log(result);
						//1.解析并显示员工数据
						if (data.data.list == "") {
							$("#myHaveQuestion ul p").remove();
							$("#myHaveQuestion ul").append(
									"<p class='pstyle'>没有提出问题，快去提问吧！</p>");
							return false;
						}
						buide_emps_table(data.data.list, "#myHaveQuestion ul");
						if (data.data.total >= 5) {
							//2.解析并显示分页信息
							buide_pqge_info(data, "#zb_page_info_area");
							//3.解析并显示分页条
							buide_pqge_nav(data, "#zb_page_nav_area");
						}
					}
				});
	}
	//解析并显示问题数据
	function buide_emps_table(data, ele) {
		$(ele).empty();
		$
				.each(
						data,
						function() {
							var li = $("<li></li>");
							var div = $("<div class='proDet'></div>");
							var h4 = $("<h4><a href='${APP_PATH }/answer/findByQidFront.action?qid="
									+ this.qid
									+ "'>"
									+ this.topic
									+ "</a></h4>");
							var span = $("<h6>" + this.contents + "</h6>");
							var p = $("<p><span class='release'>发布于："
									+ this.creattime
									+ "</span>"
									+ "<span class='aSpan'><a href='${APP_PATH }/answer/findByQidFront.action?qid="
									+ this.qid
									+ "'>回答("
									+ this.replycount
									+ ")</a>"
									+ "<a href='${APP_PATH }/answer/findByQidFront.action?qid="
									+ this.qid + "'>浏览(" + this.clickcount
									+ ")</a></span> </p>");

							div.append(h4).append(span).append(p);
							li.append(div);
							li.appendTo(ele);
						});
	}

	//解析并显示分页信息
	function buide_pqge_info(data, ele) {
		//清空
		$(ele).empty();
		$(ele).append(
				"当前" + data.data.pageNum + "页,总" + data.data.pages + "页,共"
						+ data.data.total + "记录数");
		//给全局总记录数赋值
		totalRecord = data.data.total;
		//保存当前页
		currentPage = data.data.pageNum;
	}

	//解析并显示分页条
	function buide_pqge_nav(data, ele) {
		//清空
		$(ele).empty();
		var ul = $("<ul></ul>").addClass("pagination");

		var firstPageLi = $("<li></li>").append(
				$("<a></a>").append("首页").attr("href", "#"));
		var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
		//判断前一页和首页能否被点击
		if (data.data.hasPreviousPage == false) {
			firstPageLi.addClass("disabled");
			prePageLi.addClass("disabled");
		} else {
			//为首页，下一页添加事件
			firstPageLi.click(function() {
				to_page(1);
			});
			prePageLi.click(function() {
				to_page(data.data.pageNum - 1);
			});
		}

		var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
		var lastPageLi = $("<li></li>").append(
				$("<a></a>").append("尾页").attr("href", "#"));
		//判断下一页和末页能否被点击
		if (data.data.hasNextPage == false) {
			nextPageLi.addClass("disabled");
			lastPageLi.addClass("disabled");
		} else {
			//为下一页页，末页添加事件
			nextPageLi.click(function() {
				to_page(data.data.pageNum + 1);
			});
			lastPageLi.click(function() {
				to_page(data.data.pages);
			});
		}

		//添加首页和前一页
		ul.append(firstPageLi).append(prePageLi);

		$.each(data.data.navigatepageNums, function(index, item) {
			var numLi = $("<li></li>").append($("<a></a>").append(item));
			//当前页突出显示
			if (data.data.pageNum == item) {
				numLi.addClass("active");
			}
			numLi.click(function() {
				to_page(item);
			});
			//添加页码
			ul.append(numLi);
		});

		//添加下一页和末页
		ul.append(nextPageLi).append(lastPageLi);

		var navEle = $("<nav></nav>").append(ul);
		navEle.appendTo(ele);
	}

	//分页跳转
	function to_page2(pn) {
		$
				.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/question/findAboutQuestionByidJson.action",
					dataType : "json",
					data : {
						"id" : "${user_teacher.tid}",
						"page" : pn
					},
					success : function(data) {
						//console.log(data.data);
						//1.解析并显示员工数据
						if (data.data.pagedList == "") {
							$("#aboutHaveQuestion ul p").remove();
							$("#aboutHaveQuestion ul").append(
									"<p class='pstyle2'>没有已参与的问题，快去回答问题吧！</p>");
							return false;
						}
						buide_emps_table2(data.data.pagedList,
								"#aboutHaveQuestion ul");
						if (data.data.totalCount >= 5) {
							//2.解析并显示分页信息
							buide_pqge_info2(data, "#zb_page_info_area2");
							//3.解析并显示分页条
							buide_pqge_nav2(data, "#zb_page_nav_area2");
						}
					}
				});
	}

	function buide_emps_table2(data, ele) {
		$(ele).empty();
		$
				.each(
						data,
						function() {
							var li = $("<li></li>");
							var div = $("<div class='proDet proDet1'></div>");
							var h4 = $("<h4><a href='${APP_PATH }/answer/findByQidFront.action?qid="
									+ this.qid
									+ "'>"
									+ this.topic
									+ "</a></h4>");
							var span = $("<h6>" + this.contents + "</h6>");
							var p = $("<p><span class='release'>发布于："
									+ this.creattime
									+ "</span>"
									+ "<span class='aSpan'><a href='${APP_PATH }/answer/findByQidFront.action?qid="
									+ this.qid
									+ "'>回答("
									+ this.replycount
									+ ")</a>"
									+ "<a href='${APP_PATH }/answer/findByQidFront.action?qid="
									+ this.qid + "'>浏览(" + this.clickcount
									+ ")</a></span> </p>");

							div.append(h4).append(span).append(p);
							li.append(div);
							li.appendTo(ele);
						});
	}

	//解析并显示分页信息
	function buide_pqge_info2(data, ele) {
		//清空
		$(ele).empty();
		$(ele).append(
				"当前" + data.data.nowPage + "页,总" + data.data.totalPage + "页,共"
						+ data.data.totalCount + "记录数");
		//给全局总记录数赋值
		totalRecord = data.data.totalCount;
		//保存当前页
		currentPage = data.data.nowPage;
	}

	//解析并显示分页条
	function buide_pqge_nav2(data, ele) {
		//清空
		$(ele).empty();
		var ul = $("<ul></ul>").addClass("pagination");

		var firstPageLi = $("<li></li>").append(
				$("<a></a>").append("首页").attr("href", "#"));
		var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
		//判断前一页和首页能否被点击
		if (data.data.nowPage == 1) {
			firstPageLi.addClass("disabled");
			prePageLi.addClass("disabled");
		} else {
			//为首页，下一页添加事件
			firstPageLi.click(function() {
				to_page2(1);
			});
			prePageLi.click(function() {
				to_page2(data.data.nowPage - 1);
			});
		}

		var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
		var lastPageLi = $("<li></li>").append(
				$("<a></a>").append("尾页").attr("href", "#"));
		//判断下一页和末页能否被点击
		if (data.data.totalPage == data.data.nowPage) {
			nextPageLi.addClass("disabled");
			lastPageLi.addClass("disabled");
		} else {
			//为下一页页，末页添加事件
			nextPageLi.click(function() {
				to_page2(data.data.nowPage + 1);
			});
			lastPageLi.click(function() {
				to_page2(data.data.totalPage);
			});
		}

		//添加首页和前一页
		ul.append(firstPageLi).append(prePageLi);
		var array = new Array();
		if (data.data.totalPage <= 5) {
			for ( var i = 1; i <= data.data.totalPage; i++) {
				array[i - 1] = i;
			}
		} else {
			var begin = data.data.nowPage - 2;
			var end = data.data.nowPage + 2;
			console.log(begin);
			if (begin < 1) {
				begin = 1;
				console.log(begin);
				end = 5;
			}
			if (end > data.data.totalPage) {
				begin = data.data.totalPage - 4;
				end = data.data.totalPage;
			}

			array[0] = begin;
			array[1] = begin + 1;
			array[2] = begin + 2;
			array[3] = begin + 3;
			array[4] = end;
			//console.log(array);
		}
		$.each(array, function(index, item) {
			var numLi = $("<li></li>").append($("<a></a>").append(item));
			//当前页突出显示
			if (data.data.nowPage == item) {
				numLi.addClass("active");
			}
			numLi.click(function() {
				to_page2(item);
			});
			//添加页码
			ul.append(numLi);
		});

		//添加下一页和末页
		ul.append(nextPageLi).append(lastPageLi);

		var navEle = $("<nav></nav>").append(ul);
		navEle.appendTo(ele);
	}
</script>
</body>
</html>