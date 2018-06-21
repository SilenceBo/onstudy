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
<title>学生信息</title>
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
	<form id="loadForm"
		action="${APP_PATH }/student/findAll.action"
		method="post"></form>
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
										data-toggle="modal" data-target="#myModal"  onclick="selectClass();">
										<i class="glyphicon glyphicon-plus" aria-hidden="true"></i>
									</button>
									<!-- 删除 -垃圾桶-->
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
											<th data-field="id">学生编号</th>
											<th data-field="account">学号</th>
											<th data-field="sname">姓名</th>
											<th data-field="sex">性别</th>
											<!-- <th data-field="pwd">密码</th>
											<th data-field="repwd">确认密码</th> -->
											<th data-field="e_mail">电子邮件</th>
											<th data-field="date">注册日期</th>
											<th data-field="name">班级名</th>
											<th data-field="operate">操作</th>
										</tr>
									</thead>
									<c:forEach items="${studentList}" var="student">
										<tr id="${student.id }">
											<td data-field="state" data-checkbox="true"><input
												id="ids" name="ids" type="checkbox" class="noborder"
												value="${student.id }"></td>
											<td data-field="id">${student.id}</td>
											<td data-field="account">${student.account}</td>
											<td data-field="sname">${student.sname }</td>
											<td data-field="sex">${student.sex}</td>
											<%-- <td data-field="pwd">${student.pwd}</td>
											<td data-field="repwd">${student.repwd}</td> --%>
											<td data-field="e_mail">${student.e_mail}</td>
											<td data-field="date">${student.date}</td>
											<td data-field="name">${student.name}</td>
											<td>
												<!-- data-target: bootstrap中，要求将#myModal1中的内容以模态框的形式显示出来 -->
												<button title="${student.id}" value="${student.id}"
													type="button" class="btn btn-outline btn-default"
													data-toggle="modal" data-target="#myModal1"
													onclick="selectStudentById(this);">
													<i class="fa fa-edit"></i>修改学号
												</button> <!-- 注意class值 -->
												<button title="${student.id}"  value="${student.account}" type="button" class="btn btn-outline btn-default"
													onclick="resetPwd(this);">
													<i class="glyphicon glyphicon-trash" aria-hidden="true"></i>重置密码
												</button>
												<button type="button" class="btn btn-outline btn-default"
													onclick="deleteStudent(this);">
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

	<!-- 添加 -->
	<div class="modal inmodal" id="myModal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content animated bounceInRight">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
					</button>

					<h4 class="modal-title">添加学生</h4>
					<small class="font-bold"></small>
				</div>
				<div class="modal-body">
					<form class="form-horizontal m-t " id="addStudentForm"
						enctype="multipart/form-data">
						<div class="form-group">
							<label class="col-sm-3 control-label">学号：</label>
							<div class="col-sm-6">
								<input type="text" name="account" 
									class="form-control" placeholder="请输入学号" value="">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">名字：</label>
							<div class="col-sm-6">
								<input type="text" name="sname" id="sname" class="form-control"
									placeholder="请输入名字">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">性别：</label>
							<div class="col-sm-6">
								<label> <input type="radio" name="sex" id="sex1"
									value="男" class="sex">男 </label> <label> <input
									type="radio" name="sex" id="sex2" value="女" class="sex">女
								</label>

							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">班级：</label>
							<div class="col-sm-6">
								<select data-placeholder="选择班级" class="form-control"
									tabindex="2" name="classId" id="classSelect">
									<option value="0">请选择班级</option>
								</select>
							</div>
						</div>
						<input type="button" class="btn btn-primary"
							style="margin-left:400px" value="添加" onclick="addStudent(this);">
						<button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!--修改学生-->
	<div class="modal inmodal" id="myModal1" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content animated bounceInRight">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
					</button>

					<h4 class="modal-title">修改学生</h4>
				</div>
				<div class="modal-body correntInfo">
					<form class="form-horizontal m-t " id="updataFrom"
						method="get" enctype="multipart/form-data">
						<input type="hidden" name="id" value="" id="StudentId" >
						<div class="form-group">
							<label class="col-sm-3 control-label">学号：</label>
							<div class="col-sm-6">
								<input type="text" name="account" id="account"
									class="form-control" placeholder="请输入学号" value="">
							</div>
						</div>
					</form>
					<div class="modal-footer">
							<input type="button" class="btn btn-primary"
								style="margin-left:400px" value="修改" onclick="updataStudent();">
							<button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
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
	<!-- Peity -->
	<script src="${APP_PATH}/admin/js/demo/bootstrap-table-demo.js"></script>
	<script type="text/javascript">
		// 添加全局站点信息
		var BASE_URL = 'js/plugins/webuploader';
	</script>
	<script
		src="${APP_PATH}/admin/js/plugins/webuploader/webuploader.min.js"></script>
	<script src="${APP_PATH}/admin/js/demo/webuploader-demo.js"></script>

	<!-- 修改 -->
	<script type="text/javascript">
		function selectStudentById(but) {
			$.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/student/selectByPrimaryKeyJson.action",
					data : {"id":but.title},
					dataType : "json",
					success : function(data) {
						$("#account").val(data.account);
						$("#StudentId").val(data.id);
					}
				});
		}
		function updataStudent(){
			$.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/student/updateStudent.action",
					data : $("#updataFrom").serialize(),
					dataType : "json",
					success : function(data) {
						if (data.status == 200) {
							alert("修改成功");
							$("#loadForm").submit();
						} else {
							alert(data.msg);
						}
					}
				});
		}
		
		function resetPwd(but){
			$.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/student/updateResetPwd.action",
					data : {"id":but.title,
							"pwd":"123456",
							"account":but.value
					},
					dataType : "json",
					success : function(data) {
						if(data.status==200){
							alert("重置密码成功");
						}else{
							alert(data.msg);
						}
					}
				});
		}
	</script>
	<script type="text/javascript">
		function deleteStudent(del) {
			var id = $(del).parent().parent().attr("id");
			var msg = "您确定要删除吗？";
			if (confirm(msg) == true) {
				window.location = "deleteByPrimaryKey.action?id=" + id;
			}
		}
	</script>
	<!-- 批量删除 -->
	<script type="text/javascript">
		function check() {
			var msg = "您真的确定要删除吗？......";
			if (confirm(msg) == true) {
				//alert("11111111111111");
				var becheckbox = "";

				$("input[name=ids]:checked").each(function() { //遍历table里的全部checkbox
					becheckbox += $(this).val() + ","; //获取所有checkbox的值
				});

				if (becheckbox.length > 0) { //如果获取到
					//alert("133333333333333");
					becheckbox = becheckbox.substring(0, becheckbox.length - 1); //把最后一个逗号去掉
					window.location = "deleteByIds.action?ids=" + becheckbox;
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
				$("input[name=ids]").each(function() {
					this.checked = true;
				});
			} else {
				$("input[name=ids]").each(function() {
					this.checked = false;
				});
			}
		}

		function addStudent(but) {
			$(but).attr({
				"disabled" : "disabled"
			});
			$.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/student/addStudent.action",
					data : $("#addStudentForm").serialize(),
					dataType : "json",
					success : function(data) {
						if (data.status == 200) {
							alert("添加成功");
							$("#loadForm").submit();
							$(but).removeAttr("disabled");
						} else {
							alert(data.msg);
							$(but).removeAttr("disabled");
						}
					}
				});
		}
		function selectClass(){
			var ele=$("#classSelect");
			ele.empty();
			$.ajax({
				url : "${APP_PATH}/classname/findAllClass.action",
				type : "POST",
				success : function(result) {
					console.log(result);
					$.each(result.data, function() {
						var optionEle = $("<option ></option>").append(
								this.name).attr("value", this.classId);
						optionEle.appendTo(ele);
					})

				}
			});
		}
	</script>
</body>

</html>
