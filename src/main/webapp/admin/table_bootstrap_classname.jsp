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
<title>班级信息</title>
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

									<button type="button" class="btn btn-outline btn-default"
										onclick="check()">
										<i class="glyphicon glyphicon-trash" aria-hidden="true"></i>
									</button>
									</a> ${msg}
									<c:forEach items="${classNameList}" var="classname">
										<tr>
											<td>${user.name}</td>
										</tr>

									</c:forEach>
								</div>
								<table id="exampleTableEvents" data-height="800"
									data-mobile-responsive="true">
									<thead>
										<tr>
											<th data-field="state"><input id="selectAll"
												onclick="selectAll()" name="selectAll" type="checkbox">
											</th>
											<th data-field="classId">班级序号</th>
											<th data-field="name">班级名</th>
											<th data-field="snum">班级人数</th>
											<th data-field="oprate">操作</th>
										</tr>
									</thead>
									<c:forEach items="${classNameList}" var="classname">

										<tr id="${classname.classId }" class="tr" classId="123">
											<td><input id="classId" name="classId" type="checkbox"
												class="noborder" value="${classname.classId}"></td>
											<td data-field="classId">${classname.classId }</td>
											<td data-field="name">${classname.name}</td>
											<td data-field="snum">${classname.snum}</td>
											<td>
												<button title="${classname.classId}" type="button"
													onclick="updata(this);"
													class="btn btn-outline btn-default " data-toggle="modal"
													data-target="#myModal1">
													<i class="fa fa-edit"></i>修改
												</button> <a
												href="${APP_PATH}/classname/deleteClassNameByclassId.action?classId=${classname.classId}">
													<button type="button"
														class="btn btn-outline btn-default btn-danger">
														<i class="glyphicon glyphicon-trash" aria-hidden="true"></i>删除
													</button> </a></td>
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

	<!--添加班级-->
	<div class="modal inmodal" id="myModal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content animated bounceInRight">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
					</button>

					<h4 class="modal-title">添加班级</h4>
					<small class="font-bold"></small>
				</div>
				<div class="modal-body">
					<form action="<c:url value='/classname/insertSelective.action'/>"
						class="form-horizontal m-t " id="signupForm" method="post"
						enctype="multipart/form-data">
						<div class="form-group">
							<label class="col-sm-3 control-label">课程名：</label>
							<div class="col-sm-6">
								<input type="text" name="name" class="form-control"
									placeholder="请输入文本">
							</div>
						</div>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
					<!--  <input type="submit" class="btn btn-primary" value="添加" style="margin-left:400px" /> -->
					<button type="submit" class="btn btn-primary">添加</button>
					</form>
				</div>
			</div>

			<!--修改班级-->
			<div class="modal inmodal" id="myModal1" tabindex="-1" role="dialog"
				aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content animated bounceInRight">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
							</button>

							<h4 class="modal-title">修改班级</h4>
							<small class="font-bold"></small>
						</div>
						<div class="modal-body correntInfo">
							<form
								action="<c:url value='/classname/updateByPrimaryKeySelective.action'/>"
								class="form-horizontal m-t " id="signupForm" method="post"
								enctype="multipart/form-data">
								<input type="hidden" id="classIds" name="classId">
								<div class="form-group">
									<label class="col-sm-3 control-label">班级名：</label>
									<div class="col-sm-6">
										<input type="text" name="name" id="ClassName"
											class="form-control classname" placeholder="请输入文本" value="">
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-white"
										data-dismiss="modal">关闭</button>
									<!--  <input type="submit" class="btn btn-primary" value="添加" style="margin-left:400px" /> -->
									<button type="submit" class="btn btn-primary" value="修改">修改</button>
							</form>
						</div>

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

		<!-- Chosen -->
		<script src="${APP_PATH}/admin/js/plugins/chosen/chosen.jquery.js"></script>
		<script src="${APP_PATH}/admin/js/demo/form-advanced-demo.js"></script>
		<!-- Peity -->
		<script src="${APP_PATH}/admin/js/demo/bootstrap-table-demo.js"></script>
		<!-- 批量删除 -->
		<script type="text/javascript">
			function updata(but) {
				var ClassName = document.getElementById("ClassName");
				<c:forEach items="${classNameList }" var="classname">

				if ("${classname.classId}" == but.title) {
					ClassName.value = "${classname.name}";
					$("#classIds").attr("value", "${classname.classId}");
				}
				</c:forEach>
			}

			function check() {
				var msg = "您真的确定要删除吗？";
				if (confirm(msg) == true) {
					var becheckbox = "";

					$("input[name=	]:checked").each(function() { //遍历table里的全部checkbox

						becheckbox += $(this).val() + ","; //获取所有checkbox的值
						//alert("--------");
						//console.log(becheckbox);
						/* if($(this).attr("checked")){//如果被选中
							alert("**********");
						    becheckbox += $(this).val() + ","; //获取被选中的值
						    console.log(becheckbox);
						    } */
					});

					if (becheckbox.length > 0) { //如果获取到
						becheckbox = becheckbox.substring(0,
								becheckbox.length - 1); //把最后一个逗号去掉
						window.location = "deleteClassNameByclassId.action?classId="
								+ becheckbox;
						return false;
					} else {
						return false;
					}
				}
			}

			//全选或清空
			var i = 0;
			function selectAll() {
				var chkbox = document.getElementById("selectAll");
				i++;
				if (i % 2 != 0) {
					$("input[name=classId]").each(function() {
						this.checked = true;
					});
				} else {
					$("input[name=classId]").each(function() {
						this.checked = false;
					});
				}
			}
		</script>
		<script type="text/javascript">
			// 添加全局站点信息
			var BASE_URL = 'js/plugins/webuploader';
		</script>
		<script
			src="${APP_PATH}/admin/js/plugins/webuploader/webuploader.min.js"></script>
		<script src="${APP_PATH}/admin/js/demo/webuploader-demo.js"></script>
		<script
			src="${APP_PATH}/admin/js/plugins/prettyfile/bootstrap-prettyfile.js"></script>
		<script>
			$('input[type="file"]').prettyFile();
		</script>
</body>

</html>






