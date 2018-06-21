<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="${APP_PATH }/front/css/pintuer.css">
<link rel="stylesheet" href="${APP_PATH }/front/css/admin.css">
<link rel="stylesheet" href="${APP_PATH }/front/css/sReply.css">
<link rel="stylesheet" type="text/css"
	href="${APP_PATH}/front/bootstrap/bootstrap.min.css" />

<script type="text/javascript"
	src="${APP_PATH}/front/js/jquery-1.12.4.js"></script>
<script src="${APP_PATH}/front/bootstrap/bootstrap.min.js"></script>
<script src="${APP_PATH }/front/js/jquery.js"></script>
<script src="${APP_PATH }/front/js/pintuer.js"></script>
</head>
<body>
	<form id="loadForm"
		action="${APP_PATH}/resource/findAllTeacher.action?cid=${cid}"
		method="post"></form>
	<div class="panel admin-panel">
		<div class="panel-head">
			<strong class="icon-reorder"> 内容列表</strong>
		</div>
		<div class="padding border-bottom button-group">
			<button type="button" class="button border-yellow"
				data-toggle="modal" data-target="#addViedo"
				onclick="Initialization()">
				<span class="glyphicon glyphicon-plus"></span> 添加分集视频
			</button>
			<button type="button" class="button border-yellow"
				data-toggle="modal" data-target="#allViedo"
				onclick="Initialization()">
				<span class="glyphicon glyphicon-plus"></span> 添加课程资源
			</button>
			<button type="button" onclick="deletebatch()"
				class="button border-yellow">批量删除</button>
		</div>

		<div class="sRuanjian button-group fr padding">
			<button type="button" class="button border-green" data-toggle="modal"
				data-target="#s_radio1">功能介绍</button>
			<a
				href="${pageContext.request.contextPath}/resource/downloadutiles.action"><button
					type="button" class="button border-green">转码软件下载</button> </a>
		</div>


		<table class="table table-hover table-bordered text-center">
			<tr>
				<th width="5%"><input type="checkbox" id="deleChbx" name="aaa" />
				</th>
				<th width="5%">资源名称</th>
				<th width="5%">资源类型</th>
				<th width="5%">资源序号</th>
				<th width="10%">试题名称</th>
				<th width="5%">试题答案</th>
				<th width="5%">预览</th>
				<th width="5%">访问量</th>
				<th width="20%">操作</th>
			</tr>
			<c:forEach items="${listR }" var="resource">
				<c:if test="${resource.resourceType eq 1 }">
					<tr>
						<td><input value="${resource.rid }" type="checkbox"
							name="duoxuan" /></td>
						<td>${resource.resourceName }</td>
						<td>分集视频</td>
						<td>${resource.ordery }</td>
						<td>${resource.resume }</td>
						<td>${resource.answerString }</td>
						<td><input title="${resource.rid }" onclick="play(this)"
							class="view_btn goStudyFlag" style="color: #23527c;" value="播放"
							type="button"></td>
						<td>${resource.clickNum }</td>
						<td>
							<div class="button-group">
								<a class="button border-yellow" href="#add" data-toggle="modal"
									data-target="#resourseSkim" rid="${resource.rid }"
									onclick="showSkim(this)"><span class="icon-th"></span> 浏览分析</a>
								<a class="button border-main" href="#add" data-toggle="modal"
									data-target="#amend" rid="${resource.rid }"
									onclick="showResource(this)"><span class="icon-edit"></span>
									修改</a> <a class="button border-red" rid="${resource.rid }"
									onclick="deleteResource(this)"><span class="icon-trash-o"></span>
									删除</a>
							</div></td>
					</tr>
				</c:if>
			</c:forEach>

			<c:forEach items="${listR }" var="resource">
				<c:if test="${resource.resourceType ne 1 }">
					<tr>
						<td><input value="${resource.rid }" type="checkbox"
							name="duoxuan" /></td>
						<td>${resource.resourceName }</td>
						<c:if test="${resource.resourceType eq 2 }">
							<td>文本</td>
						</c:if>
						<c:if test="${resource.resourceType eq 3 }">
							<td>普通视频</td>
						</c:if>
						<c:if test="${resource.resourceType eq 0 }">
							<td>其他</td>
						</c:if>
						<td>${resource.ordery }</td>
						<td>${resource.answerSrc }</td>
						<td>${resource.answerString }</td>
						<c:choose>
							<c:when test="${resource.resourceType eq 3 }">
								<td><input title="${resource.rid }" onclick="play(this)"
									class="view_btn goStudyFlag" style="color: #23527c;" value="播放"
									type="button"></td>
							</c:when>
							<c:otherwise>
								<td><a
									href="${pageContext.request.contextPath}/resource/download.action?rid=${resource.rid }">下载</a>
								</td>
							</c:otherwise>
						</c:choose>
						<td>${resource.clickNum }</td>
						<td><div class="button-group">
								<a class="button border-yellow" href="#add" data-toggle="modal"
									data-target="#resourseSkim" rid="${resource.rid }"
									onclick="showSkim(this)"><span class="icon-th"></span> 浏览分析</a>
								<a class="button border-main" href="#add" data-toggle="modal"
									data-target="#amend" rid="${resource.rid }"
									onclick="showResource(this)"><span class="icon-edit"></span>
									修改</a> <a class="button border-red" rid="${resource.rid} "
									onclick="deleteResource(this)"><span class="icon-trash-o"></span>
									删除</a>
							</div></td>
					</tr>
				</c:if>
			</c:forEach>

		</table>
	</div>
	<script type="text/javascript">
		function del(id, mid) {
			if (confirm("您确定要删除吗?")) {

			}
		}
	</script>
	<!-- 资源浏览信息的模态框 -->
	<div class="modal fade" id="resourseSkim" tabindex="-1" role="dialog"
		aria-labelledby="resourseSkimLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true"></button>
					<h4 class="modal-title">资源浏览信息</h4>
				</div>
				<div class="modal-body" id="model_stab">
					<h5 style="color:red;" id="skimSUM"></h5>
					<table class="table table-hover table-center" id="showSkimTable">
						<tr>
							<td>学生姓名</td>
							<td>访问次数</td>
							<td>最后一次访问时间</td>
						</tr>
					</table>

					<h5>
						总记录数 <span id="SkimNum" style="color:#5380cf;"></span>
					</h5>
					<div id="skimPage" class="pagelist"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal"
						onclick="clean();">关闭</button>
					<button type="button" class="btn btn-primary">提交更改</button>
				</div>
			</div>
		</div>
	</div>



	<!-- 功能介绍模态框(显示隐藏)1 -->
	<div class="modal fade" id="s_radio1" tabindex="-1" role="dialog"
		aria-labelledby="s_radio1Label" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true"></button>
					<h4 class="modal-title" id="s_radio1Label">使用功能介绍</h4>
				</div>
				<div class="modal-body">
					<div class="radio1_pp">
						<ul>
							<li><span>分集视频介绍</span>
								<div class="hide">分集视频是必须顺序观看且通过测试方可观看下一集,如没有试题可不上传,视频资源目前仅支持MP4如视频格式不是MP4可使用网站提供的转码工具转码,资源序号(很重要)是学生观看视频的顺序,并且是记录学生答题成绩的重要参数</div>
							</li>
							<li><span>课程资源</span>
								<div class="hide">课程资源提供下载,教师可上传任何类型的资源,如上传的是视频只有是MP4才能提供在线观看</div>
							</li>
							<li><span>作业管理</span>
								<div class="hide">作业管理在这里可以布置作业,作业可以设置最晚上交日期,可在线打分,学生提交作业可以是任何格式,学生的作业提供下载</div>
							</li>
							<li><span>班级管理</span>
								<div class="hide">班级管理这里管理的是哪些班级要学习这个课程,如不选择学生将无法看到课程的作业</div></li>
							<li><span>问答管理</span>
								<div class="hide">这里管理的是本课程下的讨论,可以进行删除回复等操作</div></li>
						</ul>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>


	<!-- 添加分集视频的模态框 -->
	<div class="modal fade" id="addViedo" tabindex="-1" role="dialog"
		aria-labelledby="addViedoLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true"></button>
					<h4 class="modal-title" id="addViedoLabel">添加分集视频</h4>
				</div>
				<div class="modal-body">
					<form method="post" class="form-x" id="signupForm"
						enctype="multipart/form-data">
						<input name="resourceType" id="1" value="1" type="hidden">
						<input type="hidden" name="cid" value="${cid}" />
						<div class="form-group">
							<div class="label">
								<label>资源名称：</label>
							</div>
							<div class="field">
								<input type="text" class="input" id="resourceName1"
									name="resourceName" value="" />
							</div>
						</div>
						<div class="form-group">
							<div class="label">
								<label>资源视频：</label>
							</div>
							<div class="field">
								<div class="report-file">
									<span>上传文件…</span><input tabindex="3" size="3"
										name="multipartFile" class="file-prew" type="file"
										onchange="document.getElementById('textName').value=this.value">
								</div>
								<input type="text" id="textName"
									style="height: 32px;border:1px solid #f1f1f1" />
							</div>
						</div>

						<div class="form-group">
							<div class="label">
								<label>资源试题：</label>
							</div>
							<div class="field">
								<div class="report-file">
									<span>上传文件…</span><input tabindex="3" size="3"
										name="multipartFiles" class="file-prew" type="file"
										onchange="document.getElementById('textName1').value=this.value">
								</div>
								<input type="text" id="textName1"
									style="height: 32px;border:1px solid #f1f1f1" />
							</div>
						</div>

						<div class="form-group">
							<div class="label">
								<label>资源答案：</label>
							</div>
							<div class="field">
								<input type="text" class="input" id="answerString1"
									name="answerString" value="" />
							</div>
							<br />
							<div style="color: red;text-align: center;">如：ABCD</div>
						</div>
						<div class="sRadio_shang">
							<br /> <span>进度条:</span>
							<progress id="progressBar2" value="0" max="100"></progress>
							<span id="percentage2"></span>
						</div>
						<div class="form-group">
							<div class="label">
								<label></label>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type=" button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<button type="button" onclick="add(this);" class="btn btn-primary">上传
					</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>

	<!-- 添加课程资源的模态框 -->
	<div class="modal fade" id="allViedo" tabindex="-1" role="dialog"
		aria-labelledby="addViedoLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true"></button>
					<h4 class="modal-title" id="addViedoLabel">修改内容</h4>
				</div>

				<div class="modal-body">
					<form enctype="multipart/form-data" method="post"
						id="signupFormTwo" class="form-x">
						<input type="hidden" name="cid" value="${cid}" />
						<div class="form-group">
							<div class="label">
								<label>资源名称：</label>
							</div>
							<div class="field">
								<input type="text" class="input" id="resourceName2"
									name="resourceName" value="" />
							</div>
						</div>

						<div class="form-group">
							<div class="label">
								<label>资源类型：</label>
							</div>
							<div class="field">
								<input type="radio" id="add2resourceType" name="resourceType"
									value="3" style="margin-left:40px;">视频 <input
									type="radio" name="resourceType" value="2"
									style="margin-left:40px;">文本 <input type="radio"
									name="resourceType" value="0" style="margin-left:40px;">其他
							</div>
						</div>

						<div class="form-group">
							<div class="label">
								<label>上传资源：</label>
							</div>
							<div class="field">
								<div class="report-file">
									<span>上传文件…</span><input tabindex="3" size="3"
										name="multipartFile" class="file-prew" type="file"
										onchange="document.getElementById('textName2').value=this.value">
								</div>
								<input type="text" id="textName2"
									style="height: 32px;border:1px solid #f1f1f1" />
							</div>
						</div>
						<div class="form-group">
							<div class="label">
								<label></label>
							</div>
						</div>
						<div class="sRadio_shang">
							<span>进度条:</span>
							<progress id="progressBar" value="0" max="100"></progress>
							<span id="percentage"></span>
						</div>
						<input type="hidden" name="test">
					</form>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<button type="button" onclick="addTwo(this)"
						class="btn btn-primary">提交</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>

	<!-- 修改模态框 -->
	<div class="modal fade" id="amend" tabindex="-1" role="dialog"
		aria-labelledby="amendLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true"></button>
					<h4 class="modal-title" id="amendLabel">修改内容</h4>
				</div>
				<div class="modal-body">
					<form method="post" class="form-x" id="updataForm"
						enctype="multipart/form-data">
						<input type="hidden" name="cid" value="${cid }" />
						<div class="form-group">
							<div class="label">
								<label>资源名称：</label>
							</div>
							<div class="field">
								<input type="text" class="input" id="updataResourceName"
									name="resourceName" value="" />
							</div>
						</div>
						<div id="updataORdery" class="form-group">
							<div class="label">
								<label>资源序号：</label>
							</div>
							<div class="field">
								<input type="text" class="input" id="updataOrdery" name="ordery"
									value="" />
							</div>
						</div>

						<div class="form-group">
							<div class="label">
								<label>资源类型：</label>
							</div>
							<div class="field">
								<input type="radio" id="updataRadio" name="resourceType"
									value="1" style="margin-left:40px;">分集视频<input
									type="radio" name="resourceType" value="3"
									style="margin-left:40px;">视频 <input type="radio"
									name="resourceType" value="2" style="margin-left:40px;">文本
								<input type="radio" name="resourceType" value="0"
									style="margin-left:40px;">其他
							</div>
						</div>

						<div class="form-group">
							<div class="label">
								<label>更新视频：</label>
							</div>
							<div class="field">
								<div class="report-file">
									<span>上传文件…</span><input tabindex="3" size="3"
										name="multipartFile" class="file-prew" type="file"
										onchange="document.getElementById('textName3').value=this.value">
								</div>
								<input type="text" id="textName3"
									style="height: 32px;border:1px solid #f1f1f1" />
							</div>
						</div>

						<div id="updataAnswerfile" class="form-group">
							<div class="label">
								<label>更新资源：</label>
							</div>
							<div class="field">
								<div class="report-file">
									<span>上传文件…</span><input tabindex="3" size="3"
										name="multipartFiles" class="file-prew" type="file"
										onchange="document.getElementById('textName4').value=this.value">
								</div>
								<input type="text" id="textName4"
									style="height: 32px;border:1px solid #f1f1f1" />
							</div>
							<br /> <br />
							<div style="color: red;text-align: center;">如不更新资源可以不选择</div>
						</div>

						<div id="updataAnswer" class="form-group">
							<div class="label">
								<label>资源答案：</label>
							</div>
							<div class="field">
								<input type="text" class="input" id="updataAnswerString"
									name="answerString" value="" />
							</div>
							<br />
							<div style="color: red;text-align: center;">如：ABCD</div>
						</div>
					</form>
					<div class="sRadio_shang">
						<span>进度条:</span>
						<progress id="progressBar3" value="0" max="100"></progress>
						<span id="percentage3"></span>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<button type="button" onclick="updataResource(this)"
						class="btn btn-primary">提交</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>

	</div>
	<script type="text/javascript">
		$(".radio1_pp>ul>li").on('click', function() {
			if ($(this).find("div").attr("class") == "") {
				$(this).find("div").addClass("hide");
			} else {
				$(".radio1_pp>ul>li div").addClass("hide");
				$(this).find("div").removeClass("hide");
			}
		});

		function add(but) {
			if ($("#textName1").val() != ""
					&& !String($("#textName1").val()).endsWith("pdf")
					&& !String($("#textName1").val()).endsWith("PDF")) {
				alert("试题只能上传pdf");
				return;
			}
			;
			if (!String($("#textName").val()).endsWith("mp4")
					&& !String($("#textName").val()).endsWith("MP4")) {
				alert("视频仅支持上传MP4");
				return;
			}
			;
			var answer = $("#answerString1").val(); //拿到email的值 
			var regemail = /^[a-d^A-D]{0,20}$/
			if (!regemail.test(answer)) {
				alert("答案只能是含有ABCD的字符串");
				return;
			}
			$(but).attr({
				"disabled" : "disabled"
			});
			var FileController = "${pageContext.request.contextPath}/resource/addTeacherResource.action"; // 接收上传文件的后台地址 
			// FormData 对象
			var form = new FormData($("#signupForm")[0]);

			// XMLHttpRequest 对象
			var xhr = new XMLHttpRequest();
			xhr.open("post", FileController, true);
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					var data = xhr.responseText;
					data = eval("(" + data + ")");
					alert(data.msg);
					$(but).removeAttr("disabled");
					if (data.status == 200) {
						$("#loadForm").submit();
					}
				} else if (xhr.readyState == 4 && xhr.status > 400) {
					alert("上传请求失败");
					$(but).removeAttr("disabled");
				}
			};
			xhr.upload.addEventListener("progress", progressFunction2, false);
			xhr.send(form);
		}

		function addTwo(but) {

			var str = $("#textName2").val();
			var reg = /^.*\.mp4/i;

			if ($("#add2resourceType").prop("checked") && !reg.test(str)) {
				alert("视频仅支持MP4");
				return;
			}

			$(but).attr({
				"disabled" : "disabled"
			});
			var FileController = "${pageContext.request.contextPath}/resource/addTeacherResourceTwo.action"; // 接收上传文件的后台地址 
			// FormData 对象
			var form = new FormData($("#signupFormTwo")[0]);

			// XMLHttpRequest 对象
			var xhr = new XMLHttpRequest();
			xhr.open("post", FileController, true);
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					var data = xhr.responseText;
					data = eval("(" + data + ")");
					alert(data.msg);
					$(but).removeAttr("disabled");
					if (data.status == 200) {
						$("#loadForm").submit();
					} else {
						var percentageDiv = document
								.getElementById("percentage");
						percentageDiv.innerHTML = Math.round(0) + "%";
					}
				} else if (xhr.readyState == 4 && xhr.status > 400) {
					alert("上传请求失败");
					$(but).removeAttr("disabled");
				}
			};
			xhr.upload.addEventListener("progress", progressFunction, false);
			xhr.send(form);
		}

		function progressFunction(evt) {
			var progressBar = document.getElementById("progressBar");
			var percentageDiv = document.getElementById("percentage");
			if (evt.lengthComputable) {
				progressBar.max = evt.total;
				progressBar.value = evt.loaded;
				percentageDiv.innerHTML = Math.round(evt.loaded / evt.total
						* 100)
						+ "%";
			}
		}

		function progressFunction2(evt) {
			var progressBar = document.getElementById("progressBar2");
			var percentageDiv = document.getElementById("percentage2");
			if (evt.lengthComputable) {
				progressBar.max = evt.total;
				progressBar.value = evt.loaded;
				percentageDiv.innerHTML = Math.round(evt.loaded / evt.total
						* 100)
						+ "%";
			}
		}

		function deleteResource(but) {
			if (confirm("您确定要删除吗?")) {
				$
						.ajax({
							type : "post",
							url : "${pageContext.request.contextPath}/resource/deleteTeacherByRid.action",
							data : {
								"rid" : $(but).attr("rid"),
								"cid" : "${cid}"
							},
							dataType : "json",
							success : function(data) {
								if (data.status == 200) {
									$(but).parent().parent().parent().hide();
								} else {
									alert(data.msg);
								}
							}
						});
			}
		}
		function showResource(but) {
			$
					.ajax({
						type : "post",
						url : "${pageContext.request.contextPath}/resource/findByRidJson.action",
						data : {
							"rid" : $(but).attr("rid"),
						},
						dataType : "json",
						success : function(data) {
							if (data.status == 200) {
								console.log(data);
								var resource = data.data;
								$("#updataForm").append(
										$("<input></input>").attr({
											type : 'hidden',
											name : 'rid',
											value : resource.rid
										}))
								$("#updataResourceName").val(
										resource.resourceName);
								if (resource.ordery == null) {
									$("#updataOrdery").parent().parent().hide();
								} else {
									$("#updataOrdery").val(resource.ordery);
								}
								if (resource.resourceType == 3
										|| resource.resourceType == 2
										|| resource.resourceType == 0) {
									$("#updataAnswer").hide();
									$("#updataAnswerfile").hide();
								}
								if (resource.resourceType == 1) {
									$("#updataAnswer").show();
									$("#updataAnswerfile").show();
								}
								$
										.each(
												$("input[name=resourceType]"),
												function() {
													if (this.value == resource.resourceType) {
														$(this).attr("checked",
																"checked");
													}
												});
								$("#updataAnswerString").val(
										resource.answerString);
							} else {
								alert(data.msg);
							}
						}
					});
		}
		function updataResource(but) {
			$(but).attr({
				"disabled" : "disabled"
			});
			var FileController = "${pageContext.request.contextPath}/resource/updateTeacherResource.action"; // 接收上传文件的后台地址 
			var form = new FormData($("#updataForm")[0]);
			var xhr = new XMLHttpRequest();
			xhr.open("post", FileController, true);
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					var data = xhr.responseText;
					data = eval("(" + data + ")");
					alert(data.msg);
					$(but).removeAttr("disabled");
					$("#loadForm").submit();
				} else if (xhr.readyState == 4 && xhr.status > 400) {
					alert("上传请求失败");
					$(but).removeAttr("disabled");
				}
			};
			xhr.upload.addEventListener("progress", progressFunction3, false);
			xhr.send(form);
		}

		function progressFunction3(evt) {
			var progressBar = document.getElementById("progressBar3");
			var percentageDiv = document.getElementById("percentage3");
			if (evt.lengthComputable) {
				progressBar.max = evt.total;
				progressBar.value = evt.loaded;
				percentageDiv.innerHTML = Math.round(evt.loaded / evt.total
						* 100)
						+ "%";
			}
		}

		$("#updataRadio").click(function() {
			$("#updataAnswer").show();
			$("#updataAnswerfile").show();
		});
		$("input[name=resourceType]").click(function() {
			if ($(this).attr("id") == undefined) {
				$("#updataAnswer").hide();
				$("#updataAnswerfile").hide();
			}
		});
		$(function() {
			console.log("${b}");
			if ("${msg}" != "") {
				alert("${msg}");
			}
		});

		function play(resource) {
			$
					.ajax({
						type : "post",
						url : "${pageContext.request.contextPath}/resource/play.action",
						data : {
							"rid" : resource.title
						},
						dataType : "json",
						success : function(data) {
							if (data.status == 200) {
								window.location.href = "${pageContext.request.contextPath}/front/play.jsp?src="
										+ "${pageContext.request.contextPath}/resource/"
										+ data.data.src;
							} else {
								alert(data.msg);
							}
						}
					});
		}
		function Initialization() {
			$("#resourceName1").val("");
			$("#textName").val("");
			$("#textName1").val("");
			$("#answerString1").val("");
			$("#resourceName2").val("");
			$("#textName2").val("");
		}

		$("#deleChbx").click(
				function() {
					$("input[type=checkbox][name=duoxuan]").prop("checked",
							$(this).prop("checked"));
				});
		$(document)
				.on(
						"click",
						"input[type=checkbox][name=duoxuan]",
						function() {
							var flag = $("input[type=checkbox][name=duoxuan]:checked").length == $("input[type=checkbox][name=duoxuan]").length;
							$("#deleChbx").prop("checked", flag);
						});
		function deletebatch() {
			var str = "";
			var i = 0;
			$.each($("input[type=checkbox][name=duoxuan]"), function() {
				if ($(this).prop("checked")) {
					i++;
					str += $(this).prop("value") + ",";
				}
			});
			if (str == "") {
				alert("您还没有选择要删除的数据");
				return;
			}
			if (confirm("您确定要删除选中这" + i + "条数据吗?")) {
				$
						.ajax({
							type : "post",
							url : "${pageContext.request.contextPath}/resource/deleteTeacherByRids.action",
							data : {
								"rids" : str,
							},
							dataType : "json",
							success : function(data) {
								alert("删除成功");
								$("#loadForm").submit();
							}
						});
			}
		}
		var rid;
		function showSkim(but) {
			rid = $(but).attr("rid");
			showSkimToPage(1);
		}
		function showSkimToPage(pn) {
			$
					.ajax({
						type : "post",
						url : "${pageContext.request.contextPath}/ResourceClickLogs/findByRid.action",
						data : {
							"rid" : rid,
							"pn" : pn
						},
						dataType : "json",
						success : function(data) {
							$(".showskimTr").remove();
							document.getElementById("skimSUM").innerHTML = "总浏览量:"
									+ data.data2;
							var table = $("#showSkimTable");
							$.each(data.data.list, function() {
								var tr = $("<tr class='showskimTr'></tr>");
								tr.append("<td>" + this.sname + "</td>");
								tr.append("<td>" + this.clicknum + "</td>");
								var date = new Date(this.lastdata);
								tr.append("<td>"
										+ date.format("yyyy-MM-dd hh:mm:ss")
										+ "</td>");
								tr.appendTo(table);
							});
							document.getElementById("SkimNum").innerHTML = data.data.total;
							showSkimPage(data.data);
							console.log(data);
						}

					});
		}
		function showSkimPage(page) {
			var ele = $("#skimPage");
			ele.empty();
			if (!page.isFirstPage) {
				ele.append($("<a href='javascript:showSkimToPage(1)'>首页</a>"));
			}
			if (page.hasPreviousPage) {
				ele.append($("<a href='javascript:showSkimToPage("
						+ page.prePage + ")'>上一页</a>"));
			}
			$.each(page.navigatepageNums, function() {
				var e = $("<a href='javascript:showSkimToPage(" + this + ")'>"
						+ this + "</a>");
				if (this == page.pageNum) {
					//添加class\
					e.attr("style",
							"background:#09F; border-color:#09F; color: #FFF");
				}
				ele.append(e);
			});
			if (page.hasNextPage) {
				ele.append($("<a href='javascript:showSkimToPage("
						+ page.nextPage + ")'>下一页</a>"));
			}
			if (!page.isLastPage) {
				ele.append($("<a href='javascript:showSkimToPage("
						+ page.lastPage + ")'>尾页</a>"));
			}
		}

		function clean() {
			$(".showskimTr").remove();
			document.getElementById("SkimNum").innerHTML = 0;
			document.getElementById("skimSUM").innerHTML = "总浏览量:" + 0;
		}
	</script>
	<!-- 日期格式化 -->
	<script type="text/javascript">
		Date.prototype.format = function(format) {
			var o = {
				"M+" : this.getMonth() + 1, //month
				"d+" : this.getDate(), //day
				"h+" : this.getHours(), //hour
				"m+" : this.getMinutes(), //minute
				"s+" : this.getSeconds(), //second
				"q+" : Math.floor((this.getMonth() + 3) / 3), //quarter
				"S" : this.getMilliseconds()
			//millisecond
			}
			if (/(y+)/.test(format))
				format = format.replace(RegExp.$1, (this.getFullYear() + "")
						.substr(4 - RegExp.$1.length));
			for ( var k in o)
				if (new RegExp("(" + k + ")").test(format))
					format = format.replace(RegExp.$1,
							RegExp.$1.length == 1 ? o[k] : ("00" + o[k])
									.substr(("" + o[k]).length));
			return format;
		}
	</script>
</body>
</html>
