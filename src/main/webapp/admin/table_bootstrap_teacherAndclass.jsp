﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<title>班级管理</title>
<meta name="keywords" content="">
<meta name="description" content="">
<link rel="shortcut icon" href="favicon.ico">
<link href="${APP_PATH}/admin/css/bootstrap.min.css" rel="stylesheet">
<link href="${APP_PATH}/admin/css/font-awesome.css" rel="stylesheet">
<link href="${APP_PATH}/admin/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
<link href="${APP_PATH}/admin/css/plugins/blueimp/css/blueimp-gallery.min.css" rel="stylesheet">
<link href="${APP_PATH}/admin/css/animate.css" rel="stylesheet">
<link href="${APP_PATH}/admin/css/style.css" rel="stylesheet">
<link href="${APP_PATH}/admin/css/style1.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${APP_PATH}/admin/css/plugins/webuploader/webuploader.css">
<link rel="stylesheet" type="text/css" href="${APP_PATH}/admin/css/demo/webuploader-demo.css">
  <style>
     #myModal{ margin-top:60px; }
  </style>
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
                                    <button type="button" class="btn btn-outline btn-default"
										data-toggle="modal" onclick='javascript:window.location.href="${APP_PATH }/teacher/findAll.action"'>
										<i class="glyphicon glyphicon-chevron-left" aria-hidden="true"></i>
									</button>
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
                                
                                <table id="exampleTableEvents" data-height="600"
                                    data-mobile-responsive="true">
                                    <thead>
                                        <tr>
                                            <th data-field="state"><input id="selectAll"
                                                onclick="selectAll()" name="selectAll" type="checkbox">
                                            </th>
                                            <th data-field="account">所带班级</th>               
                                            <th data-field="oprate">操作</th>
                                        </tr>
                                    </thead>
                                    <c:forEach items="${TeachingList }" var="teacherclass">
                                        <tr id="${teacherclass.tcid }">
                                            <td data-field="state" data-checkbox="true"><input
                                                id="ids" name="ids" type="checkbox" class="noborder checks"
                                                value="${teacherclass.tcid }">
                                            </td>
                                            <td data-field="account">${teacherclass.dbClassName.name }</td>          
                                            <td data-field="oprate">
                                                <button type="button"
                                                    class="btn btn-outline btn-default btn-danger"
                                                    onclick="deleteTeacherClass(this);">
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
    </div>
    
	
	<!-- 添加模态框 -->
	<div class="modal inmodal" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
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
                    <form action="<c:url value='/teacherclass/insertTeacherAndClass.action'/>" 
                        class="form-horizontal m-t " id="signupForm" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="tid" value="${tid }" id="tid">									
                        <div class="form-group">
                            <label class="col-sm-3 control-label">所有班级：</label>
                            <div class="col-sm-6" style="height:200px;">
                                <select class="form-control" name="classId" size="8">							
                                   <c:forEach items="${classNameList }" var="className">
                                      <option value="${className.classId }">${className.name }</option>
                                   </c:forEach>
                                </select>
                            </div>
                        </div>							
                        <input type="submit" class="btn btn-primary" value="添加" style="margin-left:400px" />
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
	<script src="${APP_PATH}/admin/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
	<script src="${APP_PATH}/admin/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
	<script src="${APP_PATH}/admin/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
	<!-- blueimp gallery -->
	<script src="${APP_PATH}/admin/js/plugins/blueimp/jquery.blueimp-gallery.min.js"></script>
	<!-- Peity -->
	<script src="${APP_PATH}/admin/js/demo/bootstrap-table-demo.js"></script>
	<script type="text/javascript">
		// 添加全局站点信息
		var BASE_URL = 'js/plugins/webuploader';
	</script>
	<script src="${APP_PATH}/admin/js/plugins/webuploader/webuploader.min.js"></script>
	<script src="${APP_PATH}/admin/js/demo/webuploader-demo.js"></script>

	<!-- zb -->
	<!-- 删除部分 -->
	<script type="text/javascript">
		/* 单个删除  */
		function deleteTeacherClass(del) {
			var id = $(del).parent().parent().attr("id");
			var msg = "您确定要删除吗？";
			if (confirm(msg) == true) {
				window.location = "deleteTeacherAndClass.action?ids=" + id;
			}
		}
		
		/* 批量删除  */
		function check() {
			var msg = "您真的确定要删除吗？";
			if (confirm(msg) == true) {
				var becheckbox = "";
				console.log($("input[id=ids]:checked"));
				$("input[id=ids]:checked").each(function() { //遍历table里的全部checkbox
						becheckbox += $(this).val() + ","; //获取所有checkbox的值
				});
	
				if (becheckbox.length > 0) { //如果获取到
					becheckbox = becheckbox.substring(0, becheckbox.length - 1); //把最后一个逗号去掉
					window.location = "deleteTeacherAndClass.action?ids=" + becheckbox;
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