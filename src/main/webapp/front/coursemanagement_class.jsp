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
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv=X-UA-Compatible content="IE=edge,chrome=1">
<meta content=always name=referrer>
<meta name="renderer" content="webkit">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>

<link rel="stylesheet" type="text/css" href="${APP_PATH}/front/bootstrap/bootstrap.min.css" />

<script type="text/javascript" src="${APP_PATH}/front/js/jquery-1.12.4.js"></script>
<script src="${APP_PATH}/front/bootstrap/bootstrap.min.js"></script>

<link rel="stylesheet" href="${APP_PATH }/front/css/pintuer.css">
<link rel="stylesheet" href="${APP_PATH }/front/css/admin.css">
<script src="${APP_PATH }/front/js/jquery.js"></script>
<script src="${APP_PATH }/front/js/pintuer.js"></script>
</head>
<body>

	<div class="admin-panel">
		<div class="panel-head">
			<strong class="icon-reorder"> 内容列表</strong>
		</div>
		<div class="padding button-group">
			<ul class="search">
				<li>
					<button type="button" class="button border-yellow"
						data-toggle="modal" data-target="#addViedo">
						<span class="glyphicon glyphicon-plus"></span> 添加班级
					</button>
					<button type="button" class="button border-green" id="checkall">
						<span class="icon-check"></span> 全选
					</button>
					<button type="submit" class="button border-red"
						onclick="DelSelect()">
						<span class="icon-trash-o"></span> 批量删除
					</button>
				</li>
			</ul>
		</div>
		<table class="table table-hover text-center">
			<tr>
				<th data-field="state">
				<th width="20%">编号</th>
				<th width="40%">学习<font color="red">${course.cname }</font>课程的班级</th>
				<th width="40%">操作</th>
			</tr>
			<c:if test="${empty CCList}">
				<span style="color: red;font-size: 30px">您还没有添加班级,请您点击左侧的添加班级按钮添加需要学习本课程的班级</span>
			</c:if>
			<c:forEach items="${CCList }" var="cc" varStatus="status">
				<tr id="${cc.ccid }" class="tr">
					<td>
						<%-- <input id="ids" name="ids" type="checkbox"
						class="noborder" value="${cc.ccid }"> --%></td>
					<td><input type="checkbox" id="ids" name="ids"
						value="${cc.ccid }" />${status.index +1}</td>
					<td><a  onclick='showClassStudent(this)' class='button border-blue' href='#adnew' data-toggle='modal' data-target='#adnews' classId="${cc.classId }">${cc.dbClassName.name }</a></td>
					<td><div class="button-group">
							<button type="button" class="button border-red"
								onclick="deleteCarousel(this);">
								<span class="icon-trash-o"></span>删除
							</button>
						</div></td>
				</tr>
			</c:forEach>
			<!-- <tr>
				<td colspan="8"><div class="pagelist">
						<a href="">上一页</a> <span class="current">1</span><a href="">2</a><a
							href="">3</a><a href="">下一页</a><a href="">尾页</a>
					</div>
				</td>
			</tr> -->
		</table>
		<!-- 添加模态框 -->
		<div class="modal inmodal" id="addViedo" tabindex="-1" role="dialog"
			aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content animated bounceInRight">

					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true"> <!-- &times; --> </span><span
								class="sr-only">关闭</span>
						</button>

						<h4 class="modal-title">添加学习的班级</h4>
						<small class="font-bold"></small>
					</div>

					<div class="modal-body">
						<form
							action="<c:url value='/CourseAndClass/addCourseAndClasss.action'/>"
							class="form-horizontal m-t " id="signupForm" method="post"
							enctype="multipart/form-data">

							<div class="form-group">
								<label class="col-sm-3 control-label">所有班级：</label>
								<div class="col-sm-6" style="height:200px;">
									<input type="hidden" name="courseId" value="${course.cid }">
									<select class="form-control" name="classId" size="8">
										<c:forEach items="${classNameList }" var="className">
											<option value="${className.classId }">${className.name
												}</option>
										</c:forEach>
									</select>
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
		<!-- 查看详细模态框 -->
		<div class="modal fade" id="adnews" tabindex="-1" role="dialog"
			aria-labelledby="addViedoLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true"></button>
						<h4 class="modal-title" id="addViedoLabel">班级详细</h4>
					</div>
					<div class="modal-body">
						<div class="panel-group" id="accordion"></div>
						<div id="selectDiv" class="panel panel-default"></div>
					</div>
					<div class="modal-footer">
						<button type=" button" class="btn btn-default"
							data-dismiss="modal">关闭</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
		</div>

		<script type="text/javascript">
			function deleteCarousel(del) {
				var id = $(del).parent().parent().parent().attr("id");
				var msg = "您确定要删除吗？";
				if (confirm(msg) == true) {
					window.location = "deleteCourseAndClass.action?ids=" + id;
				}
			}

			$("#checkall").click(function() {
				$("input[name='ids']").each(function() {
					if (this.checked) {
						this.checked = false;
					} else {
						this.checked = true;
					}
				});
			})

			function DelSelect() {
				var Checkbox = false;
				$("input[name='ids']").each(function() {
					if (this.checked == true) {
						Checkbox = true;
					}
				});
				if (Checkbox) {
					var t = confirm("您确认要删除选中的内容吗？");
					if (t == true) {
						var becheckbox = "";
						$("input[name=ids]:checked").each(function() { //遍历table里的全部checkbox
							becheckbox += $(this).val() + ","; //获取所有checkbox的值
						});

						if (becheckbox.length > 0) { //如果获取到
							becheckbox = becheckbox.substring(0,
									becheckbox.length - 1); //把最后一个逗号去掉
							window.location = "deleteCourseAndClass.action?ids="
									+ becheckbox;
							return false;
						} else {
							return false;
						}
					}
				} else {
					alert("请选择您要删除的内容!");
				}
			}

			var classId;
			function showClassStudent(but) {
				classId = $(but).attr("classId");
				$.ajax({
					url : "${APP_PATH}/teacherInformationController/showClassStudent.action",
					type : "post",
					data : {
						"classId" : $(but).attr("classId")
					},
					success : function(result) {
						console.log(result);
						var div = $("#selectDiv");
						$(".panel-heading").remove();
						$(".panel-collapse collapse in").remove();
						$(".panel-body").remove();
						var i = 1;
							var titleDiv = $("<div class='panel-heading'></div>").append($("<h4 class='panel-title'></h4>"));
							var div2 = $("<div class='title_main'></div>").append($("<span class='title_nav'>"
									+ result.data.className+ "</span>")).append("总人数（人）：")
									.append($("<span class='title_nav'>"+ result.data.totleNum+ "</span>"));
							var a = $("<a data-toggle='collapse' data-parent='#accordion' href='#collapse"+i +"'></a>").append(div2);
							titleDiv.append(a);
							var studentDiv = $("<div id='collapse"+i+"' class='panel-collapse collapse in'>");
							var showDiv = $("<div class='panel-body'>");
							var table = $("<table></table>");
							var tr = $("<tr></tr>");
							tr.append("<th width='60px'>姓名</th><th width='85px'>性别</th><th width='85px'>学号</th>"
								+ "<th width='60px'>姓名</th><th width='85px'>性别</th><th width='85px'>学号</th>");
							tr.appendTo(table);
							tr = $("<tr></tr>");
							var j = 0;
							var num = result.data.totleNum;
							$.each(result.data.list,function() {
								j++;
								tr.append($("<td width='100px'>"+ this.sname+ "</td>"));
								tr.append($("<td width='60px'>"+this.sex+"</td>"));
								tr.append($("<td width='180px'>"+this.account+"</td>"));
								
									if (j % 2 == 0) {
										tr.appendTo(table);
										tr = $("<tr></tr>");
									}
									if (j == num) {
										tr.appendTo(table);
									}
								});  
							table.appendTo(showDiv);
							showDiv.appendTo(studentDiv);
							titleDiv.appendTo(div);
							studentDiv.appendTo(div);
							i++;
					}
				});
			}
		</script>
</body>
</html>
