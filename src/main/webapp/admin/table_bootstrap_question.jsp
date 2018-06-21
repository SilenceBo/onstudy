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
<title>问答管理</title>
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
										onclick="check()">
										<i class="glyphicon glyphicon-trash" aria-hidden="true"></i>
									</button>
								</div>
								<p style="font-weight: 900; color: red">${msg }</p>
								<table id="exampleTableEvents" data-height="800"
									data-mobile-responsive="true">
									<thead>
										<tr>
											<th data-field="state"><input id="selectAll"
												onclick="selectAll()" name="selectAll" type="checkbox">
											</th>
											<th>标题</th>
											<th>内容</th>
											<th>回复数</th>
											<th>点击量</th>
											<th>创建时间</th>
											<th>创建人</th>
											<th>用户类型</th>
											<th>操作</th>
										</tr>
									</thead>

									<c:forEach items="${queList }" var="question">
										<tr id="${question.qid }" class="tr" ids="123">
											<td><input id="ids" name="ids" type="checkbox"
												class="noborder" value="${question.qid }"></td>
											<td>${question.topic }</td>
											<td>${question.contents }</td>
											<td>${question.replycount }</td>
											<td>${question.clickcount }</td>
											<td>${question.creattime }</td>
											<c:choose>
												<c:when test="${question.usertype==0 }">
													<td>${question.dbTeacher.username }</td>
												</c:when>
												<c:otherwise>
													<td>${question.dbStudent.sname }</td>
												</c:otherwise>
											</c:choose>
											<td>${question.usertype=="0"?"老师":"学生" }</td>
											<td>
												<button type="button" class="btn btn-outline btn-default"
													onclick="deleteCarousel(this);">
													<i class="glyphicon glyphicon-trash" aria-hidden="true"></i>删除
												</button> <a
												href="${APP_PATH }/answer/findByQid.action?qid=${question.qid }">
													<button type="button" class="btn btn-outline btn-default">
														<i class="fa fa-edit"></i>回复管理
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

	<!-- zb -->
	<!-- 删除部分 -->
	<script type="text/javascript">
		/* 单个删除  */
		function deleteCarousel(del) {
			var id = $(del).parent().parent().attr("id");
			var msg = "您确定要删除吗？";
			if (confirm(msg) == true) {
				window.location = "deleteQuestion.action?ids=" + id;
			}
		}

		/* 批量删除  */
		function check() {
			var msg = "您真的确定要删除吗？";
			if (confirm(msg) == true) {
				var becheckbox = "";

				$("input[name=ids]:checked").each(function() { //遍历table里的全部checkbox	
					becheckbox += $(this).val() + ","; //获取所有checkbox的值
				});

				if (becheckbox.length > 0) { //如果获取到
					becheckbox = becheckbox.substring(0, becheckbox.length - 1); //把最后一个逗号去掉
					window.location = "deleteQuestion.action?ids=" + becheckbox;
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
