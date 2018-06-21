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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta content=always name=referrer>
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>课程信息</title>
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
<link href="${APP_PATH}/admin/css/sTable.css" rel="stylesheet">
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
									<!-- <button type="button" class="btn btn-outline btn-default" data-toggle="modal" data-target="#myModal">
										<i class="glyphicon glyphicon-plus" aria-hidden="true"></i>
									</button> -->
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
											<th data-field="id">课程编号</th>
											<th data-field="cname">课程名</th>
											<th data-field="name">创建人</th>
											<th data-field="date">创建日期</th>
											<th data-field="point">所属方向</th>
											<th data-field="interest">所属兴趣</th>
											<th data-field="grade">所属年级</th>
											<th data-field="mname">所属专业</th>
											<th data-field="redsc">课程简介</th>
											<th data-field="number">点赞数</th>
											<th data-field="pricture">图片</th>
											<!-- <th data-field="local">是否加锁</th> -->
											<th data-field="oprate">操作</th>
										</tr>
									</thead>

									<c:forEach items="${courseList }" var="course">
										<tr id="${course.cid }" class="tr" ids="123">
											<td><input id="ids" name="ids" type="checkbox"
												class="noborder" value="${course.cid }"></td>
											<td data-field="id">${course.cid }</td>
											<td data-field="cname">${course.cname }</td>
											<td data-field="name">${course.dbTeacher.username }</td>
											<td data-field="data">${course.date }</td>
											<td data-field="point">${course.dbFangxiang.fname }</td>
											<td data-field="interest">${course.dbInterest.iname }</td>
											<td data-field="grade">${course.grade }</td>
											<td data-field="mname">${course.dbMajor.mname }</td>
								<!--  -->	<td class="sRedesc" title="${course.redesc }" data-field="redsc">${course.redesc }</td>
											<td data-field="number">${course.linknum }</td>
											<td data-field="price"><a
												href="${APP_PATH}${course.image }" title="图片"
												data-gallery=""> <img src="${APP_PATH}${course.image }"
													width="65"> </a>
												<div id="blueimp-gallery" class="blueimp-gallery">
													<div class="slides"></div>
													<h3 class="title"></h3>
													<a class="close">×</a>
												</div></td>
											<%-- <td data-field="local">${course.iorder=="true"?"是":"否" }</td> --%>
											<td>
												<%-- <button title="${course.cid }" type="button" class="btn btn-outline btn-default btn-edit"
													data-toggle="modal" data-target="#myModal1" onclick="correctInfos(this);">
													<i class="fa fa-edit"></i>修改
												</button> --%>

												<button type="button" class="btn btn-outline btn-default"
													onclick="deleteCourse(this);">
													<i class="glyphicon glyphicon-trash" aria-hidden="true"></i>删除
												</button><a href="${APP_PATH }/resource/findAllAdmin.action?cid=${course.cid }">
													<button type="button" class="btn btn-outline btn-default">
														<i class="fa fa-edit"></i>资源管理
													</button>
												</a> <%-- 
												<a href="${APP_PATH }/CourseAndClass/findByCourseId.action?courseId=${course.cid }">
													<button type="button" class="btn btn-outline btn-default">
														<i class="fa fa-edit"></i>班级管理
													</button>
												</a> --%></td>
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

					<h4 class="modal-title">添加课程</h4>
					<small class="font-bold"></small>
				</div>

				<div class="modal-body">
					<form action="<c:url value='/course/addCourse.action'/>"
						class="form-horizontal m-t " id="signupForm" method="post"
						enctype="multipart/form-data">

						<div class="form-group">
							<label class="col-sm-3 control-label">课程名：</label>
							<div class="col-sm-6">
								<input type="text" name="cname" class="form-control"
									placeholder="请输入文本">
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">所属兴趣：</label>
							<div class="col-sm-6">
								<select class="form-control" name="iid" id="iid">
									<option value="">===请选择===</option>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">所属方向：</label>
							<div class="col-sm-6">
								<select class="form-control" name="fid" id="fid">
									<option value="">===请选择===</option>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">所属年级：</label>
							<div class="col-sm-6">
								<select class="form-control" name="grade" id="grade">
									<option value="2017">2017</option>
									<option value="2016">2016</option>
									<option value="2015">2015</option>
									<option value="2014">2014</option>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">所属专业：</label>
							<div class="col-sm-6">
								<select class="form-control" name="mid" id="mid">
									<c:forEach items="${mList }" var="major">
										<option value="${major.mid }">${major.mname }</option>
									</c:forEach>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label"> 是否加锁：</label>
							<div class="col-sm-6">
								<label> <input type="radio" name="iorder" value=1>是
								</label> <label> <input type="radio" name="iorder"
									value=0 checked>否 </label>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">课程简介：</label>
							<div class="col-sm-6">
								<textarea class="form-control" type="3" name="redesc"></textarea>
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-3 control-label">课程图片：</label>
							<div class="col-sm-6">
								<input type="file" name="file" class="form-control">
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">创建人：</label>
							<div class="col-sm-6">
								<input type="text" name="tid" class="form-control"
									placeholder="请输入创建人tid">
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

	<!--修改模态框-->
	<div class="modal inmodal" id="myModal1" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content animated bounceInRight">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
					</button>
					<h4 class="modal-title">修改课程</h4>
					<small class="font-bold"></small>
				</div>

				<div class="modal-body correntInfo">
					<form action="<c:url value='/course/updateCourse.action'/>"
						class="form-horizontal m-t " id="signupForm" method="post"
						enctype="multipart/form-data">
						<input type="hidden" name="cid" value="" class="cid">

						<div class="form-group">
							<label class="col-sm-3 control-label">课程名：</label>
							<div class="col-sm-6">
								<input type="text" name="cname" id="coursecname"
									class="form-control coursename" placeholder="请输入文本" value="">
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">所属兴趣：</label>
							<div class="col-sm-6">
								<select class="form-control" name="iid" id="iidtwo">
									<option value="">===请选择===</option>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">所属方向：</label>
							<div class="col-sm-6">
								<select class="form-control" name="fid" id="fidtwo">
									<option value="">===请选择===</option>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">所属年级：</label>
							<div class="col-sm-6">
								<select class="form-control" name="grade" id="grade_update">
									<option value="2017">2017</option>
									<option value="2016">2016</option>
									<option value="2015">2015</option>
									<option value="2014">2014</option>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">所属专业：</label>
							<div class="col-sm-6">
								<select class="form-control" name="mid" id="mid_update">
									<c:forEach items="${mList }" var="major">
										<option value="${major.mid }">${major.mname }</option>
									</c:forEach>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label"> 是否加锁：</label>
							<div class="col-sm-6 courseRadio">
								<label> <input type="radio" name="iorder"
									id="courseiorder" value="true" class="courseiorder">是 </label>
								<label> <input type="radio" name="iorder"
									id="courseiorder2" value="false" class="courseiorder">否
								</label>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">课程简介：</label>
							<div class="col-sm-6">
								<textarea class="form-control courseredesc" id="courseredesc"
									type="3" name="redesc"></textarea>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">课程图片：</label>
							<div class="col-sm-6">
								<input type="file" name="file" id="courseimage"
									class="form-control">
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">创建人：</label>
							<div class="col-sm-6">
								<input type="text" name="tid" id="coursetid"
									class="form-control" placeholder="请输入创建人tid">
							</div>
						</div>

						<input type="submit" class="btn btn-primary" value="保存"
							style="margin-left:400px" />
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
	<script src="${APP_PATH}/admin/js/demo/webuploader-demo.js"></script>

	<!-- zb -->
	<!-- 添加部分--省市联动 -->
	<script type="text/javascript">
		function createXMLHttpRequest() {
			try {
				return new XMLHttpRequest();
			} catch (e) {
				try {
					return new ActiveXObject("Msxml2.XMLHTTP");
				} catch (e) {
					return new ActiveXObject("Micorsoft.XMLHTTP");
				}
			}
		}
		window.onload = function() {

			// 得到核心对象
			var xmlHttp = createXMLHttpRequest();
			//打开链接
			xmlHttp.open("GET",
					"<c:url value='/interest/findAllJson.action'/>", true);
			//发送
			xmlHttp.send(null);
			//添加监听
			xmlHttp.onreadystatechange = function() {
				if (xmlHttp.readyState == 4) {
					if (xmlHttp.status == 200) {
						// 执行服务器发送过来的json字符串，得到js的对象
						var proArray = eval("(" + xmlHttp.responseText + ")");
						for ( var i = 0; i < proArray.length; i++) {
							var pro = proArray[i];//得到每个pro对象
							//创建<option>元素
							var optionEle = document.createElement("option");
							// 给<option>元素的value属性赋值
							optionEle.value = pro.iid;//给<option>的实际值赋为pid，而不是name
							var textNode = document.createTextNode(pro.iname);//使用省名称来创建textNode
							optionEle.appendChild(textNode);//把textNode添加到option元素中

							//使用省名称来创建textNode
							document.getElementById("iid").appendChild(
									optionEle);
						}
					}
				}
			};

			/*
			2. 给<select id="pronvine">添加onchange监听
			 */
			document.getElementById("iid").onchange = function() {
				/*
				异步请求服务器，得到选择的省下所有市
				 */
				var xmlHttp = createXMLHttpRequest();
				xmlHttp
						.open(
								"POST",
								"<c:url value='/fangxiang/selectFangxiangJsonByiid.action'/>",
								true);
				// 设置请求头
				xmlHttp.setRequestHeader("Content-Type",
						"application/x-www-form-urlencoded");
				// 发送
				xmlHttp.send("iid=" + this.value);//用户选择的省
				// 添加监听
				xmlHttp.onreadystatechange = function() {
					if (xmlHttp.readyState == 4) {
						if (xmlHttp.status == 200) {
							/*
							清空<select id="city">中的选项
							 */
							var citySelect = document.getElementById("fid");
							// 获取select中的所有子元素
							var cityOptionArray = citySelect
									.getElementsByTagName("option");
							while (cityOptionArray.length > 1) {//这里只控制循环的次数
								citySelect.removeChild(cityOptionArray[1]);//只删除1下标，不会删除0
							}

							/*
							得到服务器发送过来的所有市
							 */
							var cityArray = eval("(" + xmlHttp.responseText
									+ ")");
							// 循环遍历每个city对象，用来生成<option>元素添加到<select id="city">中
							for ( var i = 0; i < cityArray.length; i++) {
								var city = cityArray[i];//得到每个city对象
								// 创建<option>元素
								var optionEle = document
										.createElement("option");
								// 给<option>元素的value属性赋值
								optionEle.value = city.fid;//给<option>的实际值赋为cid，而不是name
								var textNode = document
										.createTextNode(city.fname);//使用省名称来创建textNode
								optionEle.appendChild(textNode);//把textNode添加到option元素中	
								// 把option元素添加到select元素中
								citySelect.appendChild(optionEle);
							}
						}
					}
				};
			};
		};
	</script>

	<!-- 修改部分 -->
	<script type="text/javascript">
		/* 数据回显   */
		function correctInfos(add) {
			var cid = $(add).parent().parent().attr("id");
			console.log(cid);
			var url = "${APP_PATH}/course/SelectCourseJsonByCid.action";
			//console.log($("#courseimage").val()+"^^^^^^^");
			$.ajax({
				type : "post",
				dataType : 'json',
				url : url,
				data : {
					cid : cid
				},
				success : function(data) {
					//console.log(data);
					$("#coursecname").val(data.cname);
					$("#iidtwo option:selected").text(data.dbInterest.iname);
					$("#iidtwo option:selected").val(data.dbInterest.iid);
					$("#fidtwo option:selected").text(data.dbFangxiang.fname);
					$("#fidtwo option:selected").val(data.dbFangxiang.fid);
					$("#courseredesc").text(data.redesc);
					$("#coursetid").val(data.dbTeacher.tid);
					$("#grade_update option:selected").text(data.grade);
					$("#grade_update option:selected").val(data.grade);
					$("#mid_update option:selected").text(data.dbMajor.mname);
					$("#mid_update option:selected").val(data.dbMajor.mid);
					var dataorder = data.iorder;
					function getSex() {
						var sex = $(".courseRadio input");
						//console.log(sex);
						for ( var i = 0; i < sex.length; i++) {
							var r = sex[i];
							if (r.value == data.iorder.toString()) {
								r.checked = true;
								break;
							}
						}
					}
					getSex();
					$(".cid").val(data.cid);
					console.log($(".cid").val());
				},
				error : function() {
					alert("error");
				}
			});

		};
	</script>

	<!-- 修改部分--省市联动 -->
	<script type="text/javascript">
		function createXMLHttpRequest() {
			try {
				return new XMLHttpRequest();
			} catch (e) {
				try {
					return new ActiveXObject("Msxml2.XMLHTTP");
				} catch (e) {
					return new ActiveXObject("Micorsoft.XMLHTTP");
				}
			}
		}

		document.getElementById("iidtwo").onclick = function() {
			var obj = document.getElementById("iidtwo");
			for ( var i = obj.options.length - 1; i > 0; i--) {
				obj.options.remove(i);
			}
			//obj.options.length=0;                      	                       	            
			// 得到核心对象
			var xmlHttp = createXMLHttpRequest();
			//打开链接
			xmlHttp.open("GET",
					"<c:url value='/interest/findAllJson.action'/>", true);
			//发送
			xmlHttp.send(null);
			//添加监听
			xmlHttp.onreadystatechange = function() {
				if (xmlHttp.readyState == 4) {
					if (xmlHttp.status == 200) {
						// 执行服务器发送过来的json字符串，得到js的对象
						var proArray = eval("(" + xmlHttp.responseText + ")");
						for ( var i = 0; i < proArray.length; i++) {
							var pro = proArray[i];//得到每个pro对象
							//创建<option>元素
							var optionEle = document.createElement("option");
							// 给<option>元素的value属性赋值
							optionEle.value = pro.iid;//给<option>的实际值赋为pid，而不是name
							var textNode = document.createTextNode(pro.iname);//使用省名称来创建textNode
							optionEle.appendChild(textNode);//把textNode添加到option元素中

							//使用省名称来创建textNode
							document.getElementById("iidtwo").appendChild(
									optionEle);
						}
					}
				}
			};

			/*
			2. 给<select id="pronvine">添加onchange监听
			 */
			document.getElementById("iidtwo").onclick = function() {
				var fidtwo = document.getElementById("fidtwo").options.length = 0;
				var xmlHttp = createXMLHttpRequest();
				xmlHttp
						.open(
								"POST",
								"<c:url value='/fangxiang/selectFangxiangJsonByiid.action'/>",
								true);
				// 设置请求头
				xmlHttp.setRequestHeader("Content-Type",
						"application/x-www-form-urlencoded");
				// 发送
				xmlHttp.send("iid=" + this.value);//用户选择的省

				// 添加监听
				xmlHttp.onreadystatechange = function() {
					if (xmlHttp.readyState == 4) {
						if (xmlHttp.status == 200) {
							/*
							清空<select id="city">中的选项
							 */
							var citySelect = document.getElementById("fidtwo");
							// 获取select中的所有子元素
							var cityOptionArray = citySelect
									.getElementsByTagName("option");
							while (cityOptionArray.length > 1) {//这里只控制循环的次数
								citySelect.removeChild(cityOptionArray[1]);//只删除1下标，不会删除0
							}

							/*
							得到服务器发送过来的所有市
							 */
							var cityArray = eval("(" + xmlHttp.responseText
									+ ")");
							// 循环遍历每个city对象，用来生成<option>元素添加到<select id="city">中
							for ( var i = 0; i < cityArray.length; i++) {
								var city = cityArray[i];//得到每个city对象
								// 创建<option>元素
								var optionEle = document
										.createElement("option");
								// 给<option>元素的value属性赋值
								optionEle.value = city.fid;//给<option>的实际值赋为cid，而不是name
								var textNode = document
										.createTextNode(city.fname);//使用省名称来创建textNode
								optionEle.appendChild(textNode);//把textNode添加到option元素中

								// 把option元素添加到select元素中
								citySelect.appendChild(optionEle);
							}
						}
					}
				};
			};
		};
	</script>

	<!-- 删除部分 -->
	<script type="text/javascript">
		/* 删除一个 */
		function deleteCourse(del) {
			var id = $(del).parent().parent().attr("id");
			var msg = "您确定要删除吗？";
			if (confirm(msg) == true) {
				window.location = "deleteCourse.action?ids=" + id;
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
					window.location = "deleteCourse.action?ids=" + becheckbox;
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
