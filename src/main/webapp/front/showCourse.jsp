<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv=X-UA-Compatible content="IE=edge,chrome=1">
<meta content=always name=referrer>
<meta name="renderer" content="webkit">
<title>信息工程学院-视频学习网站</title>
<!--导入的css样式-->
<link rel="stylesheet" type="text/css" href="../front/css/public.css" />
<link rel="stylesheet" type="text/css" href="../front/css/style.css" />
<link rel="stylesheet" type="text/css" href="../front/css/qusetion.css" />

<link rel="stylesheet" type="text/css" href="../front/bootstrap/bootstrap.min.css" />

<script src="../front/js/jquery.min.js"></script>
<script src="../front/bootstrap/bootstrap.min.js"></script>

<%-- <script src="${APP_PATH}/front/js/jquery-1.8.3.min.js"></script> --%>
<script type="text/javascript" src="../front/js/myfocus-2.0.1.min.js"></script> 
<link rel="stylesheet" href="../front/css/course.css" type="text/css"></link>
<link rel="stylesheet" href="../front/css/style.css" type="text/css"></link>
</head>
<body>

	<c:import url="header.jsp" />

	<!--  提问 -->
	<div class="modal fade" id="questionModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<h4 style="text-align:center;">问题仅教师可见,教师回复可在个人中心内查看</h4>
				<div class="modal-body form-group">
					<textarea rows="10" cols="87.7" id="questionText" name="text"
						class="form-control"></textarea>
					<button type="button" onclick="questionsToTeacher();"
						class="button" id="btnSign" style="margin-left:48%;">提问</button>
				</div>
				<div class="modal-footer">
					<button type="button" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="answerModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">发布问题</h4>
				</div>
				<div class="modal-body">
					<div class="tab-pane" id="main6" style="margin-left: 50px;">
						<form id="updataNoticeForm" class="form">
							<input type="text" id="qaTitle" class="form-control" name="title"
								placeholder="标题" style="width:450px" />
							<textarea placeholder="发布的内容" id="qaCont" name="text"
								class="form-control" style="width:450px ;height: 200px"></textarea>
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<button id="myQaBtn" onclick="fabu();" type="button"
						class="btn btn-primary">提交</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>


	<div class="courseBody">
		<div class="comWidth">
			<div class="courseLeft">
				<!--图片-->
				<div class="cousreLeft_top">
					<p>

						<c:if test="${fn:contains(courseCustomer.image,'.')==true}">
							<a href="#"><img src="${APP_PATH}${courseCustomer.image }"
								alt="" /> </a>
						</c:if>
						<c:if test="${fn:contains(courseCustomer.image,'.')==false}">
							<a class="cousreLeftTop_sImg" href="#"> <i>${courseCustomer.cname
									}</i> </a>
						</c:if>
					</p>
				</div>
				<!--文字-->

				<div class="h3">
					<a href="javascript:;" tid="sCourse" class="aH3">课程资源</a> <a
						href="javascript:;" id="answerBut" tid="sAnwser">课程问答</a>
					<c:if test="${!empty user_student}">
						<button type="button" onclick="showQuestionModel();"
							class="btn btn-primary">向老师提问</button>
					</c:if>
				</div>
				<!-- 点赞的图标 -->
				<div>
					<img id="link" alt="" src="../front/images/nb_hou.png" class="nb">
				</div>
				<div class="couseS_tab" id="sCourse">
					<div class="courseLeft_bottom">
						<form>
							<table class="table table-striped table-hover">
								<tr id="resourceTable">
									<th>类型</th>
									<th>名称</th>
									<th>播放地址</th>
									<th>下载</th>
								</tr>
								<c:forEach items="${listR }" var="resource">
									<c:if test="${resource.resourceType eq 3 }">
										<tr>
											<td>视频</td>
											<td>${resource.resourceName}</td>
											<td><input title="${resource.rid }" onclick="play(this)"
												class="view_btn goStudyFlag" style="color: #23527c;"
												value="播放" type="button">
											</td>
											<td><a
												href="${pageContext.request.contextPath}/resource/download.action?rid=${resource.rid }">下载</a>
											</td>
										</tr>
									</c:if>
								</c:forEach>
								<c:forEach items="${listR }" var="resource">
									<c:if test="${resource.resourceType eq 0 }">
										<tr>
											<td>其他</td>
											<td>${resource.resourceName}</td>
											<td></td>
											<td><a
												href="${pageContext.request.contextPath}/resource/download.action?rid=${resource.rid }">下载</a>
											</td>
										</tr>
									</c:if>
								</c:forEach>
								<c:forEach items="${listR }" var="resource">
									<c:if test="${resource.resourceType eq 2 }">
										<tr>
											<td>文本</td>
											<td>${resource.resourceName}</td>
											<td></td>
											<td><a
												href="${pageContext.request.contextPath}/resource/download.action?rid=${resource.rid }">下载</a>
											</td>
										</tr>
									</c:if>
								</c:forEach>
							</table>
						</form>
					</div>
				</div>

				<div class="couseS_tab hide" id="sAnwser">
					<button onclick="showModal();" id="fabuBut" class="btn btn-default">发布问题</button>
					<div id="answerDiv" class="couseS_wenti"></div>
				</div>
				<!-- 回答模态框 -->
				<div class="modal fade" id="huida" tabindex="-1" role="dialog"
					aria-labelledby="huidaLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									&times;</button>
								<h4 class="modal-title" id="amendLabel"></h4>
							</div>
							<div class="modal-body">
								<ul class="sReply-ul">
									<li>
										<h5 class="sReply_p" id="textId">
											<a href="##">回复</a>
										</h5>
										<div id="replayDiv" class="sReply_que"></div>
										<div class="sReply_a">
											<i class="fl" id="timeI">发布时间：2017-8-25 12:25:30</i> <span
												class="fr"> <a id='replayBut' onclick="replay(this)"
												href="javascript:void(0)">回复</a> </span>
										</div>
									</li>
								</ul>
								<form class="form">
									<textarea onfocus="this.value='';" id="answerTextarea"
										class="form-control"></textarea>
								</form>
							</div>
							<div class="modal-footer">
								<button id="replaySubmit" type="submit" class="btn btn-info">提交</button>
								<button type="button" class="btn btn-default"
									data-dismiss="modal">关闭</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal -->
				</div>

			</div>
			<!--老师简介-->
			<div class="courseRight">
				<h3>老师资料</h3>
				<div class="courseBase">
					<p>
						<label>姓名：</label><span>${teacher.username }</span>
					</p>
				</div>
				<div class="courseBase">
					<span>${teacher.redesc }</span>
				</div>
				<h3>课程介绍</h3>
				<div class="courseBase">
					<span>${courseCustomer.redesc}</span>
				</div>
			</div>
		</div>
	</div>
	<div class="copy">
		<p>Copyright &copy; 2016-2017 西安市西安文理学院信息工程学院电子商务实验室</p>
	</div>
	<script type="text/javascript">
		function play(resource) {
			if("${user_student}"==""&&"${user_teacher}"==""){
				alert("请您登录后观看");
				return ; 
			}
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/resource/play.action",
				data : {
					"rid" : resource.title
				},
				dataType : "json",
				success : function(data) {
					if (data.status == 200) {
						window.location.href = "${pageContext.request.contextPath}/front/play.jsp?src=" + "${pageContext.request.contextPath}/resource/" + data.data.src;
					} else {
						alert(data.msg);
					}
				}
			});
		}
		window.onload = function() {
			$
					.ajax({
						type : "post",
						url : "${pageContext.request.contextPath}/resource/isHaveDiversityVideo.action",
						data : {
							"cid" : "${cid}",
						},
						dataType : "json",
						success : function(data) {
							console.log(data);
							if (data.data == true) {
								/* 		<form action="${APP_PATH}/resource/findAll.action?cid=${cid}"
									method="post">
									<input type="submit" class="btn btn-primary" value="分集视频学习" />
								</form> */
								var a = $("<a>学习地址</a>")
										.attr("href",
												"${APP_PATH}/resource/findAll.action?cid=${cid}");
								var btr = $("#resourceTable");
								var tr = $("<tr></tr>");
								tr.append($("<td></td>").append("分集学习"))
										.append($("<td></td>").append(a))
										.append($("<td></td>")).append(
												$("<td></td>"));
								btr.after(tr);
							}
						}
					});
		}
	</script>
	<script type="text/javascript">
		$(".courseLeft .h3").on('click', 'a', function() {
			$(".courseLeft .h3>a").removeClass("aH3");
			$(this).addClass("aH3");
			$(".couseS_tab").addClass("hide");
			var id = $(this).attr("tid");
			$("#" + id).removeClass("hide");
		});

		linkNum();
		function linkNum() {
			var cid = "${cid }";
			var cookie = getCookie(cid);
			//alert(cookie );
			if (cookie == "") {

			} else {
				$("#link").attr('src', "../front/images/nb_front.png");
			}

			var flag = true;
			$("#link")
					.click(
							function() {
								if (flag) {
									flag = false;
									if ($("#link").attr("src") == "../front/images/nb_front.png") {
										$
												.ajax({
													type : "POST",
													url : "${pageContext.request.contextPath}/course/linkNumDel.action?cid="
															+ cid,
													dataType : "json",
													success : function(data) {
														if (data.status == 200) {
															clearCookie(cid);
															$("#link")
																	.attr(
																			'src',
																			"../front/images/nb_hou.png");
															//window.location.href="${APP_PATH}/course/findAllFront.action";
														}
													}
												});
									} else {
										$
												.ajax({
													type : "POST",
													url : "${pageContext.request.contextPath}/course/linkNum.action",
													data : {
														"cid" : "${cid}",
													},
													dataType : "json",
													success : function(data) {
														if (data.status == 200) {
															//alert(data.msg);
															$("#link")
																	.attr(
																			'src',
																			"../front/images/nb_front.png");
														}
													}
												});
									}
									setTimeout(function() {
										flag = true;
									}, 500);
								}
							});
		}

		// 定义一个函数，用来读取特定的cookie值。
		function getCookie(c_name) {
			if (document.cookie.length > 0) {
				c_start = document.cookie.indexOf(c_name + "=");
				if (c_start != -1) {
					c_start = c_start + c_name.length + 1;
					c_end = document.cookie.indexOf(";", c_start);
					if (c_end == -1)
						c_end = document.cookie.length;
					return unescape(document.cookie.substring(c_start, c_end));
				}
			}
			return "";
		}

		//清除cookie    
		function clearCookie(name) {
			setCookie(name, "", -1);
		}

		//设置cookie  
		function setCookie(cname, cvalue, exdays) {
			var d = new Date();
			d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
			var expires = "expires=" + d.toUTCString();
			document.cookie = cname + "=" + cvalue + "; " + expires
					+ "; path=/";
		}

		function showQuestionModel() {
			$("#questionText").val("");
			$("#questionModal").modal("show");
		}

		function questionsToTeacher() {
			if($("#questionText").val()==null ||$("#questionText").val()==""){
				alert("提问信息不能为空");
				return;
			}
			$.ajax({
						type : "POST",
						url : "${pageContext.request.contextPath}/qanda/questionsToTeacher.action",
						data : {
							"cid" : "${cid}",
							"text" : $("#questionText").val(),
						},
						dataType : "json",
						success : function(data) {
							if (data.status == 200) {
								alert("已将你的信息反馈给教师");
								$("#questionModal").modal("hide");
							} else {
								alert(data.msg);
							}
						}
					});
		}

		var page = 1;
		$("#answerBut").click(function showAnswer() {
			$(".wenti_p").remove();
			toPage(1);
		});
		function toPage(pn) {
			page++;
			var ele = $("#answerDiv");
			$(".toPageA").attr("href", "javascript:void()0");
			$
					.ajax({
						type : "post",
						url : "${pageContext.request.contextPath}/qanda/findAll.action",
						data : {
							"page" : pn,
							"cid" : "${cid}",
						},
						dataType : "json",
						success : function(data) {
							console.log(data);
							if(data.status==200){
								$.each(data.data2.list,function() {
									var div = $("<div class='wenti_p'></div>");
									div.append($("<h4><a href='javascript:;'>"+ this.osname+ "</a><a href='javascript:;'>"
													+ this.title+ "</a></h4>"));
									div.append($("<p class='p_a'><a href='javascript:;'>"+ this.text+ "</a></p>"));
									var p = $("<p></p>");
									p.append($("<span>发布于: <i>"+ this.time+ "</i></span>"));
									p.append($("<a qid='"+ this.qid+ "' onclick='selectQandA(this)' data-toggle='modal' data-target='#huida'>回答<i>("
													+ this.count+ ")</i></a>"));
									div.append(p);
									div.appendTo(ele);
								});
								$(".toPageA").remove();
								if (data.data2.list == 0 && pn == 1) {
									ele.append($("<a class='toPageA' href='javascript:void(0)'>暂无相关问答</a>"));
								} else if (data.data2.list == 0) {
									ele.append($("<a class='toPageA' href='javascript:void(0)'>到底了</a>"));
								} else {
									ele.append($("<a class='toPageA' href='javascript:toPage("+ page + ")'>显示更多消息</a>"));
								}
							}else if(data.status==405){
								$("#fabuBut").hide();
								$(".msg").remove();
								ele.append("<h1 class='msg' style='text-align: center;'>请登录后查看问答</h1>");
							}else{
								alert(data.msg);
							}
						}
							
					});
		}
		function selectQandA(but) {
			showQandA($(but).attr("qid"));
		}
		function showQandA(qid) {
			fqid = qid;
			$
					.ajax({
						type : "post",
						url : "${pageContext.request.contextPath}/qanda/findAllAnswer.action",
						data : {
							"qid" : qid,
						},
						dataType : "json",
						success : function(data) {
							console.log(data);
							if (data.status == 200) {
								var qanda2 = data.data2[0];
								document.getElementById("amendLabel").innerHTML = qanda2.title;
								document.getElementById("textId").innerHTML = qanda2.text;
								document.getElementById("timeI").innerHTML = "发布时间 :"
										+ qanda2.time;
								$("#replayBut").attr("qid", qanda2.qid);
								$("#replaySubmit").attr("qid", qanda2.qid);
								$("#replayDiv p").remove();
								var div = $("#replayDiv");
								$
										.each(
												data.data,
												function() {
													if (this.typea == 0) {
														if (qanda2.osname == this.tsname) {
															var p = $("<p></p>")
																	.append(
																			$(
																					"<a qid='"
																							+ this.qid
																							+ "' onclick='replay(this)' href='javascript:void(0)'></a>")
																					.append(
																							this.osname))
																	.append(
																			"<span>"
																					+ this.text
																					+ "</span>");
															p.appendTo(div);

														} else {
															var p = $("<p></p>")
																	.append(
																			$(
																					"<a qid='"
																							+ this.qid
																							+ "' onclick='replay(this)' href='javascript:void(0)'></a>")
																					.append(
																							this.osname))
																	.append(
																			$("<span>回复 </span>"))
																	.append(
																			$("<a qid='"
																					+ this.qid
																					+ "' onclick='replay2(this)' href='javascript:void(0)'>"
																					+ this.tsname
																					+ "</a>"))
																	.append(
																			"<span>"
																					+ this.text
																					+ "</span>");
															p.appendTo(div);
														}
													}
													if (this.typea == 1) {
														var p = $("<p></p>")
																.append(
																		$(
																				"<a qid='"
																						+ this.qid
																						+ "' onclick='replay(this)' href='javascript:void(0)'></a>")
																				.append(
																						this.osname))
																.append(
																		$("<span>回复 </span>"))
																.append(
																		$("<a qid='"
																				+ this.qid
																				+ "' onclick='replay3(this)' href='javascript:void(0)'>"
																				+ this.tname
																				+ "</a>"))
																.append(
																		"<span>"
																				+ this.text
																				+ "</span>");
														p.appendTo(div);
													}
													if (this.typea == 2) {
														var p = $("<p></p>")
																.append(
																		$(
																				"<a qid='"
																						+ this.qid
																						+ "' onclick='replay3(this)' href='javascript:void(0)'></a>")
																				.append(
																						this.tname))
																.append(
																		$("<span>回复 </span>"))
																.append(
																		$("<a qid='"
																				+ this.qid
																				+ "' onclick='replay(this)' href='javascript:void(0)'>"
																				+ this.osname
																				+ "</a>"))
																.append(
																		"<span>"
																				+ this.text
																				+ "</span>");
														p.appendTo(div);
													}
												});
							} else {
							}
						}

					});
		}
		//点击第一个学生
		function replay(but) {
			$
					.ajax({
						type : "post",
						url : "${pageContext.request.contextPath}/qanda/findByQid.action",
						data : {
							"qid" : $(but).attr("qid"),
						},
						dataType : "json",
						success : function(data) {
							console.log(data);
							$("#replaySubmit").attr("qid", data.data[0].qid);
							$("#replaySubmit").attr("typea", "0");
							$("#answerTextarea").val(
									"回复 :  " + data.data[0].osname);
						}
					});

		}
		//点击第二个学生
		function replay2(but) {
			$
					.ajax({
						type : "post",
						url : "${pageContext.request.contextPath}/qanda/findByQid.action",
						data : {
							"qid" : $(but).attr("qid"),
						},
						dataType : "json",
						success : function(data) {
							console.log(data);
							$("#replaySubmit").attr("qid", data.data[0].qid);
							$("#replaySubmit").attr("typea", "1");
							$("#answerTextarea").val(
									"回复 :  " + data.data[0].tsname);
						}
					});

		}
		//点击教师
		function replay3(but) {
			$
					.ajax({
						type : "post",
						url : "${pageContext.request.contextPath}/qanda/findByQid.action",
						data : {
							"qid" : $(but).attr("qid"),
						},
						dataType : "json",
						success : function(data) {
							console.log(data);
							$("#replaySubmit").attr("qid", data.data[0].qid);
							$("#replaySubmit").attr("typea", "2");
							$("#answerTextarea").val(
									"回复 :  " + data.data[0].tname);
						}
					});

		}
		$("#replaySubmit").click(function() {
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/qanda/replys.action",
				data : {
					"qid" : $(this).attr("qid"),
					"typea" : $(this).attr("typea"),
					"fqid" : fqid,
					"text" : $("#answerTextarea").val()
				},
				dataType : "json",
				success : function(data) {
					if (data.status == 200) {
						alert("回复成功");
						showQandA(fqid);
					}else{
						alert(data.msg);
					}
				}
			});
		});

		function fabu() {
			var qaTitle = document.getElementById("qaTitle");
			var qaCont = document.getElementById("qaCont");
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/qanda/add.action",
				data : {
					"title" : qaTitle.value,
					"text" : qaCont.value,
					"page" : page,
					"type" : 0,
					"cid" : "${cid}",
				},
				dataType : "json",
				success : function(data) {
					if (data.status == 200) {
						alert("发布成功");
						$("#answerModal").modal("hide");
						$(".wenti_p").remove();
						toPage(1);
					} else {
						alert(data.msg);
						$("#answerModal").modal("hide");
					}
				}

			});
		}
		function showModal() {
			$("#answerModal").modal();
		}
	</script>
</body>
</html>
