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
<title>轮播管理</title>
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
</head>

<body class="gray-bg">
	<!-- 页面显示 -->
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
								</div>
								<p style="font-weight: 900; color: red">${msg }</p>
								<table id="exampleTableEvents" data-height="800"
									data-mobile-responsive="true">
									<thead>
										<tr>
											<th><input id="selectAll" onclick="selectAll()"
												name="selectAll" type="checkbox"></th>
											<th>名称</th>
											<th>轮播图</th>
											<th>类型</th>
											<th>是否启用</th>
											<th>链接课程编号</th>
											<th>操作</th>
										</tr>
									</thead>

									<c:forEach items="${caList }" var="carousel">
										<tr id="${carousel.caid }" class="tr" ids="123">
											<td><input id="ids" name="ids" type="checkbox"
												class="noborder" value="${carousel.caid }">
											</td>
											<td>${carousel.name }</td>
											<td><a href="${APP_PATH}${carousel.value }" title="图片"
												data-gallery=""> <img
													src="${APP_PATH}${carousel.value }" width="100"> </a>
												<div id="blueimp-gallery" class="blueimp-gallery">
													<div class="slides"></div>
													<h3 class="title"></h3>
													<a class="close">×</a>
												</div>
											</td>
											<td>${carousel.type=="0"?"轮播图":"滚动文字" }</td>
											<td>${carousel.status=="1"?"启用":"禁用" }</td>
											<td>${carousel.cid }</td>
											<td>
												<button title="${carousel.cid }" type="button"
													class="btn btn-outline btn-default btn-edit"
													data-toggle="modal" data-target="#myModal1"
													onclick="correctInfos(this);">
													<i class="fa fa-edit"></i>修改
												</button>

												<button type="button" class="btn btn-outline btn-default"
													onclick="deleteCarousel(this);">
													<i class="glyphicon glyphicon-trash" aria-hidden="true"></i>删除
												</button>
											</td>
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

					<h4 class="modal-title">添加轮播信息</h4>
					<small class="font-bold"></small>
				</div>

				<div class="modal-body">
					<form action="<c:url value='/carousel/addCarousel.action'/>"
						class="form-horizontal m-t " id="signupForm" method="post"
						name="addForm" onsubmit="return false;"
						enctype="multipart/form-data">

						<div class="form-group">
							<label class="col-sm-3 control-label">名称：</label>
							<div class="col-sm-6">
								<input type="text" name="name" class="form-control" id="addname"
									placeholder="请输入文本">
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label"> 类型：</label>
							<div class="col-sm-6">
								<label> <input type="radio" name="type" value=0
									class="addcheck" id="addimage">轮播图 </label> <label> <input
									type="radio" name="type" value=1 class="addcheck" checked
									id="addText">滚动文字 </label>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label"> 是否启用：</label>
							<div class="col-sm-6">
								<label> <input type="radio" name="status" value=1>启用
								</label> <label> <input type="radio" name="status" value=0
									checked>禁用 </label>
							</div>
						</div>

						<div class="form-group" id="addimg">
							<label class="col-sm-3 control-label">轮播图：</label>
							<div class="col-sm-6">
								<input type="file" name="file" multiple="multiple"
									accept=".gif,.jpg,.jpeg,.bmp,.png" id="addlb" />
							</div>
						</div>
						
						


						<div class="form-group">
							<label class="col-sm-3 control-label">链接课程编号：</label>
							<div class="col-sm-6">
								<input type="text" name="cid" id="addCourseCid"
									class="form-control save" placeholder="请输入链接课程编号">
							</div>
						</div>

						<input type="submit" class="btn btn-primary" value="添加"
							style="margin-left:400px" id="save" />
						<button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
					</form>

				</div>
			</div>
		</div>
	</div>

	<!--修改模态框-->
	<div class="modal inmodal" id="myModal1" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content animated bounceInRight">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
					</button>

					<h4 class="modal-title">修改轮播信息</h4>
					<small class="font-bold"></small>
				</div>
				<div class="modal-body correntInfo">
					<form action="<c:url value='/carousel/updateCarousel.action'/>"
						class="form-horizontal m-t " id="signupForm2" name="updateForm"
						onsubmit="return false;" method="post"
						enctype="multipart/form-data">
						<input type="hidden" name="caid" value="" class="caid"
							id="updateCaid">

						<div class="form-group">
							<label class="col-sm-3 control-label">名称：</label>
							<div class="col-sm-6">
								<input type="text" name="name" id="CarouselName"
									class="form-control" placeholder="请输入文本">
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label"> 类型：</label>
							<div class="col-sm-6 CarouselRadio1">
								<label> <input type="radio" name="type"
									id="CarouselType" class="updatecheck" value=0 id="updateimage">轮播图
								</label> <label> <input type="radio" name="type" value=1 checked
									class="updatecheck" id="updateText">滚动文字 </label>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label"> 是否启用：</label>
							<div class="col-sm-6 CarouselRadio2">
								<label> <input type="radio" name="status"
									id="CarouselStatus" value=1>启用 </label> <label> <input
									type="radio" name="status" value=0 checked>禁用 </label>
							</div>
						</div>

						<div class="form-group" id="updateimg">
							<label class="col-sm-3 control-label">轮播图：</label>
							<div class="col-sm-6">
								<input type="file" name="file" class="form-control"
									id="updatelb">
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">链接课程编号：</label>
							<div class="col-sm-6">
								<input type="text" name="cid" id="CarouselCid"
									class="form-control" placeholder="请输入链接课程编号">
							</div>
						</div>

						<input type="submit" class="btn btn-primary save" value="保存"
							style="margin-left:400px" id="update" />
						<button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
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
	<script src="js/demo/webuploader-demo.js"></script>
	<script src="js/plugins/prettyfile/bootstrap-prettyfile.js"></script>
	<script>
		$('input[type="file"]').prettyFile();
	</script>
	<!-- 修改部分 -->
	<script type="text/javascript">
		/* 数据回显 */
		//console.log($(".btn-edit"));	$(".btn-edit")    
		function correctInfos(add) {
			var caid = $(add).parent().parent().attr("id");
			console.log(caid);
			var url = "${APP_PATH}/carousel/SelectCarouselJsonByCaid.action";
			//console.log($("#courseimage").val()+"^^^^^^^");
			$.ajax({
				type : "post",
				dataType : 'json',
				url : url,
				data : {
					caid : caid
				},
				success : function(data) {
					//console.log(data);
					$("#updateCaid").val(data.caid);
					$("#CarouselName").val(data.name);
					$("#CarouselCid").val(data.cid);
					var dataType = data.type;
					function getSex() {
						var sex = $(".CarouselRadio1 input");
						//console.log(sex);
						for ( var i = 0; i < sex.length; i++) {
							var r = sex[i];
							if (r.value == data.type.toString()) {
								r.checked = true;
								break;
							}
						}
					}
					getSex();
					if (data.type == 1) {
						$("#updateimg").hide();
					} else {
						$("#updateimg").show();
					}

					var dataStatus = data.status;
					function getSex2() {
						var sex = $(".CarouselRadio2 input");
						//console.log(sex);
						for ( var i = 0; i < sex.length; i++) {
							var r = sex[i];
							if (r.value == data.status.toString()) {
								r.checked = true;
								break;
							}
						}
					}
					getSex2();

				},
				error : function() {
					alert("error");
				}
			});

		};
	</script>

	<!-- 批量删除 -->
	<script type="text/javascript">
		/* 删除一个 */
		function deleteCarousel(del) {
			var id = $(del).parent().parent().attr("id");
			var msg = "您确定要删除吗？";
			if (confirm(msg) == true) {
				window.location = "deleteCarousel.action?ids=" + id;
			}
		}

		/* 批量删除 */
		function check() {
			var msg = "您真的确定要删除吗？";
			if (confirm(msg) == true) {
				var becheckbox = "";
				$("input[name=ids]:checked").each(function() { //遍历table里的全部checkbox
					becheckbox += $(this).val() + ","; //获取所有checkbox的值
				});

				if (becheckbox.length > 0) { //如果获取到
					becheckbox = becheckbox.substring(0, becheckbox.length - 1); //把最后一个逗号去掉
					window.location = "deleteCarousel.action?ids=" + becheckbox;
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
	<script type="text/javascript">
		if ($('#addText').is(':checked')) {
			$("#addimg").hide();
		}

		$("#save")
				.click(
						function() {
							var caname = $("#addname").val();
							if (caname == "") {
								alert("名称不能为空");
								return false;
							}
							if ($('#addimage').is(':checked')) {
								if ($("#addlb").val() == "") {
									alert("图片不能为空");
									return false;
								}
							}

							var cid = $("#addCourseCid").val();
							if (cid == "") {
								alert("课程编号不能为空!");
								return false;
							}

							if (!isNaN(cid)) {
								$
										.ajax({
											type : "GET",
											dataType : 'json',
											url : "${APP_PATH}/course/SelectCourseBycidTwo.action?cid="
													+ cid,
											success : function(data) {
												//alert("ok");
												if (data.status == 200) {
													document.addForm.submit();
													return true;
												}
												if (data.status == 500) {
													alert("此课程编号不存在");
													return false;
												}
											}
										});
							} else {
								alert("编号必须是数字");
								return false;
								//window.location.href = "${APP_PATH}/carousel/findAll.action";
							}

						});

		$("#update")
				.click(
						function() {

							var caname = $("#CarouselName").val();
							if (caname == "") {
								alert("名称不能为空");
								return false;
							}

							var cid = $("#CarouselCid").val();

							if (cid == "") {
								alert("课程编号不能为空!");
								return false;
							}
							if (!isNaN(cid)) {
								$
										.ajax({
											type : "GET",
											dataType : 'json',
											url : "${APP_PATH}/course/SelectCourseBycidTwo.action?cid="
													+ cid,
											success : function(data) {
												//alert("ok");
												if (data.status == 200) {
													document.updateForm
															.submit();
													return true;
												}
												if (data.status == 500) {
													alert("此课程编号不存在");
													return false;
												}
											}
										});
							} else {
								alert("编号必须是数字");
								return false;
								//window.location.href = "${APP_PATH}/carousel/findAll.action";
							}
						});

		$(".addcheck").click(function() {
			if ($('#addText').is(':checked')) {
				$("#addimg").hide();
			} else {
				$("#addimg").show();
			}
		});

		$(".updatecheck").click(function() {
			if ($('#updateText').is(':checked')) {
				$("#updateimg").hide();
			} else {
				$("#updateimg").show();
			}
		});
	</script>
</body>

</html>
