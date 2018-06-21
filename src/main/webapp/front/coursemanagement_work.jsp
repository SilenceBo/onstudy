<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<title>网站信息</title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>


<link rel="stylesheet" type="text/css" href="${APP_PATH}/front/bootstrap/bootstrap.min.css" />

<script type="text/javascript" src="${APP_PATH}/front/js/jquery-1.12.4.js"></script>
<script src="${APP_PATH}/front/bootstrap/bootstrap.min.js"></script>

<link type="text/css" rel="stylesheet"
	href="${APP_PATH }/front/jedate/skin/jedate.css">

<script type="text/javascript"
	src="${APP_PATH }/front/jedate/jquery.jedate.js"></script>
</head>
<body>
	<div class="panel admin-panel">
		<div class="panel-head">
			<strong class="icon-reorder"> 内容列表</strong>
		</div>
		<div class="padding button-group">
			<button type="button" class="button border-yellow"
				data-toggle="modal" data-target="#addViedo">
				<span class="glyphicon glyphicon-plus"></span> 布置作业
			</button>
			<a
				href="${pageContext.request.contextPath}/teacherWork/downloadWorkUtils.action"><button
					type="button" class="button border-green">作业批量下载工具</button>
			</a>
		</div>
		<table id="workTable" class="table table-hover text-center">
			<tr>
				<th>作业名称</th>
				<th>创建日期</th>
				<th>截止日期</th>
				<th>查看详细状态</th>
				<th width="250">操作</th>
			</tr>

		</table>
	</div>
	<script>
		
	</script>
	<!-- 查看详细模态框 -->
	<div class="modal fade" id="adnews" tabindex="-1" role="dialog"
		aria-labelledby="addViedoLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true"></button>
					<span class="modal-title" id="addViedoLabel" style="font-size:30px">查看状态</span>
					<span class="modal-title" id="workTwid" style="font-size:20px"></span>
				</div>
				<div class="modal-body">
					<div class="panel-group" id="accordion"></div>
					<div id="selectDiv" class="panel panel-default"></div>
				</div>
				<div class="modal-footer">
					<button type=" button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>

	<!-- 修改模态框 -->
	<div class="modal fade" id="addModal" tabindex="-1" role="dialog"
		aria-labelledby="amendLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true"></button>
					<div class="body-content">
						<form method="post" class="form-x" id="updataForm"
							enctype="multipart/form-data">
							<div class="form-group">
								<div class="label">
									<label>作业名称：</label>
								</div>
								<div class="field">
									<input type="text" class="input w50" name="title" value=""
										id="updataTitle" data-validate="required:请输入标题" />
									<div class="tips"></div>
								</div>
							</div>
							<div class="form-group">
								<div class="label">
									<label>上传作业附件：</label>
								</div>
								<div class="field">
									<div class="report-file">
										<span>上传文件…</span><input tabindex="3" size="3"
											name="multipartFile" class="file-prew" type="file"
											onchange="document.getElementById('textName6').value=this.value">
									</div>
									<input type="text" id="textName6"
										style="height: 32px;border:1px solid #f1f1f1" />
								</div>
							</div>
							<div class="form-group">
								<div class="label">
									<label>截止日期：</label>
								</div>
								<div class="field">
									<input class="form-control" id="date02" type="text"
										placeholder="YYYY-MM-DD hh:mm:ss" name="deadline"
										style="width: 200">
									<div class="tips"></div>
								</div>
							</div>
							<div class="form-group">
								<div class="label">
									<label>作业要求：</label>
								</div>
								<div class="field">
									<textarea type="text" class="input" name="jobRequires"
										id="updataJobRequires" style="height:100px;"></textarea>
								</div>
							</div>

							<div class="label">
								<label></label>
							</div>
					</div>
					</form>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<button type="button" onclick="updataWork()"
						class="btn btn-primary">提交</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	<!-- 添加内容的模态框 -->
	<div class="modal fade" id="addViedo" tabindex="-1" role="dialog"
		aria-labelledby="addViedoLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true"></button>

					<div class="body-content">
						<form method="post" id="addWorkForm" class="form-x"
							enctype="multipart/form-data">
							<input type="hidden" name="cid" id="cidInput" />
							<div class="form-group">
								<div class="label">
									<label>作业名称：</label>
								</div>
								<div class="field">
									<input type="text" class="input w50" name="title" value=""
										data-validate="required:请输入标题" />
									<div class="tips"></div>
								</div>
							</div>
							<div class="form-group">
								<div class="label">
									<label>上传作业附件：</label>
								</div>
								<div class="field">
									<div class="report-file">
										<span>上传文件…</span><input tabindex="3" size="3" name="files"
											class="file-prew" type="file"
											onchange="document.getElementById('textName3').value=this.value">
									</div>
									<input type="text" id="textName3"
										style="height: 32px;border:1px solid #f1f1f1" />
								</div>
							</div>
							<div class="form-group">
								<div class="label">
									<label>截止日期：</label>
								</div>
								<div class="field">
									<input class="form-control" id="date01" type="text"
										placeholder="YYYY-MM-DD hh:mm:ss" name="deadline"
										style="width: 200"> 
									<div class="tips"></div>
								</div>
							</div>
							<div class="form-group">
								<div class="label">
									<label>作业要求：</label>
								</div>
								<div class="field">
									<textarea type="text" class="input" name="jobRequires"
										style="height:100px;"></textarea>
								</div>
							</div>
							<div class="sRadio_shang">
								<span>进度条:</span>
								<progress id="progressBar" value="0" max="100"></progress>
								<span id="percentage"></span>
							</div>
							<div class="label">
								<label></label>
							</div>
					</div>
					</form>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<button type="button" onclick="addWork(this);"
						class="btn btn-primary">提交</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		$("#cidInput").attr("value", document.location.href.split("=")[1]);
		show();
	});
	function show() {
		var table = $("#workTable");
		$(".showTr").remove();
		$
				.ajax({
					url : "${APP_PATH}/teacherWork/findByTidOrCid.action",
					type : "post",
					data : {
						"cid" : document.location.href.split("=")[1]
					},
					success : function(result) {
						console.log(result);
						$
								.each(
										result.data,
										function() {
											var tr = $("<tr></tr>").addClass(
													"showTr");
											tr
													.append(
															$("<td></td>")
																	.append(
																			this.title))
													.append(
															$("<td></td>")
																	.append(
																			this.date))
													.append(
															$("<td></td>")
																	.append(
																			this.deadline))
													.append(
															$("<td><a twid="
																	+ this.twid
																	+ " onclick='showDetailedWork(this)' class='button border-blue' href='#adnew' data-toggle='modal' data-target='#adnews'><span class='icon-edit'></span>查看完成情况</a></td>"));
											var a1 = $("<a>修改</a>")
													.addClass(
															"button border-main")
													.append(
															$("<span class='icon-edit'></span>"))
													.attr("onclick",
															"showWork(this)")
													.attr("twid", this.twid);
											var a2 = $("<a>删除</a>")
													.addClass(
															"button border-red")
													.append(
															$("<span class='icon-trash-o'></span>"))
													.attr("onclick",
															"deleteWork(this)")
													.attr("twid", this.twid);
											var td = $("<td></td>").append(
													$("<div></div>").addClass(
															"button-group")
															.append(a1).append(
																	a2));
											tr.append(td);
											tr.appendTo(table);
										});
					}
				});
	}
	function showWork(but) {
		$(but).attr("twid");
		$
				.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/teacherWork/findByTwid.action",
					data : {
						"twid" : $(but).attr("twid")
					},
					dataType : "json",
					success : function(data) {
						if (data.status == 200) {
							console.log(data);
							$("#updataTitle").val(data.data.title);
							$("#updataJobRequires").val(data.data.jobRequires);
							$(".updataHiddenInput").remove();
							$("#updataForm")
									.append(
											$("<input class='updataHiddenInput' type='hidden'  name='twid' value='"+data.data.twid +"' />"));
						} else {
							alert(data.msg);
						}
					},
				});
		$("#addModal").modal();
	}
	function deleteWork(but) {
		if (confirm("您确定要删除吗?")) {
			$
					.ajax({
						type : "post",
						url : "${pageContext.request.contextPath}/teacherWork/deleteWork.action",
						data : {
							"twid" : $(but).attr("twid")
						},
						dataType : "json",
						success : function(data) {
							console.log(data);
							if (data.status == 200) {
								$(but).parent().parent().parent().hide();
								alert("删除成功");
							} else {
								alert(data.msg);
							}
						},
					});
		} else {
		}
	}
	function updataWork() {
		var format = new FormData($("#updataForm")[0]);
		if (confirm("您确定要提交修改吗?")) {
			$
					.ajax({
						type : "post",
						url : "${pageContext.request.contextPath}/teacherWork/updateWork.action",
						data : format,
						dataType : "json",
						processData : false,
						contentType : false,
						success : function(data) {
							if (data.status == 200) {
								console.log(data);
								alert("修改成功");
								$("#addModal").modal("hide");
							} else {
								alert(data.msg);
							}
						},
					});
		}
	}
	var twid;
	function showDetailedWork(but) {
		twid = $(but).attr("twid");
		document.getElementById("workTwid").innerHTML="作业编号"+twid;
		$
				.ajax({
					url : "${APP_PATH}/teacherInformationController/showWOrkInformation.action",
					type : "post",
					data : {
						"twid" : $(but).attr("twid")
					},
					success : function(result) {
						console.log(result);
						var div = $("#selectDiv");
						$(".panel-heading").remove();
						$(".panel-collapse collapse in").remove();
						$(".panel-body").remove();
						var i = 1;
						$
								.each(
										result.data,
										function() {
											var titleDiv = $(
													"<div class='panel-heading'></div>")
													.append(
															$("<h4 class='panel-title'></h4>"));
											var div2 = $(
													"<div class='title_main'></div>")
													.append(
															$("<span class='title_nav'>"
																	+ this.className.name
																	+ "</span>"))
													.append("总人数（人）：")
													.append(
															$("<span class='title_nav'>"
																	+ this.totalNumber
																	+ "</span>"))
													.append("已提交人数（人）：")
													.append(
															$("<span class='title_nav'>"
																	+ this.sbumitNumber
																	+ "</span>"));
											var a = $(
													"<a data-toggle='collapse' data-parent='#accordion' href='#collapse"+i +"'></a>")
													.append(div2);
											titleDiv.append(a);
											var studentDiv = $("<div id='collapse"+i+"' class='panel-collapse collapse in'>");
											var showDiv = $("<div class='panel-body'>");
											var table = $("<table></table>");
											var tr = $("<tr></tr>");
											tr
													.append("<th width='60px'>姓名</th><th width='85px'>作业状态</th><th width='110px'>打分</th>"
															+ "<th width='60px'>姓名</th><th width='85px'>作业状态</th><th width='110px'>打分</th>");
											tr.appendTo(table);
											tr = $("<tr></tr>");
											var j = 0;
											var num = this.studentLst.length;
											$
													.each(
															this.studentLst,
															function() {
																j++;
																tr
																		.append($("<td width='60px'>"
																				+ this.sname
																				+ "</td>"));
																if (this.submitWork) {
																	tr
																			.append($("<td width='85px'><form method='post' action><a href='${pageContext.request.contextPath}/studentWork/download.action?swid="
																					+ this.work.swid
																					+ "'>点击下载</a></td>"))
																	if (this.work.mark == null) {
																		tr
																				.append($("<td width='110px'><input type='text' style='width:40px;height:20px;' /><button onclick='mark(this)' twid='"
																						+ twid
																						+ "' sid='"
																						+ this.id
																						+ "' class='btn btn-xs'>提交</button></td>"));
																	} else {
																		tr
																				.append($("<td width='110px'><input value='"+this.work.mark+"' type='text' style='width:40px;height:20px;' /><button onclick='mark(this)' twid='"
																						+ twid
																						+ "' sid='"
																						+ this.id
																						+ "' class='btn btn-xs'>提交</button></td>"));
																	}
																} else {
																	tr
																			.append($("<td width='85px' style='color: red;'>未提交</td>"));
																	tr
																			.append($("<td width='110px'><input  type='text' style='width:40px;height:20px;' /><button onclick='mark(this)' twid='"
																					+ twid
																					+ "' sid='"
																					+ this.id
																					+ "' class='btn btn-xs'>提交</button></td>"));
																}

																if (j % 2 == 0) {
																	tr
																			.appendTo(table);
																	tr = $("<tr></tr>");
																}
																if (j == num) {
																	tr
																			.appendTo(table);
																}
															});
											table.appendTo(showDiv);
											showDiv.appendTo(studentDiv);
											titleDiv.appendTo(div);
											studentDiv.appendTo(div);
											i++;
										});
					}
				});
	}

	function progressFunction(evt) {
		var progressBar = document.getElementById("progressBar");
		var percentageDiv = document.getElementById("percentage");
		if (evt.lengthComputable) {
			progressBar.max = evt.total;
			progressBar.value = evt.loaded;
			percentageDiv.innerHTML = Math.round(evt.loaded / evt.total * 100)
					+ "%";
		}
	}

	function addWork(but) {
		$(but).attr({
			"disabled" : "disabled"
		});
		var FileController = "${pageContext.request.contextPath}/teacherWork/commitWork.action"; // 接收上传文件的后台地址 
		var format = new FormData($("#addWorkForm")[0]);
		var xhr = new XMLHttpRequest();
		xhr.open("post", FileController, true);
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var data = xhr.responseText;
				data = eval("(" + data + ")");
				alert(data.msg);
				$(but).removeAttr("disabled");
				if (data.status == 200) {
					$("#addViedo").modal("hide");
					show();
				}
			} else if (xhr.readyState == 4 && xhr.status > 400) {
				alert("上传请求失败");
				$(but).removeAttr("disabled");
			}
		};
		xhr.upload.addEventListener("progress", progressFunction, false);
		xhr.send(format);
	}

	function mark(but) {
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/studentWork/mark.action",
			data : {
				"twid" : $(but).attr("twid"),
				"sid" : $(but).attr("sid"),
				"mark" : $(but).prev().val(),
				"cid" : document.location.href.split("=")[1],
			},
			dataType : "json",
			success : function(data) {
				if (data.status == 200) {
					alert("操作成功");
				} else {
					alert(data.msg);
				}
			},
		});
	}
