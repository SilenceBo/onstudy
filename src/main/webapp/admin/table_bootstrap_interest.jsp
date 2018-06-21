<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv=X-UA-Compatible content="IE=edge,chrome=1">
<meta content=always name=referrer>
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>兴趣方向</title>
<meta name="keywords" content="">
<meta name="description" content="">
<link rel="shortcut icon" href="favicon.ico">
<link href="${APP_PATH}/admin/css/bootstrap.min.css" rel="stylesheet">
<link href="${APP_PATH}/admin/css/font-awesome.css" rel="stylesheet">
<link
	href="${APP_PATH}/admin/css/plugins/bootstrap-table/bootstrap-table.min.css"
	rel="stylesheet">
<link
	href="${APP_PATH}/admin/css/plugins/blueimp/css/blueimp-gallery.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="${APP_PATH}/admin/css/plugins/webuploader/webuploader.css">
<link rel="stylesheet" type="text/css"
	href="${APP_PATH}/admin/css/demo/webuploader-demo.css">
<!--radio属性-->
<link
	href="${APP_PATH}/admin/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"
	rel="stylesheet">
<!--下拉框-->
<link href="${APP_PATH}/admin/css/plugins/chosen/chosen.css"
	rel="stylesheet">

<link href="${APP_PATH}/admin/css/animate.css" rel="stylesheet">
<link href="${APP_PATH}/admin/css/style.css" rel="stylesheet">
<link href="${APP_PATH}/admin/css/style1.css" rel="stylesheet">
</head>

