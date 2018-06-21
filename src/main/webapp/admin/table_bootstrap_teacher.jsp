<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv=X-UA-Compatible content="IE=edge,chrome=1">
<meta content=always name=referrer>
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>老师信息</title>
<meta name="keywords" content="">
<meta name="description" content="">
<link rel="shortcut icon" href="favicon.ico">
<link href="../admin/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="../admin/css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link
	href="../admin/css/plugins/bootstrap-table/bootstrap-table.min.css"
	rel="stylesheet">
<!--下拉框-->
<link href="../admin/css/plugins/chosen/chosen.css" rel="stylesheet">
<!--radio属性-->
<link
	href="../admin/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"
	rel="stylesheet">
<link href="../admin/css/animate.css" rel="stylesheet">
<link href="../admin/css/style.css" rel="stylesheet">
<link href="../admin/css/style1.css" rel="stylesheet">

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
									<!-- 点击添加事件出现Modal模态框 -->
									<button type="button" class="btn btn-outline btn-default"
										data-toggle="modal" data-target="#myModal" id="add">
										<i class="glyphicon glyphicon-plus" aria-hidden="true"></i>
									</button>
									<!-- 点击删除事件进行删除功能 -->
									<button type="button" class="btn btn-outline btn-default"
										onclick="check()">
										<i class="glyphicon glyphicon-trash" aria-hidden="true"></i>
									</button>
								</div>
								<table id="exampleTableEvents" data-height="800"
									data-mobile-responsive="true">
									<thead>
										<tr>

											<th data-field="state" data-checkbox="true"><input
												id="selectAll" onclick="selectAll()" name="selectAll"
												type="checkbox"></th>
											<th data-field="account">工号</th>
											<th data-field="name">老师名</th>
											<th data-field="redesc">简介</th>
											<th>登录次数</th>
											<th>课程数</th>
											<th>资源数</th>
											<th data-field="oprate">操作</th>
										</tr>
									</thead>

									<c:forEach items="${teacherList }" var="teacher">
										<tr id="${teacher.tid}">
											<td data-field="state" data-checkbox="true"><input
												id="ids" name="ids" type="checkbox" class="noborder"
												value="${teacher.tid }"></td>

											<td data-field="account">${teacher.account }</td>
											<td data-field="username">${teacher.username }</td>
											<td data-field="redesc">${teacher.redesc }</td>
											<td >${teacher.loginNum }</td>
											<td>${teacher.courseNum }</td>
											<td>${teacher.reourceNum }</td>
											<td><a
												href="${APP_PATH }/teacherclass/findByTeacherId.action?tid=${teacher.tid }">
													<button type="button" class="btn btn-outline btn-default"
														data-toggle="modal">班级管理</button> </a>
												<button title="${teacher.tid }" value="${teacher.tid }"
													type="button" class="btn btn-outline btn-default "
													data-toggle="modal" data-target="#myModal1"
													onclick="update(this);">
													<i class="fa fa-edit"></i>修改
												</button> <!--  <a
												href="${APP_PATH}/teacher/deleteByPrimaryKey.action?tid=${teacher.tid}">-->
												<button type="button"
													class="btn btn-outline btn-default btn-danger"
													onclick="deleteTeacher(this);">
													<i class="glyphicon glyphicon-trash" aria-hidden="true"></i>删除
												</button>
												<button type="button"
													class="btn btn-outline btn-default btn-danger"
													onclick="Repwd(this);">
													<i class="glyphicon glyphicon-trash" aria-hidden="true"></i>重置密码
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
		<!-- <div class="form-group">
                            <label class="font-noraml">多选</label>
                            <div class="input-group">
                                <select data-placeholder="选择省份" class="chosen-select" multiple style="width:350px;" tabindex="4">
                                    <option value="">请选择班级</option>
                                    <option value="">1</option>
                                    <option value="">2</option>
                                    <option value="">3</option>
                                    <option value="">4</option>
                                    <option value="">5</option>     
                                </select>
                            </div>
                        </div> -->
	</div>

	<!--添加老师 modal-->
	<div class="modal inmodal" id="myModal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content animated bounceInRight">
				<div class="modal-header">
					<h4 class="modal-title">添加老师</h4>
					<small class="font-bold"> <!-- 这里可以显示副标题。 -->
				</div>
				<div class="modal-body">
					<form method="post"
						action="<c:url value='/teacher/insertTeacher.action'/>"
						class="form-horizontal m-t " id="signupForm">

						<div class="form-group">
							<label class="col-sm-3 control-label">工号：</label>
							<div class="col-sm-6">
								<input type="text" id="addAccount" name="account"
									class="form-control" placeholder="请输入文本">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">老师名：</label>
							<div class="col-sm-6">
								<input type="text" id="addName" name="username"
									class="form-control" placeholder="请输入文本">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">简介：</label>
							<div class="col-sm-6">
								<textarea name="redesc" class="form-control" type="3"></textarea>
							</div>
						</div>

						<%--<div class="form-group">
							<label class="col-sm-3 control-label">班级：</label>
							<div class="col-sm-6">
								<select data-placeholder="选择班级" class="form-control"
									tabindex="2" id="classname">
									<option value="0">请选择班级</option>
									<option value="1" hassubinfo="true">1</option>
									<option value="2" hassubinfo="true">2</option>
									<option value="3" hassubinfo="true">3</option>
									<option value="4" hassubinfo="true">4</option>
									<option value="5" hassubinfo="true">5</option>
								
								</select>
							</div>
						</div>--%>

						<!--多选-->
						<!-- <div class="form-group">
                            <label class="col-sm-3 control-label">方向：</label>
                            <div class="input-group">
                                <select data-placeholder="选择方向" class="chosen-select" multiple style="width:350px;" tabindex="4">
                                    <option value="" hassubinfo="true">1</option>
                                    <option value="" hassubinfo="true">2</option>
                                    <option value="" hassubinfo="true">3</option>
                                    <option value="" hassubinfo="true">4</option>
                                    <option value="" hassubinfo="true">5</option>
                                </select>
                            </div>
                        </div>  -->
					</form>
					<div class="modal-footer">
						<button type="submit" class="btn btn-white" data-dismiss="modal">关闭</button>
						<button type="button" onclick="add();" class="btn btn-primary">添加</button>
					</div>
				</div>
			</div>
		</div>

		<!--修改老师 modal-->
		<div class="modal inmodal" id="myModal1" tabindex="-1" role="dialog"
			aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content animated bounceInRight">
					<div class="modal-header">
						<h4 class="modal-title">修改老师</h4>
						<small class="font-bold"> <!-- 这里可以显示副标题。 -->
					</div>
					<div class="modal-body">

						<form
							action="<c:url value='/teacher/updateByPrimaryKeySelective.action'/>"
							class="form-horizontal m-t " id="signupForm">
							<input type="hidden" name="tid" id="tid">
							<div class="form-group">
								<label class="col-sm-3 control-label">工号：</label>
								<div class="col-sm-6">
									<input type="text" name="account" id="account"
										class="form-control" placeholder="请输入文本">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">老师名：</label>
								<div class="col-sm-6">
									<input type="text" name="username" id="username"
										class="form-control" placeholder="请输入文本">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">简介：</label>
								<div class="col-sm-6">
									<textarea name="redesc" id="redesc" class="form-control"
										type="3"></textarea>
								</div>
							</div>
							<%--<div class="form-group">
								<label class="col-sm-3 control-label">班级：</label>
								<div class="col-sm-6">
									<select data-placeholder="选择班级" class="form-control"
										tabindex="2">
										<option value="">请选择班级</option>
										<option value="" hassubinfo="true">1</option>
										<option value="" hassubinfo="true">2</option>
										<option value="" hassubinfo="true">3</option>
										<option value="" hassubinfo="true">4</option>
										<option value="" hassubinfo="true">5</option>
									</select>
								</div>
							</div>--%>

							<!--多选-->
							<!-- <div class="form-group">
                            <label class="col-sm-3 control-label">班级：</label>
                            <div class="input-group">
                                <select data-placeholder="选择班级" class="chosen-select" multiple style="width:350px;" tabindex="4">
                                    <option value="" hassubinfo="true">1</option>
                                    <option value="" hassubinfo="true">2</option>
                                    <option value="" hassubinfo="true">3</option>
                                    <option value="" hassubinfo="true">4</option>
                                    <option value="" hassubinfo="true">5</option>
                                </select>
                            </div>
                        </div> -->
							<div class="modal-footer">
								<button type="submit" class="btn btn-white" data-dismiss="modal">关闭</button>
								<button type="submit" class="btn btn-primary">保存</button>
							</div>
						</form>
					</div>
				</div>
			</div>


			<%--<!--查看所有班级-->
			<div class="modal inmodal" id="myModal3" tabindex="-1" role="dialog"
				aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content animated bounceInRight">
						<div class="modal-header">
							<button type="button" class="close" data-toggle="modal"
								data-target="#myModal3">
								<span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
							</button>

							<h4 class="modal-title">
								<span></span>老师所带班级
							</h4>
							<small class="font-bold"> <!--这里可以显示副标题。-->
						</div>
						<div class="modal-body">
							<form action="<c:url value='/updateByPrimaryKey.action'/> class="
								form-horizontal m-t " id="signupForm">
								<div class="form-group">
									<label class="col-sm-3 control-label">班级：</label>
									<div class="col-sm-6">
										<select data-placeholder="选择班级" class="form-control"
											tabindex="2">
											<option value="0">请选择班级</option>
											<option value="1" hassubinfo="true">1</option>
											<option value="2" hassubinfo="true">2</option>
											<option value="3" hassubinfo="true">3</option>
											<option value="4" hassubinfo="true">4</option>
											<option value="5" hassubinfo="true">5</option>
										</select>
									</div>
								</div>--%>
			<%--<div class="form-group">
									<label class="col-sm-3 control-label">班级：</label>
									<div class="input-group col-sm-6">
										<select data-placeholder="选择班级" class="chosen-select col-sm-6"
											multiple style="width:350px;" tabindex="4">
											<option value="">请选择班级</option>
											<option value="">1</option>
											<option value="">2</option>
											<option value="">3</option>
											<option value="">4</option>
											<option value="">5</option>
										</select>
									</div>
								</div>

							
			</form>

		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>

		</div>
		
	</div>
	</div>--%>
		</div>

		<!-- 全局js -->
		<script src="../admin/js/jquery.min.js"></script>
		<script src="../admin/js/bootstrap.min.js"></script>

		<!-- 自定义js -->
		<script src="../admin/js/content.js"></script>


		<!-- Bootstrap table -->
		<script
			src="../admin/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
		<script
			src="../admin/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
		<script
			src="../admin/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>

		<!-- Peity -->
		<script src="../admin/js/demo/bootstrap-table-demo.js"></script>

		<script type="text/javascript"
			src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
		<!--统计代码，可删除-->
		<!-- Chosen -->
		<script src="../admin/js/plugins/chosen/chosen.jquery.js"></script>
		<script src="../admin/js/demo/form-advanced-demo.js"></script>

		<script src="../admin/js/plugins/prettyfile/bootstrap-prettyfile.js"></script>
		<script>
			$('input[type="file"]').prettyFile();
		</script>

		<script type="text/javascript">
			function add() {
				if ($("#addAccount").val() == "") {
					alert("工号不能为空");
					return;
				}
				if ($("#addName").val() == "") {
					alert("教师姓名不能为空");
					return;
				}
				$("#signupForm").submit();
			}
			function update(but) {
				$
						.ajax({
							type : "POST",
							url : "${pageContext.request.contextPath}/teacher/selectByPrimaryKeyJson.action",
							data : {
								"tid" : but.value
							},
							dataType : "json",
							success : function(data) {
								if (data.status == 200) {
									$("#tid").val(data.data.tid);
									$("#account").val(data.data.account);
									$("#username").val(data.data.username);
									$("#redesc").val(data.data.redesc);
								} else {
								}
							}
						});
			}

			function check() {
				var msg = "您真的确定要删除吗?";
				if (confirm(msg) == true) {
					//alert("11111111111111");
					var becheckbox = "";

					$("input[name=ids]:checked").each(function() { //遍历table里的全部checkbox
						becheckbox += $(this).val() + ","; //获取所有checkbox的值
						// alert("1222222222222");
						//console.log(becheckbox);
						/* if($(this).attr("checked")){//如果被选中
							alert("**********");
						    becheckbox += $(this).val() + ","; //获取被选中的值
						    console.log(becheckbox);
						    } */
					});

					if (becheckbox.length > 0) { //如果获取到
						//alert("133333333333333"); 
						becheckbox = becheckbox.substring(0,
								becheckbox.length - 1); //把最后一个逗号去掉
						window.location = "deleteByIds.action?ids="
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
					$("input[name=ids]").each(function() {
						this.checked = true;
					});
				} else {
					$("input[name=ids]").each(function() {
						this.checked = false;
					});
				}
			}
			$("#add").click(function() {
				getClassnames($("#classname"));
			});
			//查询班级信息
			function getClassnames(ele) {
				ele.empty();
				//清空之前下拉列表
				$.ajax({
					url : "${APP_PATH}/teacher/findclassname.action",
					type : "GET",
					success : function(result) {
						console.log(result);
						//$("#dept_add_select")
						$.each(result.extend.findclassname, function() {
							var optionEle = $("<option></option>").append(
									this.name).attr("value", this.classId);
							optionEle.appendTo(ele);
						});
					}

				});
			}
			function deleteTeacher(del) {
				var id = $(del).parent().parent().attr("id");
				var msg = "您确定要删除吗？";
				if (confirm(msg) == true) {
					window.location = "deleteByPrimaryKey.action?tid=" + id;
				}
			}

			function Repwd(repwd) {
				var id = $(repwd).parent().parent().attr("id");
				var msg = "您确定要重置密码吗？";
				if (confirm(msg) == true) {
					window.location = "RepwdByPrimaryKey.action?tid=" + id;
				}

			}

			window.onload = function() {
				if ("${msg}" != "" && "${msg}" != "ok") {
					alert("${msg}");
				} else if ("${msg}" == "ok") {
					alert("${msg}");
				}
			}
		</script>
</body>
</html>