</script>
<!-- 日期选择器 -->
<script type="text/javascript">
	$("#datefix").jeDate({
		fixedCell : "refix",
		hmsSetVal : {
			hh : 00,
			mm : 00,
			ss : 00
		},
		initAddVal : {
			MM : "+3",
			DD : "+2"
		},
		minDate : '2016-06-16',
		maxDate : '2025-06-16',
		format : "YYYY-MM-DD hh:mm:ss",
		zIndex : 3000,
		choosefun : function(elem, val, date) {
			console.log(val);
			console.log(date);
		},
		okfun : function(elem, val, date) {
			console.log(val);
			console.log(date);
		}
	});
	console.log($.timeStampDate("2017-11-16 10:35:22", false));
	console.log($.timeStampDate("1513391722", true));
	var cancel = {
		minDate : '2015-06-16',
		maxDate : '2017-12-16'
	};
	var opts = $.extend({
		type : "je",
		minDate : undefined,
		maxDate : undefined
	}, cancel);
	if (opts.type == "je") {
		$("#optsdate").jeDate({
			isinitVal : true,
			festival : true,
			trigger : "click mouseenter focus",
			isTime : false,
			ishmsVal : false,
			minDate : opts.minDate,
			maxDate : opts.maxDate,
			format : "YYYY-MM-DD hh:mm",
			zIndex : 3000,
			okfun : function(elem, val) {
				alert(elem);
			}
		});
	}

	//实现日期选择联动
	var start = {
		format : 'YYYY-MM-DD',
		minDate : '2014-06-16 23:59:59', //设定最小日期为当前日期
		//festival:true,
		maxDate : $.nowDate({
			DD : 0
		}), //最大日期
		choosefun : function(elem, datas) {
			end.minDate = datas; //开始日选好后，重置结束日的最小日期
			endDates();
		},
		okfun : function(elem, datas) {
			alert(datas);
		}
	};
	var end = {
		format : 'YYYY年MM月DD日',
		minDate : $.nowDate({
			DD : 0
		}), //设定最小日期为当前日期
		//festival:true,
		maxDate : '2099-06-16 23:59:59', //最大日期
		choosefun : function(elem, datas) {
			start.maxDate = datas; //将结束日的初始值设定为开始日的最大日期
		}
	};
	function endDates() {
		end.trigger = false;
		$("#inpend").jeDate(end);
	}
	$("#inpstart").jeDate(start);
	$("#inpend").jeDate(end);

	$("#date01").jeDate({
		isinitVal : true,
		//festival:true,
		ishmsVal : true,
		isTime : true,
		minDate : '2016-06-16 23:59:59',
		maxDate : $.nowDate({
			DD : 100
		}),
		format : "YYYY-MM-DD hh:mm:ss",
		zIndex : 3000,
	});
	$("#date02").jeDate({
		isinitVal : true,
		//festival:true,
		ishmsVal : true,
		isTime : true,
		minDate : '2016-06-16 23:59:59',
		maxDate : $.nowDate({
			DD : 100
		}),
		format : "YYYY-MM-DD hh:mm:ss",
		zIndex : 3000,
	});
</script>