<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


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
<title>资源信息</title>
<meta name="keywords" content="">
<meta name="description"	content="">

<link rel="shortcut icon" href="favicon.ico">
<link href="${APP_PATH}/admin/css/bootstrap.min.css" rel="stylesheet">
<link href="${APP_PATH}/admin/css/font-awesome.css" rel="stylesheet">
<link
	href="${APP_PATH}/admin/css/plugins/bootstrap-table/bootstrap-table.min.css"
	rel="stylesheet">

<!--下拉框-->
<link href="${APP_PATH}/admin/css/plugins/chosen/chosen.css"
	rel="stylesheet">
<!--radio属性-->
<link
	href="${APP_PATH}/admin/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"
	rel="stylesheet">



<link href="${APP_PATH}/admin/css/animate.css" rel="stylesheet">
<link href="${APP_PATH}/admin/css/style.css" rel="stylesheet">
<link href="${APP_PATH}/admin/css/style1.css" rel="stylesheet">
</head>

<body class="gray-bg">

	<script type="text/javascript">
		function update(but) {
			<c:forEach items="${listR }" var="resource">
			if ("${resource.rid}" == but.value) {
				var resName = document.getElementById("UpdateResourceName");
				var Ordery = document.getElementById("ResourceOrdery");
				var upload = document.getElementById("uploadBut");
				var answer = document.getElementById("answerStrings");
				answer.value = "${resource.answerString}";
				upload.value = "${resource.rid}";
				resName.value = "${resource.resourceName}";
				Ordery.value = "${resource.ordery}";
				if ("${resource.resourceType}" == 1) {
					$("#fenji").attr("checked", "checked");
				}
				if ("${resource.resourceType}" == 0) {
					$("#wenben").attr("checked", "checked");
				}
				if ("${resource.resourceType}" == 2) {
					$("#qita").attr("checked", "checked");
				}
				if ("${resource.resourceType}" == 3) {
					$("#qtsp").attr("checked", "checked");
				}
			}
			</c:forEach>
		}

		function upload(but) {
			var form = document.getElementById("uploadForm");
			form.action = "${pageContext.request.contextPath }/resource/updateResource.action?rid="
					+ but.value + "&cid=100";
			form.submit();
		}
		function deldete(but) {
			var url = "?rid=" + but.value;
			$
					.ajax({
						type : "post",
						url : "${pageContext.request.contextPath}/resource/deleteByRid.action",
						data : {
							"rid" : but.value
						},
						dataType : "json",
						success : function(data) {
							if (data.status == 200) {
								alert("删除成功");
							} else {
								alert(data.msg);
							}
						}

					});
		}
		function add() {
			var from = document.getElementById("signupForm");
			from.action = "${pageContext.request.contextPath}/resource/addResource.action";
			alert(from.action);
			from.submit();
		}

		function addTwo() {
			var from = document.getElementById("signupFormTwo");
			from.action = "${pageContext.request.contextPath}/resource/addResource.action";
			alert(from.action);
			from.submit();
		}
	</script>



	<div class="wrapper wrapper-content animated fadeInRight">
		<!-- Panel Other -->
		<div class="ibox float-e-margins">
			<div class="ibox-content">
				<div class="row row-lg">
					<div class="col-sm-12">
						<!-- Example Events -->
						<div class="example-wrap">
							<div class="example">
								<div class="btn-group hidden-xs" id="exampleTableEventsToolbar"
									role="group">
									<button type="button" class="btn btn-outline btn-default"
										data-toggle="modal" data-target="#myModal">
										<i class="glyphicon glyphicon-plus" aria-hidden="true">添加分集视频</i>
									</button>
									<button type="button" class="btn btn-outline btn-default"
										data-toggle="modal" data-target="#myModal2">
										<i class="glyphicon glyphicon-plus" aria-hidden="true">添加课程资源</i>
									</button>
									<button type="button" class="btn btn-outline btn-default">
										<i class="glyphicon glyphicon-heart" aria-hidden="true"></i>
									</button>
									<button type="button" class="btn btn-outline btn-default">
										<i class="glyphicon glyphicon-trash" aria-hidden="true"></i>
									</button>
								</div>
								<table id="exampleTableEvents" data-height="800"
									data-mobile-responsive="true">
									<thead>
										<tr>
											<th data-field="state" data-checkbox="true"></th>
											<th data-field="id">资源名称</th>
											<th data-field="name">资源类型</th>
											<th data-field="sex">资源序号</th>
											<th data-field="name">试题名称</th>
											<th data-field="name">试题答案</th>

										</tr>
									</thead>
									<c:forEach items="${listR }" var="resource">
										<c:if test="${resource.resourceType eq 1 }">
											<tr>
												<td data-field="state" data-checkbox="true"></td>
												<td data-field="id">${resource.resourceName }</td>
												<td data-field="name">分集视频</td>
												<td data-field="sex">${resource.ordery }</td>
												<td data-field="sex">${resource.answerSrc }</td>
												<td data-field="sex">${resource.answerString }</td>
												<td>
													<button type="button" value="${resource.rid }"
														class="btn btn-outline btn-default" data-toggle="modal"
														data-target="#myModal1" onclick="update(this);">
														<i class="fa fa-edit"></i>修改
													</button> <a
													href="http://localhost:8080/${pageContext.request.contextPath}/resource/deleteByRid.action?rid=${resource.rid }">
														<button
															onclick="http://localhost:8080/${pageContext.request.contextPath}/resource/deleteByRid.action?rid=${resource.rid }"
															type="button" value="${resource.rid }"
															class="btn btn-outline btn-default btn-danger">
															<i class="glyphicon glyphicon-trash" aria-hidden="true"></i>删除
														</button> </a></td>
											</tr>
										</c:if>
									</c:forEach>
									<c:forEach items="${listR }" var="resource">
										<c:if test="${resource.resourceType eq 3 }">
											<tr>
												<td data-field="state" data-checkbox="true"></td>
												<td data-field="id">${resource.resourceName }</td>
												<td data-field="name">视频</td>
												<td data-field="sex">${resource.ordery }</td>
												<td data-field="sex">${resource.answerSrc }</td>
												<td data-field="sex">${resource.answerString }</td>
												<td>
													<button type="button" value="${resource.rid }"
														class="btn btn-outline btn-default" data-toggle="modal"
														data-target="#myModal1" onclick="update(this);">
														<i class="fa fa-edit"></i>修改
													</button> <a
													href="http://localhost:8080/${pageContext.request.contextPath}/resource/deleteByRid.action?rid=${resource.rid }">
														<button
															onclick="http://localhost:8080/${pageContext.request.contextPath}/resource/deleteByRid.action?rid=${resource.rid }"
															type="button" value="${resource.rid }"
															class="btn btn-outline btn-default btn-danger">
															<i class="glyphicon glyphicon-trash" aria-hidden="true"></i>删除
														</button> </a></td>
											</tr>
										</c:if>
									</c:forEach>
									<c:forEach items="${listR }" var="resource">

										<c:if test="${resource.resourceType eq 0 }">
											<tr>
												<td data-field="state" data-checkbox="true"></td>
												<td data-field="id">${resource.resourceName }</td>
												<c:if test="${resource.resourceType eq 0 }">
													<td data-field="name">文本</td>
												</c:if>
												<td data-field="sex">${resource.ordery }</td>
												<td data-field="sex">${resource.answerSrc }</td>
												<td data-field="sex">${resource.answerString }</td>
												<td>
													<button type="button" value="${resource.rid }"
														onclick="update(this);"
														class="btn btn-outline btn-default" data-toggle="modal"
														data-target="#myModal1">
														<i class="fa fa-edit"></i>修改
													</button> <a
													href="http://localhost:8080/${pageContext.request.contextPath}/resource/deleteByRid.action?rid=${resource.rid }">

														<button
															onclick="http://localhost:8080/${pageContext.request.contextPath}/resource/deleteByRid.action?rid=${resource.rid }"
															type="button" value="${resource.rid }"
															class="btn btn-outline btn-default btn-danger">
															<i class="glyphicon glyphicon-trash" aria-hidden="true"></i>删除
														</button>
												</td>
												</a>
											</tr>
										</c:if>
									</c:forEach>

									<c:forEach items="${listR }" var="resource">

										<c:if test="${resource.resourceType eq 2 }">
											<tr>
												<td data-field="state" data-checkbox="true"></td>
												<td data-field="id">${resource.resourceName }</td>
												<c:if test="${resource.resourceType eq 2 }">
													<td data-field="name">其他</td>
												</c:if>
												<td data-field="sex">${resource.ordery }</td>
												<td data-field="sex">${resource.answerSrc }</td>
												<td data-field="sex">${resource.answerString }</td>
												<td>
													<button type="button" value="${resource.rid }"
														onclick="update(this);"
														class="btn btn-outline btn-default" data-toggle="modal"
														data-target="#myModal1">
														<i class="fa fa-edit"></i>修改
													</button> <a
													href="http://localhost:8080/${pageContext.request.contextPath}/resource/deleteByRid.action?rid=${resource.rid }">

														<button
															onclick="http://localhost:8080/${pageContext.request.contextPath}/resource/deleteByRid.action?rid=${resource.rid }"
															type="button" value="${resource.rid }"
															class="btn btn-outline btn-default btn-danger">
															<i class="glyphicon glyphicon-trash" aria-hidden="true"></i>删除
														</button> </a>
												</td>
											</tr>
										</c:if>
									</c:forEach>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!--添加资源-->
	<div class="modal inmodal" id="myModal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content animated bounceInRight">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
					</button>

					<h4 class="modal-title">添加分集视频</h4>
					<small class="font-bold"> <!--这里可以显示副标题。-->
				</div>
				<div class="modal-body">
					<form class="form-horizontal m-t " enctype="multipart/form-data"
						method="post" id="signupForm">
						<input name="resourceType" id="1" value="1" type="hidden">
						<input type="hidden" name="cid" value="${cid}" />
						<div class="form-group">
							<label class="col-sm-3 control-label">资源名称：</label>
							<div class="col-sm-6">
								<input type="text" name="resourceName" class="form-control"
									placeholder="请输入资源名称">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">资源序号：</label>
							<div class="col-sm-6">
								<input type="text" name="ordery" class="form-control"
									placeholder="请输入资源的序号">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">资源视频：</label>
							<div class="col-sm-6">
								<input type="file" name="multipartFile" class="form-control"
									accept=".mp4">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">资源试题：</label>
							<div class="col-sm-6">
								<input type="file" name="multipartFiles" class="form-control"
									accept=".pdf">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">试题答案：</label>
							<div class="col-sm-6">
								<input type="text" name="answerString" class="form-control"
									id="answerString">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-6 control-label"><h3
									style="color:red">如 ABDA</h3> </label>
						</div>
					</form>
					<div class="modal-footer">
						<button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
						<button type="button" onclick="add();" class="btn btn-primary">添加</button>
					</div>
				</div>
			</div>
		</div>


		<!--添加资源2-->
		<div class="modal inmodal" id="myModal2" tabindex="-1" role="dialog"
			aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content animated bounceInRight">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
						</button>

						<h4 class="modal-title">添加课程资源</h4>
						<small class="font-bold"> <!--这里可以显示副标题。-->
					</div>
					<div class="modal-body">
						<form class="form-horizontal m-t " enctype="multipart/form-data"
							method="post" id="signupFormTwo">

							<input type="hidden" name="cid" value="${cid}" />
							<div class="form-group">
								<label class="col-sm-3 control-label">资源名称：</label>
								<div class="col-sm-6">
									<input type="text" name="resourceName" class="form-control"
										placeholder="请输入资源名称">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">资源序号：</label>
								<div class="col-sm-6">
									<input type="text" name="ordery" class="form-control"
										placeholder="请输入资源的序号">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">资源类型：</label>
								<div class="col-sm-6">
									<div class="radio"
										style="display:inline-block;margin-right:20px">
										<input name="resourceType" id="3" value="3" type="radio">
										<label for="man">视频</label>
									</div>
									<div class="radio" style="display:inline-block;">
										<input name="resourceType" id="2" type="radio" value="0">
										<label for="woman">文本</label>
									</div>
									<div class="radio" style="display:inline-block;">
										<input name="resourceType" id="0" type="radio" value="2">
										<label for="woman">其他</label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">上传资源：</label>
								<div class="col-sm-6">
									<input type="file" name="multipartFile" class="form-control">
								</div>
							</div>
						</form>
						<div class="modal-footer">
							<button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
							<button type="button" onclick="addTwo();" class="btn btn-primary">添加</button>
						</div>
					</div>
				</div>
			</div>


			<!--修改资源-->
			<div class="modal inmodal" id="myModal1" tabindex="-1" role="dialog"
				aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content animated bounceInRight">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
							</button>

							<h4 class="modal-title">修改资源</h4>
							<small class="font-bold"> <!--这里可以显示副标题。-->
						</div>
						<div class="modal-body">
							<form class="form-horizontal m-t " id="uploadForm" method="post"
								enctype="multipart/form-data">
								<div class="form-group">
									<label class="col-sm-3 control-label">资源名称：</label>
									<div class="col-sm-6">
										<input type="text" name="resourceName" class="form-control"
											id="UpdateResourceName">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">资源序号：</label>
									<div class="col-sm-6">
										<input type="text" name="ordery" class="form-control"
											id="ResourceOrdery">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">资源类型：</label>
									<div class="col-sm-6">
										<div class="radio"
											style="display:inline-block;margin-right:20px">
											<input name="resourceType" id="fenji" value="1" type="radio">
											<label for="man">分集视频</label>
										</div>
										<div class="radio" style="display:inline-block;">
											<input name="resourceType" id="wenben" type="radio" value="0">
											<label for="woman">文本</label>
										</div>
										<div class="radio" style="display:inline-block;">
											<input name="resourceType" id="qita" type="radio" value="2">
											<label for="woman">其他</label>
										</div>
										<div class="radio" style="display:inline-block;">
											<input name="resourceType" id="qtsp" type="radio" value="3">
											<label for="woman">其他视频</label>
										</div>
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-3 control-label">更新视频：</label>
									<div class="col-sm-6">
										<input type="file" name="multipartFile" class="form-control"
											accept=".mp4">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">更新试题：</label>
									<div class="col-sm-6">
										<input type="file" name="multipartFiles" class="form-control"
											accept=".pdf">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-6 control-label"><h3
											style="color:red">如不更新资源可以不选择</h3> </label>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">试题答案：</label>
									<div class="col-sm-6">
										<input type="text" name="answerString" class="form-control"
											id="answerStrings">
									</div>
								</div>
							</form>
							<div class="modal-footer">
								<button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
								<button type="button" id="uploadBut" class="btn btn-primary"
									onclick="upload(this);">添加</button>
							</div>
						</div>
					</div>
				</div>
				<!-- 全局js -->
				<script src="${APP_PATH}/admin/js/jquery.min.js?v=2.1.4"></script>
				<script src="${APP_PATH}/admin/js/bootstrap.min.js?v=3.3.6"></script>

				<!-- 自定义js -->
				<script src="${APP_PATH}/admin/js/content.js?v=1.0.0"></script>


				<!-- Bootstrap table -->
				<script
					src="${APP_PATH}/admin/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
				<script
					src="${APP_PATH}/admin/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
				<script
					src="${APP_PATH}/admin/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>

				<!-- Peity -->
				<script src="${APP_PATH}/admin/js/demo/bootstrap-table-demo.js"></script>

				<!-- Prettyfile -->
				<script
					src="${APP_PATH}/admin/js/plugins/prettyfile/bootstrap-prettyfile.js"></script>


				<!--进行验证-->
				<script
					src="${APP_PATH}/admin/js/plugins/validate/jquery.validate.min.js"></script>
				<script
					src="${APP_PATH}/admin/js/plugins/validate/messages_zh.min.js"></script>
				<script src="${APP_PATH}/admin/js/demo/form-validate-demo.js"></script>
				<!-- Chosen -->
				<script src="${APP_PATH}/admin/js/plugins/chosen/chosen.jquery.js"></script>
				<script src="${APP_PATH}/admin/js/demo/form-advanced-demo.js"></script>

				<script
					src="${APP_PATH}/admin/js/plugins/prettyfile/bootstrap-prettyfile.js"></script>
				<script>
					$('input[type="file"]').prettyFile();
					window.onload = function() {
						if ("${msg}") {
							alert("${msg}");
						}
					}
				</script>
</body>
</html>