<body class="gray-bg">
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
										<i class="glyphicon glyphicon-plus" aria-hidden="true"></i>
									</button>
									<button type="button" class="btn btn-outline btn-default">
										<i class="glyphicon glyphicon-heart" aria-hidden="true"></i>
									</button>
									<%--<button type="button" class="btn btn-outline btn-default"
										onclick="check()">
										<i class="glyphicon glyphicon-trash" aria-hidden="true"></i>
									</button>
								--%></div>
								<p style="font-weight: 900; color: red">${msg }</p>
								<table id="exampleTableEvents" data-height="800"
									data-mobile-responsive="true">
									<thead>
										<tr>
											<th data-field="state" data-checkbox="true"><input
												id="selectAll" name="selectAll" onclick="selectAll()"
												type="checkbox"></th>
											<th data-field="id">兴趣编号</th>
											<th data-field="name">兴趣名称</th>
											<th data-field="local">是否显示</th>
											<th data-field="redsc">兴趣描述</th>
											<th data-field="oprate">操作</th>
										</tr>
									</thead>


									<c:forEach items="${iList }" var="interest">
										<tr id="${interest.iid }" class="tr">
											<td><input id="ids" name="ids" type="checkbox"
												class="noborder" value="${interest.iid }"></td>
											<td data-field="id">${interest.iid }</td>
											<td data-field="iname">${interest.iname }</td>
											<td data-field="local">${interest.isuse }</td>
											<td data-field="idesc">${interest.idesc }</td>

											<td><a
												href="${APP_PATH }/fangxiang/selectFangxiangByiid.action?iid=${interest.iid }">
													<button type="button" class="btn btn-outline btn-default">
														<i class="fa fa-edit"></i>查看相应方向
													</button> </a>
												<button type="button" class="btn btn-outline btn-default"
													value="${interest.iid }" data-toggle="modal"
													data-target="#myModal2" onclick="updateInterest(this);">
													<i class="fa fa-edit"></i>修改
												</button>
												<button type="button" class="btn btn-outline btn-default"
													value="${interest.iid }" onclick="deleteInterest(this);">
													<i class="glyphicon glyphicon-trash" aria-hidden="true"></i>删除
												</button></td>
										</tr>
									</c:forEach>

								</table>
							</div>
						</div>
						<!-- End Example Events -->
					</div>
				</div>
			</div>
		</div>
		<!-- End Panel Other -->

	</div>

	<!--添加兴趣-->
	<div class="modal inmodal" id="myModal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content animated bounceInRight">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
					</button>

					<h4 class="modal-title">添加兴趣</h4>
					<small class="font-bold">
				</div>
				<div class="modal-body">
					<form action="<c:url value='/interest/addInterest.action'/>"
						class="form-horizontal m-t " id="signupForm" method="post">
						<div class="form-group">
							<label class="col-sm-3 control-label">兴趣名称：</label>
							<div class="col-sm-6">
								<input type="text" name="iname" class="form-control"
									placeholder="请输入兴趣名称">
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">是否展示：</label>
							<div class="col-sm-6">
								<div class="radio"
									style="display:inline-block;margin-right:20px">
									<input name="isuse" id="yes" type="radio" value="是" checked>
									<label for="man">是</label>
								</div>
								<div class="radio" style="display:inline-block;">
									<input name="isuse" id="no" type="radio" value="否"> <label
										for="no">否</label>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">兴趣简介：</label>
							<div class="col-sm-6">
								<textarea class="form-control" rows="6" name="idesc"></textarea>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
							<button type="submit" class="btn btn-primary">添加</button>
						</div>
					</form>

				</div>
			</div>
		</div>


		<!--修改  -->
		<%-- <div class="modal inmodal" id="myModal2" tabindex="-1" role="dialog"
			aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content animated bounceInRight">

					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
						</button>
						<h4 class="modal-title">修改兴趣</h4>
						<small class="font-bold"></small>
					</div>

					<div class="modal-body correntInfo">
						<form action="<c:url value='/interest/updateInterest.action'/>"
							class="form-horizontal m-t " id="signupForm">
							<div class="form-group">
								<label class="col-sm-3 control-label">兴趣名称：</label>
								<div class="col-sm-6">
									<input type="text" name="" class="form-control"
										placeholder="请输入文本">
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label">是否展示：</label>
								<div class="col-sm-6">
									<div class="radio"
										style="display:inline-block;margin-right:20px">
										<input name="local" id="yes" type="radio" checked> <label
											for="man">是</label>
									</div>
									<div class="radio" style="display:inline-block;">
										<input name="local" id="no" type="radio"> <label
											for="no">否</label>
									</div>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label">兴趣简介：</label>
								<div class="col-sm-6">
									<textarea class="form-control" rows="6"></textarea>
								</div>
							</div>

							<input type="submit" class="btn btn-primary" value="保存"
								style="margin-left:400px" />
							<button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
						</form>
					</div>
				</div>
			</div>
		</div> --%>

		<!--修改兴趣-->
		<div class="modal inmodal" id="myModal2" tabindex="-1" role="dialog"
			aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content animated bounceInRight">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
						</button>

						<h4 class="modal-title">修改兴趣</h4>
						<small class="font-bold"> <!--这里可以显示副标题。-->
					</div>
					<div class="modal-body">
						<form action="<c:url value='/interest/updateInterest.action'/>"
							class="form-horizontal m-t " id="signupForm" method="post">
							<input type="hidden" name="iid" value="" id="iid" class="iid">
							<div class="form-group">
								<div class="form-group">
									<label class="col-sm-3 control-label">兴趣名称：</label>
									<div class="col-sm-6">
										<input type="text" name="iname" id="iname"
											class="form-control" placeholder="请输入兴趣名称">
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-3 control-label">是否展示：</label>
									<div class="col-sm-6">
										<div class="radio"
											style="display:inline-block;margin-right:20px">
											<input name="isuse" id="yes" type="radio" value="是">
											<label for="man">是</label>
										</div>
										<div class="radio" style="display:inline-block;">
											<input name="isuse" id="no" type="radio" value="否"> <label
												for="no">否</label>

										</div>
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-3 control-label">兴趣简介：</label>
									<div class="col-sm-6">
										<textarea class="form-control" name="idesc" id="idesc"
											rows="6"></textarea>
									</div>
								</div>
								<input type="submit" id="uploadBut" class="btn btn-primary"
									style="margin-left:400px" value="修改">
								<button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
						</form>
						<div class="modal-footer"></div>
					</div>
				</div>
			</div>




			<!-- 修改 -->
			<script type="text/javascript">
				function updateInterest(but) {
					<c:forEach items="${iList}" var="interest">
					if ("${interest.iid}" == but.value) {
						var iid = document.getElementById("iid");
						var iname = document.getElementById("iname");
						var isuse = document.getElementById("isuse");
						var idesc = document.getElementById("idesc");

						iid.value = but.value;
						iname.value = "${interest.iname}";
						isuse.value = "${interest.isuse}";
						idesc.value = "${interest.idesc}";
					}
					</c:forEach>
				}
			</script>


			<!-- 删除部分 -->
			<script type="text/javascript">
				/* 删除一个 */
				function deleteInterest(del) {
					var id = $(del).parent().parent().attr("id");
					var msg = "将同时删除该兴趣下的所有方向，您确定要删除吗？";
					if (confirm(msg) == true) {
						window.location = "deleteInterestByiid.action?iid="
								+ id;
					}
				}

				/* 批量删除 */
				function check() {
					var msg = "不能多项删除，由于兴趣下包含方向，请逐个删除…";
					if (confirm(msg) == true) {
						var becheckbox = "";

						$("input[name=iid]:checked").each(function() { //遍历table里的全部checkbox
							becheckbox += $(this).val() + ","; //获取所有checkbox的值	
						});

						if (becheckbox.length > 0) { //如果获取到
							becheckbox = becheckbox.substring(0,
									becheckbox.length - 1); //把最后一个逗号去掉
							window.location = "deleteInterestByiid.action?iid="
									+ becheckbox;
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
						$("input[name=ids]").each(function() {
							this.checked = true;
						});
					} else {
						$("input[name=ids]").each(function() {
							this.checked = false;
						});
					}
				}
			</script>


			<!-- 全局js -->
			<script src="${APP_PATH}/admin/js/jquery.min.js"></script>
			<script src="${APP_PATH}/admin/js/bootstrap.min.js"></script>

			<!-- 自定义js -->
			<script src="${APP_PATH}/admin/js/content.js"></script>

			<!-- Bootstrap table -->
			<script
				src="${APP_PATH}/admin/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
			<script
				src="${APP_PATH}/admin/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
			<script
				src="${APP_PATH}/admin/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>

			<!-- blueimp gallery -->
			<script
				src="${APP_PATH}/admin/js/plugins/blueimp/jquery.blueimp-gallery.min.js"></script>

			<!-- Chosen -->
			<script src="${APP_PATH}/admin/js/plugins/chosen/chosen.jquery.js"></script>
			<script src="${APP_PATH}/admin/js/demo/form-advanced-demo.js"></script>
			<!-- Peity -->
			<script src="${APP_PATH}/admin/js/demo/bootstrap-table-demo.js"></script>
			<script type="text/javascript">
				// 添加全局站点信息
				var BASE_URL = 'js/plugins/webuploader';
			</script>
			<script
				src="${APP_PATH}/admin/js/plugins/webuploader/webuploader.min.js"></script>

			<script src="${APP_PATH}/admin/js/demo/webuploader-demo.js"></script>
</body>

</html>
