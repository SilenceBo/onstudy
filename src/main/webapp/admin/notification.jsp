<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	pageContext.setAttribute("APP_PATH", path);
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
<title>学生信息</title>
<meta name="keywords" content="">
<meta name="description" content="">

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
							<h4 class="example-title">事件</h4>
							<div class="example">
								<div class="alert alert-success" id="examplebtTableEventsResult"
									role="alert">事件结果</div>
								<div class="btn-group hidden-xs" id="exampleTableEventsToolbar"
									role="group">
									<button type="button" class="btn btn-outline btn-default">
										<i class="glyphicon glyphicon-trash" aria-hidden="true"></i>
									</button>
								</div>
								<table id="exampleTableEvents" data-height="600"
									data-mobile-responsive="true">
									<thead>
										<tr uniqueId="id">
											<th data-field="state" data-checkbox="true"></th>
											<th data-field="title">标题</th>
											<th data-field="time">时间</th>
											<th data-field="status">发送状态</th>
											<th data-field="operate">操作</th>

										</tr>
									</thead>
									<c:forEach items="${list }" var="notice">
										<tr>
											<td class="bs-checkbox"><input type="checkbox">
											</td>
											<td data-field="title">${notice.title }</td>
											<td data-field="time">${notice.time }</td>
											<c:choose>
												<c:when test="${notice.issendout }">
													<td data-field="status">已发送</td>
												</c:when>
												<c:otherwise>
													<td data-field="status">未发送</td>
												</c:otherwise>
											</c:choose>
											<td>
												<button type="button"
													class="btn btn-outline btn-default btn-revise"
													anid="${notice.anid }" onclick="check(this)"
													data-toggle="modal" data-target="#myModal1">
													<i class="fa fa-edit"></i>查看
												</button>
												<button type="button"
													class="btn btn-outline btn-default btn-danger"
													anid="${notice.anid }" onclick="deleInfo(this)">
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


	<div class="modal inmodal" id="myModal1" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content animated bounceInRight">
				<div class="modal-body">
					<form class="form-horizontal m-t" id="updataForm">
						<div class="form-group">
							<label class="col-sm-2 control-label" for="title">标题：</label>
							<div class="col-sm-10">
								<input id="title" type="text" class="form-control">
							</div>
						</div>
						<div class="form-group">
							<label for="message" class="col-sm-2 control-label">消息：</label>
							<div class="col-sm-10">
								<textarea class="form-control" id="text" rows="8"></textarea>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">接收人群：</label>
							<div class="input-group col-sm-10">
								<select name="notivetype" data-placeholder="选择班级">
									<option value="0" hassubinfo="true">仅学生</option>
									<option value="1" hassubinfo="true">仅教师</option>
									<option value="2" hassubinfo="true">全体师生</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">发送状态：</label>
							<div class="col-sm-10">
								<div class="radio"
									style="display:inline-block;margin-right:20px"
									class="col-sm-10">
									<input name="isSendOut" id="YesisSendOut" type="radio"
										value="1"> <label for="right">已发送</label>
								</div>
								<div class="radio" style="display:inline-block;">
									<input name="isSendOut" id="NoisSendOut" type="radio" value="0">
									<label for="left">未发送</label>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">时间：</label>
							<div class="col-sm-10">
								<input class="form-control layer-date laydate-icon"
									id="NoticeTime">
							</div>
							<input class="times" type="hidden">
						</div>
					</form>
					<div class="modal-footer">
						<button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
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
		<script src="${APP_PATH}/admin/js/plugins/validate/messages_zh.min.js"></script>

		<script src="${APP_PATH}/admin/js/demo/form-validate-demo.js"></script>

		<!-- layerDate plugin javascript -->
		<script src="${APP_PATH}/admin/js/plugins/layer/laydate/laydate.js"></script>
		<script>
			
		</script>
		<script>
			laydate({
				elem : '#NoticeTime',
				istime : true, //开启时间选择
				istoday : false,//显示今天
				festival : true,//显示节日
				format : 'YYYY-MM-DD hh:mm:ss',
				choose : function(datas) {
					$('.times').html(datas);
				}
			})
			window.onload = function() {
			}
			function showNotice() {
				$
						.ajax({
							url : "${APP_PATH}/adminNotice/findAllNotice.action",
							type : "POST",
							success : function(result) {
								var table = $("#exampleTableEvents");
								if (result.status == 200) {
									$
											.each(
													result.data,
													function() {
														var tr = $("<tr></tr>");
														tr
																.append($(
																		"<td></td>")
																		.addClass(
																				"bs-checkbox")
																		.append(
																				$(
																						"<input></input>")
																						.attr(
																								"type",
																								"checkbox")));
														tr
																.append($(
																		"<td></td>")
																		.attr(
																				"data-field",
																				"title")
																		.append(
																				this.title));
														tr
																.append($(
																		"<td></td>")
																		.attr(
																				"data-field",
																				"time")
																		.append(
																				this.time));
														if (this.issendout == true) {
															tr
																	.append($(
																			"<td></td>")
																			.attr(
																					"data-field",
																					"status")
																			.append(
																					"已发送"));
														} else {
															tr
																	.append($(
																			"<td></td>")
																			.attr(
																					"data-field",
																					"status")
																			.append(
																					"未发送"));
														}
														var look = $(
																"<td></td>")
																.addClass(
																		"btn btn-outline btn-default btn-revise")
																.attr("type",
																		"button")
																.attr(
																		"data-toggle",
																		"modal")
																.attr(
																		"data-target",
																		"#myModal1")
																.append(
																		$(
																				"<i></i>")
																				.addClass(
																						"fa fa-edit"))
																.append("查看");
														tr.append(look);
														var deltd = $(
																"<td></td>")
																.addClass(
																		"btn btn-outline btn-default btn-danger")
																.attr("type",
																		"button")
																.attr(
																		"onclick",
																		"deleInfo(this)")
																.prop(
																		"anid",
																		this.anid)
																.append(
																		$(
																				"<i></i>")
																				.addClass(
																						"glyphicon glyphicon-trash"))
																.append("删除");
														tr.append(deltd);
														tr.appendTo(table);
													});
								}
							}
						});
			}

			function deleInfo(but) {
				if (confirm("您确定要删除吗?")) {
					$.ajax({
						url : "${APP_PATH}/adminNotice/deleteByid.action",
						type : "POST",
						data : {
							"anid" : $(but).attr("anid")
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

			function check(but) {
				$.ajax({
					url : "${APP_PATH}/adminNotice/findByAnid.action",
					type : "POST",
					data : {
						"anid" : $(but).attr("anid")
					},
					success : function(result) {
						if (result.status == 200) {
							console.log(result);
							$("#title").val(result.data.title);
							$("#text").val(result.data.text);
							if (result.data.issendout) {
								$("#YesisSendOut").attr("checked", "checked");
							} else {
								$("#NoisSendOut").attr("checked", "checked");
							}
						} else {
							alert(result.msg);
						}
					}
				});
			}
		</script>

		<!-- Chosen -->
		<script src="${APP_PATH}/admin/js/plugins/chosen/chosen.jquery.js"></script>
		<script src="${APP_PATH}/admin/js/demo/form-advanced-demo.js"></script>

		<script src="${APP_PATH}/admin/js/main/ajax.js"></script>
		<script src="${APP_PATH}/admin/js/main/table_student.js"></script>
</body>

</html>
