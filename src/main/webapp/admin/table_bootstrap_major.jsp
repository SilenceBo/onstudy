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
<title>专业信息</title>
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
<link href="${APP_PATH}/admin/css/animate.css" rel="stylesheet">
<link href="${APP_PATH}/admin/css/style.css" rel="stylesheet">
<link href="${APP_PATH}/admin/css/style1.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="${APP_PATH}/admin/css/plugins/webuploader/webuploader.css">
<link rel="stylesheet" type="text/css"
	href="${APP_PATH}/admin/css/demo/webuploader-demo.css">
<style>
</style>
</head>

<body class="gray-bg">

	<!--页面显示  -->
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
												id="selectAll" onclick="selectAll()" name="selectAll"
												type="checkbox"></th>
											<th data-field="id">专业编号</th>
											<th data-field="name">专业名称</th>
											<th data-field="oprate">操作</th>
										</tr>
									</thead>

									<c:forEach items="${mList }" var="major">
										<tr id="${major.mid }" class="tr" ids="123">
											<td><input id="ids" name="ids" type="checkbox"
												class="noborder" value="${major.mid }">
											</td>
											<td data-field="id">${major.mid }</td>
											<td data-field="fname">${major.mname}</td>
											<td>
												<button type="button" class="btn btn-outline btn-default"
													data-toggle="modal" data-target="#myModal2"
													value="${major.mid}" onclick="updateMajor(this);">
													<i class="fa fa-edit"></i>修改
												</button>
												<button type="button" class="btn btn-outline btn-default"
													title="${major.mid }" value="${major.mid }"
													onclick="deleteMajor(this);">
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

	<!-- 添加模态框 -->
	<div class="modal inmodal" id="myModal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content animated bounceInRight">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
					</button>

					<h4 class="modal-title">添加专业</h4>
					<small class="font-bold"></small>
				</div>

				<div class="modal-body correntInfo">
					<form action="<c:url value='/major/addMajor.action'/>"
						class="form-horizontal m-t " id="signupForm" method="post">
						<input type="hidden" name="mid" value="${mid }" />
						<div class="form-group">
							<label class="col-sm-3 control-label">方向名称：</label>
							<div class="col-sm-6">
								<input type="text" name="mname" class="form-control"
									placeholder="请输入专业名称">
							</div>
						</div>
				</div>
				<input type="submit" class="btn btn-primary" value="添加"
					style="margin-left:400px" />
				<button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
				</form>
			</div>
		</div>
	</div>
	</div>


	<!--修改  -->
	<div class="modal inmodal" id="myModal2" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content animated bounceInRight">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
					</button>

					<h4 class="modal-title">修改专业</h4>
					<small class="font-bold"> <!--这里可以显示副标题。-->
				</div>
				<div class="modal-body correntInfo">
					<form class="form-horizontal m-t " id="signupForm"
						action="<c:url value='/major/updateMajor.action'/>" method="post">
						<input type="hidden" name="mid" value="" id="mid" class="mid">
						<div class="form-group">
							<label class="col-sm-3 control-label">专业名称：</label>
							<div class="col-sm-6">
								<input type="text" name="mname" id="mname" class="form-control"
									placeholder="请输入专业名称">
							</div>
						</div>

						<div class="modal-footer">
							<input type="submit" class="btn btn-primary" value="修改"
								style="margin-left:200px" />
							<button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


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
	<!-- Peity -->
	<script src="${APP_PATH}/admin/js/demo/bootstrap-table-demo.js"></script>
	<script type="text/javascript">
		// 添加全局站点信息
		var BASE_URL = 'js/plugins/webuploader';
	</script>
	<script
		src="${APP_PATH}/admin/js/plugins/webuploader/webuploader.min.js"></script>
	<script src="${APP_PATH}/admin/js/demo/webuploader-demo.js"></script>




	<!-- 修改部分 -->
	<script type="text/javascript">
		function updateMajor(but) {
			<c:forEach items="${mList}" var="major">
			if ("${major.mid}" == but.value) {
				var fid = document.getElementById("mid");
				var fname = document.getElementById("mname");

				fid.value = but.value;
				fname.value = "${major.mname}";

			}
			</c:forEach>
		}
	</script>

	<!--删除部分  -->
	<script type="text/javascript">
		/* 单个删除  */
		function deleteMajor(del) {
			var id = $(del).parent().parent().attr("id");
			var msg = "您确定要删除该专业吗？";
			if (confirm(msg) == true) {
				window.location = "deleteMajorBymid.action?mid=" + id;
			}
		}

		/* 批量删除  */
		function check() {
			var msg = "请单个删除专业信息…";
			if (confirm(msg) == true) {
				var becheckbox = "";

				$("input[name=ids]:checked").each(function() { //遍历table里的全部checkbox
					becheckbox += $(this).val() + ","; //获取所有checkbox的值
				});

				if (becheckbox.length > 0) { //如果获取到
					becheckbox = becheckbox.substring(0, becheckbox.length - 1); //把最后一个逗号去掉
					window.location = "deleteMajorBymid.action?ids="
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
</body>

</html>
