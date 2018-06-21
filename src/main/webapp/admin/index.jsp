<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv=X-UA-Compatible content="IE=edge,chrome=1">
<meta content=always name=referrer>
<meta name="renderer" content="webkit">

<title>信息工程学院后台管理</title>

<meta name="keywords" content="">
<meta name="description" content="">

<!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

<link rel="shortcut icon" href="favicon.ico">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
</head>

<body class="fixed-sidebar full-height-layout gray-bg"
	style="overflow:hidden">
	<div id="wrapper">
		<!--左侧导航开始-->
		<nav class="navbar-default navbar-static-side" role="navigation">
		<div class="nav-close">
			<i class="fa fa-times-circle"></i>
		</div>
		<div class="sidebar-collapse">
			<ul class="nav" id="side-menu">
				<li class="nav-header">
					<div class="dropdown profile-element">
						<span><img alt="image" class="img-circle"
							src="img/profile_small.jpg" /> </span> <a data-toggle="dropdown"
							class="dropdown-toggle" href="#"> <span class="clear">
								<span class="block m-t-xs" id="adminName"><strong
									class="font-bold">${sessionScope.admin.uname }</strong> </span> <span
								class="text-muted text-xs block">超级管理员<b class="caret"></b>
							</span> </span> </a>
						<ul class="dropdown-menu animated fadeInRight m-t-xs">
							<li><a class="J_menuItem" href="adminUpdatePass.jsp">修改密码</a>
							</li>
							<li><a href="${APP_PATH}/admin/signOut.action">安全退出</a>
							</li>
						</ul>
					</div>
					<div class="logo-element"></div>
				</li>
				<!--   <li>
                        <a href="#">
                            <i class="fa fa-home"></i>
                            <span class="nav-label">主页</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a class="J_menuItem" href="index_v1.html" data-index="0">主页示例一</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="index_v2.html">主页示例二</a>
                            </li>
                        </ul>

                    </li> -->

				<!--以下为预留消息-->
				<!-- <li>
                        <a href="mailbox.html"><i class="fa fa-envelope"></i> <span class="nav-label">信箱 </span><span class="label label-warning pull-right">16</span></a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="mailbox.html">收件箱</a>
                            </li>
                            <li><a class="J_menuItem" href="mail_detail.html">查看邮件</a>
                            </li>
                            <li><a class="J_menuItem" href="mail_compose.html">写信</a>
                            </li>
                        </ul>
                    </li> -->

				<li class=""><a href="#"><i class="fa fa-table"></i> <span
						class="nav-label">信息管理</span><span class="fa arrow"></span> </a>
					<ul class="nav nav-second-level collapse" aria-expanded="false"
						style="height: 0px;">
						<li><a class="J_menuItem"
							href="${APP_PATH }/student/findAll.action" data-index="82">学生信息
						</a>
						</li>
						<li><a class="J_menuItem"
							href="${APP_PATH }/teacher/findAll.action" data-index="82">老师信息
						</a>
						</li>
						<li><a class="J_menuItem"
							href="${APP_PATH }/course/findAll.action" data-index="82">课程信息
								<span class="label label-danger pull-right"></span> </a>
						</li>
						<li><a class="J_menuItem"
							href="${APP_PATH }/major/findAll.action" data-index="82">专业信息
								<span class="label label-danger pull-right"></span> </a>
						</li>
						<li><a class="J_menuItem"
							href="${APP_PATH }/interest/findAll.action" data-index="82">兴趣方向
								<span class="label label-danger pull-right"></span> </a>
						</li>
						<li><a class="J_menuItem"
							href="${APP_PATH }/classname/findAll.action" data-index="82">班级信息
								<span class="label label-danger pull-right"></span> </a>
						</li>
						<li><a class="J_menuItem"
							href="${APP_PATH }/carousel/findAll.action" data-index="82">轮播信息
								<span class="label label-danger pull-right"></span> </a>
						</li>
						<li><a class="J_menuItem"
							href="${APP_PATH }/question/findAll.action" data-index="82">问答信息
								<span class="label label-danger pull-right"></span> </a>
						</li>
					</ul>
				</li>

				<li><a href="#"><i class="fa fa-edit"></i> <span
						class="nav-label">通知</span><span class="fa arrow"></span> </a>
					<ul class="nav nav-second-level">
						<li><a href="${APP_PATH }/adminNotice/showSendNotice.action"
							data-index="82" class="J_menuItem" href="form_basic.html">发送通知</a>
						</li>
						<li><a class="J_menuItem"
							href="${APP_PATH }/adminNotice/findAllNotice.action">通知管理</a>
						</li>

					</ul>
				</li>


				<li><a href="#"><i class="fa fa-edit"></i> <span
						class="nav-label">统计</span><span class="fa arrow"></span> </a>
					<ul class="nav nav-second-level">
						<li><a href="${APP_PATH }/admin/statistics_drawUpon.jsp"
							data-index="82" class="J_menuItem">开出</a></li>
						<li><a class="J_menuItem"
							href="${APP_PATH }/admin/statisticsReource.action">资源</a>
						</li>
						<li><a class="J_menuItem"
							href="${APP_PATH }/admin/statisticsvideo.action">视频</a>
						</li>
						<li><a class="J_menuItem"
							href="${APP_PATH }/admin/statisticswork.action">作业</a>
						</li>
					</ul>
				</li>



			</ul>
		</div>
		</nav>
		<!--左侧导航结束-->
		<!--右侧部分开始-->
		<div id="page-wrapper" class="gray-bg dashbard-1">
			<div class="row content-tabs">
				<button class="roll-nav roll-left J_tabLeft">
					<i class="fa fa-backward"></i>
				</button>
				<nav class="page-tabs J_menuTabs">
				<div class="page-tabs-content">
					<a href="javascript:;" class="active J_menuTab"
						data-id="index_v1.html">首页</a>
				</div>
				</nav>
				<button class="roll-nav roll-right J_tabRight">
					<i class="fa fa-forward"></i>
				</button>
				<div class="btn-group roll-nav roll-right">
					<button class="dropdown J_tabClose" data-toggle="dropdown">
						关闭操作<span class="caret"></span>
					</button>
					<ul role="menu" class="dropdown-menu dropdown-menu-right">
						<li class="J_tabShowActive"><a>定位当前选项卡</a>
						</li>
						<li class="divider"></li>
						<li class="J_tabCloseAll"><a>关闭全部选项卡</a>
						</li>
						<li class="J_tabCloseOther"><a>关闭其他选项卡</a>
						</li>
					</ul>
				</div>
				<a href="${APP_PATH}/admin/signOut.action"
					class="roll-nav roll-right J_tabExit"><i
					class="fa fa fa-sign-out"></i> 退出</a>
			</div>
			<div class="row J_mainContent" id="content-main">
				<iframe class="J_iframe" name="iframe0" width="100%" height="100%"
					src="index_v1.html" frameborder="0" data-id="index_v1.html"
					seamless></iframe>
			</div>
			<!-- <div class="footer">
                <div class="pull-right">&copy; 2014-2015 <a href="http://www.zi-han.net/" target="_blank">zihan's blog</a>
                </div>
            </div> -->
		</div>
		<!--右侧部分结束-->
		<!--右侧边栏开始-->
		<div id="right-sidebar">
			<div class="sidebar-container">

				<ul class="nav nav-tabs navs-3">

					<li class="active"><a data-toggle="tab" href="#tab-1"> <i
							class="fa fa-gear"></i> 主题 </a>
					</li>
					<!-- <li class=""><a data-toggle="tab" href="#tab-2">
                        通知
                    </a>
                    </li> -->

				</ul>

				<div class="tab-content">
					<div id="tab-1" class="tab-pane active">
						<div class="sidebar-title">
							<h3>
								<i class="fa fa-comments-o"></i> 主题设置
							</h3>
							<small><i class="fa fa-tim"></i>
								你可以从这里选择和预览主题的布局和样式，这些设置会被保存在本地，下次打开的时候会直接应用这些设置。</small>
						</div>
						<div class="skin-setttings">
							<div class="title">主题设置</div>
							<div class="setings-item">
								<span>收起左侧菜单</span>
								<div class="switch">
									<div class="onoffswitch">
										<input type="checkbox" name="collapsemenu"
											class="onoffswitch-checkbox" id="collapsemenu"> <label
											class="onoffswitch-label" for="collapsemenu"> <span
											class="onoffswitch-inner"></span> <span
											class="onoffswitch-switch"></span> </label>
									</div>
								</div>
							</div>
							<div class="setings-item">
								<span>固定顶部</span>

								<div class="switch">
									<div class="onoffswitch">
										<input type="checkbox" name="fixednavbar"
											class="onoffswitch-checkbox" id="fixednavbar"> <label
											class="onoffswitch-label" for="fixednavbar"> <span
											class="onoffswitch-inner"></span> <span
											class="onoffswitch-switch"></span> </label>
									</div>
								</div>
							</div>
							<div class="setings-item">
								<span> 固定宽度 </span>

								<div class="switch">
									<div class="onoffswitch">
										<input type="checkbox" name="boxedlayout"
											class="onoffswitch-checkbox" id="boxedlayout"> <label
											class="onoffswitch-label" for="boxedlayout"> <span
											class="onoffswitch-inner"></span> <span
											class="onoffswitch-switch"></span> </label>
									</div>
								</div>
							</div>
							<div class="title">皮肤选择</div>
							<div class="setings-item default-skin nb">
								<span class="skin-name "> <a href="#" class="s-skin-0">
										默认皮肤 </a> </span>
							</div>
							<div class="setings-item blue-skin nb">
								<span class="skin-name "> <a href="#" class="s-skin-1">
										蓝色主题 </a> </span>
							</div>
							<div class="setings-item yellow-skin nb">
								<span class="skin-name "> <a href="#" class="s-skin-3">
										黄色/紫色主题 </a> </span>
							</div>
						</div>
					</div>
					<div id="tab-2" class="tab-pane">

						<div class="sidebar-title">
							<h3>
								<i class="fa fa-comments-o"></i> 最新通知
							</h3>
							<small><i class="fa fa-tim"></i> 您当前有10条未读信息</small>
						</div>

						<div>

							<div class="sidebar-message">
								<a href="#">
									<div class="pull-left text-center">
										<img alt="image" class="img-circle message-avatar"
											src="img/a1.jpg">

										<div class="m-t-xs">
											<i class="fa fa-star text-warning"></i> <i
												class="fa fa-star text-warning"></i>
										</div>
									</div>
									<div class="media-body">

										据天津日报报道：瑞海公司董事长于学伟，副董事长董社轩等10人在13日上午已被控制。 <br> <small
											class="text-muted">今天 4:21</small>
									</div> </a>
							</div>
							<div class="sidebar-message">
								<a href="#">
									<div class="pull-left text-center">
										<img alt="image" class="img-circle message-avatar"
											src="img/a2.jpg">
									</div>
									<div class="media-body">
										HCY48之音乐大魔王会员专属皮肤已上线，快来一键换装拥有他，宣告你对华晨宇的爱吧！ <br> <small
											class="text-muted">昨天 2:45</small>
									</div> </a>
							</div>
							<div class="sidebar-message">
								<a href="#">
									<div class="pull-left text-center">
										<img alt="image" class="img-circle message-avatar"
											src="img/a3.jpg">

										<div class="m-t-xs">
											<i class="fa fa-star text-warning"></i> <i
												class="fa fa-star text-warning"></i> <i
												class="fa fa-star text-warning"></i>
										</div>
									</div>
									<div class="media-body">
										写的好！与您分享 <br> <small class="text-muted">昨天 1:10</small>
									</div> </a>
							</div>
							<div class="sidebar-message">
								<a href="#">
									<div class="pull-left text-center">
										<img alt="image" class="img-circle message-avatar"
											src="img/a4.jpg">
									</div>

									<div class="media-body">
										国外极限小子的炼成！这还是亲生的吗！！ <br> <small class="text-muted">昨天
											8:37</small>
									</div> </a>
							</div>
							<div class="sidebar-message">
								<a href="#">
									<div class="pull-left text-center">
										<img alt="image" class="img-circle message-avatar"
											src="img/a8.jpg">
									</div>
									<div class="media-body">

										一只流浪狗被收留后，为了减轻主人的负担，坚持自己觅食，甚至......有些东西，可能她比我们更懂。 <br> <small
											class="text-muted">今天 4:21</small>
									</div> </a>
							</div>
							<div class="sidebar-message">
								<a href="#">
									<div class="pull-left text-center">
										<img alt="image" class="img-circle message-avatar"
											src="img/a7.jpg">
									</div>
									<div class="media-body">
										这哥们的新视频又来了，创意杠杠滴，帅炸了！ <br> <small class="text-muted">昨天
											2:45</small>
									</div> </a>
							</div>
							<div class="sidebar-message">
								<a href="#">
									<div class="pull-left text-center">
										<img alt="image" class="img-circle message-avatar"
											src="img/a3.jpg">

										<div class="m-t-xs">
											<i class="fa fa-star text-warning"></i> <i
												class="fa fa-star text-warning"></i> <i
												class="fa fa-star text-warning"></i>
										</div>
									</div>
									<div class="media-body">
										最近在补追此剧，特别喜欢这段表白。 <br> <small class="text-muted">昨天
											1:10</small>
									</div> </a>
							</div>
							<div class="sidebar-message">
								<a href="#">
									<div class="pull-left text-center">
										<img alt="image" class="img-circle message-avatar"
											src="img/a4.jpg">
									</div>
									<div class="media-body">
										我发起了一个投票 【你认为下午大盘会翻红吗？】 <br> <small class="text-muted">星期一
											8:37</small>
									</div> </a>
							</div>
						</div>

					</div>
					<div id="tab-3" class="tab-pane">

						<div class="sidebar-title">
							<h3>
								<i class="fa fa-cube"></i> 最新任务
							</h3>
							<small><i class="fa fa-tim"></i> 您当前有14个任务，10个已完成</small>
						</div>

						<ul class="sidebar-list">
							<li><a href="#">
									<div class="small pull-right m-t-xs">9小时以后</div>
									<h4>市场调研</h4> 按要求接收教材；

									<div class="small">已完成： 22%</div>
									<div class="progress progress-mini">
										<div style="width: 22%;"
											class="progress-bar progress-bar-warning"></div>
									</div>
									<div class="small text-muted m-t-xs">项目截止： 4:00 -
										2015.10.01</div> </a>
							</li>
							<li><a href="#">
									<div class="small pull-right m-t-xs">9小时以后</div>
									<h4>可行性报告研究报上级批准</h4> 编写目的编写本项目进度报告的目的在于更好的控制软件开发的时间,对团队成员的
									开发进度作出一个合理的比对

									<div class="small">已完成： 48%</div>
									<div class="progress progress-mini">
										<div style="width: 48%;" class="progress-bar"></div>
									</div> </a>
							</li>
							<li><a href="#">
									<div class="small pull-right m-t-xs">9小时以后</div>
									<h4>立项阶段</h4> 东风商用车公司 采购综合综合查询分析系统项目进度阶段性报告武汉斯迪克科技有限公司

									<div class="small">已完成： 14%</div>
									<div class="progress progress-mini">
										<div style="width: 14%;"
											class="progress-bar progress-bar-info"></div>
									</div> </a>
							</li>
							<li><a href="#"> <span
									class="label label-primary pull-right">NEW</span>
									<h4>设计阶段</h4> <!--<div class="small pull-right m-t-xs">9小时以后</div>-->
									项目进度报告(Project Progress Report)
									<div class="small">已完成： 22%</div>
									<div class="small text-muted m-t-xs">项目截止： 4:00 -
										2015.10.01</div> </a>
							</li>
							<li><a href="#">
									<div class="small pull-right m-t-xs">9小时以后</div>
									<h4>拆迁阶段</h4> 科研项目研究进展报告 项目编号: 项目名称: 项目负责人:

									<div class="small">已完成： 22%</div>
									<div class="progress progress-mini">
										<div style="width: 22%;"
											class="progress-bar progress-bar-warning"></div>
									</div>
									<div class="small text-muted m-t-xs">项目截止： 4:00 -
										2015.10.01</div> </a>
							</li>
							<li><a href="#">
									<div class="small pull-right m-t-xs">9小时以后</div>
									<h4>建设阶段</h4> 编写目的编写本项目进度报告的目的在于更好的控制软件开发的时间,对团队成员的
									开发进度作出一个合理的比对

									<div class="small">已完成： 48%</div>
									<div class="progress progress-mini">
										<div style="width: 48%;" class="progress-bar"></div>
									</div> </a>
							</li>
							<li><a href="#">
									<div class="small pull-right m-t-xs">9小时以后</div>
									<h4>获证开盘</h4> 编写目的编写本项目进度报告的目的在于更好的控制软件开发的时间,对团队成员的
									开发进度作出一个合理的比对

									<div class="small">已完成： 14%</div>
									<div class="progress progress-mini">
										<div style="width: 14%;"
											class="progress-bar progress-bar-info"></div>
									</div> </a>
							</li>

						</ul>

					</div>
				</div>

			</div>
		</div>
		<!--右侧边栏结束-->
	</div>

	<!-- 全局js -->
	<script src="js/jquery.min.js?v=2.1.4"></script>
	<script src="js/bootstrap.min.js?v=3.3.6"></script>
	<script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script src="js/plugins/layer/layer.min.js"></script>


	<!-- 自定义js -->
	<script src="js/hplus.js?v=4.1.0"></script>
	<script type="text/javascript" src="js/contabs.js"></script>

	<!-- 提示信息 -->
	<script type="text/javascript" src="js/sFoot.js"></script>

	<!-- 第三方插件 -->
	<script src="js/plugins/pace/pace.min.js"></script>
	<script type="text/javascript">
		var v = "${empty admin }";
		if (v == 'true') {
			alert("未登录，请前往登录！");
			window.location.href = "${APP_PATH}/admin/login.jsp";
		}
	</script>
</body>

</html>
